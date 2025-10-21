"use strict";
import procesos from "./US-Procesos.mjs";
const temaVista = "usuarios";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const tituloPagina = "Alta de Usuario / Olvido de Contraseña";
		const codigo = "altaOlvido";

		// Obtiene imágenes
		const imagenes = procesos.altaOlvido.obtieneImagenesAlAzar();

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
			imagenes
		});
	},
	edicion: async (req, res) => {
		// Variables
		const tituloPagina = "Edición de Usuario";
		const codigo = "edicion";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
	cambioRoles: async (req, res) => {
		// Variables
		const tituloPagina = "Cambio de Roles";
		const codigo = "cambioRolUsuarios";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
		});
	},
};
