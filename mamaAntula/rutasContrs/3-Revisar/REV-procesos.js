"use strict";

export default {
	// API
	cambioStatus: {
		encabezado: async ({encab_id, ...cambioStatus}) => {
			// Variables
			const espera = [];

			// Cambia el status del encabezado
			espera.push(baseDatos.actualizaPorId("encabezados", encab_id, cambioStatus));

			// Cambia el status de los contenidos
			const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {encab_id}, "carrusel");
			espera.push(baseDatos.actualizaPorCondicion("contenidos", {encab_id}, cambioStatus));
			await Promise.all(espera);

			// Obtiene todas las imágenes a mover
			const imagenes = [];
			for (const contenido of contenidos) {
				if (contenido.imagen) imagenes.push(contenido.imagen);
				if (contenido.imagen2) imagenes.push(contenido.imagen2);
				imagenes.push(...contenido.carrusel.map((n) => n.imagen));
			}

			// Mueve los archivos de imagen a la carpeta de revisados
			for (const imagen of imagenes) comp.gestionArchs.mueve(carpRevisar, carpFinal, imagen);

			// Fin
			return;
		},
		contenido: async ({contenido, ...cambioStatus}) => {
			// Variables
			const imagenes = [];

			// Actualiza el status del contenido
			await baseDatos.actualizaPorId("contenidos", contenido.id, cambioStatus);

			// Obtiene los carrusel del contenido
			const carruseles = await baseDatos.obtieneTodosPorCondicion("carrusel", {contenido_id: contenido.id});

			// Obtiene el nombre de los archivos de imagen
			if (contenido.imagen) imagenes.push(contenido.imagen);
			if (contenido.imagen2) imagenes.push(contenido.imagen2);
			for (const carrusel of carruseles) imagenes.push(carrusel.imagen);

			// Mueve los archivos de imagen a la carpeta de revisados
			for (const imagen of imagenes) comp.gestionArchs.mueve(carpRevisar, carpFinal, imagen);

			// Fin
			return;
		},
	},

	// Vista - Revisar
	obtieneEncabezado: {
		consolidado: async function (usuario) {
			// Obtiene el encabezado
			const encabsRevisar = await this.obtieneEncabezados(usuario);
			let encabezado = this.obtieneEncabezado(encabsRevisar);
			if (!encabezado) return {};
			await this.completaEncabezado(encabezado);

			// Fin
			return {encabezado, cambioStatusEncab: true};
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

			// Completa el usuario
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
			return {encabezado, cambioStatusCont: true};
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
			}

			// Completa el encabezado
			await FN.completaEncabezado(encabezado);

			// Fin
			return;
		},
	},
	captura: (encabezado, usuario) => {
		// Actualiza la captura
		const {tema_id, pestana_id} = encabezado;
		comp.captura({tema_id, pestana_id, capturadoPor_id: usuario.id});

		// Obtiene la ruta
		const ruta = FN.obtieneRuta(encabezado);

		// Fin
		return ruta;
	},
	actualizaCookies: ({encabezado, res}) => {
		// Variables
		const {seccion, tema, pestana} = encabezado;

		// Actualiza las cookies de 'actualiza'
		res.cookie("actSeccion_id", seccion.id, {maxAge: unDia, path: "/"});
		res.cookie("actTema_id", tema.id, {maxAge: unDia, path: "/"});
		if (pestana) res.cookie("actPestana_id", pestana.id, {maxAge: unDia, path: "/"});
		else res.clearCookie("actPestana_id");
		res.cookie("actEncabezado_id", encabezado.id, {maxAge: unDia, path: "/"});

		// Fin
		return;
	},
	anchorLectura: (req) => {
		// Variables
		const {actSeccion_id, actTema_id, actPestana_id, actEncabezado_id} = req.cookies;

		// Le agrega la sección
		let anchorLectura = "/" + seccionesLectura.find((n) => n.id == actSeccion_id).url;

		// Le agrega el tema
		const temaActual = temasSecciones.find((n) => n.id == actTema_id);
		anchorLectura += "/" + temasSecciones.find((n) => n.id == actTema_id).url;

		// Le agrega la pestaña
		anchorLectura += (actPestana_id && "/" + v.pestanasTemas.find((n) => n.id == actPestana_id).url) || "";

		// Le agrega el encabezado
		const conIndice = temaActual.indicesFecha.length || temaActual.indicesLugar.length;
		anchorLectura += conIndice ? "/?id=" + actEncabezado_id : "";

		// Fin
		return anchorLectura;
	},

	// Vista - Papelera
	papelera: {
		obtieneEncabezados: async () => {
			// Obtiene todos los contenidos en papelera
			const encab_ids = await baseDatos
				.obtieneTodosPorCondicion("contenidos", {statusRegistro_id: rechazado_id})
				.then((n) => n.map((m) => m.encab_id));

			// Obtiene todos los encabezados en papelera o con contenido en papelera
			const condicion = {[Op.or]: [{id: encab_ids}, {statusRegistro_id: rechazado_id}]};
			const includes = [...includesEncabs.cartas, ...includesEncabs.lugares];
			const encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", condicion, includes);

			// Fin
			return encabezados;
		},
		obtieneRutas: function (encabezados) {
			// Variables
			const rutas = {};

			// Agrega el tema y la pestaña
			for (let encabezado of encabezados) {
				// Obtiene la ruta
				encabezado = FN.agregaTemaPestana(encabezado);
				const ruta = FN.obtieneRuta(encabezado);

				// Completa el encabezado
				encabezado = comp.tituloElab(encabezado);
				encabezado.anchor ="/actualizar"+ this.anchorLectura(encabezado);

				// Agrega a la ruta
				if (rutas[ruta]) rutas[ruta].encabezados.push(encabezado);
				else {
					// Crea el orden
					const {seccion, tema, pestana} = encabezado;
					const orden = seccion.orden + "-" + tema.orden + (pestana ? "-" + pestana.orden : "");

					// Crea la ruta
					rutas[ruta] = {orden, encabezados: [encabezado]};
				}
			}

			// Ordena las rutas
			const entries = Object.entries(rutas);
			entries.sort((a, b) => (a[1].orden < b[1].orden ? -1 : 1));
			const ordered = Object.fromEntries(entries);

			// Fin
			return ordered;
		},
		anchorLectura: (encabezado) => {
			// Variables
			const {seccion, tema, pestana} = encabezado;

			// Le agrega la sección
			let anchorLectura = "/?actSeccion_id=" + seccion.id + "&actTema_id=" + tema.id;

			// Le agrega la pestaña
			anchorLectura += (pestana && "&actPestana_id=" + pestana.id) || "";

			// Le agrega el encabezado
			const temaActual = temasSecciones.find((n) => n.id == tema.id);
			const conIndice = temaActual.indicesFecha.length || temaActual.indicesLugar.length;
			anchorLectura += conIndice ? "&actEncabezado_id=" + encabezado.id : "";

			// Fin
			return anchorLectura;
		},
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
		encabezado.seccion = seccionesLectura.find((n) => n.id == encabezado.tema.seccion_id);

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
	obtieneRuta: (encabezado) => {
		// Obtiene la ruta
		const {seccion, tema, pestana} = encabezado;
		const ruta = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.titulo : "");

		// Fin
		return ruta;
	},
};
