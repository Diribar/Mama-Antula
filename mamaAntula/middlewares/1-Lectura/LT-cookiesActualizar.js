"use strict";

export default (req, res, next) => {
	// Usuario
	const {usuario} = req.session;
	if (!usuario) return next();

	// Variables
	const {urlSeccion, urlTema, urlPestana} = req.params;
	const {id: encab_id} = req.query;

	// Seccion
	const seccionActual = seccionesLectura.find((n) => n.url == (urlSeccion || LP_urlSeccion)); // si no existe urlSeccion, se usa la de la landing page

	// TEMA - Si el temaActual no corresponde, muestra la vista de error
	const temasPosibles = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
	const temaActual = temasPosibles.find((n) => n.url == (urlTema || LP_urlTema1)); // si no existe urlTema, se usa el de la landing page

	// PESTAÑA - Averigua si el tema tiene pestañas
	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
	const pestanaActual = pestsPosibles.length && pestsPosibles.find((n) => n.url == urlPestana);

	// Guarda cookies para interactuar con actualización
	res.cookie("actSeccion_id", seccionActual.id, {maxAge: unDia, path: "/"});
	res.cookie("actTema_id", temaActual.id, {maxAge: unDia, path: "/"});
	if (pestanaActual) res.cookie("actPestana_id", pestanaActual.id, {maxAge: unDia, path: "/"});
	else res.clearCookie("actPestana_id");
	if (encab_id) res.cookie("actEncabezado_id", encab_id, {maxAge: unDia, path: "/"});

	// Fin
	return next();
};
