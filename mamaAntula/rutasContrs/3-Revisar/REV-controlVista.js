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
		procesos.actualizaCookies({encabezado, res});

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura();

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{encabezado, seccionTema, anchorLectura},
		});
	},
};
