"use strict";

export default {
	contenidos: async ({temaActual, pestanaActual, encabezado_id}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const {entidad, campo_id, includes} = comp.contenido.obtieneDatosDeTabla(condicion);

		// Obtiene los encabezados
		console.log(10, entidad, condicion, includes);

		const encabezados =
			entidad == "encabCartas"
				? await baseDatos
						.obtieneTodos(entidad, includes)
						.then((n) => n.sort((a, b) => (a.fechaEvento < b.fechaEvento ? -1 : 1)))
				: await baseDatos
						.obtieneTodosPorCondicion(entidad, condicion, includes)
						.then((n) => n.sort((a, b) => (b.fechaEvento < a.fechaEvento ? -1 : 1)));
		if (!encabezados.length) return {};
		const encabezado = encabezados.find((n) => n.id == encabezado_id) || encabezados[0];

		// Obtiene los encabezados anterior y posterior
		const indice = encabezados.indexOf(encabezado);
		encabezado.ant_id = encabezados[indice - 1]?.id || null;
		encabezado.sig_id = encabezados[indice + 1]?.id || null;

		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {[campo_id]: encabezado.id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Obtiene las imgsCarrousel y las  vincula a su contenido
		const contenidos_ids = contenidos.map((n) => n.id);
		const imgsCarrousel = await baseDatos.obtieneTodosPorCondicion("imgsCarrousel", {contenido_id: contenidos_ids});
		contenidos.forEach((n) => (n.imgsCarrousel = imgsCarrousel.filter((m) => m.contenido_id == n.id)));

		// Fin
		return {encabezado, contenidos};
	},
	indice: (encabezados) => {
		// Variables
		const fechas = [...new Set(encabezados.map((n) => n.fechaEvento))];

		// Averigua la cantidad de fechas distintas

		// Si se superan las 8, resume por año

		// Si se siguen superando las 8, resume por lustro

		// Fin
		return fechas;
	},
	varsVista: ({seccionActual, temaActual}) => {
		const esCartas = temaActual.codigo == "cartas";
		const esExpers = seccionActual.codigo == "experiencias";
		// const indice = procesos.indice(encabezados);
		// if (esCartas || esExperiencias) return res.send(indice);
		const archVista = esCartas || esExpers ? "2ConIndice" : "2SinIndice";

		// Fin
		return {archVista};
	},
};
