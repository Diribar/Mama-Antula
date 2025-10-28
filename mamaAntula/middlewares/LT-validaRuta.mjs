export default (req, res, next) => {
	// Variables
	const {urlSeccion, urlTema, urlPestana} = req.params;
	const informacion = {mensajes: ["No tenemos esa dirección en nuestro sistema"]};

	// SECCION - Si el urlSeccion no existe, redirige
	if (!urlSeccion) {
		const {seccionActual} = req.cookies || "inicio";
		const urlActual = secciones.find((n) => n.url == seccionActual).url;
		return res.redirect("/" + urlActual);
	}

	// SECCION - Si la seccionActual no corresponde, muestra la vista de error
	const seccionActual = secciones.find((n) => n.url == urlSeccion);
	if (!seccionActual) return res.render("CMP-0Estructura", {informacion});


	// TEMA - Si el urlTema no existe, redirige
	const temasPosibles = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
	if (!urlTema) {
		const urlActual = temasPosibles.find((n) => n.codigo === req.cookies.temaActual)?.url || temasPosibles[0].url;
		return res.redirect("/" + seccionActual.url + "/" + urlActual);
	}

	// TEMA - Si el temaActual no corresponde, muestra la vista de error
	const temaActual = temasPosibles.find((n) => n.url == urlTema);
	if (!temaActual) return res.render("CMP-0Estructura", {informacion});

	// PESTAÑA - Averigua si el tema tiene pestañas
	const pestanasPosibles = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
	if (pestanasPosibles.length) {
		// Si el urlPestana no existe redirige
		if (!urlPestana) {
			const urlActual = pestanasPosibles.find((n) => n.codigo == req.cookies.pestanaActual)?.url || pestanasPosibles[0].url;
			return res.redirect("/" + seccionActual.url + "/" + temaActual.url + "/" + urlActual);
		}

		// Si la pestanaActual no corresponde, muestra la vista de error
		const pestanaActual = pestanasPosibles.find((n) => n.url == urlPestana);
		if (!pestanaActual) return res.render("CMP-0Estructura", {informacion});
	}

	// Fin
	return next();
};
