"use strict";
import bcryptjs from "bcryptjs";
import valida from "./US-FN-valida.mjs";
import procesos from "./US-procesos.mjs";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const {email} = req.query;

		// Obtiene el usuario y valida si ya se le envió una contraseña
		const {usuario, errores} = await valida.contrasenaYaEnviada(email);
		if (errores.hay) return res.json(errores);

		// Nueva contraseña
		const contrasena = Math.round(Math.random() * Math.pow(10, 6))
			.toString()
			.padStart(6, "0");
		console.log("Contraseña: " + contrasena);

		// Envia el mail con la contraseña
		const {mensajeFe, mailEnviado} = await procesos.altaOlvido.enviaMailContrasena({usuario, email, contrasena});

		// Actualiza o crea el usuario
		if (mailEnviado) {
			const contrEncriptada = bcryptjs.hashSync(contrasena, 10);
			usuario
				? await baseDatos.actualizaPorId("usuarios", usuario.id, {contrasena: contrEncriptada})
				: await procesos.altaOlvido.creaElUsuario({email, contrEncriptada});
		}

		// Fin
		return res.json({mensaje: mensajeFe, hay: !mailEnviado});
	},
	login: async (req, res) => {
		// Variables
		const {email, contrasena} = req.query;

		// Valida
		const {errores, usuario} = await valida.login({email, contrasena});
		if (errores.hay) return res.json(errores);

		// Actualiza el usuario
		const {cliente} = req.session;
		const {cliente_id} = cliente;
		const esVisita = !cliente_id.startsWith("U");
		await procesos.login.actualizaUsuario({usuario, cliente, esVisita});

		// Actualiza el usuario y la cookie - no se actualiza 'session'', para que se ejecute el middleware 'clientesSession'
		res.cookie("email", email, {maxAge: unAno});
		res.cookie("cliente_id", usuario.cliente_id, {maxAge: unAno}); // es crítico por seguridad, para cruzar email con cliente_id
		delete req.session.cliente; // es crítico para que lo obtenga del cliente_id

		// Actualiza datos en las estadísticas
		// procesos.login.actualizaPersWebDia(usuario)
		// if (esVisita) procesos.cambiaVisitaEnNavegsDia({cliente_id: usuario.cliente_id, cliente_idViejo: cliente_id});

		// Fin
		return res.json({hay: false});
	},
	logout: async (req, res) => {
		// Desloguea al usuario
		delete req.session.usuario;
		res.clearCookie("email");
		if (res.locals && res.locals.usuario) delete res.locals.usuario;

		// Fin
		return res.json();
	},
	edicion:{
		validaCampo: async (req, res) => {
			// Variables
			const {id} = req.query;

			// Valida
			const {errores, usuario} = await valida.edicion({id});
			if (errores.hay) return res.json(errores);

			// Fin
			return res.json({hay: false});
		},
		revisaGuarda: async (req, res) => {
			// Variables
			const datos = req.query;

			// Valida
			const {errores, usuario} = await valida.edicion({datos});
			if (errores.hay) return res.json(errores);

			// Actualiza el usuario
			baseDatos.actualizaPorId("usuarios", usuario.id, datos);

			// Fin
			return res.json({hay: false});
		},
	},
	cambioRoles: async (req, res) => {},
};
