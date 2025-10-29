"use strict";

export default {
	datosIniciales: (req, res) => {
		// Variables
		const datosIniciales = {secciones, temasSecciones, pestanasTemas};

		// Fin
		return res.json(datosIniciales);
	},
	obtieneEncabs: async (req, res) => {
		// Variables
		const {seccion_id, tema_id, pestana_id} = req.query;
		const condicion = {[pestana_id ? "pestana_id" : "tema_id"]: pestana_id || tema_id};

		// Obtiene la entidad
		const seccionActual = secciones.find((n) => n.id == seccion_id);
		const temaActual = temasSecciones.find((n) => n.id == tema_id);
		const {entidad, orden} = comp.obtieneDatosTabla({seccionActual, temaActual});

		// Obtiene los titulos
		const titulos =
			entidad == "encabCartas"
				? await baseDatos.obtieneTodos(entidad)
				: await baseDatos
						.obtieneTodosPorCondicion(entidad, condicion)
						.then((n) => (orden ? n.sort((a, b) => a[orden] - b[orden]) : n));

		// Fin
		return res.json(titulos);
	},
};
