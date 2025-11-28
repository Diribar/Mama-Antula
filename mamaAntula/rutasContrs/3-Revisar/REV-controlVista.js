"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const codigoVista = "revisar";
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		const {usuario} = req.session;
		let encabezado, cambioStatusEncab, edicion, cambioStatusCont;

		// Obtiene el encabezado a revisar
		({encabezado, cambioStatusEncab} = await procesos.obtieneEncabezado.consolidado(usuario));
		if (!encabezado) ({encabezado, edicion} = await procesos.obtieneEncabConEdicion.consolidado(usuario));
		if (!encabezado) ({encabezado, cambioStatusCont} = await procesos.obtieneEncabConContenido.consolidado(usuario));

		// Si no hay encabezado, redirige a la lectura del artículo según cookies de actualizar
		if (!encabezado) return res.redirect("/revisar/papelera");

		// Captura y obtiene la ruta
		const ruta = procesos.capturaObtieneRuta(encabezado, usuario);

		// Actualiza las cookies de 'actualiza'
		procesos.actualizaCookies({encabezado, res});

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura(req);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			...{encabezado, edicion, ruta, anchorLectura},
			...{cambioStatusEncab, cambioStatusCont},
		});
	},
	papelera: async (req, res) => {
		// Variables
		const codigoVista = "papelera";
		const anchorLectura = procesos.anchorLectura(req);

		// Obtiene todos los encabezados en papelera o con contenido en papelera
		const encabezados = await procesos.papelera.obtieneEncabezados();
		if (!encabezados.length) return res.redirect(anchorLectura);

		// Obtiene las rutas
		const rutas = procesos.papelera.obtieneRutas(encabezados);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina: "Papelera", temaVista, codigoVista},
			...{rutas, anchorLectura, },
		});
	},
};
