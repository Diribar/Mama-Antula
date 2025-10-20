"use strict";
import procesos from "./SL-procesos.mjs";

export default {
	secciones: async (req, res) => {
		// Obtiene la sección
		const url = req.originalUrl;
		const seccionActual = secciones.find((n) => n.link == url);
		const titulo = seccionActual.nombre;

		// Obtiene variables de temas y pestañas
		const temasSeccion = temas.filter((n) => n.seccion_id == seccionActual.id);
		for (const tema of temasSeccion) tema.pestanas = pestanas.filter((n) => n.tema_id == tema.id);
		const {temaActual, pestanaActual} = procesos.temaPestanaActual({seccionActual, temasSeccion, req, res});

		// Obtiene el encabezado, contenido y carrouseles de los artículos y cartas
		const {encabArtics, encabCartas} = await procesos.encabezados({seccionActual, temasSeccion});
		const contenidos = await procesos.contenido({encabArtics, encabCartas});
		const carrouseles = await procesos.carrouseles(contenidos);

		// Fin
		console.log(22, req.cookies);

		return res.render("CMP-0Estructura", {
			titulo,
			...{seccionActual, temaActual, pestanaActual},
			...{temasSeccion, encabArtics, encabCartas, contenidos, carrouseles},
		});
	},
};
