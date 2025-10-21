"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	abm: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Contenido";
		const codigo = "abmArticulos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
	revision: async (req, res) => {
		// Variables
		const tituloPagina = "Revisión de ABMs de Contenido";
		const codigo = "revisionAbm";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
};
