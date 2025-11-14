"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {id} = req.body;

	// Valida
	if (!id) return res.json({error: "El encabezado no está identificado, no lo podemos eliminar"});

	// Fin
	return next();
};
