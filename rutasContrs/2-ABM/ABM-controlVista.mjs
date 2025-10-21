"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	abm: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Contenido";
		const tema = "abmArticulos";
		const codigo = "abmArticulos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	revision: async (req, res) => {
		// Variables
		const tituloPagina = "Revisión de ABMs de Contenido";
		const tema = "abmArticulos";
		const codigo = "revisionAbm";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
};
