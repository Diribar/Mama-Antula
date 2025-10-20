export default async (req, res, next) => {
	return next();
	// Variables
	const url = req.originalUrl;

	// Título de la página
	const seccion = secciones.find((n) => n.link == url);
	if (seccion) res.locals.tituloPagina = seccion.nombre;

	// Fin
	return next();
};
