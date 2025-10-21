"use strict";
import procesos from "./LT-procesos.mjs";

export default {
	secciones: async (req, res) => {
		// Variables
		const temaVista = "secciones";

		// Obtiene la sección
		const url = req.originalUrl;
		const seccionActual = secciones.find((n) => n.link == url);
		const tituloPagina = seccionActual.nombre;

		// Obtiene variables de temas y pestañas
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		for (const tema of temasSeccion) tema.pestanas = pestanasTemas.filter((n) => n.tema_id == tema.id);
		const {temaActual, pestanaActual} = procesos.temaPestanaActual({seccionActual, temasSeccion, req, res});

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		const {encabArtics, encabCartas} = await procesos.encabezados({seccionActual, temasSeccion});
		const contenidos = await procesos.contenido({encabArtics, encabCartas});
		const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{seccionActual, temaActual, pestanaActual},
			...{temasSeccion, encabArtics, encabCartas, contenidos, carrouseles},
		});
	},
};
