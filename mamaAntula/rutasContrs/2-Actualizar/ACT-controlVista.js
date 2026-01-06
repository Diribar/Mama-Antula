"use strict";
const temaVista = "actualizaArtics";

export default {
	actualizar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
		});
	},
};
