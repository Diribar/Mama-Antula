"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	login: async (req, res) => {
		// Variables
		const tituloPagina = "ABM de Usuarios";

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina});
	},
};
