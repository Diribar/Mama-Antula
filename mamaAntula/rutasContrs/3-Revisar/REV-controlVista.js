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
		if (!encabezado) {
			const anchorLectura = procesos.anchorLectura(req);
			return res.redirect(anchorLectura);
		}

		// Actualiza la captura
		const {tema_id, pestana_id} = encabezado;
		comp.captura({tema_id, pestana_id, capturadoPor_id});

		// Completa el encabezado
		await procesos.completaEncabezado(encabezado);

		// Actualiza las cookies de 'actualiza'
		procesos.actualizaCookies({encabezado, res});

		// Obtiene el seccionTema
		const {seccion, tema, pestana} = encabezado;
		const seccionTema = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.titulo : "");

		// Variables para la vista
		const anchorLectura = procesos.anchorLectura(req);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{encabezado, seccionTema, anchorLectura},
		});
	},
};
