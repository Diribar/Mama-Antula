"use strict";

// Start-up - última carpeta git subida: 4.03
console.clear();
globalThis.horarioStartUp = Date.now();

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
globalThis.path = path;
globalThis.fs = fs;
globalThis.Sequelize = Sequelize;

// Carga variables confidenciales
dotenv.config({quiet: true});

// Aplicaciones express
const app = express();
app.use(express.urlencoded({extended: false})); // Para usar el método post y req.body
app.use(express.json()); // Para convertir el json recibido por POST en req.body
app.use(cookieParser());

// Variables de entorno
globalThis.rutaHome = path.dirname(fileURLToPath(import.meta.url)); // es la carpeta raíz
globalThis.entProd = path.basename(rutaHome) == "1-Actual";
const entPrueba = path.basename(rutaHome) == "2-Prueba";
const entDesarr = !entProd && !entPrueba;
globalThis.urlHost = ((entProd || entPrueba) && "https://mamaantula.online") || "https://mamaantula:3008";

// Servidor
const puerto = entProd ? 4216 : entPrueba ? "?" : 3008;
const leyenda = "\nMama Antula - Servidor funcionando...";
if (entDesarr) {
	// Variables
	const rutaArchivo = "./variables/mamaantula";
	const ext = ".pem";
	const opciones = {cert: fs.readFileSync(rutaArchivo + ext), key: fs.readFileSync(rutaArchivo + "-key" + ext)};

	// Conexión con el servidor
	https.createServer(opciones, app).listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor
} else app.listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor

// Carpetas públicas - imágenes
globalThis.carpImgsEstables = path.join(rutaHome, "/publico/imagenes");
app.use("/imgsEstables", express.static(carpImgsEstables));
globalThis.carpImgsEditables = path.join(rutaHome, "../9-Imagenes"); // este dominio
app.use("/imgsEditables", express.static(carpImgsEditables));

// Carpetas públicas - videos
const videos = path.join(rutaHome, "../8-Videos"); // este dominio
app.use("/videos", express.static(videos));

// Carpetas públicas - descargas
const descargas = path.join(rutaHome, "../7-Descargas"); // este dominio
app.use("/descargas", express.static(descargas));

// Carpetas públicas - otras
app.use("/formatos", express.static(path.join(rutaHome, "/publico/formatos")));
app.use("/javascript", express.static(path.join(rutaHome, "/publico/javascript")));
app.use("/fa", express.static("node_modules/@fortawesome/fontawesome-free"));

// Variables globales - debe ser con await, para que primero se carguen las variables globales de más arriba
const constantes = await import("./variables/constantes.js");
for (const metodo in constantes.default) globalThis[metodo] = constantes.default[metodo];

// Base de datos
globalThis.credencsSitio = await import("./variables/credenciales.js").then((n) => n.default); // es necesario el await para que traiga los valores de .env
const entornoBd = !entDesarr ? "produccion" : "desarrollo";
const credencsBD = credencsSitio.bd[entornoBd];
const {database, username, password} = credencsBD;
globalThis.sequelize = new Sequelize(database, username, password, credencsBD);
const bd = await import("./baseDatos/index.js").then((n) => n.default);
globalThis.bd = bd;
globalThis.Op = Sequelize.Op;

// Para usar la propiedad "session"
const MySQLStore = connectMySQL(session);
const connection = mysql.createConnection(credencsSitio.session[entornoBd]);
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
	// Funciones globales
	globalThis.baseDatos = await import("./funciones/baseDatos.js").then((n) => n.default);
	globalThis.comp = await import("./funciones/compartidas.js").then((n) => n.default);

	// Variables globales de la base de datos
	const varsBD = await import("./variables/baseDatos.js").then((n) => n.default);
	const lecturasDeBd = await varsBD.lecturasDeBd();
	for (const campo in lecturasDeBd) globalThis[campo] = lecturasDeBd[campo];
	const datosPartics = varsBD.datosPartics();
	for (const campo in datosPartics) globalThis[campo] = datosPartics[campo]; // asigna una variable a valores específicos

	// Rutinas
	const rutinas = await import("./rutinas/RT-Control.js").then((n) => n.default);
	await rutinas.startupMasConfiguracion();

	// Middlewares transversales
	app.use((await import("./middlewares/transversales/TR-clienteId.js")).default);
	app.use((await import("./middlewares/transversales/TR-novsSitio.js")).default);
	app.use((await import("./middlewares/transversales/TR-haciaEdicUs.js")).default);

	// Rutas
	app.use("/actualizar", (await import("./rutasContrs/2-Actualizar/ACT-rutas.js")).default);
	app.use("/revisar", (await import("./rutasContrs/3-Revisar/REV-rutas.js")).default);
	app.use("/usuarios", (await import("./rutasContrs/8-Usuarios/US-rutas.js")).default);
	app.use("/", (await import("./rutasContrs/9-Miscelaneas/MS-rutas.js")).default);
	app.use("/", (await import("./rutasContrs/1-Lectura/LT-rutas.js")).default);

	// Ruta desconocida
	app.use(comp.rutaInvalida); // Si no se reconoce el url - se debe informar después de los urls anteriores
})();
