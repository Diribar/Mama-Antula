"use strict";
// Imports
import bcryptjs from "bcryptjs";
// const procesos = require("./US-FN-Procesos");

export default {
	formatoMail: (email) => formatoMail(email),
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
	datosPeren: async (datos) => {
		// 1. Revisa si los datos tienen la info de los campos perennes
		const campos = Object.keys(datos);
		for (const campo of camposPerennes) if (!campos.includes(campo)) return {faltanCampos: true, hay: true};

		// 2. Revisa el formato superficial de los valores
		let errores = perennesFE(datos);
		if (errores.hay) return errores;

		// 3. Revisa las credenciales
		const {email} = datos;
		const usuario = await baseDatos.obtienePorCondicion("usuarios", {email});
		errores.credenciales = camposPerennes.some((n) => usuario[n] != datos[n]); // si algún campo no coincide, es 'true'
		errores.hay = errores.credenciales;

		// Fin
		return errores;
	},
	login: async (datos) => {
		// Variables
		const {email, contrasena} = datos;
		let usuario;

		// Verifica errores
		let errores = formatoMail(email);
		errores.contrasena = !contrasena ? contrasenaVacia : largoContr(contrasena) ? largoContr(contrasena) : "";
		errores.hay = Object.values(errores).some((n) => !!n);

		// Sólo si no hay algún error previo, revisa las credenciales
		if (!errores.hay) {
			// Obtiene el usuario
			usuario = await comp.obtieneUsuarioPorMail(email);

			// Valida el mail y la contraseña
			errores.email_BD = !usuario;
			errores.contr_BD = usuario && !bcryptjs.compareSync(datos.contrasena, usuario.contrasena);

			// Valida las credenciales
			errores.credenciales = errores.email_BD || errores.contr_BD;
			errores.hay = errores.credenciales;
		}

		// Fin
		return {errores, usuario};
	},
	editables: (datos) => {
		// Variables
		let errores = {};
		let campos = Object.keys(datos);

		// Validaciones
		if (campos.includes("apodo")) {
			const dato = datos.apodo;
			errores.apodo =
				(!dato && inputVacio) ||
				comp.validacs.castellano.basico(dato) ||
				comp.validacs.inicial.basico(dato) ||
				comp.validacs.longitud(dato, 2, 30) ||
				"";

			// Fin
		}
		if (campos.includes("genero_id")) errores.genero_id = !datos.genero_id ? selectVacio : "";
		if (campos.includes("pais_id")) errores.pais_id = !datos.pais_id ? selectVacio : "";
		if (campos.includes("avatar")) errores.avatar = comp.validacs.avatar(datos);

		// Fin
		errores.hay = Object.values(errores).some((n) => !!n);
		return errores;
	},
	perennesFE: (datos) => perennesFE(datos),
	perennesBE: async (datos) => {
		// Averigua los errores superficiales
		for (const campo of camposPerennes) if (!datos[campo]) datos[campo] = "";
		let errores = await perennesFE(datos);
		if (errores.hay) return errores;

		// Averigua si ya existe un usuario con esas credenciales
		let condicion = {};
		for (const campo of camposPerennes) condicion[campo] = datos[campo];
		errores.credenciales =
			!!(await baseDatos.obtienePorCondicion("usuarios", condicion)) && procesos.comentarios.credsInvalidas.datosPeren;
		errores.hay = !!errores.credenciales;

		// Fin
		return errores;
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
const perennesFE = (datos) => {
	// Variables
	const errores = {};
	const campos = Object.keys(datos);

	// Funciones
	const fechaRazonable = (dato) => {
		// Verificar que la fecha sea razonable
		const fecha = new Date(dato);
		const max = comp.fechaHora.ahora();
		const min = comp.fechaHora.ahora();
		max.setFullYear(max.getFullYear() - 5);
		min.setFullYear(min.getFullYear() - 100);
		return fecha > max || fecha < min;
	};

	// Validaciones
	if (campos.includes("nombre")) {
		const dato = datos.nombre;
		errores.nombre =
			(!dato && inputVacio) ||
			comp.validacs.castellano.basico(dato) ||
			comp.validacs.inicial.basico(dato) ||
			comp.validacs.longitud(dato, 2, 30) ||
			"";
	}
	if (campos.includes("apellido")) {
		const dato = datos.apellido;
		errores.apellido =
			(!dato && inputVacio) ||
			comp.validacs.castellano.basico(dato) ||
			comp.validacs.inicial.basico(dato) ||
			comp.validacs.longitud(dato, 2, 30) ||
			"";
	}
	if (campos.includes("fechaNacim"))
		errores.fechaNacim = !datos.fechaNacim
			? "Necesitamos que ingreses la fecha"
			: fechaRazonable(datos.fechaNacim)
			? "¿Estás seguro de que introdujiste la fecha correcta?"
			: "";
	if (campos.includes("paisNacim_id")) errores.paisNacim_id = !datos.paisNacim_id ? "Necesitamos que elijas un país" : "";

	// Fin
	errores.hay = Object.values(errores).some((n) => !!n);
	return errores;
};
const largoContr = (contrasena) => {
	return contrasena && (contrasena.length < 6 || contrasena.length > 12)
		? "La contraseña debe tener entre 6 y 12 caracteres"
		: "";
};
