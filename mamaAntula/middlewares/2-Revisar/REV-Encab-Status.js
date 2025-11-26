"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	console.log(6, req.body);
	return res.json({error: "El encabezado no está identificado, no lo podemos procesar"});

	// Fin
	return next();
};
