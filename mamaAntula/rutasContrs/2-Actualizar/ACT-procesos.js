"use strict";

export default {
	// API - Encabezado
	obtieneEncabs: async ({esCarta, esLugares, conIndice, condicion, usuario}) => {
		// Obtiene los encabezados
		let encabezados = await comp.obtieneEncabezados({esCarta, esLugares, conIndice, condicion});

		// Si es sin indice, no existe un registro, y la condición tiene un tema, crea el encabezado
		if (!conIndice && !encabezados.length && condicion.tema_id) {
			// Crea los datos a guardar
			const datos = {statusSugeridoPor_id: usuario.id, creadoPor_id: usuario.id};

			// Le agrega la referencia
			const {tema_id, pestana_id} = condicion;
			if (tema_id) datos.tema_id = tema_id;
			if (pestana_id) datos.pestana_id = pestana_id;

			// Guarda el encabezado
			await baseDatos.agregaRegistroIdCorrel("encabezados", datos);

			// Lee de nuevo los encabezados
			encabezados = await comp.obtieneEncabezados({esCarta, esLugares, conIndice, condicion});
		}

		// Les agrega los títulos
		if (conIndice) encabezados = comp.titulosElabs({esCarta, esLugares, encabezados});

		// Los fusiona con su edición del usuario
		const ediciones = await baseDatos.obtieneTodosPorCondicion("encabEdics", {editadoPor_id: usuario.id});
		for (const edicion of ediciones) {
			delete edicion.id;
			const indice = encabezados.findIndex((n) => n.id == edicion.encab_id);
			if (indice == -1) continue;

			// Los fusiona
			for (const prop in edicion)
				if (encabezados[indice][prop]) encabezados[indice][prop] = edicion[prop] || encabezados[indice][prop];
		}

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
			const ruta = contenido.statusRegiastro_id == creado_id ? carpRevisar : carpFinal;

			// Carruseles
			for (const carrusel of contenido.carrusel) comp.gestionArchs.elimina(ruta, carrusel.imagen);
			await baseDatos.eliminaPorCondicion("carrusel", {contenido_id: contenido.id});

			// Contenidos
			if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen);
			espera.push(baseDatos.eliminaPorId("contenidos", contenido.id));
		}
		await Promise.all(espera);

		// Fin
		return;
	},

	// API - Contenido actual
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

	// API - Contenido nuevo
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
};
