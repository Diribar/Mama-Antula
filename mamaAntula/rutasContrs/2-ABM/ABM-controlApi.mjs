"use strict";

export default {
	datosIniciales: (req, res) => {
		// Variables
		const datosIniciales = {
			...{secciones, temasSecciones, pestanasTemas}, // Filtros e Impacto...
			...{personajes, idiomas, lugares}, // Impacto de Filtro Encabezado
		};

		// Fin
		return res.json(datosIniciales);
	},
	obtieneEncabs: async (req, res) => {
		// Variables
		const {seccion_id, tema_id, pestana_id} = req.query;
		const condicion = {[pestana_id ? "pestana_id" : "tema_id"]: pestana_id || tema_id};

		// Obtiene la entidad
		const seccionActual = secciones.find((n) => n.id == seccion_id);
		const temaActual = temasSecciones.find((n) => n.id == tema_id);
		const {entidad, orden, includes} = comp.contenido.obtieneDatosDeTabla({seccionActual, temaActual});

		// Obtiene los encabezados
		let encabezados =
			entidad == "encabCartas"
				? await baseDatos
						.obtieneTodos(entidad, includes)
						.then((n) => n.sort((a, b) => new Date(a[orden]) - new Date(b[orden])))
				: entidad == "encabExpers"
				? await baseDatos
						.obtieneTodosPorCondicion(entidad, condicion, includes)
						.then((n) => n.sort((a, b) => new Date(b[orden]) - new Date(a[orden])))
				: await baseDatos.obtieneTodosPorCondicion(entidad, condicion).then((n) => n.sort((a, b) => a.orden - b.orden));

		// Si la entidad es encabSinIndice y no existe un registro, lo crea
		if (entidad == "encabSinIndice" && !encabezados.length) {
			const creadoPor_id = req.session.usuario.id;
			const statusRegistro_id = aprobado_id;
			const datos = {...condicion, creadoPor_id, statusRegistro_id};
			const encabezado = await baseDatos.agregaRegistroIdCorrel(entidad, datos);
			encabezados = [encabezado];
		}

		// Les agrega el 'tituloCons'
		encabezados = comp.contenido.titulo[entidad](encabezados);

		// Fin
		return res.json(encabezados);
	},
	obtieneContenidos: async (req, res) => {
		// Variables
		const {encab_id, campo_id} = req.query;

		// Obtiene los contenidos
		const contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {[campo_id]: encab_id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Fin
		return res.json(contenidos);
	},
};
