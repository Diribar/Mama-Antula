"use strict";
// Imports
import bcryptjs from "bcryptjs";
// const procesos = require("./US-FN-Procesos");

export default {
	contrasenaYaEnviada: async (email) => {
		// Verifica el formato del mail
		errores = FN.formatoMail(email);
		if (errores.hay) return {errores};

		// Obtiene la fecha de contraseña del usuario
		const usuario = await baseDatos.obtienePorCondicion("usuarios", {email});
		const {fechaContrasena} = usuario;

		// Detecta si ya se le envió una contraseña en las últimas 24hs
		const ahora = comp.fechaHora.ahora();
		const diferencia = fechaContrasena && (ahora.getTime() - fechaContrasena.getTime()) / unaHora;
		const envioReciente = diferencia && diferencia < 24;

		// Mensaje de error
		const errores = envioReciente ? {email: mailYaEnviado, hay: true} : {};

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
		errores.credenciales = (email_BD || contr_BD) && "Credenciales erróneas";
		errores.hay = !!errores.credenciales;

		// Fin
		return {errores, usuario};
	},
};

// Variables y Funciones
const mensMailVacio = "Necesitamos que escribas un correo electrónico";
const mensMailFormato = "Necesitamos que escribas un formato de correo válido";
const contrasenaVacia = "Necesitamos que escribas una contraseña";
const mailYaEnviado = "Ya enviamos un mail con la contraseña. Para evitar 'spam', esperamos 24hs antes de enviar una nueva.";

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
	largoContr: (contrasena) => {
		return contrasena && (contrasena.length < 6 || contrasena.length > 12)
			? "La contraseña debe tener entre 6 y 12 caracteres"
			: "";
	},
};
