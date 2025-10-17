"use strict";
// import procsFM_PRL from "../2.0-Familias/FM-Procs1-PRL.js";

export default {
	secciones: async (req, res) => {
		// Obtiene la sección
		const url = req.originalUrl;
		const seccion = secciones.find((n) => n.link == url);

		// Obtiene los temas de la sección, con sus pestañas
		const temasSeccion = temas.filter((n) => n.seccion_id == seccion.id);
		for (const tema of temasSeccion) tema.pestanas = pestanas.filter((n) => n.tema_id == tema.id);

		// Obtiene el contenido de los temas o secciones


		// Fin
		return res.render("CMP-0Estructura", {
			temasSeccion,
		});
	},
};
