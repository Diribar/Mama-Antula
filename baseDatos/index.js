"use strict";

// Variables
const nombreDeEsteArch = path.basename(__filename); // el nombre de este archivo
const tablas = {};

// Obtiene las carpetas
let carpetas = fs.readdirSync(__dirname);
for (let i = carpetas.length - 1; i >= 0; i--) if (carpetas[i].includes(".")) carpetas.splice(i, 1); // elimina los archivos
carpetas.push("/");
carpetas = carpetas.map((n) => path.join(__dirname, n));

// Agrega cada tabla a 'tablas'
for (const carpeta of carpetas) {
	fs.readdirSync(carpeta)
		.filter(
			(archivo) =>
				archivo !== nombreDeEsteArch && // archivo distinto a éste
				archivo.indexOf(".") > 0 && // tiene '.' en el nombre y no está en el primer caracter
				archivo.slice(-3) === ".js" // con terminación '.js'
		)
		.map((archivo) => {
			const tabla = require(path.join(carpeta, archivo))(sequelize, Sequelize.DataTypes);
			tablas[tabla.name] = tabla;
		});
}

// Agrega las asociaciones
for (const tabla in tablas) if (tablas[tabla].associate) tablas[tabla].associate(tablas);

// Agrega las funciones
tablas.Sequelize = Sequelize;
tablas.sequelize = sequelize;

// Fin
module.exports = tablas;
