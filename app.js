"use strict";

// Start-up - última carpeta git subida: 1.00
console.clear();
global.horarioStartUp = Date.now();

// Requires
require("dotenv").config();
global.path = require("path");
global.fs = require("fs");
global.express = require("express");
const app = express();

// Aplicaciones express
app.use(express.urlencoded({extended: false})); // Para usar el método post y req.body
app.use(express.json()); // Para convertir el json recibido por POST en req.body

// Para usar cookies
const cookies = require("cookie-parser");
app.use(cookies());

// Entorno
global.entProd = path.basename(__dirname) == "1-Actual";
global.entPrueba = path.basename(__dirname) == "2-Prueba";
global.entDesarr = !entProd && !entPrueba;

// Variables que dependen del entorno
const subCarp = !entDesarr ? "1-Actual" : "";
const entornoBd = !entDesarr ? "produccion" : "desarrollo";
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

	const https = require("https");
	https.createServer(opciones, app).listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor
} else app.listen(puerto, () => console.log(leyenda)); // Para conectarse con el servidor

// Carpetas públicas - propias
app.use("/formato", express.static(path.join(__dirname, "publico/formatos")));
app.use("/imgsEstables", express.static(path.join(__dirname, "publico/imagenes")));
app.use("/javascript", express.static(path.join(__dirname, "publico/javascript")));

// Carpetas públicas - compartidas
global.carpImgsEditables = path.join(__dirname, "../9-Imagenes"); // este dominio
app.use("/imgsEditables", express.static(carpImgsEditables));

// Variables globales
const constantes = require("./variables/constantes");
for (const metodo in constantes) global[metodo] = constantes[metodo];

// Base de datos
global.Sequelize = require("sequelize");
global.credenciales = require("./variables/credenciale");
const credencsBD = credenciales.bd[entornoBd];
const {database, username, password} = credencsBD;
global.bdNombre = credencsBD.database;
global.sequelize = new Sequelize(database, username, password, credencsBD);
global.bd = require("./baseDatos"); // tiene que ir después de 'fs', porque el archivo 'index' usa 'fs'
global.Op = bd.Sequelize.Op;

// Para usar la propiedad "session"
const mysql = require("mysql2");
const connection = mysql.createConnection(credenciales.session[entornoBd]);
const session = require("express-session");
const MySQLStore = require("express-mysql-session")(session);
const sessionStore = new MySQLStore(
	{
		expiration: unDia / 1000,
		clearExpired: true,
		checkExpirationInterval: unaHora / 1000,
		useUnixTimestamp: true, // importante para segundos
	},
	connection
); // la sesión se borra automáticamente un día después de la última novedad del usuario
sessionStore.clearExpiredSessions(); // Elimina sesiones antiguas
app.use(
	session({
		key: "session_id", // nombre de cookie
		secret: "elc-peliculas", // ídem original
		resave: false, // ídem original - no reescribe la sesión en la base de datos si no hubo cambios en los datos de sesión
		saveUninitialized: false, // ídem original
		store: sessionStore, // nuevo
		rolling: true, // reinicia la vida útil con cada novedad en la session
		cookie: {maxAge: unDia}, // la sesión expira automáticamente un día después de la última novedad del usuario
	})
);

// Todas las carpetas donde se almacenan vistas
const obtieneLasCarpsDeVista = (carpetaVistas) => {
	const subCarpetas = fs.readdirSync(carpetaVistas, {withFileTypes: true});
	const todasLasCarps = [carpetaVistas];

	// Recorre las carpetas
	for (const subCarpeta of subCarpetas)
		if (subCarpeta.isDirectory()) todasLasCarps.push(...obtieneLasCarpsDeVista(carpetaVistas + "/" + subCarpeta.name));

	// Fin
	return todasLasCarps;
};
const vistas = obtieneLasCarpsDeVista("./vistas");
app.set("views", vistas);
app.set("view engine", "ejs"); // Terminación de los archivos de vista

// Funciones asíncronas de start-up
(async () => {
	// Variables que dependen de las lecturas de BD
	global.baseDatos = require("./funciones/BaseDatos");

	// Variables que requieren 'require'
	global.variables = require("./variables/Depends");
	global.comp = require("./funciones/Compartidas");

	// Procesos que dependen de la variable 'global'
	const rutinas = require("./rutinas/RT-Control");
	await rutinas.startupMasConfiguracion();

	// Middlewares transversales

	// Vistas - Con base definida

	// Middlewares transversales
	app.use(require(path.join(carpArchComp, "middlewares/transversales/urlDesconocida"))); // Si no se reconoce el url - se debe informar después de los urls anteriores

	// Fin
	return;
})();
