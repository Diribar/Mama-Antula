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
	prueba1: (req, res) => {
		// Variables
		const tituloPagina = "Prueba";
		const codigoVista = "prueba1";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	prueba2: (req, res) => {
		// Variables
		const tituloPagina = "Prueba";
		const codigoVista = "prueba2";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
