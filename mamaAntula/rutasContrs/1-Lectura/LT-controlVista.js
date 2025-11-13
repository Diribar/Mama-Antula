"use strict";
import procesos from "./LT-procesos.js";
const temaVista = "secciones";

export default {
	temas: async (req, res) => {
		// Variables
		const codigoVista = "temas";
		let {urlSeccion, urlTema} = req.params;
		urlSeccion = urlSeccion || LP_urlSeccion;
		urlTema = urlTema || LP_urlTema;

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);
		const esCarta = temaActual.codigo == "cartas";
		const conIndice = !!temaActual.indices.length;

		// Datos para la vista
		const encabezado_id = req.query.id;
		const {encabezados, encabezado} = await procesos.encabezados({temaActual, encabezado_id});
		const contenidos = encabezado && (await procesos.contenidos({temaActual, encabezado}));
		const tituloCarta = encabezado && encabezado.tituloLectura; // el encabezado puede no estar creado
		const clase = temaActual.codigo == "libros" ? "libros" : "estandar";
		if (clase == "libros") contenidos.sort((a, b) => (b.video < a.video ? -1 : 1)); // ordena los libros en forma descenente

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion},
			...{seccionActual, temaActual, esCarta, conIndice, clase},
			...{tituloCarta, encabezado, contenidos, encabezados},
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

		// Datos para la vista
		const esCarta = null;
		const conIndice = null;
		const encabezado_id = req.query.id;
		const {encabezados, encabezado} = await procesos.encabezados({pestanaActual, encabezado_id});
		const contenidos = encabezado && (await procesos.contenidos({pestanaActual, encabezado}));
		const clase = pestanaActual.codigo.startsWith("estampas") ? "estampas" : "estandar";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual, esCarta, conIndice, clase},
			...{encabezado, contenidos, encabezados},
		});
	},
};
