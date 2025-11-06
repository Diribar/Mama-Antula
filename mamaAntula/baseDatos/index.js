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
	// Obtiene los archivos de la carpeta
	const archivos = fs
		.readdirSync(carpeta)
		.filter((arch) => arch !== nombreArch && [".mjs", ".js"].includes(path.extname(arch))); // archivo distinto a éste y con terminación correcta

	for (const archivo of archivos) {
		// Obtiene la ruta del archivo en formato 'url' e importa el modelo
		const rutaArchivo = pathToFileURL(path.join(carpeta, archivo)).href;
		const {default: modelo} = await import(rutaArchivo);

		// Obtiene la tabla y la agrega a 'tablas'
		const tabla = modelo(sequelize, Sequelize.DataTypes);
		tablas[tabla.name] = tabla;
	}
}

// Agrega las asociaciones
for (const tabla in tablas) if (tablas[tabla].associate) tablas[tabla].associate(tablas);

// Agrega las funciones
tablas.Sequelize = Sequelize;
tablas.sequelize = sequelize;

// Fin
export default tablas;
