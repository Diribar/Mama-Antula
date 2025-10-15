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
const desarrollo = {
	...produccion,
	username: "root", // necesario para Sequelize
	password: "",
};

// Exportar
module.exports = {
	bd: {produccion, desarrollo},
	session: {
		produccion: {database, user: username, password}, // anterior: elc_test - 0UfBnmM9eSJl
		desarrollo: {database, user: "root", password: ""},
	},
	// mail: {
	// 	host: "mail.evangelicemoslacultura.com",
	// 	puerto: "465",
	// 	direccion: "solo-envios@evangelicemoslacultura.com",
	// 	contrasena: "gppePwXGCaRq",
	// 	ateUsuario: "atencion-al-usuario@evangelicemoslacultura.com", // 35Ysn6NfNjlt
	// },
};
