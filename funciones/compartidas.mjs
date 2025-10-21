"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	obtieneUsuarioPorMail: async (email) => {
		const include = ["rol", "statusRegistro", "genero"];
		console.log(10, email);

		const usuario = await baseDatos.obtienePorCondicion("usuarios", {email}, include);
		return usuario;
	},
};
