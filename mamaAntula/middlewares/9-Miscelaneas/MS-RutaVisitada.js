"use strict";

export default (req, res, next) => {
	// Variables
	const originalUrl = req.originalUrl.slice(0, 100); // para analizar el url
	const {cliente_id} = req.session;

	// Actualiza la tabla navegacs
	baseDatos.agregaRegistroIdCorrel("navegacs", {cliente_id, originalUrl});

	// Fin
	return next();
};
