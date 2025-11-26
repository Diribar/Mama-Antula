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
		const encabRevisar =
			(encabsRevisar.length > 1 && procesos.obtieneEncabRevisar(encabsRevisar)) ||
			(encabsRevisar.length == 1 && encabsRevisar[0]) ||
			{};
		return res.send(encabRevisar);

		// Obtiene el primer encabezado
		const encabezado = encabezados[0];
		const usuario = await baseDatos.obtienePorId("usuarios", encabezado.statusSugeridoPor_id);
		encabezado.statusSugeridoPor = usuario;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
		});
	},
};
