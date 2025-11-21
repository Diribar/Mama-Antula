"use strict";
// errores sólo para el guardado

export default async (req, res, next) => {
	// Variables
	const {encab_id, layoutCodigo} = req.body;
	const mensajes = [];

	// General - encab_id
	if (!encab_id) mensajes.push("El encabezado no se identifica");
	else if (!(await baseDatos.obtienePorId("encabezados", encab_id))) mensajes.push("El encabezado no se identifica");

	// General - layoutCodigo
	if (!layoutCodigo) mensajes.push("El layout no se identifica");
	else if (!contLayouts.find((n) => n.codigo == layoutCodigo)) mensajes.push("El layout no se identifica");

	// Texto + Imagen

	// Texto

	// Carrusel

	// Video

	// Libro

	// Estampa

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
