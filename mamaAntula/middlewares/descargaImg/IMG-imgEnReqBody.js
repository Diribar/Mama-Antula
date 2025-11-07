"use strict";

export default (req, res, next) => {
	// Le agrega el nombre de la/s imagenes a req.body
	if (req.file) req.body.imagen = comp.gestionArchs.nombreArchDesc(req.file);
	if (req.files) {
		req.body.imagenes = [];
		for (const file of req.files) req.body.imagenes.push(comp.gestionArchs.nombreArchDesc(file));
	}

	// Fin
	return next();
};
