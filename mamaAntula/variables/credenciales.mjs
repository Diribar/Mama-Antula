"use strict";
// Variables - credenciales
const database = process.env.NOMBRE_BD;
const username = database;
const password = process.env.CONTRASENA_USUARIO_BD;

// Variables - otras
const dialect = "mysql";
const logging = false;

// Variables - objetos
const produccion = {
	database,
	username, // necesario para Sequelize - anterior: elc_test
	password,

	// Datos que usa node_modules/sequelize/lib/sequelize
	dialect,
	logging,
	// host: "localhost",
};
const desarrollo = {...produccion, username: "root", password: ""};

// Exportar
export default {
	bd: {produccion, desarrollo},
	session: {
		produccion: {database, user: username, password},
		desarrollo: {database, user: "root", password: ""},
	},
	mail: {
		// Para conexión
		host: process.env.HOST_MAIL,
		puerto: 465,
		seguro: true, // secure: true for 465, false for other ports

		// Para envíos
		mailEnvios: process.env.MAIL_ENVIOS,
		contrEnvios: process.env.CONTR_ENVIOS,

		// Para atención al usuario
		ateUsuario: process.env.MAIL_ATE_USUARIO,
	},
};
