"use strict";
import procesosUs from "../8-Usuarios/US-procesos.js";
const temaVista = "miscelaneas";

export default {
	contactanos: async (req, res) => {
		// Variables
		const tituloPagina = "Contactanos";
		const codigoVista = "contactanos";
		const imagenes = procesosUs.obtieneImagenesAlAzar();

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			imagenes,
		});
	},
	videos: async (req, res) => {
		// Variables
		const tituloPagina = "Videos de Capacitación";
		const codigoVista = "videos";

		// Datos para la vista
		const videos = await baseDatos.obtieneTodos("videos").then((n) => n.sort((a, b) => a.orden - b.orden));

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			videos,
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
};
