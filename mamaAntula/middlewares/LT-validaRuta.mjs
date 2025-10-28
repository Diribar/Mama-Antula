export default (req, res, next) => {
	// Variables
	const {urlSeccion, urlTema, urlPestana} = req.params;

	const informacion = {mensajes: ["No tenemos esa dirección en nuestro sistema"]};

	// Si el urlSeccion no existe, redirige
	if (!urlSeccion) {
	}

	// Si la seccionActual no corresponde, muestra la vista de error
	const seccionActual = secciones.find((n) => n.url == urlSeccion);
	if (!seccionActual) return res.render("CMP-0Estructura", {informacion});

	// Si el urlTema no existe redirige
	if (!urlTema) {
	}

	// Si el temaActual no corresponde, muestra la vista de error
	const temaActual = temasSecciones.find((n) => n.url == urlTema);
	if (!temaActual || temaActual.seccion_id != seccionActual.id) return res.render("CMP-0Estructura", {informacion});

	// Averigua si el tema tiene pestañas
	const pestanasPosibles = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
	if (pestanasPosibles.length) {
		// Si el urlPestana no existe redirige
		if (!urlPestana) {
		}

		// Si la pestanaActual no corresponde, muestra la vista de error
		const pestanaActual = pestanasTemas.find((n) => n.url == urlTema);
		if (!pestanaActual || pestanaActual.tema_id != temaActual.id) return res.render("CMP-0Estructura", {informacion});
	}

	// Fin
	return next();
};
