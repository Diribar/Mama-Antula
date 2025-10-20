"use strict";

export default {
	obtiene: {
		temaPestanaActual: (seccionActual, temasSeccion, req) => {
			// Variables
			let aux;

			// Obtiene el tema actual y la guarda en la cookie
			aux = temasSeccion[0];
			const temaActual =
				req.cookies && req.cookies[seccionActual.codigo]
					? temasSeccion.find((n) => n.codigo == req.cookies[seccionActual.codigo]) || aux
					: aux;
			if (!req.cookies[seccionActual.codigo]) req.cookies[seccionActual.codigo] = temaActual.codigo;

			// Obtiene la pestaña actual y la guarda en la cookie
			aux = temaActual.pestanas && temaActual.pestanas[0];
			const pestanaActual =
				req.cookies && req.cookies[temaActual.codigo]
					? temaActual.pestanas.find((n) => n.codigo == req.cookies[temaActual.codigo]) || aux
					: aux;
			if (pestanaActual && !req.cookies[temaActual.codigo]) req.cookies[temaActual.codigo] = pestanaActual.codigo;

			// Fin
			return {temaActual, pestanaActual};
		},
		encabezados: async (seccionActual, temasSeccion) => {
			// Obtiene el encabezado de los artículos
			const temas_ids = temasSeccion.map((n) => n.id);
			const pestanas_ids = temasSeccion.reduce((arr, n) => arr.concat(n.pestanas.map((m) => m.id)), []);
			const encabArtics = await baseDatos
				.obtieneTodosConOrden("encabArtics", "fechaOcurrio", true)
				.then((n) => n.filter((m) => temas_ids.includes(m.tema_id) || pestanas_ids.includes(m.pestana_id)));

			// Obtiene el encabezado de las cartas
			const encabCartas =
				seccionActual.codigo == "cartasEscritos"
					? await baseDatos.obtieneTodosConOrden("encabCartas", "fechaEscrita")
					: [];

			// Fin
			return {encabArtics, encabCartas};
		},
		contenido: async (encabArtics, encabCartas) => {
			// Obtiene el contenido de los encabArtics y encabCartas
			const articulos_ids = encabArtics.map((n) => n.id);
			const cartas_ids = encabCartas.map((n) => n.id);
			const contenidos = await baseDatos
				.obtieneTodosConOrden("contenidos", "orden")
				.then((n) => n.filter((m) => articulos_ids.includes(m.encabArtic_id) || cartas_ids.includes(m.encabCarta_id)));

			// Fin
			return contenidos;
		},
		carrouseles: async (contenidos) => {
			// Obtiene los carrouseles
			const contenidos_ids = contenidos.map((n) => n.id);
			const carrouseles = await baseDatos
				.obtieneTodosConOrden("carrouseles", "orden")
				.then((n) => n.filter((m) => contenidos_ids.includes(m.contenido_id)));

			// Fin
			return carrouseles;
		},
	},
};
