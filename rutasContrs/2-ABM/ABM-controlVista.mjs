"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	abm: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Artículos";

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina});
	},
	revision: async (req, res) => {
		// Variables
		const tituloPagina = "Revisión de ABM de Artículos";

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina});
	},
};
