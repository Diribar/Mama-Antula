"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	actualizar: async (req, res) => {
		// Variables
		const codigoVista = "actualizar";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista).nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	revisar: async (req, res) => {
		// Variables
		const codigoVista = "revisar";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista).nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
