"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;

		// Obtiene el encabezado a revisar
		const encabsRevisar = await procesos.obtieneEncabsRevisar();
		const encabezado =
			(encabsRevisar.length > 1 && procesos.obtieneEncabRevisar(encabsRevisar)) ||
			(encabsRevisar.length == 1 && encabsRevisar[0]) ||
			{};

		// Completa el encabezado
		await procesos.completaEncabezado(encabezado);

		// Actualiza las cookies de 'actualiza'
		const {seccion, tema, pestana} = encabezado;
		res.cookie("actualizaSeccion_id", seccion.id, {maxAge: unDia, path: "/"});
		res.cookie("actualizaTema_id", tema.id, {maxAge: unDia, path: "/"});
		if (pestana) res.cookie("actualizaPestana_id", pestana.id, {maxAge: unDia, path: "/"});
		res.cookie("actualizaEncabezado_id", encabezado.id, {maxAge: unDia, path: "/"});

		// Variables para la vista
		const seccionTema = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.nombre : "");

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{seccionTema, encabezado},
		});
	},
};
