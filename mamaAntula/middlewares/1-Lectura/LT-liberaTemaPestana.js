"use strict";

export default (req, res, next) => {
	// Variables
	const {usuario} = req.session;
	if (!usuario) return next();

	// Elimina la captura del usuario
	const {tema_id, pestana_id} = res.locals;
	const campo = tema_id ? "tema_id" : "pestana_id";
	const campo_id = tema_id || pestana_id;
	baseDatos.eliminaPorCondicion("capturas", {[campo]: campo_id, capturadoPor_id: usuario.id});

	// Fin
	return next();
};
