"use strict";

// Start-up - última carpeta git subida: 1.00
console.clear();
global.horarioStartUp = Date.now();

// Imports
import dotenv from "dotenv";
import path from "path";
import fs from "fs";
import https from "https";
import express from "express";
import cookieParser from "cookie-parser";
import {fileURLToPath} from "url";
import {Sequelize} from "sequelize";
import mysql from "mysql2";
import session from "express-session";
import connectMySQL from "express-mysql-session";

// Variables globales
global.path = path;
global.fs = fs;
global.Sequelize = Sequelize;

// Carga variables confidenciales
dotenv.config({quiet: true});

// Aplicaciones express
const app = express();
app.use(express.urlencoded({extended: false})); // Para usar el método post y req.body
app.use(express.json()); // Para convertir el json recibido por POST en req.body
app.use(cookieParser());

// Variables de entorno
const rutaActual = path.dirname(fileURLToPath(import.meta.url));
global.entProd = path.basename(rutaActual) == "1-Actual";
global.entPrueba = path.basename(rutaActual) == "2-Prueba";
global.entDesarr = !entProd && !entPrueba;
global.urlHost =
	(entProd && "https://mamaantula.com") || (entPrueba && "https://prueba.mamaantula.com") || "https://mamaantula:3006";

// Servidor
const puerto = entProd ? "?" : entPrueba ? "?" : 3008;
const leyenda = "\nMama Antula - Servidor funcionando...";
if (entDesarr) {
	// Variables
	const rutaArchivo = "./mamaantula";
	const ext = ".pem";
	const opciones = {cert: fs.readFileSync(rutaArchivo + ext), key: fs.readFileSync(rutaArchivo + "-key" + ext)};

	// Conexión con el servidor
	https.createServer(opciones, app).listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor
} else app.listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor

// Carpetas públicas - internas
app.use("/formato", express.static(path.join(rutaActual, "publico/formatos")));
app.use("/imgsEstables", express.static(path.join(rutaActual, "publico/imagenes")));
app.use("/javascript", express.static(path.join(rutaActual, "publico/javascript")));
app.use("/fa", express.static("node_modules/@fortawesome/fontawesome-free"));

// Carpetas públicas - externas
global.carpImgsEditables = path.join(rutaActual, "../9-Imagenes"); // este dominio
app.use("/imgsEditables", express.static(carpImgsEditables));

// Variables globales
import constantes from "./variables/constantes.mjs";
for (const metodo in constantes) global[metodo] = constantes[metodo];

// Base de datos
const credenciales = await import("./variables/credenciales.mjs").then((n) => n.default); // es necesario el await para que traiga los valores de .env
const entornoBd = !entDesarr ? "produccion" : "desarrollo";
const credencsBD = credenciales.bd[entornoBd];
const {database, username, password} = credencsBD;
global.sequelize = new Sequelize(database, username, password, credencsBD);
const bd = await import("./baseDatos/index.mjs").then((n) => n.default);
global.bd = bd;
global.Op = Sequelize.Op;

// Para usar la propiedad "session"
const MySQLStore = connectMySQL(session);
const connection = mysql.createConnection(credenciales.session[entornoBd]);
const sessionStore = new MySQLStore(
	{expiration: unDia / 1000, clearExpired: true, checkExpirationInterval: unaHora / 1000, useUnixTimestamp: true}, // useUnixTimestamp: true es importante para segundos
	connection
); // la sesión se borra automáticamente un día después de la última novedad del usuario
app.use(
	session({
		key: "session_id", // nombre de cookie
		secret: "mama-antula",
		resave: false, // no reescribe la sesión en la base de datos si no hubo cambios en los datos de sesión
		saveUninitialized: false,
		store: sessionStore,
		rolling: true, // reinicia la vida útil con cada novedad en la session
		cookie: {maxAge: unDia}, // la sesión expira automáticamente un día después de la última novedad del usuario
	})
);
sessionStore.clearExpiredSessions(); // Elimina sesiones antiguas

// Todas las carpetas donde se almacenan vistas
const obtieneLasCarpsDeVista = (carpetaVistas) => {
	const subCarpetas = fs.readdirSync(carpetaVistas, {withFileTypes: true});
	const todasLasCarps = [carpetaVistas];

	// Recorre las carpetas
	for (const subCarpeta of subCarpetas)
		if (subCarpeta.isDirectory()) todasLasCarps.push(...obtieneLasCarpsDeVista(path.join(carpetaVistas, subCarpeta.name)));

	// Fin
	return todasLasCarps;
};
const vistas = obtieneLasCarpsDeVista("./vistas");
app.set("views", vistas);
app.set("view engine", "ejs");

// Funciones asíncronas de start-up
(async () => {
	// Funciones
	global.baseDatos = await import("./funciones/BaseDatos.mjs").then((n) => n.default);
	global.comp = await import("./funciones/Compartidas.mjs").then((n) => n.default);

	const lecturasDeBd = await import("./variables/BaseDatos.js")
		.then((n) => n.default)
		.then(async (n) => await n.lecturasDeBd());
	for (const campo in lecturasDeBd) global[campo] = lecturasDeBd[campo];

	//const rutinas = await import("./rutinas/RT-Control.mjs").then((n) => n.default);
	// await rutinas.startupMasConfiguracion();

	// Middlewares transversales
	app.use((await import("./middlewares/tituloPagina.mjs")).default);

	// Rutas
	app.use("/usuarios", (await import("./rutasContrs/usuarios/US-rutas.mjs")).default);
	app.use("/", (await import("./rutasContrs/lectura/LT-rutas.mjs")).default);

	// Error - página no encontrada
	app.use((await import("./middlewares/urlDesconocida.mjs")).default);
})();
