"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;

		// Obtiene el encabezado a revisar
		const {encabezado, edicion, seccionTema} = await procesos.obtieneEncabezado.consolidado(usuario);
		if (!encabezado) return res.redirect(procesos.anchorLectura(req));

		// Actualiza las cookies de 'actualiza'
		procesos.actualizaCookies({encabezado, res});

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura(req);
		console.log(20, edicion);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{encabezado, edicion, seccionTema, anchorLectura},
		});
	},
};
