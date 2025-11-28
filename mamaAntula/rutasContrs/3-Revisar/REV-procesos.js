"use strict";

export default {
	// API
	cambiosStatus: async ({encab_id, ...cambioStatus}) => {
		// Variables
		const espera = [];

		// Cambia el status del encabezado
		espera.push(baseDatos.actualizaPorId("encabezados", encab_id, cambioStatus));

		// Obtiene todas las dependencias
		const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {encab_id}, "carrusel");
		espera.push(baseDatos.actualizaPorCondicion("contenidos", {encab_id}, cambioStatus)); // contenido

		// Obtiene todas las imágenes a mover
		const imagenes = [];
		for (const contenido of contenidos) {
			if (contenido.imagen) imagenes.push(contenido.imagen); // contenido
			if (contenido.imagen2) imagenes.push(contenido.imagen2); // contenido
			imagenes.push(...contenido.carrusel.map((n) => n.imagen)); // carrusel
		}

		// Mueve la imagen a la carpeta de aprobados
		for (const imagen of imagenes) espera.push(comp.gestionArchs.mueve(carpRevisar, carpFinal, imagen)); // imagen

		// Fin
		await Promise.all(espera);
		return;
	},

	// Vista
	obtieneEncabezado: {
		consolidado: async function (usuario) {
			// Obtiene el encabezado
			const encabsRevisar = await this.obtieneEncabezados(usuario);
			let encabezado = this.obtieneEncabezado(encabsRevisar);
			if (!encabezado) return {};
			await this.completaEncabezado(encabezado);

			// Fin
			return {encabezado, cambioStatus: true};
		},
		obtieneEncabezados: async (usuario) => {
			// Variables
			const statusRegistro_id = [creado_id, rechazar_id];

			// Obtiene los encabezados
			const includes = [...includesEncabs.cartas, "lugarIndice"];
			let encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", {statusRegistro_id}, includes);
			if (!encabezados.length) return [];

			// Quita los encabezados capturados por terceros
			await FN.quitaEncabsCapturadosPorTerceros({encabezados, usuario});

			// Fin
			return encabezados;
		},
		obtieneEncabezado: (encabezados) => {
			// Si no hay encabezados, interrumpe la función
			if (!encabezados.length) return;

			// Si hay un sólo encabezado, lo completa e interrumpe la función
			encabezados = encabezados.map((n) => FN.agregaTemaPestana(n));
			if (encabezados.length == 1) return encabezados[0];

			// Los ordena por sección
			encabezados.sort((a, b) => a.seccion.orden - b.seccion.orden);
			encabezados = encabezados.filter((n) => n.seccion.id == encabezados[0].seccion.id);
			if (encabezados.length == 1) return encabezados[0];

			// Los ordena por tema
			encabezados.sort((a, b) => a.tema.orden - b.tema.orden);
			encabezados = encabezados.filter((n) => n.tema.id == encabezados[0].tema.id);
			if (encabezados.length == 1) return encabezados[0];

			// Los ordena por pestaña
			if (encabezados[0].pestana) {
				encabezados.sort((a, b) => a.pestana.orden - b.pestana.orden);
				encabezados = encabezados.filter((n) => n.pestana.id == encabezados[0].pestana.id);
				if (encabezados.length == 1) return encabezados[0];
			}

			// Los ordena por fecha y por lugarIndice
			encabezados
				.sort((a, b) => (a.titulo < b.titulo ? -1 : 1))
				.sort((a, b) => (a.fechaEvento && b.fechaEvento ? new Date(a.fechaEvento) - new Date(b.fechaEvento) : 0))
				.sort((a, b) => (a.lugarIndice && b.lugarIndice ? (a.lugarIndice.orden < b.lugarIndice.orden ? -1 : 1) : 0));

			// Fin
			return encabezados[0];
		},
		completaEncabezado: async (encabezado) => {
			// Le agrega el usuario
			encabezado.usuario = await baseDatos.obtienePorId("usuarios", encabezado.statusSugeridoPor_id);

			// Le agrega la imagen del usuario
			encabezado.imagenUsuario = encabezado.usuario.imagen
				? "/imgsEditables/8-Usuarios/" + encabezado.usuario.imagen
				: "/imgsEstables/Varios/usuarioGenerico.jpg";

			await FN.completaEncabezado(encabezado);

			// Fin
			return;
		},
	},
	obtieneEncabConEdicion: {
		consolidado: async function (usuario) {
			// Obtiene todos los encabezados que tengan ediciones
			const encabezado = await this.obtieneEncabezado(usuario);
			if (!encabezado) return {};

			// Obtiene la edición
			const edicion = await this.obtieneEdicion(encabezado);

			// Completa el encabezado y pule la edición
			await this.completaEncabezado({encabezado, edicion});
			this.puleLaEdicion(edicion);

			// Fin
			return {encabezado, edicion};
		},
		obtieneEncabezado: async (usuario) => {
			// Variables
			const statusRegistro_id = aprobado_id;

			// Obtiene los encabezados
			const includes = [...includesEncabs.cartas, "lugarIndice", "ediciones"];
			let encabezados = await baseDatos
				.obtieneTodosPorCondicion("encabezados", {statusRegistro_id}, includes)
				.then((n) => n.filter((m) => m.ediciones.length));
			if (!encabezados.length) return;

			// Quita los encabezados capturados por terceros
			await FN.quitaEncabsCapturadosPorTerceros({encabezados, usuario});
			if (!encabezados.length) return;

			// Agrega el tema y la pestaña
			const encabezado = FN.agregaTemaPestana(encabezados[0]);

			// Fin
			return encabezado;
		},
		obtieneEdicion: async (encabezado) => {
			// Variables
			const edic_id = encabezado.ediciones[0].id;

			// Obtiene la edición
			const includes = [...includesEncabs.cartas, "lugarIndice", "editadoPor"];
			const edicion = await baseDatos.obtienePorId("encabEdics", edic_id, includes);

			// Fin
			return edicion;
		},
		completaEncabezado: async ({encabezado, edicion}) => {
			// Le agrega el editadoPor
			encabezado.edicion_id = edicion.id;
			encabezado.editadoPor = edicion.editadoPor;

			// Completa el encabezado
			await FN.completaEncabezado(encabezado);

			// Fin
			return;
		},
		puleLaEdicion: (edicion) => {
			// Quita los campos sin valor
			for (const key in edicion) if (!edicion[key]) delete edicion[key];

			// Elimina campos puntuales
			for (const prop in edicion) if (!Object.keys(camposEdicion.vista).includes(prop)) delete edicion[prop];

			// Fin
			return;
		},
	},
	obtieneEncabConContenido: {
		consolidado: async function (usuario) {
			// Obtiene los encabezados con contenido en status distinto de aprobado
			const encabezado = await this.obtieneEncabezado(usuario);
			if (!encabezado) return {};

			// Completa el encabezado
			await this.completaEncabezado(encabezado);

			// Fin
			return {encabezado, cambioContenido: true};
		},
		obtieneEncabezado: async (usuario) => {
			// Variables
			const statusRegistro_id = aprobado_id;

			// Obtiene los encabezados con status aprobado
			const includes = [...includesEncabs.cartas, "lugarIndice"];
			let encabezados = baseDatos.obtieneTodosPorCondicion("encabezados", {statusRegistro_id}, includes);

			// Obtiene los contenidos con status pendiente de revision
			const statusPends = [creado_id, rechazar_id];
			let contenidos = baseDatos.obtieneTodosPorCondicion("contenidos", {statusRegistro_id: statusPends});

			// Espera a que se actualicen las promesas
			[encabezados, contenidos] = await Promise.all([encabezados, contenidos]);
			if (!encabezados.length) return;

			// Filtra los encabezados por su contenido y se los agrega
			encabezados = encabezados.filter((n) => contenidos.find((m) => m.encab_id == n.id));
			encabezados.map((n) => (n.contenidos = contenidos.filter((m) => m.encab_id == n.id)));

			// Quita los encabezados capturados por terceros
			await FN.quitaEncabsCapturadosPorTerceros({encabezados, usuario});
			if (!encabezados.length) return;

			// Agrega el tema y la pestaña - lo necesita para hacer el 'título elaborado'
			const encabezado = FN.agregaTemaPestana(encabezados[0]);

			// Fin
			return encabezado;
		},
		completaEncabezado: async (encabezado) => {
			// Le agrega el usuario
			for (const contenido of encabezado.contenidos) {
				// Si el contenido está aprobado, saltea la rutina
				if (contenido.statusRegistro_id == aprobado_id) continue;

				// Le asigna el usuario
				contenido.usuario = await baseDatos.obtienePorId("usuarios", contenido.statusSugeridoPor_id);

				// Le agrega la imagen del usuario
				contenido.imagenUsuario = contenido.usuario.imagen
					? "/imgsEditables/8-Usuarios/" + contenido.usuario.imagen
					: "/imgsEstables/Varios/usuarioGenerico.jpg";
			}

			// Completa el encabezado
			await FN.completaEncabezado(encabezado);

			// Fin
			return;
		},
	},
	capturaObtieneRuta: (encabezado, usuario) => {
		// Actualiza la captura
		const {tema_id, pestana_id} = encabezado;
		comp.captura({tema_id, pestana_id, capturadoPor_id: usuario.id});

		// Obtiene la ruta
		const {seccion, tema, pestana} = encabezado;
		const ruta = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.titulo : "");

		// Fin
		return ruta;
	},
	actualizaCookies: ({encabezado, res}) => {
		// Variables
		const {seccion, tema, pestana} = encabezado;

		// Actualiza las cookies de 'actualiza'
		res.cookie("actualizaSeccion_id", seccion.id, {maxAge: unDia, path: "/"});
		res.cookie("actualizaTema_id", tema.id, {maxAge: unDia, path: "/"});
		if (pestana) res.cookie("actualizaPestana_id", pestana.id, {maxAge: unDia, path: "/"});
		else res.clearCookie("actualizaPestana_id");
		res.cookie("actualizaEncabezado_id", encabezado.id, {maxAge: unDia, path: "/"});

		// Fin
		return;
	},
	anchorLectura: (req) => {
		// Variables
		const {actualizaSeccion_id, actualizaTema_id, actualizaPestana_id, actualizaEncabezado_id} = req.cookies;

		// Le agrega la sección
		let anchorLectura = "/" + secciones.find((n) => n.id == actualizaSeccion_id).url;

		// Le agrega el tema
		const temaActual = temasSecciones.find((n) => n.id == actualizaTema_id);
		anchorLectura += "/" + temasSecciones.find((n) => n.id == actualizaTema_id).url;

		// Le agrega la pestaña
		anchorLectura += (actualizaPestana_id && "/" + v.pestanasTemas.find((n) => n.id == actualizaPestana_id).url) || "";

		// Le agrega el encabezado
		const conIndice = temaActual.indicesFecha.length || temaActual.indicesLugar.length;
		anchorLectura += conIndice ? "/?id=" + actualizaEncabezado_id : "";

		// Fin
		return anchorLectura;
	},
};

