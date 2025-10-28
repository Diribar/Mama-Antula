"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "miscelaneas";

export default {
	contactanos: async (req, res) => {
		// Variables
		const tituloPagina = "Contactanos";
		const codigoVista = "contactanos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	estadisticas: async (req, res) => {
		// Variables
		const tituloPagina = "Estadísticas";
		const codigoVista = "estadisticas";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	prueba: (req, res) => {
		// Variables
		const tituloPagina = "Prueba";
		const codigoVista = "prueba";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
