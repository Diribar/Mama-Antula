"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {tema_id} = req.body;

	// Valida encabezado de cartas
	if (tema_id == temaCarta_id) {
		// Variables
		const {numero, nombreDesde_id, nombreHacia_id, lugar_id, idioma_id, fechaEvento} = req.body;

		// Valida cada variable - numero
		(!numero && mensajes.push("El campo <em>Número</em> es obligatorio")) ||
			((numero < 1 || numero > 108) && mensajes.push("El campo <em>Número</em> está fuera de rango"));

		// Valida cada variable - nombreDesde_id
		(!nombreDesde_id && mensajes.push("El campo <em>Remitente</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreDesde_id) && mensajes.push("El remitente no existe"));

		// Valida cada variable - nombreHacia_id
		(!nombreHacia_id && mensajes.push("El campo <em>Destinatario</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreHacia_id) && mensajes.push("El destinatario no existe"));

		validaLugarFecha(lugar_id, fechaEvento);

		// Valida cada variable - idioma_id
		(!idioma_id && mensajes.push("El campo <em>Idioma</em> es obligatorio")) ||
			(!idiomas.find((n) => n.id == idioma_id) && mensajes.push("El idioma no existe"));

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}
	// Valida encabezado con índices
	else if (tema_id && temasSecciones.find((n) => n.id == tema_id && n.indices.length)) {
		// Variables
		const {titulo, lugar_id, fechaEvento} = req.body;

		// Valida cada variable - titulo
		!titulo && mensajes.push("El campo <em>Título</em> es obligatorio");

		// Valida lugar y fechas
		validaLugarFecha(lugar_id, fechaEvento);

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}
	// Valida encabezado de los demás
	else {
		// Variables
		const {titulo, pestana_id} = req.body;

		// Valida cada variable - tema_id y pestana_id
		(!tema_id && !pestana_id && mensajes.push("Tenés que elegir un tema o una pestaña")) ||
			(tema_id && !temasSecciones.find((n) => n.id == tema_id) && mensajes.push("El tema no existe")) ||
			(pestana_id && !pestanasTemas.find((n) => n.id == pestana_id) && mensajes.push("La pestaña no existe"));

		// Valida cada variable - titulo
		pestana_id && !titulo && mensajes.push("El campo <em>Título</em> es obligatorio");

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}

	// Fin
	return next();
};

// Variables
const mensajes = [];

// Funciones
const preparaLaRespuesta = (mensajes) => {
	// Variables
	let error;

	// Un sólo mensaje
	if (mensajes.length == 1) error = mensajes[0];

	// Más de un mensaje
	if (mensajes.length > 1) {
		const ulMensajes = mensajes.map((n) => "<li>" + n + "</li>");
		error = "Necesitamos que soluciones lo siguiente:<ul>" + ulMensajes.join("") + "</ul>";
	}

	// Fin
	return error;
};
const validaLugarFecha = (lugar_id, fechaEvento, tema_id) => {
	// Variables
	const indicesTema = tema_id && indicesFecha.filter((n) => n.tema_id == tema_id).map();
	let fechaMin, fechaMax;

	// Busca el rango de fechas
	if (indicesTema && indicesTema.length) {
		fechaMin = indicesTema.sort((a, b) => (a.fechaDesde < b.fechaDesde ? -1 : 1))[0].fechaDesde;
		fechaMax = indicesTema.sort((a, b) => (b.fechaDesde < a.fechaDesde ? -1 : 1))[0].fechaDesde;
	}

	// Valida cada variable - lugar_id
	(!lugar_id && mensajes.push("El campo <em>Lugar</em> es obligatorio")) ||
		(!lugares.find((n) => n.id == lugar_id) && mensajes.push("El lugar no existe"));

	// Valida cada variable - fechaEvento
	(!fechaEvento && mensajes.push("El campo <em>Fecha</em> es obligatorio")) ||
		((fechaEvento < fechaMin || fechaEvento > fechaMax) && mensajes.push("La fecha está fuera de rango"));

	// Fin
	return;
};
