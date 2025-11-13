"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {tema_id, pestana_id} = req.body;
	const campo_id = pestana_id ? "pestana_id" : "tema_id";

	// Valida encabezado de cartas
	if (tema_id == temaCarta_id) {
		// Variables
		const {numero, nombreDesde_id, nombreHacia_id, lugar_id, idioma_id, fechaEvento} = req.body;
		const mensajes = [];

		// Valida cada variable - numero
		(!numero && mensajes.push("El campo <em>Número</em> es obligatorio")) ||
			((numero < 1 || numero > 108) && mensajes.push("El campo <em>Número</em> está fuera de rango"));

		// Valida cada variable - nombreDesde_id
		(!nombreDesde_id && mensajes.push("El campo <em>Remitente</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreDesde_id) && mensajes.push("El remitente no existe"));

		// Valida cada variable - nombreHacia_id
		(!nombreHacia_id && mensajes.push("El campo <em>Destinatario</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreHacia_id) && mensajes.push("El destinatario no existe"));

		// Valida cada variable - lugar_id
		(!lugar_id && mensajes.push("El campo <em>Lugar</em> es obligatorio")) ||
			(!lugares.find((n) => n.id == lugar_id) && mensajes.push("El lugar no existe"));

		// Valida cada variable - idioma_id
		(!idioma_id && mensajes.push("El campo <em>Idioma</em> es obligatorio")) ||
			(!idiomas.find((n) => n.id == idioma_id) && mensajes.push("El idioma no existe"));

		// Valida cada variable - fechaEvento
		(!fechaEvento && mensajes.push("El campo <em>Fecha</em> es obligatorio")) ||
			((fechaEvento < "1778-01-06" || fechaEvento > "1816-02-20") && mensajes.push("La fecha está fuera de rango"));

		// Fin
		if (mensajes.length == 1) return res.json({error: mensajes[0]});
		if (mensajes.length > 1) {
			const ulMensajes = mensajes.map((n) => "<li>" + n + "</li>");
			const error = "Necesitamos que soluciones lo siguiente:<ul>" + ulMensajes.join("") + "</ul>";
			console.log(45, error);

			return res.json({error});
		}
	}
	// Valida encabezado con índices
	else if (tema_id && temasSecciones.find((n) => n.indices.length && n.id == tema_id)) {
		console.log(req.body);

		return res.json({error: "No puedes crear encabezados con índices"});
	}
	// Valida encabezado de los demás
	else {
		return res.json({error: "No puedes crear encabezados de otros temas"});
	}

	// Fin
	return next();
};