// Funciones
const FN = {
	agregaTemaPestana: (encabezado) => {
		// Variables
		const {tema_id, pestana_id} = encabezado;

		// Obtiene los datos de niveles
		if (pestana_id) encabezado.pestana = pestanasTemas.find((n) => n.id == pestana_id);
		encabezado.tema = temasSecciones.find((n) => n.id == (tema_id || encabezado.pestana.tema_id));
		encabezado.seccion = secciones.find((n) => n.id == encabezado.tema.seccion_id);

		// Fin
		return encabezado;
	},
	quitaEncabsCapturadosPorTerceros: async ({encabezados, usuario}) => {
		// Variables
		const capturadoPor_id = {[Op.ne]: usuario.id};
		const capturadoEn = {[Op.gt]: new Date(Date.now() - unaHora)};

		// Quita los encabezados capturados por terceros
		const capturas = await baseDatos.obtieneTodosPorCondicion("capturas", {[Op.and]: [{capturadoPor_id}, {capturadoEn}]});
		encabezados = encabezados.filter(
			(n) => !capturas.find((m) => (n.tema_id && m.tema_id == n.tema_id) || (n.pestana_id && m.pestana_id == n.pestana_id)) // el encabezado tiene tema/pestaña y no está capturada
		);

		// Fin
		return;
	},
	completaEncabezado: async (encabezado) => {
		// Le agrega el statusRegistro
		encabezado.statusRegistro = statusRegistros.find((n) => n.id == encabezado.statusRegistro_id);

		// Le agrega los contenidos
		const encab_id = encabezado.id;
		encabezado.contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id}, ["layout", "carrusel", "statusSugeridoPor", "statusRegistro"])
			.then((n) => n.sort((a, b) => a.orden - b.orden))
			.then((n) => n.sort((a, b) => b.anoLanzam - a.anoLanzam));

		// Le agrega el título elaborado
		encabezado = comp.titulosElabs({tema_id: encabezado.tema.id, encabezados: [encabezado]})[0];

		// Fin
		return;
	},
};
