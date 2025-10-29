"use strict";

export default {
	datosIniciales: (req, res) => {
		// Variables
		const datosIniciales = {secciones, temasSecciones, pestanasTemas, personajes, idiomas, lugares};

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
		const {entidad, orden, includes} = comp.obtieneDatosTabla({seccionActual, temaActual});

		// Obtiene los encabezados
		let encabezados =
			entidad == "encabCartas"
				? await baseDatos
						.obtieneTodos(entidad, includes)
						.then((n) => n.sort((a, b) => new Date(a[orden]) - new Date(b[orden])))
				: entidad == "encabExpers"
				? await baseDatos
						.obtieneTodosPorCondicion(entidad, condicion, includes)
						.then((n) => n.sort((a, b) => new Date(b[orden]) - new Date(a[orden])))
				: await baseDatos.obtieneTodosPorCondicion(entidad, condicion).then((n) => n.sort((a, b) => a.orden - b.orden));

		// Les agrega el 'tituloCons'
		encabezados = comp.tituloCons[entidad](encabezados);

		// Fin
		return res.json(encabezados);
	},
};
