"use strict";

export default {
	// Vista revisar
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
