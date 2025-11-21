"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id, layoutCodigo} = req.body;
	const {texto, imagen, imagen2, video, titulo, autor, anoLanzam, editorial} = req.body;
	const mensajes = [];
	console.log(9,layoutCodigo);


	// GENERAL - encab_id
	if (!encab_id) mensajes.push("Necesitamos un valor para el encabezado");
	else {
		const encabezado = await baseDatos.obtienePorId("encabezados", encab_id);
		if (!encabezado) mensajes.push("No tenemos ese encabezado");
	}

	// General - layoutCodigo
	if (!layoutCodigo) mensajes.push("Necesitamos un valor para el layout");
	else if (!contLayouts.find((n) => n.codigo == layoutCodigo)) mensajes.push("No tenemos ese layout");

	// Texto + Imagen
	if (layoutCodigo == "textoImagen" && !texto && !imagen) mensajes.push("Necesitamos un texto y/o una imagen");
	// Texto
	else if (layoutCodigo == "texto" && !texto) mensajes.push("Necesitamos un texto");
	// Video
	else if (layoutCodigo == "video" && !video) mensajes.push("Necesitamos un link de video de Youtube");
	// Libro
	else if (layoutCodigo == "libro") {
		if (!titulo || !autor || !anoLanzam || !editorial) mensajes.push("Necesitamos un libro con todos los datos");
		if (titulo && titulo.length > 100) mensajes.push("El campo <em>Título</em> debe tener hasta 100 caracteres");
		if (autor && autor.length > 30) mensajes.push("El campo <em>Autor</em> debe tener hasta 30 caracteres");
		if (editorial && editorial.length > 50) mensajes.push("El campo <em>Editorial</em> debe tener hasta 50 caracteres");
	}

	// Estampa
	else if (layoutCodigo == "estampa" && (!imagen || !imagen2)) mensajes.push("Necesitamos los 2 archivos de imagen");

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
