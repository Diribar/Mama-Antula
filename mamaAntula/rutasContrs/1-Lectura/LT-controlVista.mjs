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
		const esCartas = temaActual.codigo == "cartas";
		const esExperiencias = seccionActual.codigo == "experiencias";
		const indice = procesos.indice(encabezados);
		if (esCartas || esExperiencias) return res.send(indice);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual, esCartas, esExperiencias},
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
		const esExperiencias = seccionActual.codigo == "experiencias";
		const indice = procesos.indice(encabezados);
		if (esExperiencias) return res.send(indice);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual, esExperiencias},
			...{encabezados, contenidos},
		});
	},
};
