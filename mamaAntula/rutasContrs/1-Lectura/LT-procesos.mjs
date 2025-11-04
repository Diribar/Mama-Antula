"use strict";

export default {
	contenido: async ({temaActual, pestanaActual}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};
		const {entidad, campo_id, orden} = comp.contenido.obtieneDatosDeTabla(condicion);

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
			.obtieneTodosPorCondicion("imgsCarrousel", {contenido_id: contenidos_ids})
			.then((n) => n.filter((m) => contenidos_ids.includes(m.contenido_id)));
		contenidos.forEach((n) => (n.imgsCarrousel = imgsCarrousel.filter((m) => m.contenido_id == n.id)));

		// Fin
		return {encabezados, contenidos};
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
		const archVista = esCartas ? "1Cartas" : esExpers ? "2Expers" : "3SinIndice";

		// Fin
		return {archVista};
	},
};
