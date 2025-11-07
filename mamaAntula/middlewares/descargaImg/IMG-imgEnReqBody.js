"use strict";

export default (req, res, next) => {
	// Le agrega el nombre de la/s imagenes a req.body
	if (req.file) req.body.imagen = comp.gestionArchs.nombreArchDesc(req.file);
	if (req.files) {
		// Variables
		req.body.imagenes = [];
		const contador = Date.now();
		req.files.forEach((file, i) => {
			const nombre = contador + i;
			req.body.imagenes.push(nombre + path.extname(file.originalname));
		});
	}

	// Fin
	return next();
};
