"use strict";

export default {
	encabezados: async ({seccionActual, temasSeccion}) => {
		// Obtiene el encabezado de los artículos
		const temas_ids = temasSeccion.map((n) => n.id);
		const pestanas_ids = temasSeccion.reduce((arr, n) => arr.concat(n.pestanas.map((m) => m.id)), []);
		const encSinIndice = await baseDatos
			.obtieneTodosConOrden("encSinIndice", "fechaOcurrio", true)
			.then((n) => n.filter((m) => temas_ids.includes(m.tema_id) || pestanas_ids.includes(m.pestana_id)));

		// Obtiene el encabezado de las cartas
		const encConIndice =
			seccionActual.codigo == "cartasEscritos" ? await baseDatos.obtieneTodosConOrden("encConIndice", "fechaEscrita") : [];

		// Fin
		return {encSinIndice, encConIndice};
	},
	contenido: async ({encSinIndice, encConIndice}) => {
		// Obtiene el contenido de los encSinIndice y encConIndice
		const articulos_ids = encSinIndice.map((n) => n.id);
		const cartas_ids = encConIndice.map((n) => n.id);
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
};
