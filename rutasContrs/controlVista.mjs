"use strict";
// import procsFM_PRL from "../2.0-Familias/FM-Procs1-PRL.js";

export default {
	secciones: async (req, res) => {
		// Obtiene la sección
		const url = req.originalUrl;
		const seccion = secciones.find((n) => n.link == url);

		// Obtiene el contenido de la sección
		const temasSeccion = temas.filter((n) => n.seccion_id == seccion.id);

		// Fin
		return res.render("CMP-0Estructura", {
			temasSeccion,
		});
	},
};
