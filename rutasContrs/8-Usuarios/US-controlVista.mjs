"use strict";
// import procesos from "./US-procesos.mjs";

export default {
	abm: async (req, res) => {
		// Variables
		const tituloPagina = "Panel de Usuario";
		const tema = "usuarios";
		const codigo = "abmUsuarios";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, tema, codigo},
		});
	},
	cambioRol: async (req, res) => {
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
