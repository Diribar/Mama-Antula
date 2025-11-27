"use strict";
import procesos from "./ACT-procesos.js";

export default {
	datosIniciales: (req, res) => {
		// Variables
		const {usuario} = req.session;
		const datosIniciales = {
			...{secciones, temasSecciones, pestanasTemas},
			...{personajes, idiomas, lugares, indicesLugar},
			...{encabCartaIntro_id, encabLugaresIntro_id, contLayouts},
			...{creado_id, aprobado_id, rechazar_id, rechazado_id},
			usuario,
		};

		// Fin
		return res.json(datosIniciales);
	},
	encabezado: {
		obtiene: async (req, res) => {
			// Variables
			const {tema_id, pestana_id} = req.query;
			const {usuario} = req.session;

			// Averigua si es carta o con índice
			const temaActual = tema_id && temasSecciones.find((n) => n.id == tema_id);
			const esCarta = temaActual && temaActual.codigo == "cartas";
			const esLugares = temaActual && temaActual.codigo == "lugaresDevocion";
			const conIndice = (temaActual && temaActual.indicesFecha.length) || esLugares;

			// Obtiene los encabezados
			const campo_id = [pestana_id ? "pestana_id" : "tema_id"];
			const condicion = {[campo_id]: pestana_id || tema_id};
			const encabezados = await procesos.obtieneEncabs({esCarta, esLugares, conIndice, condicion, usuario});

			// Fin
			return res.json(encabezados);
		},
		guarda: async (req, res) => {
			// Variables
			const {encab_id} = req.body;
			const {encabezado, edicion, novedad} = req;

			// 0-NUEVO: lo crea e interrumpe la función
			if (encab_id == "nuevo") {
				// Arma los datos a guardar
				const creadoPor_id = req.session.usuario.id;
				const datos = {...req.body, creadoPor_id, statusSugeridoPor_id: creadoPor_id};

				// Crea el encabezado y guarda la cookie
				const encabezado = await baseDatos.agregaRegistroIdCorrel("encabezados", datos);
				res.cookie("actualizaEncabezado_id", encabezado.id, {maxAge: unDia, path: "/"});

				// Fin
				return res.json({});
			}

			// 1-CREADO: actualiza el encabezado
			if (encabezado.statusRegistro_id == creado_id) {
				await baseDatos.actualizaPorId("encabezados", encab_id, req.body);
				return res.json({});
			}

			// 3-APROBADO: crea o actualiza la edicion
			// Si no hay novedades, elimina la edición
			if (!novedad) edicion && baseDatos.eliminaPorId("encabEdics", edicion.id);
			// Acciones si hay novedades
			else {
				// Arma los datos a guardar
				const datos = {encab_id, editadoPor_id: req.session.usuario.id, editadoEn: new Date()};
				// Valor si el campo existe en el original: si son distintos agrega el nuevo, sin son iguales va null
				for (const prop in req.body)
					if (encabezado[prop]) datos[prop] = req.body[prop] != encabezado[prop] ? req.body[prop] : null;

				// Crea o actualiza la edicion
				edicion
					? baseDatos.actualizaPorId("encabEdics", edicion.id, datos)
					: baseDatos.agregaRegistro("encabEdics", datos);
			}

			// Fin
			return res.json({});
		},
		elimina: async (req, res) => {
			// Variables
			const {encab_id} = req.body;

			// Obtiene el encabezado
			const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);

			// Si el status es creado, elimina los dependientes y el encabezado
			if (encabezado.statusRegistro_id == creado_id) {
				await procesos.eliminaDependsEncab(encab_id);
				await baseDatos.eliminaPorId("encabezados", encab_id);
			}

			// Si el status es aprobado, lo cambia a 'rechazar'
			if (encabezado.statusRegistro_id == aprobado_id)
				await baseDatos.actualizaPorId("encabezados", encab_id, {statusRegistro_id: rechazar_id});

			// Fin
			return res.json({});
		},
	},
	contActual: {
		obtiene: async (req, res) => {
			// Variables
			const {encab_id} = req.query;

			// Obtiene los contenidos
			const include = ["carrusel", "layout", "statusSugeridoPor"];
			const contenidos = await baseDatos
				.obtieneTodosPorCondicion("contenidos", {encab_id}, include)
				.then((n) => n.sort((a, b) => b.anoLanzam - a.anoLanzam))
				.then((n) => n.sort((a, b) => a.orden - b.orden))
				.then((n) => n.map((m) => ({...m, carrusel: m.carrusel.sort((a, b) => a.orden - b.orden)})));

			// Fin
			return res.json(contenidos);
		},
		baja: async (req, res) => {
			// Variables
			const {id} = req.body;
			const {usuario} = req.session;

			// Obtiene todos los contenidos del mismo encabezado y el indice del actual
			const {indice, contenido, contenidos, mensaje} = await procesos.obtieneIndiceEnContenidos({id, usuario});
			if (mensaje) return res.json({error: mensaje});

			// Si no es el último, intercambia el orden con el siguiente
			if (indice < contenidos.length - 1) {
				const siguiente = contenidos[indice + 1];
				await baseDatos.actualizaPorId("contenidos", siguiente.id, {orden: contenido.orden});
				await baseDatos.actualizaPorId("contenidos", contenido.id, {orden: siguiente.orden});
			}

			// Fin
			return res.json({});
		},
		sube: async (req, res) => {
			// Variables
			const {id} = req.body;
			const {usuario} = req.session;

			// Obtiene todos los contenidos del mismo encabezado y el indice del actual
			const {indice, contenido, contenidos, mensaje} = await procesos.obtieneIndiceEnContenidos({id, usuario});
			if (mensaje) return res.json({mensaje});

			// Si no es el primero, intercambia el orden con el anterior
			if (indice > 0) {
				const anterior = contenidos[indice - 1];
				await baseDatos.actualizaPorId("contenidos", anterior.id, {orden: contenido.orden});
				await baseDatos.actualizaPorId("contenidos", contenido.id, {orden: anterior.orden});
			}

			// Fin
			return res.json({});
		},
		elimina: async (req, res) => {
			// Variables
			const {id} = req.body;
			const contenido = await baseDatos.obtienePorId("contenidos", id, "carrusel");

			// Acciones si el contenido está en status creado
			if (contenido.statusRegistro_id == creado_id) {
				// Elimina los archivos del carrusel más los registros
				for (const registro of contenido.carrusel) comp.gestionArchs.elimina(carpRevisar, registro.imagen, true);
				await baseDatos.eliminaPorCondicion("carrusel", {contenido_id: id});

				// Contenidos
				if (contenido.imagen) comp.gestionArchs.elimina(carpRevisar, contenido.imagen, true);
				await baseDatos.eliminaPorId("contenidos", id);
			}

			// Acciones si el contenido esta en status aprobado
			if (contenido.statusRegistro_id == aprobado_id)
				await baseDatos.actualizaPorId("contenidos", id, {statusRegistro_id: rechazar_id});

			// Fin
			return res.json({});
		},
	},
	guardaContNuevo: async (req, res) => {
		// Variables
		const {encab_id, imagen, texto, imagens} = req.body;

		// Pule el layout
		let {layoutCodigo} = req.body;
		const textoImagen = layoutCodigo == "textoImagen";
		layoutCodigo = (textoImagen && !imagen && "texto") || (textoImagen && !texto && "imagen") || layoutCodigo;

		// Empieza a armar la información a guardar
		const layout_id = contLayouts.find((n) => n.codigo == layoutCodigo).id;
		const {id: creadoPor_id} = req.session.usuario;
		const datos = {encab_id, layout_id, creadoPor_id, statusSugeridoPor_id: creadoPor_id};

		// Obtiene los datos útiles
		const camposGuardar = ["texto", "imagen", "video", "leyenda"];
		camposGuardar.push("titulo", "autor", "anoLanzam", "editorial");
		for (const campo of camposGuardar) if (req.body[campo]) datos[campo] = req.body[campo];

		// Estampa
		if (layoutCodigo == "estampa") {
			datos.imagen = imagens[0];
			datos.imagen2 = imagens[1];
		}

		// Descarga la/s imagen/es
		if (req.file) await comp.gestionArchs.descarga(carpRevisar, datos.imagen, req.file);
		if (req.files) req.files.forEach((file, i) => comp.gestionArchs.descarga(carpRevisar, imagens[i], file));

		// Averigua el orden y guarda el registro
		datos.orden = await procesos.obtieneOrdenContenidos(encab_id);
		const {id: contenido_id} = await baseDatos.agregaRegistroIdCorrel("contenidos", datos);

		// Guarda los registros de carrusel
		if (layoutCodigo == "carrusel") await procesos.guardaRegsCarrusel({imagenes: imagens, contenido_id, creadoPor_id});

		// Fin
		return res.json({});
	},
};
