"use strict";

export default {
	encabezados: async ({temaActual, pestanaActual, encabezado_id}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const esCarta = temaActual && temaActual.codigo == "cartas";
		const conIndice = !esCarta && temaActual && temaActual.indices.length;

		// Obtiene los encabezados
		let encabezados = esCarta
			? await baseDatos
					.obtieneTodosPorCondicion("encabezados", condicion, includesEncabs.cartas)
					.then((n) => n.sort((a, b) => (a.fechaEvento < b.fechaEvento ? -1 : 1)))
			: conIndice
			? await baseDatos
					.obtieneTodosPorCondicion("encabezados", condicion, includesEncabs.conIndice)
					.then((n) => n.sort((a, b) => (b.fechaEvento < a.fechaEvento ? -1 : 1)))
			: await baseDatos.obtieneTodosPorCondicion("encabezados", condicion);
		if (!encabezados.length) return {};

		// Les agrega los títulos
		if (esCarta || conIndice) encabezados = comp.titulosLectura({esCarta, conIndice, encabezados});

		// Obtiene el encabezado actual
		const encabezado = encabezados.find((n) => n.id == encabezado_id) || encabezados[0];

		// Si es una tema con índice, obtiene los encabezados anterior y posterior
		if (temaActual && temaActual.indices.length) {
			const indice = encabezados.indexOf(encabezado);
			encabezado.ant_id = encabezados[indice - 1]?.id || null;
			encabezado.sig_id = encabezados[indice + 1]?.id || null;
		}

		// Fin
		return {encabezados, encabezado};
	},
	contenidos: async (encabezado) => {
		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id: encabezado.id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Obtiene los registros del carrusel y los  vincula a su contenido
		const contenidos_ids = contenidos.map((n) => n.id);
		const carrusel = await baseDatos.obtieneTodosPorCondicion("carrusel", {contenido_id: contenidos_ids});
		contenidos.forEach((n) => (n.carrusel = carrusel.filter((m) => m.contenido_id == n.id)));

		// Fin
		return contenidos;
	},
};
