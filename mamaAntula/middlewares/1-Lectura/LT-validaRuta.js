"use strict";

export default (req, res, next) => {
	// Variables
	const {urlSeccion, urlTema, urlPestana} = req.params;
	const {id: encab_id} = req.query;
	const informacion = {mensajes: ["No tenemos esa dirección en nuestro sistema"]};
	const {usuario} = req.session;

	// SECCION - Si la seccionActual no corresponde, muestra la vista de error
	const seccionActual = secciones.find((n) => n.url == (urlSeccion || LP_urlSeccion)); // si no existe urlSeccion, se usa la de la landing page
	if (!seccionActual) return res.render("CMP-0Estructura", {informacion});

	// TEMA - Si existe la urlSeccion y no el urlTema, redirige
	const temasPosibles = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
	if (urlSeccion && !urlTema) {
		const urlActual = (temasPosibles.find((n) => n.codigo == req.cookies[seccionActual.codigo]) || temasPosibles[0]).url;
		return res.redirect("/" + seccionActual.url + "/" + urlActual);
	}

	// TEMA - Si el temaActual no corresponde, muestra la vista de error
	const temaActual = temasPosibles.find((n) => n.url == (urlTema || LP_urlTema)); // si no existe urlTema, se usa el de la landing page
	if (!temaActual) return res.render("CMP-0Estructura", {informacion});

	// TEMA - Guarda cookies
	res.cookie(seccionActual.codigo, temaActual.codigo, {maxAge: unDia, path: "/"});

	// PESTAÑA - Averigua si el tema tiene pestañas
	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
	let pestanaActual;
	if (pestsPosibles.length) {
		// Si el urlPestana no existe redirige
		if (!urlPestana) {
			const urlActual = (pestsPosibles.find((n) => n.codigo == req.cookies[temaActual.codigo]) || pestsPosibles[0]).url;
			return res.redirect("/" + seccionActual.url + "/" + temaActual.url + "/" + urlActual);
		}

		// Si la pestanaActual no corresponde, muestra la vista de error
		pestanaActual = pestsPosibles.find((n) => n.url == urlPestana);
		if (!pestanaActual) return res.render("CMP-0Estructura", {informacion});

		// Guarda cookies
		res.cookie(temaActual.codigo, pestanaActual.codigo, {maxAge: unDia, path: "/"});
	} else if (urlPestana) return res.render("CMP-0Estructura", {informacion});

	// ACTUALIZA - Guarda cookies para interactuar con actualización
	if (usuario) {
		res.cookie("actualizaSeccion_id", seccionActual.id, {maxAge: unDia, path: "/"});
		res.cookie("actualizaTema_id", temaActual.id, {maxAge: unDia, path: "/"});
		if (pestsPosibles.length) res.cookie("actualizaPestana_id", pestanaActual.id, {maxAge: unDia, path: "/"});
		else res.clearCookie("actualizaPestana_id");
		if (encab_id) res.cookie("actualizaEncabezado_id", encab_id, {maxAge: unDia, path: "/"});
	}

	// Fin
	return next();
};
