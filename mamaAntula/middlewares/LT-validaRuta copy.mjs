export default (req, res, next) => {
	// Variables
	const url = req.originalUrl;

	// Averigua si existe la sección
	const seccion = secciones.find((n) => n.link == url);
	const informacion = !seccion && {mensajes: ["No tenemos esa dirección en nuestro sistema"]};

	// Fin
	if (informacion) return res.render("CMP-0Estructura", {informacion});
	return next();
};
