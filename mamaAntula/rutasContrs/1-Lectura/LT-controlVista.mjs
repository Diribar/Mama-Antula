"use strict";
import procesos from "./LT-procesos.mjs";
const temaVista = "secciones";

export default {
	redirige: (req, res) => {},
	temas: async (req, res) => {
		// Variables
		let {urlSeccion, urlTema} = req.params;
		urlSeccion = urlSeccion || "inicio";
		urlTema = urlTema || "proximos-eventos";
		const codigoVista = urlTema == "cartas" ? "cartas" : urlSeccion == "experiencias" ? "experiencias" : "sinIndice";

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Obtiene el encabezado y contenido
		const encabezado_id = req.query.id || 1;
		const {encabezado, contenidos} = await procesos.contenidos({seccionActual, temaActual, encabezado_id});

		// Genera el título de la carta
		const tituloCarta = codigoVista == "cartas" && comp.contenido.tituloCons.encabCarta(encabezado);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			...{tituloCarta, encabezado, contenidos},
		});
	},
	pestanas: async (req, res) => {
		// Variables
		const {urlSeccion, urlTema, urlPestana} = req.params;
		const codigoVista = urlSeccion == "experiencias" ? "experiencias" : "sinIndice";

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Pestaña
		const pestanasTema = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
		const pestanaActual = pestanasTema.find((n) => n.url == urlPestana);

		// Obtiene el encabezado, contenido y imgsCarrousel del artículo
		const {encabezado, contenidos} = await procesos.contenidos({seccionActual, temaActual, pestanaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			...{encabezado, contenidos},
		});
	},
};
