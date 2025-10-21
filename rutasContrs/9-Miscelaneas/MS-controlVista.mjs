"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "miscelaneas";

export default {
	contactanos: async (req, res) => {
		// Variables
		const tituloPagina = "Contactanos";
		const codigo = "contactanos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
	estadisticas: async (req, res) => {
		// Variables
		const tituloPagina = "Estadísticas";
		const codigo = "estadisticas";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
};
