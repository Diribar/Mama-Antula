"use strict";

export default {
	contenido: async ({temaActual, pestanaActual}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		let encabezados;

		// Obtiene el encabezado sin indice
		encabezados = await baseDatos.obtienePorCondicion("encSinIndice", condicion);
		const esConIndice = !encabezados.length;
		if (esConIndice) encabezados = await baseDatos.obtieneTodosPorCondicion("encConIndice", condicion);
		const encabezados_ids = esConIndice ? encabezados.map((n) => n.id) : [encabezados.id];

		// Obtiene los contenidos
		const campo_id = esConIndice ? "encConIndice_id" : "encSinIndice_id";
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
