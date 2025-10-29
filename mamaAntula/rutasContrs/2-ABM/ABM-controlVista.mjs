"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	edicion: async (req, res) => {
		// Variables
		const codigoVista = "actualizarContenido";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista).nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	revision: async (req, res) => {
		// Variables
		const codigoVista = "revisarActualizacs";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista).nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
