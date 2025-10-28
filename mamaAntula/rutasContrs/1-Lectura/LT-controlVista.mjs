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

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		// const {encSinIndice, encConIndice} = await procesos.encabezados({seccionActual, temasSeccion});
		// const contenidos = await procesos.contenido({encSinIndice, encConIndice});
		// const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			// ...{encSinIndice, encConIndice, contenidos, carrouseles},
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

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		// const {encSinIndice, encConIndice} = await procesos.encabezados({seccionActual, temasSeccion});
		// const contenidos = await procesos.contenido({encSinIndice, encConIndice});
		// const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			// ...{encSinIndice, encConIndice, contenidos, carrouseles},
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

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		// const {encSinIndice, encConIndice} = await procesos.encabezados({seccionActual, temasSeccion});
		// const contenidos = await procesos.contenido({encSinIndice, encConIndice});
		// const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			// ...{encSinIndice, encConIndice, contenidos, carrouseles},
		});
	},
};
