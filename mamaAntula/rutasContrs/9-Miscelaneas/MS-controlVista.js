"use strict";
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
	videos: async (req, res) => {
		// Variables
		const tituloPagina = "Videos de Capacitación";
		const codigoVista = "videos";

		// Datos para la vista
		const videos = await baseDatos.obtieneTodos("videos", "rol").then((n) => n.sort((a, b) => a.orden - b.orden));

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			videos,
		});
	},
};
