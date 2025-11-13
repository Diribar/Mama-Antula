"use strict";

export default {
	obtieneEncabs: async ({esCarta, conIndice, condicion, includes, usuario}) => {
		// Obtiene los encabezados
		let encabezados = esCarta
			? await baseDatos
					.obtieneTodos("encabezados", includes)
					.then((n) => n.sort((a, b) => new Date(a.fechaEvento) - new Date(b.fechaEvento)))
			: conIndice
			? await baseDatos
					.obtieneTodosPorCondicion("encabezados", condicion, includes)
					.then((n) => n.sort((a, b) => new Date(b.fechaEvento) - new Date(a.fechaEvento)))
			: await baseDatos.obtieneTodosPorCondicion("encabezados", condicion);

		// Si es sin indice y no existe un registro, lo crea
		if (!esCarta && !conIndice && !encabezados.length) {
			// Crea los datos a guardar
			const creadoPor_id = usuario.id;
			const datos = {creadoPor_id};

			// Le agrega la referencia
			const {tema_id, pestana_id} = condicion;
			if (tema_id) datos.tema_id = tema_id;
			if (pestana_id) datos.pestana_id = pestana_id;

			// Guarda el encabezado
			const encabezado = await baseDatos.agregaRegistroIdCorrel("encabezados", datos);
			// encabezado.ediciones = [];
			encabezados = [encabezado];
		}

		// Les agrega los títulos
		if (esCarta || conIndice) encabezados = comp.titulosLectura({esCarta, conIndice, encabezados});

		// Fin
		return encabezados;
	},
	eliminaDependsEncab: async (encab_id) => {
		// Obtiene los contenidos y los elimina
		const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {encab_id}, "carrusel");
		if (!contenidos.length) return;

		// Elimina los archivos y registros del carrusel de cada contenido, y también borra los contenidos
		const espera = [];
		for (const contenido of contenidos) {
			// Obtiene la ruta del archivo
			const ruta = contenido.statusRegiastro_id == creado_id ? carpRevisar : carpContenido;

			// Carruseles
			for (const registro of contenido.carrusel) comp.gestionArchs.elimina(ruta, registro.imagen);
			await baseDatos.eliminaPorCondicion("carrusel", {contenido_id: contenido.id});

			// Contenidos
			if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen);
			espera.push(baseDatos.eliminaPorId("contenidos", contenido.id));
		}
		await Promise.all(espera);

		// Fin
		return;
	},

	// API contenido actual
	obtieneIndiceEnContenidos: async ({id, usuario}) => {
		// Obtiene el contenido
		const contenido = await baseDatos.obtienePorId("contenidos", id);
		if (!contenido) return {mensaje: "No se encontró el contenido solicitado"};

		// Revisa que sea status creado_id y por el usuario o un revisor
		if (contenido.statusRegistro_id != creado_id || (contenido.creadoPor_id != usuario.id && !usuario.rol.revision))
			return {mensaje: "No tenés permisos para mover este contenido"};

		// Obtiene todos los contenidos del mismo encabezado
		const {encab_id} = contenido;
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));
		if (contenidos.length < 2) return {mensaje: "No hay otros contenidos para mover"};

		// Obtiene el índice del contenido
		const indice = contenidos.findIndex((n) => n.id == id);

		// Fin
		return {indice, contenido, contenidos};
	},

	// API guarda nuevo
	obtieneOrdenContenidos: async (encab_id) => {
		// Variables
		let orden = 1;

		// Averigua si ya hay algún registro para ese encabezado
		const registrosActuales = await baseDatos.obtieneTodosPorCondicion("contenidos", {encab_id});

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
	guardaRegsCarrusel: async (imagenes, contenido_id, creadoPor_id) => {
		// Si no hay imagenes, interrumpe la función
		if (!imagenes) return;

		// Guarda las imágenes
		for (let i = 0; i < imagenes.length; i++) {
			const imagen = imagenes[i];
			const orden = i + 1;
			const registro = {contenido_id, orden, imagen, creadoPor_id};

			await baseDatos.agregaRegistroIdCorrel("carrusel", registro);
		}

		// Fin
		return;
	},
};
