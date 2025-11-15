"use strict";
// Imports
import bcryptjs from "bcryptjs";
// const procesos = require("./US-FN-Procesos");

export default {
	login: async (datos) => {
		// Variables
		const {email, contrasena} = datos;
		let errores, usuario;

		// Verifica el formato del mail
		errores = comp.formatoMail(email);
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
				(!apodo && FN.inputVacio("apodo")) ||
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
const contrasenaVacia = "Necesitamos que escribas una contraseña";

// Funciones
const FN = {
	largoContr: (pw) => (pw && (pw.length < 6 || pw.length > 12) ? "La contraseña debe tener entre 6 y 12 caracteres" : ""),
	inputVacio: (campo) => "Necesitamos que completes el campo <em>" + campo + "</em>",
};
