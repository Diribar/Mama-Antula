"use strict";
import procesos from "./MS-procesos.js";
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
	biblioteca: async (req, res) => {
		// Variables
		const tituloPagina = "Biblioteca";
		const codigoVista = "biblioteca";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	capacitacion: async (req, res) => {
		// Variables
		const tituloPagina = "Capacitación";
		const codigoVista = "capacitacion";

		// Datos para la vista
		const capacitaciones = await baseDatos.obtieneTodos("capacitaciones", "rol");

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			capacitaciones,
		});
	},
};
