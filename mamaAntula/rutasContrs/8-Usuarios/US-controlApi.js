"use strict";
import bcryptjs from "bcryptjs";
import procesos from "./US-procesos.js";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const {email, usuario} = req.body;
		usuario.email = email;

		// Nueva contraseña
		const contrasena = Math.round(Math.random() * Math.pow(10, 6))
			.toString()
			.padStart(6, "0");
		console.log("Contraseña: " + contrasena);
		usuario.contrasena = contrasena;

		// Envia el mail con la contraseña
		const {mensajeFe, mailEnviado} = await procesos.altaOlvido.enviaMailContrasena(usuario);

		// Actualiza o crea el usuario
		if (mailEnviado) {
			const contrEncriptada = bcryptjs.hashSync(contrasena, 10);
			usuario.id
				? await baseDatos.actualizaPorId("usuarios", usuario.id, {contrasena: contrEncriptada})
				: await procesos.altaOlvido.creaElUsuario({email, contrEncriptada});
		}

		// Fin
		return res.json({mensaje: mensajeFe, hay: !mailEnviado});
	},
	login: async (req, res) => {
		// Variables
		const {email, usuario} = req.body;

		// Actualiza el usuario
		const {cliente} = req.session;
		const {cliente_id} = cliente;
		const esVisita = !cliente_id.startsWith("U");
		await procesos.login.actualizaUsuario({usuario, cliente, esVisita});

		// Actualiza el usuario y la cookie - no se actualiza 'session'', para que se ejecute el middleware 'clientesSession'
		res.cookie("email", email, {maxAge: unAno, path: "/"});
		res.cookie("cliente_id", usuario.cliente_id, {maxAge: unAno, path: "/"}); // es crítico por seguridad, para cruzar email con cliente_id
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
		return res.json({});
	},
	edicion: (req, res) => {
		// Variables
		const datos = req.body;

		// Actualizaciones varias
		const {usuario} = req.session;
		const datosSession = procesos.actualizacsEdicion(datos, usuario);
		req.session.usuario = {...req.session.usuario, ...datosSession};
		if (req.file) comp.gestionArchs.descarga(carpUsuarios, datos.imagen, req.file); // sin 'await', porque en el FE se actualiza con el url

		// Fin
		return res.json({hay: false});
	},
	cambiaRoles: async (req, res) => {
		// Variables
		const {usuario_id: id, nombreCompleto, rol_id} = req.body;

		// Arma los datos a actualizar
		const datos = {};
		if (nombreCompleto) datos.nombreCompleto = nombreCompleto;
		if (rol_id) datos.rol_id = rol_id;

		// Actualiza el usuario
		await baseDatos.actualizaPorId("usuarios", id, datos);

		// Fin
		return res.json({});
	},
};
