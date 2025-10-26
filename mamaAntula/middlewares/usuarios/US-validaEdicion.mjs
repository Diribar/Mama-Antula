"use strict";
import valida from "../../rutasContrs/8-Usuarios/US-FN-valida.mjs";

export default (req, res, next) => {
	const errores = valida.edicion(req.body);
	if (errores.hay) return res.json(errores); // previene la descarga del archivo vía multer, si hay errores que se pueden detectar antes

	return next();
};
