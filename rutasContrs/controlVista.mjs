"use strict";
// import procsFM_PRL from "../2.0-Familias/FM-Procs1-PRL.js";

export default {
	secciones: async (req, res) => {
		// Obtiene la sección
		const url = req.originalUrl;
		const seccionActual = secciones.find((n) => n.link == url);

		// Obtiene los temas de la sección, con sus pestañas
		const temasSeccion = temas.filter((n) => n.seccion_id == seccionActual.id);
		for (const tema of temasSeccion) tema.pestanas = pestanas.filter((n) => n.tema_id == tema.id);

		// Obtiene el encabezado de los artículos
		const temas_ids = temasSeccion.map((n) => n.id);
		const pestanas_ids = temasSeccion.reduce((arr, n) => arr.concat(n.pestanas.map((m) => m.id)), []);
		const articulos = await baseDatos
			.obtieneTodosPorOrden("articulos", "fechaOcurrio", true)
			.then((n) => n.filter((m) => temas_ids.includes(m.tema_id) || pestanas_ids.includes(m.pestana_id)));

		// Obtiene el encabezado de las cartas
		const cartas =
			seccionActual.codigo == "cartasEscritos" ? await baseDatos.obtieneTodosPorOrden("cartas", "fechaEscrita") : [];

		// Obtiene el contenido de los artículos y cartas
		const articulos_ids = articulos.map((n) => n.id);
		const cartas_ids = cartas.map((n) => n.id);
		const contenidos = await baseDatos
			.obtieneTodosPorOrden("contenidos", "orden")
			.then((n) => n.filter((m) => articulos_ids.includes(m.articulo_id) || cartas_ids.includes(m.carta_id)));

		// Obtiene los carrouseles
		const contenidos_ids = contenidos.map((n) => n.id);
		const carrouseles = await baseDatos
			.obtieneTodosPorOrden("carrouseles", "orden")
			.then((n) => n.filter((m) => contenidos_ids.includes(m.contenido_id)));

		// Fin
		return res.render("CMP-0Estructura", {seccionActual, temasSeccion, articulos, cartas, contenidos, carrouseles});
	},
};
