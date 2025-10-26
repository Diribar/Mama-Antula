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
		const {apodo} = req.session.usuario;
		const imagen = req.session.usuario.imagen && "/imgsEditables/8-Usuarios/" + req.session.usuario.imagen;

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina, temaVista, codigoVista, imagenes, apodo, imagen});
	},
	cambioRoles: async (req, res) => {
		// Variables
		const codigoVista = "cambioRoles";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista).nombre;
		const imagenes = procesos.obtieneImagenesAlAzar();
		const usuarios = await baseDatos.obtieneTodos("usuarios");

		// Fin
		return res.render("CMP-0Estructura", {tituloPagina, temaVista, codigoVista, imagenes, usuarios});
	},
};
