"use strict";

export default async (req, res, next) => {
	// Variables
	const datos = req.body;

	// Variables
	const {campo, imagen, apodo, contrasena} = datos; // datos tiene más métodos
	const errores = {};

	// Apodo - campo obligatorio
	if (!campo || campo == "apodo")
		errores.apodo =
			(!apodo && FN.inputVacio("apodo")) ||
			comp.validacs.castellano.basico(apodo) ||
			comp.validacs.inicial.basico(apodo) ||
			comp.validacs.longitud(apodo, 2, 30) ||
			"";

	// Campos opcionales
	if (imagen) errores.imagen = comp.validacs.imagen(datos);
	if (contrasena) errores.contrasena = FN.largoContr(contrasena) || "";

	// Agrega el resumen
	errores.hay = Object.values(errores).some((n) => !!n);

	// Fin
	if (errores.hay) return res.json(errores);

	// Fin
	return next();
};
