"use strict";

export default {
	obtieneEncabs: async ({entidad, condicion, includes, usuario}) => {
		// Obtiene los encabezados
		let encabezados = esCarta
			? baseDatos
					.obtieneTodos("encabCartas", includes)
					.then((n) => n.sort((a, b) => new Date(a.fechaEvento) - new Date(b.fechaEvento)))
			: baseDatos
					.obtieneTodosPorCondicion("encabResto", condicion, includes)
					.then((n) => n.sort((a, b) => new Date(b.fechaEvento) - new Date(a.fechaEvento)));
		encabezados = await encabezados;

		// Si es sin indice y no existe un registro, lo crea
		if (!esIndice && !encabezados.length) {
			const creadoPor_id = usuario.id;
			const statusRegistro_id = aprobado_id;
			const datos = {...condicion, creadoPor_id, statusRegistro_id};
			const encabezado = await baseDatos.agregaRegistroIdCorrel("encabResto", datos);
			encabezado.ediciones = [];
			encabezados = [encabezado];
		}

		// Fin
		return encabezados;
	},
	consolidado: async function ({tema_id, entidad, condicion, includes, usuario}) {
		// Obtiene los encabezados con todas sus ediciones
		let encabezados = await this.conTodasLasEdiciones({entidad, condicion, includes, usuario});

		// Les agrega los títulos
		encabezados = comp.contenido.tituloCons[entidad](encabezados);

		// Fin
		return encabezados;
	},

	eliminaDepends: async (entidad, id) => {
		// Obtiene los contenidos y los elimina
		const campo_id = comp.contenido.obtieneCampo_id(entidad);
		const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {[campo_id]: id}, "imgsCarrousel");
		if (!contenidos.length) return;

		// Elimina los carrouseles
		const espera = [];
		for (const contenido of contenidos) {
			// Obtiene la ruta del archivo
			const ruta = contenido.statusRegiastro_id == creado_id ? carpRevisar : carpContenido;

			// Carrouseles
			for (const imgCarrousel of contenido.imgsCarrousel) comp.gestionArchs.elimina(ruta, imgCarrousel.imagen);
			await baseDatos.eliminaPorCondicion("imgsCarrousel", {contenido_id: contenido.id});

			// Contenidos
			if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen);
			espera.push(baseDatos.eliminaPorId("contenidos", contenido.id));
		}
		await Promise.all(espera);

		// Fin
		return;
	},
};
