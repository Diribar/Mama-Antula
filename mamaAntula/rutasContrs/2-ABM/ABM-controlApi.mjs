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
		const {seccion_id, tema_id, pestana_id} = req.query;
		const condicion = {[pestana_id ? "pestana_id" : "tema_id"]: pestana_id || tema_id};
		const {usuario} = req.session;

		// Obtiene la entidad y los includes
		const seccionActual = secciones.find((n) => n.id == seccion_id);
		const temaActual = temasSecciones.find((n) => n.id == tema_id);
		const {entidad, orden, includes} = comp.contenido.obtieneDatosDeTabla({seccionActual, temaActual});
		const includesConEdics = [...includes, "ediciones"];

		// Obtiene los encabezados
		const encabezados = procesos.consolidado.obtieneEncabs({entidad, condicion, includesConEdics, orden, usuario});


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
		console.log(req.body);

		// Fin
		return res.json({id: 34});
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
