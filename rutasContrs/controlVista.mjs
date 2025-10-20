"use strict";
// import procsFM_PRL from "../2.0-Familias/FM-Procs1-PRL.js";

export default {
	secciones: async (req, res) => {
		// Obtiene la sección
		const url = req.originalUrl;
		const seccionActual = secciones.find((n) => n.link == url);
		const titulo = seccionActual.nombre;
		console.log(10, req.cookies);

		// Obtiene los temas de la sección
		const temasSeccion = temas.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual =
			req.cookies && req.cookies[seccionActual.codigo]
				? temasSeccion.find((n) => n.codigo == req.cookies[seccionActual.codigo])
				: temasSeccion[0];

		// Obtiene las pestañas de los temas
		for (const tema of temasSeccion) tema.pestanas = pestanas.filter((n) => n.tema_id == tema.id);
		const pestanaActual =
			req.cookies && req.cookies[temaActual.codigo]
				? temaActual.pestanas.find((n) => n.codigo == req.cookies[temaActual.codigo])
				: temaActual.pestanas && temaActual.pestanas[0];

		// Obtiene el encabezado de los artículos
		const temas_ids = temasSeccion.map((n) => n.id);
		const pestanas_ids = temasSeccion.reduce((arr, n) => arr.concat(n.pestanas.map((m) => m.id)), []);
		const encabArtics = await baseDatos
			.obtieneTodosConOrden("encabArtics", "fechaOcurrio", true)
			.then((n) => n.filter((m) => temas_ids.includes(m.tema_id) || pestanas_ids.includes(m.pestana_id)));

		// Obtiene el encabezado de las cartas
		const encabCartas =
			seccionActual.codigo == "cartasEscritos" ? await baseDatos.obtieneTodosConOrden("encabCartas", "fechaEscrita") : [];

		// Obtiene el contenido de los encabArtics y encabCartas
		const articulos_ids = encabArtics.map((n) => n.id);
		const cartas_ids = encabCartas.map((n) => n.id);
		const contenidos = await baseDatos
			.obtieneTodosConOrden("contenidos", "orden")
			.then((n) => n.filter((m) => articulos_ids.includes(m.encabArtic_id) || cartas_ids.includes(m.encabCarta_id)));

		// Obtiene los carrouseles
		const contenidos_ids = contenidos.map((n) => n.id);
		const carrouseles = await baseDatos
			.obtieneTodosConOrden("carrouseles", "orden")
			.then((n) => n.filter((m) => contenidos_ids.includes(m.contenido_id)));

		// Fin
		console.log({seccionActual, temaActual, pestanaActual})
		return res.render("CMP-0Estructura", {
			titulo,
			...{seccionActual, temaActual, pestanaActual},
			...{temasSeccion, encabArtics, encabCartas, contenidos, carrouseles},
		});
	},
};
