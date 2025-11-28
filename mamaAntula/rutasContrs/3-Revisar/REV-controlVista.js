"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;
		let encabezado, cambioStatusEncab, edicion, cambioStatusCont;

		// Obtiene el encabezado a revisar
		({encabezado, cambioStatusEncab} = await procesos.obtieneEncabezado.consolidado(usuario));
		if (!encabezado) ({encabezado, edicion} = await procesos.obtieneEncabConEdicion.consolidado(usuario));
		if (!encabezado) ({encabezado, cambioStatusCont} = await procesos.obtieneEncabConContenido.consolidado(usuario));
		// return res.send(encabezado);

		// Si no hay encabezado, redirige a la lectura del artículo según cookies de actualizar
		if (!encabezado) return res.redirect(procesos.anchorLectura(req));

		// Captura y obtiene la ruta
		const ruta = procesos.capturaObtieneRuta(encabezado, usuario);

		// Actualiza las cookies de 'actualiza'
		procesos.actualizaCookies({encabezado, res});

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura(req);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{encabezado, edicion, ruta, anchorLectura},
			...{cambioStatusEncab, cambioStatusCont},
		});
	},
};
