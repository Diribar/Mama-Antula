"use strict";

export default async (req, res, next) => {
	// Variables
	const {encab_id, aprueba, rechaza} = req.body;

	// Validaciones iniciales
	if (!encab_id) return res.json({error: "El encabezado no está identificado, no lo podemos procesar"});
	if (!aprueba && !rechaza) return res.json({error: "Necesitamos que apruebes o rechaces el encabezado"});

	// Averigua si existe el encabezado
	const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
	if (!encabezado) return res.json({error: "No tenemos ese encabezado"});
	req.encabezado = encabezado;

	// Averigua si el usuario tiene permiso
	if (encabezado.statusRegistro_id == aprobado_id) return res.json({error: "El encabezado ya estaba aprobado"});

	// Fin
	return next();
};
