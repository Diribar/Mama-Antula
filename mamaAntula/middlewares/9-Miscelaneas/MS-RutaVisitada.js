"use strict";

export default async (req, res, next) => {
	// Variables
	const originalUrl = req.originalUrl.slice(0, 100); // para analizar el url
	const {cliente_id} = req.session.cliente;

	// Actualiza la tabla navegacs - hace falta el 'await' para que pueda ser eliminada si corresponde
	await baseDatos.agregaRegistroIdCorrel("navegacs", {cliente_id, originalUrl});

	// Fin
	return next();
};
