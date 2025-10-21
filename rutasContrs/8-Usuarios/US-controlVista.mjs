"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const tituloPagina = "Alta de Usuario / Olvido de Contraseña";
		const tema = "usuarios";
		const codigo = "altaOlvido";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	edicion: async (req, res) => {
		// Variables
		const tituloPagina = "Edición de Usuario";
		const tema = "usuarios";
		const codigo = "edicion";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	cambioRoles: async (req, res) => {
		// Variables
		const tituloPagina = "Cambio de Rol en Usuarios";
		const tema = "usuarios";
		const codigo = "cambioRolUsuarios";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
};
