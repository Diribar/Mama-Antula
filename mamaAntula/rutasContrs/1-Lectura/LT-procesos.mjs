"use strict";

export default {
	contenido: async ({seccionActual, temaActual, pestanaActual}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const [entidad, campo_id, orden] =
			seccionActual.codigo == "experiencias"
				? ["encabExps", "experiencia_id", null]
				: temaActual.codigo == "cartas"
				? ["encabCartas", "carta_id", null]
				: ["encabSinIndice", "sinIndice_id", "orden"];

		// Obtiene los encabezados
		const encabezados = await baseDatos
			.obtieneTodosPorCondicion(entidad, condicion)
			.then((n) => (orden ? n.sort((a, b) => a[orden] - b[orden]) : n));
		const encabezados_ids = encabezados.map((n) => n.id);

		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {[campo_id]: encabezados_ids})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Obtiene las imgsCarrousel y las  vincula a su contenido
		const contenidos_ids = contenidos.map((n) => n.id);
		const imgsCarrousel = await baseDatos
			.obtieneTodosPorCondicion("imgsCarrousel", contenidos_ids)
			.then((n) => n.filter((m) => contenidos_ids.includes(m.contenido_id)));
		contenidos.forEach((n) => (n.imgsCarrousel = imgsCarrousel.filter((m) => m.contenido_id == n.id)));

		// Fin
		return {esConIndice, encabezados, contenidos};
	},
};
