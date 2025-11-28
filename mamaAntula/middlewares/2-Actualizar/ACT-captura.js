"use strict";

export default async (req, res, next) => {
	// Variables
	const {actTema_id: tema_id, actPestana_id: pestana_id} = req.cookies;
	const {id: capturadoPor_id} = req.session.usuario;

	// Actualiza la captura
	comp.captura({tema_id, pestana_id, capturadoPor_id})

	// Fin
	return next();
};
