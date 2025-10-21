"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "usuarios";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const tituloPagina = "Alta de Usuario / Olvido de Contraseña";
		const codigo = "altaOlvido";

		// Obtiene imágenes

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigo},
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
