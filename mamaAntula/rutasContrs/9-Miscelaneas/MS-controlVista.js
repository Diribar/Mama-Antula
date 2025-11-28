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
};
