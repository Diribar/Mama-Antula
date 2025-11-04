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
		const {encabezados, contenidos} = await procesos.contenidos({seccionActual, temaActual});

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
	redirige: (req, res) => {},
	cartas: async (req, res) => {
		// Variables
		const codigoVista = "cartas";

		// Sección
		const seccionActual = secciones.find((n) => n.codigo == "cartasEscritos");
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.codigo == "cartas");

		// Obtiene la carta
		const numero = req.query.numero || 1;
		const include = ["nombreDesde", "nombreHacia", "lugar", "idioma"];
		const encabezado = await baseDatos.obtienePorCondicion("encabCartas", {numero}, include);
		const contenidos = encabezado ? await baseDatos.obtieneTodosPorCondicion("contenidos", {carta_id: encabezado.id}) : [];

		// Genera el título de la carta
		const tituloCarta = comp.contenido.tituloCons.encabCarta(encabezado);

		// Variables para la vista
		const {archVista} = procesos.varsVista({seccionActual, temaActual});

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista},
			...{temasSeccion},
			...{seccionActual, temaActual, archVista},
			...{tituloCarta, encabezado, contenidos},
		});
	},
	expers: {
		temas: async (req, res) => {
			// Variables
			const codigoVista = "experiencias";
			const {urlTema} = req.params;

			// Sección
			const seccionActual = secciones.find((n) => n.codigo == "experiencias");
			const tituloPagina = seccionActual.nombre;

			// Tema
			const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
			const temaActual = temasSeccion.find((n) => n.url == urlTema);

			// Obtiene el encabezado y contenidos
			const encabezado_id = req.query.id || 1;
			const {encabezado, contenidos} = await procesos.contenidos({seccionActual, temaActual, encabezado_id});

			// Variables para la vista
			const {archVista} = procesos.varsVista({seccionActual, temaActual});

			// Fin
			return res.render("CMP-0Estructura", {
				...{tituloPagina, temaVista, codigoVista, archVista},
				...{temasSeccion},
				...{seccionActual, temaActual},
				...{encabezado, contenidos},
			});
		},
		pestanas: async (req, res) => {
			// Variables
			const codigoVista = "experiencias";
			const {urlTema, urlPestana} = req.params;

			// Sección
			const seccionActual = secciones.find((n) => n.codigo == "experiencias");
			const tituloPagina = seccionActual.nombre;

			// Tema
			const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
			const temaActual = temasSeccion.find((n) => n.url == urlTema);

			// Pestaña
			const pestanasTema = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
			const pestanaActual = pestanasTema.find((n) => n.url == urlPestana);

			// Obtiene el encabezado, contenido y imgsCarrousel del artículo
			const {encabezados, contenidos} = await procesos.contenidos({seccionActual, temaActual, pestanaActual});

			// Variables para la vista
			const {archVista} = procesos.varsVista({seccionActual, temaActual});

			// Fin
			return res.render("CMP-0Estructura", {
				...{tituloPagina, temaVista, codigoVista, archVista},
				...{temasSeccion, pestanasTema},
				...{seccionActual, temaActual, pestanaActual},
				...{encabezados, contenidos},
			});
		},
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
		const {encabezados, contenidos} = await procesos.contenidos({seccionActual, temaActual});

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
		const {encabezados, contenidos} = await procesos.contenidos({seccionActual, temaActual, pestanaActual});

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
