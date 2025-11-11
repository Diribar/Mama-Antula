"use strict";

export default {
	encabezados: async ({temaActual, pestanaActual, encabezado_id}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const {entidad, includes} = comp.contenido.obtieneDatosDeTabla(condicion);
		const esCarta = entidad == "encabCartas";

		// Obtiene los encabezados
		let encabezados = esCarta
			? await baseDatos
					.obtieneTodos(entidad, includes)
					.then((n) => n.sort((a, b) => (a.fechaEvento < b.fechaEvento ? -1 : 1)))
			: await baseDatos
					.obtieneTodosPorCondicion(entidad, condicion, includes)
					.then((n) => n.sort((a, b) => (b.fechaEvento < a.fechaEvento ? -1 : 1)));
		if (!encabezados.length) return {};

		// Les agrega los títulos
		if (temaActual && temaActual.indices.length)
			encabezados = comp.contenido.tituloCons[esCarta ? entidad : "encabConIndice"](encabezados);

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
	contenidos: async ({temaActual, pestanaActual, encabezado}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const {campo_id} = comp.contenido.obtieneDatosDeTabla(condicion);

		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {[campo_id]: encabezado.id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));
		console.log(46,contenidos);


		// Obtiene los registros del carrusel y los  vincula a su contenido
		const contenidos_ids = contenidos.map((n) => n.id);
		const carrusel = await baseDatos.obtieneTodosPorCondicion("carrusel", {contenido_id: contenidos_ids});
		contenidos.forEach((n) => (n.carrusel = carrusel.filter((m) => m.contenido_id == n.id)));

		// Fin
		return contenidos;
	},
};
