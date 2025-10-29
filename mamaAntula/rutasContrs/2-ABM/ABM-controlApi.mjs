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
		let encabezados =
			entidad == "encabCartas"
				? await baseDatos.obtieneTodos(entidad)
				: await baseDatos
						.obtieneTodosPorCondicion(entidad, condicion)
						.then((n) => n.sort((a, b) => (orden == "orden" ? a.orden - b.orden : b.fechaEvento - a.fechaEvento)));

		// Crea los encabezados para las cartas
		if (entidad == "encabCartas") encabezados = comp.armaTitulos.cartas(encabezados);
		if (entidad == "encabExps") encabezados = comp.armaTitulos.expers(encabezados);

		// Fin
		return res.json(encabezados);
	},
};
