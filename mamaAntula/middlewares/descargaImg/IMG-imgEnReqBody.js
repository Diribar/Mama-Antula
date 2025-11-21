"use strict";

export default (req, res, next) => {
	// Le agrega el nombre de la/s imagenes a req.body
	if (req.file || req.files.length == 1) req.body.imagen = Date.now() + path.extname((req.file || req.files[0]).originalname);
	else if (req.files) {
		// Variables
		const contador = Date.now();

		// Le cambia el nombre a la/s imagenes
		req.files.forEach((file, i) => {
			const nombre = contador + i;
			req.body.imagens[i] = nombre + path.extname(file.originalname);
		});
	}

	// Fin
	return next();
};
