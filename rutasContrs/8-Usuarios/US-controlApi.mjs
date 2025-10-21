"use strict";
import valida from "./US-FN-Valida.mjs";
import procesos from "./US-Procesos.mjs";

export default {
	login: async (req, res) => {
		// Variables
		const {email, contrasena} = req.query;

		// Valida
		const {errores, usuario} = await valida.login(req.query);
		if (errores.hay) return res.json(errores);

		// Variables
		const {cliente} = req.session;
		const {cliente_id} = cliente;
		const esVisita = !cliente_id.startsWith("U");
		const datosUs = {};
		const espera = [];

		// Actualiza cookies - no se actualiza 'session'', para que se ejecute el middleware 'clientesSession'
		res.cookie("email", email, {maxAge: unAno});

		// Obtiene el usuario
		const {id: usuario_id} = usuario;

		// Si corresponde, le cambia el status a 'mailValidado'
		if (usuario.statusRegistro_id == mailPendValidar_id)
			espera.push(baseDatos.actualizaPorId("usuarios", usuario.id, {statusRegistro_id: mailValidado_id}));

		// Prepara la info a guardar en usuarios
		if (esVisita) {
			// Actualiza 'fechaUltNaveg'
			datosUs.fechaUltNaveg = cliente.fechaUltNaveg;

			// Actualiza 'diasNaveg'
			if (usuario.fechaUltNaveg < cliente.fechaUltNaveg) {
				const diaInicial = new Date(usuario.fechaUltNaveg).getTime();
				const diaFinal = new Date(cliente.fechaUltNaveg).getTime();
				const diasTransc = (diaFinal - diaInicial) / unDia;
				datosUs.diasNaveg = usuario.diasNaveg + Math.min(cliente.diasNaveg, diasTransc);
			}
		}
		if (!usuario.visitaCreadaEn) datosUs.visitaCreadaEn = cliente.visitaCreadaEn; // si existe la del usuario, se conserva

		// Guarda la info en usuario
		espera.push(baseDatos.actualizaPorId("usuarios", usuario.id, datosUs));
		for (const dato in datosUs) usuario[dato] = datosUs[dato];

		// Actualiza datos en la tabla 'persWebDia'
		const datosND = {
			cliente_id: usuario.cliente_id,
			usuario_id,
			visitaCreadaEn: comp.fechaHora.anoMesDia(usuario.visitaCreadaEn),
			diasNaveg: usuario.diasNaveg,
		};
		// const hoy = new Date().toISOString().slice(0, 10);
		// espera.push(
		// 	baseDatos
		// 		.actualizaPorCondicion("persWebDia", {cliente_id, fecha: hoy}, datosND) // la variable 'cliente_id' puede diferir del 'usuario.cliente_id'
		// 		.then(() => procesos.eliminaDuplicados(usuario.id))
		// );

		// Acciones si el cliente estaba como visita
		if (esVisita) {
			baseDatos.eliminaPorCondicion("visitas", {cliente_id}); // elimina el registro de la tabla
			res.cookie("cliente_id", usuario.cliente_id, {maxAge: unAno}); // actualiza la cookie
			// procesos.cambiaVisitaEnNavegsDia({cliente_id: usuario.cliente_id, cliente_idViejo: cliente_id}); // cambia el cliente_id en la tabla de navegsDia
		}

		// Limpia la información obsoleta
		delete req.session.cliente;

		// Fin
		await Promise.all(espera);
		return res.json({ok: true});
	},
	logout: async (req, res) => {},
};
