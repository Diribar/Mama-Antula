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

		// Cambia el status de sus dependencias
		for (const contenido of contenidos)
			espera.push(baseDatos.actualizaPorCondicion("carrusel", {contenido_id: contenido.id}, cambioStatus)); // carrusel

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
			// Variables
			let encabezado, edicion;

			// Obtiene el encabezado
			const encabsRevisar = await this.obtieneEncabezados(usuario);
			encabezado = this.obtieneEncabezado(encabsRevisar);

			// Si no obtuvo un encabezado, lo obtiene de la edición
			if (!encabezado) ({encabezado, edicion} = await this.obtieneEdicion(usuario));
			if (!encabezado) return {};

			// Completa el encabezado y pule la edición
			await this.completaEncabezado({encabezado, edicion});
			this.puleLaEdicion(edicion);

			// Fin
			return {encabezado, edicion};
		},
		obtieneEncabezados: async (usuario) => {
			// Variables
			const statusRegistro_id = [creado_id, rechazar_id];

			// Obtiene los encabezados
			const includes = [...includesEncabs.cartas, "lugarIndice"];
			let encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", {statusRegistro_id}, includes);
			if (!encabezados.length) return [];

			// Quita los encabezados capturados por terceros
			const capturadoPor_id = {[Op.ne]: usuario.id};
			const capturadoEn = {[Op.gt]: new Date(Date.now() - unaHora)};
			const capturas = await baseDatos.obtieneTodosPorCondicion("capturas", {[Op.and]: [{capturadoPor_id}, {capturadoEn}]});
			encabezados = encabezados.filter(
				(n) =>
					!capturas.find((m) => (n.tema_id && m.tema_id == n.tema_id) || (n.pestana_id && m.pestana_id == n.pestana_id)) // el encabezado tiene tema/pestaña y no está capturada
			);

			// Fin
			return encabezados;
		},
		obtieneEncabezado: function (encabezados) {
			// Si no hay encabezados, interrumpe la función
			if (!encabezados.length) return;

			// Si hay un sólo encabezado, lo completa e interrumpe la función
			encabezados = encabezados.map((n) => agregaTemaPestana(n));
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
		obtieneEdicion: async (usuario) => {
			// Obtiene las ediciones del usuario
			const includes = [...includesEncabs.cartas, "lugarIndice", "editadoPor"];
			const edicion = await baseDatos.obtienePorCondicion("encabEdics", {id: {[Op.ne]: null}}, includes);
			if (!edicion) return {};

			// Obtiene el encabezado de la edición
			const encabezado = await baseDatos
				.obtienePorId("encabezados", edicion.encab_id, includes)
				.then((n) => n && agregaTemaPestana(n));

			// Fin
			return {encabezado, edicion};
		},
		completaEncabezado: async ({encabezado, edicion}) => {
			// Si es un cambio de status, le agrega el usuario
			if (!edicion) {
				encabezado.usuario = await baseDatos.obtienePorId("usuarios", encabezado.statusSugeridoPor_id);

				// Le agrega la imagen del usuario
				encabezado.imagenUsuario = encabezado.usuario.imagen
					? "/imgsEditables/8-Usuarios/" + encabezado.usuario.imagen
					: "/imgsEstables/Varios/usuarioGenerico.jpg";
			}

			// Le agrega el statusRegistro
			encabezado.statusRegistro = statusRegistros.find((n) => n.id == encabezado.statusRegistro_id);

			// Le agrega los contenidos
			encabezado.contenidos = await baseDatos
				.obtieneTodosPorCondicion("contenidos", {encab_id: encabezado.id}, ["layout", "carrusel"])
				.then((n) => n.sort((a, b) => a.orden - b.orden))
				.then((n) => n.sort((a, b) => b.anoLanzam - a.anoLanzam));

			// Le agrega el título elaborado
			encabezado = comp.titulosElabs({tema_id: encabezado.tema.id, encabezados: [encabezado]})[0];

			// Le agrega el editadoPor
			if (edicion) encabezado.editadoPor = edicion.editadoPor;

			// Fin
			return;
		},
		puleLaEdicion: (edicion) => {
			// Quita los campos sin valor
			for (const key in edicion) if (!edicion[key]) delete edicion[key];

			// Elimina campos puntuales
			const camposEliminar1 = ["id", "encab_id", "editadoPor_id", "editadoEn"];
			const camposEliminar2 = ["nombreDesde_id", "nombreHacia_id", "idioma_id", "lugar_id", "lugarIndice_id"];
			for (const prop of [...camposEliminar1, ...camposEliminar2]) delete edicion[prop];

			//

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

const agregaTemaPestana = (encabezado) => {
	// Variables
	const {tema_id, pestana_id} = encabezado;

	// Obtiene los datos de niveles
	if (pestana_id) encabezado.pestana = pestanasTemas.find((n) => n.id == pestana_id);
	encabezado.tema = temasSecciones.find((n) => n.id == (tema_id || encabezado.pestana.tema_id));
	encabezado.seccion = secciones.find((n) => n.id == encabezado.tema.seccion_id);

	// Fin
	return encabezado;
};
