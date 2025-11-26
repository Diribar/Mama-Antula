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
	obtieneEncabsRevisar: async (usuario) => {
		// Variables
		const statusRegistro_id = [creado_id, rechazar_id];

		// Obtiene los encabezados
		let encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", {statusRegistro_id}, includesEncabs.cartas);
		if (!encabezados.length) return {};

		// Les agrega la pestaña, tema y seccion
		for (const encabezado of encabezados) {
			// Variables
			const {pestana_id, tema_id} = encabezado;

			// Obtiene los datos de niveles
			if (pestana_id) encabezado.pestana = pestanasTemas.find((n) => n.id == pestana_id);
			encabezado.tema = temasSecciones.find((n) => n.id == (tema_id || encabezado.pestana.tema_id));
			encabezado.seccion = secciones.find((n) => n.id == encabezado.tema.seccion_id);
		}

		// Quita los encabezados capturados por terceros
		console.log(57, encabezados.length);
		encabezados = encabezados.filter(
			(n) =>
				[null, usuario.id].includes(n.tema.capturadoPor_id)
				// ||new Date(n.tema.capturadoEn).getTime() < Date.now() - unaHora
		);
		console.log(61, encabezados.length);

		// Fin
		return encabezados;
	},
	obtieneEncabRevisar: (encabezados) => {
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

		// Si es una carta, le agrega el título
		if (encabezado.tema.id == temaCarta_id)
			encabezado.titulo = comp.titulosElabs({esCarta: true, encabezados: [encabezado]})[0].tituloElab;

		// Le agrega los contenidos
		encabezado.contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id: encabezado.id}, ["layout", "carrusel"])
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Fin
		return;
	},
};
