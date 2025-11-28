"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id, edicion_id, campo, opcOriginal, opcEdicion} = req.body;

	// Validaciones iniciales
	if (!encab_id) return res.json({error: "El encabezado del artículo no está identificado, no lo podemos procesar"});
	if (!edicion_id) return res.json({error: "La edición no está identificada, no la podemos procesar"});

	// Averigua si existe el encabezado
	const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
	if (!encabezado) return res.json({error: "No tenemos ese encabezado"});
	req.encabezado = encabezado;

	// Averigua si existe la edición
	const edicion = await baseDatos.obtienePorId("encabEdics", edicion_id);
	if (!edicion) return res.json({error: "No tenemos esa edicion"});
	req.edicion = edicion;

	// Averigua si está identificado el campo
	if (!campo) return res.json({error: "El campo no está identificado"});

	// Averigua si se eligió alguna de las opciones
	if (!opcOriginal && !opcEdicion) return res.json({error: "Necesitamos que elijas una opción"});

	// Averigua si el usuario tiene permiso
	if (encabezado.statusRegistro_id != aprobado_id) return res.json({error: "El encabezado no está en status aprobado"});

	// Fin
	return next();
};
