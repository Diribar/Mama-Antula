"use strict";
import procesos from "./ABM-procesos.mjs";

export default {
	// Obtiene información
	datosIniciales: (req, res) => {
		// Variables
		const datosIniciales = {
			...{secciones, temasSecciones, pestanasTemas}, // Filtros e Impacto...
			...{personajes, idiomas, lugares}, // Impacto de Filtro Encabezado
		};

		// Fin
		return res.json(datosIniciales);
	},
	obtieneEncabs: async (req, res) => {
		// Variables
		const {tema_id, pestana_id} = req.query;
		const condicion = {[pestana_id ? "pestana_id" : "tema_id"]: pestana_id || tema_id};
		const {usuario} = req.session;

		// Obtiene la entidad y los includes
		const {entidad, orden, includes} = comp.contenido.obtieneDatosDeTabla(condicion);
		const includesConEdics = [...includes, "ediciones"];

		// Obtiene los encabezados
		const encabezados = await procesos.obtieneEncabs.consolidado({entidad, condicion, includesConEdics, orden, usuario});

		// Fin
		return res.json(encabezados);
	},
	obtieneContenidos: async (req, res) => {
		// Variables
		const {encab_id, campo_id} = req.query;

		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {[campo_id]: encab_id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Fin
		return res.json(contenidos);
	},

	// Cambios en BD -
	guardaEncabezado: async (req, res) => {
		// Variables
		const {entidad, id, tema_id, pestana_id} = req.body;

		// Obtiene el original
		const original = await baseDatos.obtienePorId(entidad, id);

		// Si no existe el original, lo crea
		if (!original) {
			// Variables
			const creadoPor_id = req.session.usuario.id;
			const datos = {...req.body, creadoPor_id};
			delete datos.id;

			// Crea el original
			const nuevoRegistro = await baseDatos.agregaRegistroIdCorrel(entidad, datos);
			return res.json({id: nuevoRegistro.id, hay: false});
		}

		// Si no es propio y no está en status aprobado, interrumpe la función
		if (original.creadoPor_id != req.session.usuario.id && original.statusRegistro_id != aprobado_id)
			return res.json({mensaje: "No tenés permiso para editar este encabezado", hay: true});

		// Si está en status creado y por este usuario, actualiza el original
		if (original.statusRegistro_id == creado_id && original.creadoPor_id == req.session.usuario.id) {
			await baseDatos.actualizaPorId(entidad, id, req.body);
			return res.json({hay: false});
		}

		// Si está en status aprobado, crea o actualiza la edicion
		// Obtiene la edicion del usuario
		const condicion = {editadoPor_id: req.session.usuario.id};
		const {campo_id} = comp.contenido.obtieneDatosDeTabla({tema_id, pestana_id});
		condicion[campo_id] = id;
		const edicion = await baseDatos.obtienePorCondicion("edicionesEncab", condicion);

		// Averigua si hay novedades con el original
		// En caso que si, si hay una edición la actualiza, si no la crea
		// En caso que no, si hay una edición la elimina

		// Fin
		return res.json({hay: false});
	},
	eliminaEncabezado: async (req, res) => {
		// Variables
		console.log(req.body);

		// Fin
		return res.json();
	},
	guardaContenido: async (req, res) => {
		// Variables
		console.log(req.body);

		// Fin
		return res.json();
	},
	eliminaContenido: async (req, res) => {
		// Variables
		console.log(req.body);

		// Fin
		return res.json();
	},
};
