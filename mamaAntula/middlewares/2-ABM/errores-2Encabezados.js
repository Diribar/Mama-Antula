"use strict";

export default async (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;

	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == tema_id);
	if (pestsPosibles.length) {
		if (!pestana_id) return res.json("Debés seleccionar una pestaña");
		if (!pestsPosibles.find((n) => n.id == pestana_id)) return res.json("Debés seleccionar una pestaña válida");
	}

	// Fin
	return next();
};
