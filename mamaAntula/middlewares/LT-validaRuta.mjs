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
		const urlActual = (temasPosibles.find((n) => n.codigo == req.cookies[seccionActual.codigo]) || temasPosibles[0]).url;
		return res.redirect("/" + seccionActual.url + "/" + urlActual);
	}

	// TEMA - Si el temaActual no corresponde, muestra la vista de error
	const temaActual = temasPosibles.find((n) => n.url == urlTema);
	if (!temaActual) return res.render("CMP-0Estructura", {informacion});
	res.cookie(seccionActual.codigo, temaActual.codigo, {maxAge: unAno});

	// PESTAÑA - Averigua si el tema tiene pestañas
	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
	if (pestsPosibles.length) {
		// Si el urlPestana no existe redirige
		if (!urlPestana) {
			const urlActual = (pestsPosibles.find((n) => n.codigo == req.cookies[temaActual.codigo]) || pestsPosibles[0]).url;
			return res.redirect("/" + seccionActual.url + "/" + temaActual.url + "/" + urlActual);
		}

		// Si la pestanaActual no corresponde, muestra la vista de error
		const pestanaActual = pestsPosibles.find((n) => n.url == urlPestana);
		if (!pestanaActual) return res.render("CMP-0Estructura", {informacion});

		// Guarda cookies
		res.cookie(temaActual.codigo, pestanaActual.codigo, {maxAge: unAno});
	}

	// Fin
	return next();
};
