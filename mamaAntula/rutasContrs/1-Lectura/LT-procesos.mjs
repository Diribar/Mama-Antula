"use strict";

export default {
	encabezado: async ({temaActual, pestanaActual}) => {
		// Variables
		const condicion = pestanaActual ? {pestana_id: pestanaActual.id} : {tema_id: temaActual.id};

		// Obtiene los encabezados
		const encSinIndice = await baseDatos.obtieneTodosPorCondicion("encSinIndice", condicion);
		const encConIndice = await baseDatos.obtieneTodosPorCondicion("encConIndice", condicion);

		// Fin
		return {encSinIndice, encConIndice};
	},
	contenido: async ({encSinIndice, encConIndice}) => {
		// Obtiene el contenido de los encSinIndice y encConIndice
		const sinIndice_ids = encSinIndice.map((n) => n.id);
		const conIndice_ids = encConIndice.map((n) => n.id);
		const contenidos = await baseDatos
			.obtieneTodosConOrden("contenidos", "orden")
			.then((n) => n.filter((m) => sinIndice_ids.includes(m.encabArtic_id) || conIndice_ids.includes(m.encabCarta_id)));

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
