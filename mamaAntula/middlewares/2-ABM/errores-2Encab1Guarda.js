"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	return res.json({error: "Hay un error"});

	// Fin
	return next();
};
