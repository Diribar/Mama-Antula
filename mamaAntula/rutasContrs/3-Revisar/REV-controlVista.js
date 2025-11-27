"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;
		const {id: capturadoPor_id} = usuario;

		// Obtiene el encabezado a revisar
		const encabsRevisar = await procesos.obtieneEncabezados(usuario);
		const encabezado = procesos.obtieneEncabezado(encabsRevisar);
		if (!encabezado) return res.redirect("/");

		// Actualiza la captura
		const {tema_id, pestana_id} = encabezado;
		comp.captura({tema_id, pestana_id, capturadoPor_id});

		// Completa el encabezado
		await procesos.completaEncabezado(encabezado);

		// Actualiza las cookies de 'actualiza'
		const {seccion, tema, pestana} = encabezado;
		res.cookie("actualizaSeccion_id", seccion.id, {maxAge: unDia, path: "/"});
		res.cookie("actualizaTema_id", tema.id, {maxAge: unDia, path: "/"});
		if (pestana) res.cookie("actualizaPestana_id", pestana.id, {maxAge: unDia, path: "/"});
		else res.clearCookie("actualizaPestana_id");
		res.cookie("actualizaEncabezado_id", encabezado.id, {maxAge: unDia, path: "/"});

		// Variables para la vista
		const seccionTema = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.titulo : "");

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{seccionTema, encabezado},
		});
	},
};
