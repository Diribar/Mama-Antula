"use strict";

export default (req, res, next) => {
	// Variables
	const {actTema_id: tema_id, actPestana_id: pestana_id} = req.cookies;
	const {usuario} = req.session;

	// Elimina la captura del usuario
	const campo = tema_id ? "tema_id" : "pestana_id";
	const campo_id = tema_id || pestana_id;
	if (usuario) baseDatos.eliminaPorCondicion("capturas", {[campo]: campo_id, capturadoPor_id: usuario.id});

	// Fin
	return next();
};
