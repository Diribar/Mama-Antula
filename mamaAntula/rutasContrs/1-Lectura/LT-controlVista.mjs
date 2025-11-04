"use strict";
import procesos from "./LT-procesos.mjs";
const temaVista = "secciones";

export default {
	landingPage: async (req, res) => {
		// Sección
		const seccionActual = secciones.find((n) => n.codigo == "inicio");
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion[0];

		// Obtiene el encabezado y contenido de los artículos
		const {encabezados, contenidos} = await procesos.contenido({seccionActual, temaActual});
		const esConIndice = false;

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			...{esConIndice, encabezados, contenidos},
		});
	},
	redirige: (req, res) => {},
	cartas: async (req, res) => {
		// Sección
		const seccionActual = secciones.find((n) => n.codigo == "cartasEscritos");
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.codigo == "cartas");

		// Obtiene la carta
		const carta = req.query.carta || 1;
		const encabCarta = await baseDatos.obtienePorCondicion("encabCartas", {numero: carta});
		const contCarta = await baseDatos.obtienePorCondicion("contenidos", {carta_id: encabCarta.id});

		// Variables para la vista
		const archVista = "1Cartas";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual, archVista},
			...{encabCarta, contCarta},
		});
	},
	temas: async (req, res) => {
		// Variables
		const {urlSeccion, urlTema} = req.params;

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Obtiene el encabezado y contenido de los artículos
		const {encabezados, contenidos} = await procesos.contenido({seccionActual, temaActual});

		// Variables para la vista
		const {archVista} = procesos.varsVista({seccionActual, temaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual, archVista},
			...{encabezados, contenidos},
		});
	},
	pestanas: async (req, res) => {
		// Variables
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

		// Obtiene el encabezado, contenido y imgsCarrousel del artículo
		const {encabezados, contenidos} = await procesos.contenido({seccionActual, temaActual, pestanaActual});

		// Variables para la vista
		const {archVista} = procesos.varsVista({seccionActual, temaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			...{encabezados, contenidos, archVista},
		});
	},
};
