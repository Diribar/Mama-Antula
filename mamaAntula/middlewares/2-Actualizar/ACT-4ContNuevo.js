"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id, layoutCodigo} = req.body;
	const {texto, imagen, video, titulo, subTitulo, autor, anoLanzam, editorial} = req.body;
	const mensajes = [];

	// GENERAL - encab_id
	if (!encab_id) mensajes.push("Necesitamos un valor para el encabezado");
	else {
		const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
		if (!encabezado) mensajes.push("No tenemos ese encabezado");
	}
	// GENERAL - layoutCodigo
	if (!layoutCodigo) mensajes.push("Necesitamos un valor para el layout");
	else if (!contLayouts.find((n) => n.codigo == layoutCodigo)) mensajes.push("No tenemos ese layout");

	// POR LAYOUT
	if (layoutCodigo == "textoImagen" && !texto && !imagen) mensajes.push("Necesitamos un texto y/o una imagen");
	if (layoutCodigo == "texto" && !texto) mensajes.push("Necesitamos un texto");
	if (["carrusel", "estampa"].includes(layoutCodigo) && (!req.files || req.files.length < 2))
		mensajes.push("Necesitamos al menos dos imágenes");
	if (layoutCodigo == "video" && !video) mensajes.push("Necesitamos un link de video de Youtube");
	if (layoutCodigo == "libro") {
		if (!imagen) mensajes.push("Necesitamos una imagen");
		(!titulo && mensajes.push("Necesitamos el título del libro")) ||
			(titulo.length > 100 && mensajes.push("El campo <em>Título</em> debe tener hasta 100 caracteres"));
		subTitulo && subTitulo.length > 100 && mensajes.push("El campo <em>Subtítulo</em> debe tener hasta 100 caracteres");
		(!autor && mensajes.push("Necesitamos el dato del autor")) ||
			(autor.length > 50 && mensajes.push("El campo <em>Autor</em> debe tener hasta 50 caracteres"));
		(!anoLanzam && mensajes.push("Necesitamos el año de lanzamiento")) ||
			(anoLanzam.length > new Date().getFullYear() && mensajes.push("El año no puede ser mayor al actual"));
		(!editorial && mensajes.push("Necesitamos saber la editorial")) ||
			(editorial && editorial.length > 50 && mensajes.push("El campo <em>Editorial</em> debe tener hasta 50 caracteres"));
	}
	if (layoutCodigo == "estampa" && titulo && titulo.length > 100)
		mensajes.push("El campo <em>Título</em> debe tener hasta 100 caracteres");

	// Consolida los errores
	const error = preparaLaRespuesta(mensajes);
	if (error) return res.json({error});

	// Fin
	return next();
};

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
