"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	abm: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Usuarios";

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina});
	},
	cambioRol: async (req, res) => {
		// Variables
		const tituloPagina = "Cambio de Rol en Usuarios";

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina});
	},
};
