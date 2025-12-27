"use strict";

export default async (req, res, next) => {
	// Variables
	const {encab_id} = req.body;

	// Valida el encab_id
	if (!encab_id) return res.json({error: "El encabezado no está identificado, no lo podemos eliminar"});

	// Averigua si existe el encabezado
	const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
	if (!encabezado) return res.json({error: "No tenemos ese encabezado"});

	// Fin
	return next();
};
