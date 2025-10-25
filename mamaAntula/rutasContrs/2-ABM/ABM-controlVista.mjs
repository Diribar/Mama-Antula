"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	edicion: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Contenido";
		const codigoVista = "abmArticulos";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	revision: async (req, res) => {
		// Variables
		const tituloPagina = "Revisión de ABMs de Contenido";
		const codigoVista = "revisionAbm";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
