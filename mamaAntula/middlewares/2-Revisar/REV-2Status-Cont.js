"use strict";

export default async (req, res, next) => {
	// Variables
	const {contenido_id, aprueba, rechaza} = req.body;

	// Validaciones iniciales
	if (!contenido_id) return res.json({error: "El contenido no está identificado, no lo podemos procesar"});
	if (!aprueba && !rechaza) return res.json({error: "Necesitamos que apruebes o rechaces el contenido"});

	// Averigua si existe el contenido
	const contenido = await baseDatos.obtienePorId("contenidos", contenido_id);
	if (!contenido) return res.json({error: "No tenemos ese contenido"});
	req.contenido = contenido;

	// Fin
	return next();
};
