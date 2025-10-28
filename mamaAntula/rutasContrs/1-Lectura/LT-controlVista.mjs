"use strict";
import procesos from "./LT-procesos.mjs";
const temaVista = "secciones";

export default {
	landingPage: (req, res) => {},
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
		const {encabArtics, encabCartas} = await procesos.encabezados({seccionActual, temasSeccion});
		const contenidos = await procesos.contenido({encabArtics, encabCartas});
		const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion},
			...{seccionActual, temaActual},
			// ...{encabArtics, encabCartas, contenidos, carrouseles},
		});
	},
	pestanas: async (req, res) => {
		// Variables
		const {urlSeccion, urlTema, urlPestana} = req.params;
		console.log(38, req.params);

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Pestaña
		const pestanasTema = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
		const pestanaActual = pestanasTema.find((n) => n.url == urlPestana);

		// Guarda cookies
		res.cookie(seccionActual.codigo, temaActual.codigo, {maxAge: unAno});
		res.cookie(temaActual.codigo, pestanaActual.codigo, {maxAge: unAno});

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		// const {encabArtics, encabCartas} = await procesos.encabezados({seccionActual, temasSeccion});
		// const contenidos = await procesos.contenido({encabArtics, encabCartas});
		// const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			// ...{encabArtics, encabCartas, contenidos, carrouseles},
		});
	},
};
