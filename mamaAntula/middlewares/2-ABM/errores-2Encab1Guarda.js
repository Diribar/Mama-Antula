"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {tema_id, pestana_id} = req.body;
	const campo_id = pestana_id ? "pestana_id" : "tema_id";

	// Valida encabezado de cartas
	if (tema_id == temaCarta_id) {
		return res.json({error: "No puedes crear encabezados de cartas"});
	}
	// Valida encabezado con índices
	else if (tema_id && temasSecciones.find((n) => n.indices.length && n.id == tema_id)) {
		return res.json({error: "No puedes crear encabezados con índices"});
	}
	// Valida encabezado de los demás
	else {
		return res.json({error: "No puedes crear encabezados de otros temas"});
	}

	// Fin
	return next();
};
