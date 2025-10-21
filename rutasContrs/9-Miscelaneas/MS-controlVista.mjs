"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	contactanos: async (req, res) => {
		// Variables
		const tituloPagina = "Contactanos";
		const tema = "miscelaneas";
		const codigo = "contactanos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	estadisticas: async (req, res) => {
		// Variables
		const tituloPagina = "Estadísticas";
		const tema = "miscelaneas";
		const codigo = "estadisticas";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
};
