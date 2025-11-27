"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id} = req.body;

	// Valida
	if (!encab_id) return res.json({error: "El encabezado no está identificado, no lo podemos eliminar"});

	// Fin
	return next();
};
