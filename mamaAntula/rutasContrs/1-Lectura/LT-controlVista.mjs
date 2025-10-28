"use strict";
import procesos from "./LT-procesos.mjs";
const temaVista = "secciones";

export default {
	landingPage: (req, res) => {
		// Sección
		const seccionActual = secciones.find((n) => n.codigo == "inicio");
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion[0];

		// Guarda cookies
		res.cookie(seccionActual.codigo, temaActual.codigo, {maxAge: unAno});

		// Obtiene el encabezado, contenido y imgsCarrousel de los artículos y cartas
		// const {encSinIndice, encConIndice} = await procesos.encabezados({seccionActual, temasSeccion});
		// const contenidos = await procesos.contenido({encSinIndice, encConIndice});
		// const imgsCarrousel = await procesos.imgsCarrousel(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			// ...{encSinIndice, encConIndice, contenidos, imgsCarrousel},
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

		// Guarda cookies
		res.cookie(seccionActual.codigo, temaActual.codigo, {maxAge: unAno});

		// Obtiene el encabezado y contenido de los artículos
		const {encabezados, contenidos} = await procesos.contenido({temaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			...{esConIndice, encabezados, contenidos},
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
		const {esConIndice, encabezados, contenidos} = await procesos.encabezado({pestanaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			...{esConIndice, encabezados, contenidos},
		});
	},
};
