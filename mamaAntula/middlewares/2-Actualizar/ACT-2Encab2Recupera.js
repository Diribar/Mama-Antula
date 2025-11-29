"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id} = req.body;
	const {usuario} = req.session;

	// No existe el encab_id
	if (!encab_id) return res.json({error: "Necesitamos un valor para el encabezado"});

	// No existe el encabezado
	const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
	req.encabezado = encabezado;
	if (!encabezado) return res.json({error: "No tenemos ese encabezado"});

	// No está en el status rechazado
	const {statusRegistro_id} = encabezado;
	if (statusRegistro_id != rechazado_id) return res.json({error: "El encabezado no está rechazado"});

	// No tiene permiso para recuperar
	if (!usuario.rol.revision) return res.json({error: "No tenés permiso para recuperar este encabezado"});

	// Fin
	return next();
};
