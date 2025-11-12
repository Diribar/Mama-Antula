"use strict";

export default (req, res, next) => {
	// Variables
	const {actualizaSeccion_id: seccion_id, actualizaTema_id: tema_id, actualizaEncabezado_id: encabezado_id} = req.cookies;
	const {id: capturadoPor_id} = req.session.usuario;

	// Si corresponde, captura la pestaña
	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == tema_id);
	if (pestsPosibles.length) {
		// Variables
		const {actualizaPestana_id: pestana_id} = req.cookies;
		if (!pestana_id) return next();

		// Quita las capturas del usuario en las demás pestanas
		baseDatos.actualizaPorCondicion("pestanasTemas", {id: {[Op.ne]: pestana_id}, capturadoPor_id}, {capturadoPor_id: null});

		// Captura la pestana para el usuario
		baseDatos.actualizaPorCondicion("pestanasTemas", {id: pestana_id}, {capturadoPor_id});

		// Quita las capturas del usuario en todos los temas
		baseDatos.actualizaPorCondicion("temasSecciones", {capturadoPor_id}, {capturadoPor_id: null});
	}

	// Si no captura una pestana, captura el tema
	else {
		// Quita las capturas del usuario en los demás temas
		baseDatos.actualizaPorCondicion("temasSecciones", {id: {[Op.ne]: tema_id}, capturadoPor_id}, {capturadoPor_id: null});

		// Captura el tema para el usuario
		baseDatos.actualizaPorCondicion("temasSecciones", {id: tema_id}, {capturadoPor_id});

		// Quita las capturas de todas las pestanas
		baseDatos.actualizaPorCondicion("pestanasTemas", {capturadoPor_id}, {capturadoPor_id: null});
	}

	// Fin
	return next();
};
