"use strict";
// Imports
import bcryptjs from "bcryptjs";
// const procesos = require("./US-FN-Procesos");

export default {
	contrasenaYaEnviada: async (email) => {
		// Variables
		let errores;

		// Verifica el formato del mail
		errores = FN.formatoMail(email);
		if (errores.hay) return {errores};

		// Obtiene la fecha de contraseña del usuario
		const usuario = await baseDatos.obtienePorCondicion("usuarios", {email});
		const {fechaContrasena} = usuario || {};

		// Detecta si ya se le envió una contraseña en las últimas 24hs
		const ahora = comp.fechaHora.ahora();
		const diferencia = fechaContrasena && (ahora.getTime() - fechaContrasena.getTime()) / unaHora;
		const envioReciente = diferencia && diferencia < 24;

		// Mensaje de error
		errores = envioReciente ? {email: mailYaEnviado, hay: true} : {};

		// Fin
		return {usuario, errores};
	},
	login: async (datos) => {
		// Variables
		const {email, contrasena} = datos;
		let errores, usuario;

		// Verifica el formato del mail
		errores = FN.formatoMail(email);
		if (errores.hay) return {errores};

		// Verifica la contraseña
		errores.contrasena = (!contrasena && contrasenaVacia) || FN.largoContr(contrasena) || "";
		errores.hay = Object.values(errores).some((n) => !!n);
		if (errores.hay) return {errores};

		// Revisa las credenciales
		usuario = await comp.obtieneUsuarioPorMail(email);
		const email_BD = !usuario;
		const contr_BD = usuario && !bcryptjs.compareSync(datos.contrasena, usuario.contrasena);
		errores.credenciales = ((email_BD || contr_BD) && "Credenciales erróneas") || "";
		errores.hay = !!errores.credenciales;

		// Fin
		return {errores, usuario};
	},
	edicion: (datos) => {
		// Variables
		const {campo, imagen, apodo, contrasena} = datos; // datos tiene más métodos
		const errores = {};

		// Apodo - campo obligatorio
		if (!campo || campo == "apodo")
			errores.apodo =
				(!apodo && inputVacio) ||
				comp.validacs.castellano.basico(apodo) ||
				comp.validacs.inicial.basico(apodo) ||
				comp.validacs.longitud(apodo, 2, 30) ||
				"";

		// Campos opcionales
		if (imagen) errores.imagen = comp.validacs.imagen(datos);
		if (contrasena) errores.contrasena = FN.largoContr(contrasena) || "";

		// Fin
		errores.hay = Object.values(errores).some((n) => !!n);
		return errores;
	},
};

// Variables y Funciones
const inputVacio = "Necesitamos que completes este campo";
const mensMailVacio = "Necesitamos que escribas un correo electrónico";
const mensMailFormato = "Necesitamos que escribas un formato de correo válido";
const contrasenaVacia = "Necesitamos que escribas una contraseña";
const mailYaEnviado =
	"Ya te enviamos un mail con la contraseña. Para evitar <em>spam</em>, esperamos 24hs antes de enviarte una nueva.";

// Funciones
const FN = {
	formatoMail: (email) => {
		// Variables
		const formato = /^\w+([\.-_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		const errorMail = !email ? mensMailVacio : !formato.test(email) ? mensMailFormato : "";

		// Variable error
		const errores = {email: errorMail};
		errores.hay = !!errores.email;

		// Fin
		return errores;
	},
	largoContr: (pw) => (pw && (pw.length < 6 || pw.length > 12) ? "La contraseña debe tener entre 6 y 12 caracteres" : ""),
};
