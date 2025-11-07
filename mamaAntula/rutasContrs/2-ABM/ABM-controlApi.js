"use strict";
import procesos from "./ABM-procesos.js";

export default {
	// Obtiene información
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
		const {tema_id, pestana_id} = req.query;
		const {usuario} = req.session;

		// Averigua si es carta o con índice
		const temaActual = temasSecciones.find((n) => n.id == tema_id);
		const esCarta = temaActual.codigo == "cartas";
		const conIndice = !!temaActual.indices.length;

		// Obtiene datos de la tabla
		const condicion = {[pestana_id ? "pestana_id" : "tema_id"]: pestana_id || tema_id};
		const {entidad, includes} = comp.contenido.obtieneDatosDeTabla(condicion);

		// Obtiene los encabezados
		condicion.lugar_id = conIndice ? {[Op.not]: null} : {[Op.is]: null};
		const encabezados = await procesos.obtieneEncabs({esCarta, conIndice, entidad, condicion, includes, usuario});

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

	// Cambios en BD -
	guardaEncabezado: async (req, res) => {
		// Variables
		const {entidad, id, tema_id, pestana_id} = req.body;

		// Obtiene el original
		const original = await baseDatos.obtienePorId(entidad, id);

		// Si no existe el original, lo crea
		if (!original) {
			// Variables
			const creadoPor_id = req.session.usuario.id;
			const datos = {...req.body, creadoPor_id};
			delete datos.id;

			// Crea el original
			const nuevoRegistro = await baseDatos.agregaRegistroIdCorrel(entidad, datos);
			return res.json({id: nuevoRegistro.id, hay: false});
		}

		// Si no es propio y no está en status aprobado, interrumpe la función
		if (original.creadoPor_id != req.session.usuario.id && original.statusRegistro_id != aprobado_id)
			return res.json({mensaje: "No tenés permiso para editar este encabezado", hay: true});

		// Si está en status creado y por este usuario, actualiza el original
		if (original.statusRegistro_id == creado_id && original.creadoPor_id == req.session.usuario.id) {
			await baseDatos.actualizaPorId(entidad, id, req.body);
			return res.json({hay: false});
		}

		// Si está en status aprobado, crea o actualiza la edicion
		// Obtiene la edicion del usuario
		const condicion = {editadoPor_id: req.session.usuario.id};
		const {campo_id} = comp.contenido.obtieneDatosDeTabla({tema_id, pestana_id});
		condicion[campo_id] = id;
		const edicion = await baseDatos.obtienePorCondicion("edicionesEncab", condicion);

		// Averigua si hay novedades con el original
		// En caso que si, si hay una edición la actualiza, si no la crea
		// En caso que no, si hay una edición la elimina

		// Fin
		return res.json({hay: false});
	},
	eliminaEncabezado: async (req, res) => {
		// Variables
		const {entidad, id} = req.body;

		// Elimina los dependientes y el encabezado
		await procesos.eliminaDepends(entidad, id);
		await baseDatos.eliminaPorId(entidad, id);

		// Fin
		return res.json();
	},
	guardaContenido: async (req, res) => {
		// Variables
		const {pestanaActiva, campo_id, encabezado_id} = req.body;
		const camposGuardar = ["carta_id", "encab_id", "texto", "imagen", "video", "leyenda"];
		const datos = {};

		// Guarda los datos útiles
		for (const campo of camposGuardar) if (req.body[campo]) datos[campo] = req.body[campo];

		// Guarda la imagen
		if (req.file) await comp.gestionArchs.descarga(carpRevisar, datos.imagen, req.file);

		// Arma los datos
		if (pestanaActiva == "carrusel") {
		}
		// En caso que no sea carrusel
		else {
			// Averigua si ya hay algún registro para ese campo_id
			const registrosActuales = await baseDatos.obtieneTodosPorCondicion("contenidos", {[campo_id]: encabezado_id});

			// Acciones si lo hay
			if (registrosActuales.length) {
				// Averigua cuál es el orden de mayor valor
				const ordenes = registrosActuales.map((n) => n.orden);
				const maxOrden = Math.max(...ordenes);

				// Suma 1 y lo guarda en el orden
				datos.orden = maxOrden + 1;
			}

			// Guarda el registro
			await baseDatos.agregaRegistroIdCorrel("contenidos", datos);
		}

		// Fin
		return res.json({});
	},
	eliminaContenido: async (req, res) => {
		// Variables
		const {id} = req.body;
		if (!id) return res.json({});
		const contenido = await baseDatos.obtienePorId("contenidos", id, "imgsCarrousel");
		const ruta = contenido.statusRegistro_id == creado_id ? carpRevisar : carpContenido;

		// Carrouseles
		for (const imgCarrousel of contenido.imgsCarrousel) comp.gestionArchs.elimina(ruta, imgCarrousel.imagen, true);
		await baseDatos.eliminaPorCondicion("imgsCarrousel", {contenido_id: id});

		// Contenidos
		if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen, true);
		await baseDatos.eliminaPorId("contenidos", id);

		// Fin
		return res.json({});
	},
};
