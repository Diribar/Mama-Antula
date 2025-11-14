"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {id} = req.body;
	const {usuario} = req.session;

	// Validaciones
	if (!id) return res.json({error: "El contenido no está identificado, no lo podemos gestionar"});
	if (!usuario) return res.json({error: "Necesitamos que estés logueado para gestionar los contenidos"});

	// Fin
	return next();
};
