"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	obtieneUsuarioPorMail: (email) => {
		const include = ["rol", "statusRegistro", "genero"];
		return baseDatos.obtienePorCondicion("usuarios", {email}, include);
	},
};
