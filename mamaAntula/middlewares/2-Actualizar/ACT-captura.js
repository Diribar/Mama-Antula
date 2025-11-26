"use strict";

export default async (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;
	const {id: capturadoPor_id} = req.session.usuario;
	const capturadoEn = new Date();
	const libera = {capturadoPor_id: null, capturadoEn: null};
	const captura = {capturadoPor_id, capturadoEn};

	// PESTAÑA - Actualiza las capturas
	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == tema_id);
	if (pestsPosibles.length) {
		baseDatos.actualizaPorCondicion("temasSecciones", {capturadoPor_id}, libera);
		baseDatos.actualizaPorCondicion("pestanasTemas", {capturadoPor_id, id: {[Op.ne]: pestana_id}}, libera); // se extiende la captura
		baseDatos.actualizaPorCondicion("pestanasTemas", {id: pestana_id}, captura);
	}

	// TEMA - Actualiza las capturas
	else {
		baseDatos.actualizaPorCondicion("pestanasTemas", {capturadoPor_id}, libera);
		baseDatos.actualizaPorCondicion("temasSecciones", {capturadoPor_id, id: {[Op.ne]: tema_id}}, libera); // se extiende la captura
		baseDatos.actualizaPorCondicion("temasSecciones", {id: tema_id}, captura);
	}

	// Fin
	return next();
};
