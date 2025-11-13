"use strict";

export default (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;
	const {usuario} = req.session;

	// Si no hay usuario, interrumpe la función
	if (!usuario) return next();

	// PESTAÑA - Si está capturado por el usuario, lo libera
	const libera = {capturadoPor_id: null, capturadoEn: null};
	if (pestana_id)
		baseDatos.obtienePorId("pestanasTemas", pestana_id).then((n) => {
			if (n.capturadoPor_id == usuario.id) baseDatos.actualizaPorId("pestanasTemas", pestana_id, libera);
		});
	// TEMA - Si está capturado por el usuario, lo libera
	else if (tema_id) {
		baseDatos.obtienePorId("temasSecciones", tema_id).then((n) => {
			if (n.capturadoPor_id == usuario.id) baseDatos.actualizaPorId("temasSecciones", tema_id, libera);
		});
	}

	// Fin
	return next();
};
