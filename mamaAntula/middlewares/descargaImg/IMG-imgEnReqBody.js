"use strict";

export default (req, res, next) => {
	// Variables
	if (req.file) req.body.imagen = comp.gestionArchs.nombreArchDesc(req.file);

	// Fin
	return next();
};
