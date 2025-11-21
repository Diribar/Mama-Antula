"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id, layoutCodigo} = req.body;
	const {texto, imagen, imagen2, imagens, video, titulo, autor, anoLanzam, editorial} = req.body;
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
	else if (layoutCodigo == "texto" && !texto) mensajes.push("Necesitamos un texto");
	else if (layoutCodigo == "carrusel" && (!imagens || imagens.length < 2)) mensajes.push("Necesitamos al menos dos imágenes");
	else if (layoutCodigo == "video" && !video) mensajes.push("Necesitamos un link de video de Youtube");
	else if (layoutCodigo == "libro") {
		if (!titulo || !autor || !anoLanzam || !editorial) mensajes.push("Necesitamos un libro con todos los datos");
		if (titulo && titulo.length > 100) mensajes.push("El campo <em>Título</em> debe tener hasta 100 caracteres");
		if (autor && autor.length > 30) mensajes.push("El campo <em>Autor</em> debe tener hasta 30 caracteres");
		if (editorial && editorial.length > 50) mensajes.push("El campo <em>Editorial</em> debe tener hasta 50 caracteres");
	} else if (layoutCodigo == "estampa") {
		if (!imagen || !imagen2) mensajes.push("Necesitamos los 2 archivos de imagen");
		if (titulo && titulo.length > 100) mensajes.push("El campo <em>Título</em> debe tener hasta 100 caracteres");
	}

	// Fin
	const error = preparaLaRespuesta(mensajes);
	if (error) return res.json({error});
	else return res.json({});
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
