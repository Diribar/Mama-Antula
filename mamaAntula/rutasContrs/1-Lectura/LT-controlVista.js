"use strict";
import procesos from "./LT-procesos.js";
const temaVista = "secciones";

export default {
	temas: async (req, res) => {
		// Variables
		const codigoVista = "temas";
		let {urlSeccion, urlTema} = req.params;
		urlSeccion = urlSeccion || "inicio";
		urlTema = urlTema || "novedades";

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);
		const conIndice = !!temaActual.indices.length;

		// Obtiene el encabezado y contenido
		const encabezado_id = req.query.id;
		const {encabezado, contenidos} = await procesos.contenidos({seccionActual, temaActual, encabezado_id});

		// Datos para la vista
		const tituloCarta = codigoVista == "cartas" && comp.contenido.tituloCons.encabCarta(encabezado);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion},
			...{seccionActual, temaActual, conIndice},
			...{tituloCarta, encabezado, contenidos},
		});
	},
	pestanas: async (req, res) => {
		// Variables
		const codigoVista = "pestanas";
		const {urlSeccion, urlTema, urlPestana} = req.params;

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Pestaña
		const pestanasTema = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
		const pestanaActual = pestanasTema.find((n) => n.url == urlPestana);
		const conIndice = !!pestanaActual.indices.length;

		// Obtiene el encabezado, contenido y imgsCarrousel del artículo
		const {encabezado, contenidos} = await procesos.contenidos({seccionActual, temaActual, pestanaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual, conIndice},
			...{encabezado, contenidos},
		});
	},
};
