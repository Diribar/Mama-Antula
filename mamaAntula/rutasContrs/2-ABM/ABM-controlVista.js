"use strict";
import procesos from "./ABM-procesos.js";
const temaVista = "abmContenido";

export default {
	actualizar: async (req, res) => {
		// Variables
		const codigoVista = "actualizar";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista)?.nombre;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
	revisar: async (req, res) => {
		// Variables
		const codigoVista = "revisar";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == codigoVista)?.nombre;

		// Obtiene el encabezado a revisar
		const encabsRevisar = await procesos.obtieneEncabsRevisar();
		const encabezado =
			(encabsRevisar.length > 1 && procesos.obtieneEncabRevisar(encabsRevisar)) ||
			(encabsRevisar.length == 1 && encabsRevisar[0]) ||
			{};

		// Completa el encabezado
		encabezado.statusSugeridoPor = await baseDatos.obtienePorId("usuarios", encabezado.statusSugeridoPor_id);
		encabezado.contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id: encabezado.id})
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Variables para la vista
		const {seccion, tema, pestana} = encabezado;
		console.log(tema);
		const seccionTema = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.nombre : "");

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, encabezado},
			...{seccionTema},
		});
	},
};
