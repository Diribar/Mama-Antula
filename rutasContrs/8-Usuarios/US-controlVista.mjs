"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const tituloPagina = "Alta de Usuario / Olvido de Contraseña";
		const tema = "usuarios";
		const codigo = "abmUsuarios";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	edicion: async (req, res) => {

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
