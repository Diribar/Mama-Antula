export default async (req, res, next) => {
	// Variables
	const url = req.originalUrl;

	// Título de la página
	const seccion = Object.keys(secciones).find((n) => secciones[n].link == url);
	if (seccion) res.locals.titulo = seccion;

	// Fin
	return next();
};
