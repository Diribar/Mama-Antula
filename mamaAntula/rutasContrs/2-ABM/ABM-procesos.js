"use strict";

export default {
	obtieneEncabs: async ({esCarta, conIndice, entidad, condicion, includes, usuario}) => {
		// Obtiene los encabezados
		let encabezados = esCarta
			? baseDatos
					.obtieneTodos(entidad, includes)
					.then((n) => n.sort((a, b) => new Date(a.fechaEvento) - new Date(b.fechaEvento)))
			: baseDatos
					.obtieneTodosPorCondicion(entidad, condicion, includes)
					.then((n) => n.sort((a, b) => new Date(b.fechaEvento) - new Date(a.fechaEvento)));
		encabezados = await encabezados;

		// Si es sin indice y no existe un registro, lo crea
		if (!conIndice && !encabezados.length) {
			// Crea los datos a guardar
			const creadoPor_id = usuario.id;
			const statusRegistro_id = aprobado_id;
			const datos = {creadoPor_id, statusRegistro_id};

			// Le agrega la referencia
			const {tema_id, pestana_id} = condicion;
			if (tema_id) datos.tema_id = tema_id;
			if (pestana_id) datos.pestana_id = pestana_id;

			// Guarda el encabezado
			const encabezado = await baseDatos.agregaRegistroIdCorrel("encabResto", datos);
			// encabezado.ediciones = [];
			encabezados = [encabezado];
		}

		// Les agrega los títulos
		if (conIndice) encabezados = comp.contenido.tituloCons[esCarta ? entidad : "encabConIndice"](encabezados);

		// Fin
		return encabezados;
	},
	eliminaDepends: async (entidad, id) => {
		// Obtiene los contenidos y los elimina
		const campo_id = comp.contenido.obtieneCampo_id(entidad);
		const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {[campo_id]: id}, "imgsCarrusel");
		if (!contenidos.length) return;

		// Elimina los carruseles
		const espera = [];
		for (const contenido of contenidos) {
			// Obtiene la ruta del archivo
			const ruta = contenido.statusRegiastro_id == creado_id ? carpRevisar : carpContenido;

			// Carruseles
			for (const imgCarrusel of contenido.imgsCarrusel) comp.gestionArchs.elimina(ruta, imgCarrusel.imagen);
			await baseDatos.eliminaPorCondicion("imgsCarrusel", {contenido_id: contenido.id});

			// Contenidos
			if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen);
			espera.push(baseDatos.eliminaPorId("contenidos", contenido.id));
		}
		await Promise.all(espera);

		// Fin
		return;
	},
	// API guardaContenido - obtiene el orden de contenido
	obtieneOrdenContenidos: async ({campo_id, encabezado_id}) => {
		// Variables
		let orden = 1;

		// Averigua si ya hay algún registro para ese 'campo_id'
		const registrosActuales = await baseDatos.obtieneTodosPorCondicion("contenidos", {[campo_id]: encabezado_id});

		// Acciones si lo hay
		if (registrosActuales.length) {
			// Averigua cuál es el orden de mayor valor
			const ordenes = registrosActuales.map((n) => n.orden);
			const maxOrden = Math.max(...ordenes);

			// Suma 1 y lo guarda en el orden
			orden = maxOrden + 1;
		}

		// Fin
		return orden;
	},
	// API guar
	guardaRegsCarrusel: async (imagenes, contenido_id, creadoPor_id) => {
		// Si no hay imagenes, interrumpe la función
		if (!imagenes) return;

		// Guarda las imágenes
		imagenes.forEach((imagen, i) => {
			// Variables
			const orden = i + 1;
			const registro = {contenido_id, orden, imagen, creadoPor_id};

			// Guarda el registro
			baseDatos.agregaRegistroIdCorrel("imgsCarrusel", registro);
		});

		// Fin
		return;
	},
};
