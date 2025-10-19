"use strict";
// import procsFM_PRL from "../2.0-Familias/FM-Procs1-PRL.js";

export default {
	temasPestanas: (req, res) => {
		// Obtiene la sección actual
		const {url} = req.query;
		const seccionActual = secciones.find((n) => n.link == url);

		// Obtiene los temas de la sección, con sus pestañas
		const temasSeccion = temas.filter((n) => n.seccion_id == seccionActual.id);
		for (const tema of temasSeccion) tema.pestanas = pestanas.filter((n) => n.tema_id == tema.id);

		return res.json({seccionActual, temasSeccion});
	},
};
