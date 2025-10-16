"use strict";

export default async (req, res, next) => {
	// Si corresponde, interrumpe la función
	if (req.originalUrl.includes("/api/")) return next();

	// Acciones si no se reconoce la url
	const anterior = req.session.usuario ? req.session.urlAnterior : req.session.urlSinLogin || "/";
	const informacion = {
		mensajes: ["No tenemos esa dirección en nuestro sistema"],
		//iconos: [variables.vistaAnterior(anterior), variables.vistaConsultas],
	};

	// Fin
	return res.render("CMP-0Estructura", {informacion});
};
