export default async (req, res, next) => {
	// Variables
	const url = req.originalUrl;

	// Título de la página
	const seccion = secciones.find((n) => n.link == url);
	if (seccion) res.locals.titulo = seccion.nombre;

	// Fin
	return next();
};
