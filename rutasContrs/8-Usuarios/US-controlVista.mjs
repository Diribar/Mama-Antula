"use strict";
import procesos from "./US-procesos.mjs";
const temaVista = "usuarios";

export default {
	altaOlvido: async (req, res) => {
		// Variables
		const tituloPagina = "Alta de Usuario / Olvido de Contraseña";
		const codigoVista = "altaOlvido";
		const imagenes = procesos.obtieneImagenesAlAzar();

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina, temaVista, codigoVista, imagenes});
	},
	edicion: async (req, res) => {
		// Variables
		const tituloPagina = "Edición de Usuario";
		const codigoVista = "edicion";
		const imagenes = procesos.obtieneImagenesAlAzar();

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina, temaVista, codigoVista, imagenes});
	},
	cambioRoles: async (req, res) => {
		// Variables
		const tituloPagina = "Cambio de Roles";
		const codigoVista = "cambioRolUsuarios";
		const imagenes = procesos.obtieneImagenesAlAzar();

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina, temaVista, codigoVista, imagenes});
	},
};
