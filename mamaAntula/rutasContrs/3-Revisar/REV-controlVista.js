"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;
		let encabezado, edicion;

		// Obtiene el encabezado a revisar
		encabezado = await procesos.obtieneEncabezado.consolidado(usuario);
		if (!encabezado) ({encabezado, edicion} = await procesos.obtieneEncabConEdic.consolidado());

		// Si no hay encabezado, redirige a la lectura del artículo según cookies de actualizar
		if (!encabezado) return res.redirect(procesos.anchorLectura(req));

		const ruta = procesos.capturaObtieneRuta(encabezado, usuario);

		// Actualiza las cookies de 'actualiza'
		procesos.actualizaCookies({encabezado, res});

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura(req);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{encabezado, edicion, ruta, anchorLectura},
		});
	},
};
