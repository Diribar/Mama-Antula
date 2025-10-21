"use strict";
// Imports
import bcryptjs from "bcryptjs";
// const procesos = require("./US-FN-Procesos");

export default {
	altaMail: async function (email) {
		// Variables
		let errores = formatoMail(email);

		// Se fija si el mail ya existe
		if (!errores.email && (await baseDatos.obtienePorCondicion("usuarios", {email}))) {
			errores.credenciales = "Esta dirección de email ya figura en nuestra base de datos";
			errores.hay = !!errores.credenciales;
		}

		// Fin
		return errores;
	},
	login: async (datos) => {
		// Variables
		const {email, contrasena} = datos;
		let errores, usuario;

		// Verifica el formato del mail
		errores = formatoMail(email);
		if (errores.hay) return {errores};

		// Verifica la contraseña
		errores.contrasena = !contrasena ? contrasenaVacia : largoContr(contrasena) ? largoContr(contrasena) : "";
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
const camposPerennes = ["nombre", "apellido", "fechaNacim", "paisNacim_id"];

// Funciones
const formatoMail = (email) => {
	// Variables
	const formato = /^\w+([\.-_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	const errorMail = !email ? mensMailVacio : !formato.test(email) ? mensMailFormato : "";

	// Variable error
	let errores = {email: errorMail};
	errores.hay = !!errores.email;

	// Fin
	return errores;
};
const largoContr = (contrasena) => {
	return contrasena && (contrasena.length < 6 || contrasena.length > 12)
		? "La contraseña debe tener entre 6 y 12 caracteres"
		: "";
};
