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
	obtieneEncabsRevisar: async () => {
		// Variables
		const statusRegistro_id = [creado_id, rechazar_id];

		// Obtiene los encabezados
		let encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", {statusRegistro_id});
		if (!encabezados.length) return {};

		// Les agrega la pestaña, tema y seccion
		for (const encabezado of encabezados) {
			// Variables
			const {pestana_id, tema_id} = encabezado;

			// Obtiene los datos de niveles
			if (pestana_id) encabezado.pestana = pestanasTemas.find((n) => n.id == pestana_id);
			encabezado.tema = temasSecciones.find((n) => n.id == (tema_id || encabezado.pestana.tema_id));
			// console.log(127, pestana_id, tema_id);
			encabezado.seccion = secciones.find((n) => n.id == encabezado.tema.seccion_id);
		}

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
};
