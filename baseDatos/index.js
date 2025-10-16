"use strict";

// Imports
import {fileURLToPath, pathToFileURL} from "url";

// Variables
const rutaActual = path.dirname(fileURLToPath(import.meta.url));
const nombreArch = path.basename(fileURLToPath(import.meta.url)); // el nombre de este archivo
const tablas = {};

// Obtiene las carpetas
const carpetas = ["/", ...fs.readdirSync(rutaActual)].filter((n) => !n.includes(".")); // todas las carpetas y la raíz
carpetas.forEach((n, i) => (carpetas[i] = path.join(rutaActual, n)));

// Agrega cada tabla a 'tablas'
for (const carpeta of carpetas) {
	const archivos = fs.readdirSync(carpeta).filter((archivo) => archivo !== nombreArch && path.extname(archivo) === ".mjs"); // archivo distinto a éste y con terminación '.mjs'

	for (const archivo of archivos) {
		// 👇 Convertir ruta a URL para import dinámico
		const rutaArchivo = pathToFileURL(path.join(carpeta, archivo)).href;
		const modelo = await import(rutaArchivo).then((m) => m.default);

		const tabla = modelo(sequelize, Sequelize.DataTypes);
//		console.log(25, modelo, tabla);
		tablas[tabla.name] = tabla;
	}
	// .map((archivo) => {
	// 	const tabla = require(path.join(carpeta, archivo))(sequelize, Sequelize.DataTypes);
	// 	tablas[tabla.name] = tabla;
	// });
}

// Agrega las asociaciones
for (const tabla in tablas) if (tablas[tabla].associate) tablas[tabla].associate(tablas);

// Agrega las funciones
tablas.Sequelize = Sequelize;
tablas.sequelize = sequelize;

// Fin
export default tablas;
