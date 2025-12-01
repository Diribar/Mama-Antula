"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {tema_id, pestana_id, encab_id} = req.body;
	const {usuario} = req.session;

	// GENERAL - tema_id y pestana_id
	if (!tema_id && !pestana_id) return res.json({error: "Tenés que elegir un tema o una pestaña"});
	if (tema_id && !temasSecciones.find((n) => n.id == tema_id)) return res.json({error: "El tema no existe"});
	if (pestana_id && !pestanasTemas.find((n) => n.id == pestana_id)) return res.json({error: "La pestaña no existe"});

	// GENERAL - encab_id
	if (!encab_id) return res.json({error: "Necesitamos un valor para el encabezado"});
	if (encab_id != "nuevo") {
		// Obtiene el encabezado
		const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
		req.encabezado = encabezado;

		// El encabezado no existe
		if (!encabezado) return res.json({error: "No tenemos ese encabezado"});

		// Sin permiso de edición
		const {statusRegistro_id, creadoPor_id} = encabezado;
		if (
			(statusRegistro_id == creado_id && creadoPor_id != usuario.id) ||
			statusRegistro_id == rechazar_id ||
			(statusRegistro_id == rechazado_id && !usuario.rol.revision)
		)
			return res.json({error: "No tenés permiso para actualizar este encabezado"});

		// Averigua si hubieron novedades
		let novedad = false;
		for (const prop in req.body) if (encabezado[prop] && req.body[prop] && encabezado[prop] != req.body[prop]) novedad = true;
		req.novedad = novedad;

		// Sin cambios
		if (!novedad) {
			// Variables
			const mensajeSinCambios = {error: "No hay cambios que guardar"};

			// En status creado
			if (encabezado.statusRegistro_id == creado_id) return res.json(mensajeSinCambios);
		}

		// En status aprobado
		if (encabezado.statusRegistro_id == aprobado_id) {
			const condicion = {encab_id, editadoPor_id: req.session.usuario.id};
			const edicion = await baseDatos.obtienePorCondicion("encabEdics", condicion);
			req.edicion = edicion;
			if (!edicion && !novedad) return res.json(mensajeSinCambios);
		}
	}

	// Validaciones
	if (false) {
	}
	// CARTAS
	else if (tema_id == temaCarta_id) {
		// Variables
		const {numero, nombreDesde_id, nombreHacia_id, lugar_id, idioma_id, fechaEvento} = req.body;

		// numero
		if (!numero) mensajes.push("El campo <em>Número</em> es obligatorio");
		else {
			const num = Number(numero);
			if (isNaN(num)) mensajes.push("El campo <em>Número</em> debe ser un número");
			else if (numero < 1 || numero > 108) mensajes.push("El campo <em>Número</em> está fuera de rango");
			else if (await baseDatos.obtienePorCondicion("encabezados", {id: {[Op.ne]: encab_id}, numero: num}))
				mensajes.push("Ya tenemos una carta con ese número");
		}

		// nombreDesde_id
		(!nombreDesde_id && mensajes.push("El campo <em>Remitente</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreDesde_id) && mensajes.push("El remitente no existe"));

		// nombreHacia_id
		(!nombreHacia_id && mensajes.push("El campo <em>Destinatario</em> es obligatorio")) ||
			(!personajes.find((n) => n.id == nombreHacia_id) && mensajes.push("El destinatario no existe"));

		// nombreDesde_id y nombreHacia_id
		if (nombreDesde_id && nombreDesde_id == nombreHacia_id)
			mensajes.push("El remitente y el destinatario deben ser distintos");

		// idioma_id
		(!idioma_id && mensajes.push("El campo <em>Idioma</em> es obligatorio")) ||
			(!idiomas.find((n) => n.id == idioma_id) && mensajes.push("El idioma no existe"));

		validaLugarFecha(lugar_id, fechaEvento);

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}
	// LUGARES
	else if (tema_id == temaLugares_id) {
		// Variables
		const {titulo, lugarIndice_id} = req.body;

		// titulo
		validaTitulo(titulo);

		// Valida el códigoLugar
		(!lugarIndice_id && mensajes.push("El campo <em>Lugar geográfico</em> es obligatorio")) ||
			(!indicesLugar.find((n) => n.id == lugarIndice_id) && mensajes.push("El lugar geográfico no existe"));

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}
	// ENCABEZADOS CON ÍNDICES
	else if (tema_id && temasSecciones.find((n) => n.id == tema_id && n.indicesFecha.length)) {
		// Variables
		const {titulo, lugar_id, fechaEvento} = req.body;

		// Valida cada variable - titulo
		validaTitulo(titulo);

		// Valida lugar y fechas
		validaLugarFecha(lugar_id, fechaEvento);

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}
	// ENCABEZADOS SIN ÍNDICES
	else {
		// Valida titulo
		const {titulo} = req.body;
		pestana_id && validaTitulo(titulo);

		// Fin
		const error = preparaLaRespuesta(mensajes);
		if (error) return res.json({error});
	}

	// Fin
	return next();
};

// Variables
let mensajes = [];

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
const validaTitulo = (titulo) => {
	if (!titulo) mensajes.push("El campo <em>Título</em> es obligatorio");
	else if (titulo.length > 100) mensajes.push("El campo <em>Título</em> debe tener menos de 100 caracteres");
	return;
};
