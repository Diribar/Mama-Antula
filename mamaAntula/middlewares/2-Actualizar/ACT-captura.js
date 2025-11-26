"use strict";

export default async (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;
	const {id: capturadoPor_id} = req.session.usuario;
	const capturadoEn = new Date();
	const captura = {capturadoPor_id, capturadoEn};

	// PESTAÑA - Actualiza las capturas
	if (pestana_id) {
		baseDatos.eliminaPorCondicion("capturas", {capturadoPor_id, pestana_id: {[Op.ne]: pestana_id}});
		baseDatos.actualizaPorCondicion("capturas", {pestana_id}, captura); // se extiende la captura
	}

	// TEMA - Actualiza las capturas
	else {
		baseDatos.eliminaPorCondicion("capturas", {capturadoPor_id, tema_id: {[Op.ne]: tema_id}});
		baseDatos.actualizaPorCondicion("capturas", {tema_id}, captura); // se extiende la captura
	}

	// Fin
	return next();
};
