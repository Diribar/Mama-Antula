"use strict";

export default (req, res, next) => {
	// Si no existe query, saltea la función
	console.log(5);
	if (!Object.keys(req.query).length) return next();
	console.log(8);

	// Variables
	const {actSeccion_id, actTema_id, actPestana_id, actEncabezado_id} = req.query;

	// Guarda cookies para interactuar con actualización
	if (actSeccion_id) res.cookie("actSeccion_id", actSeccion_id, {maxAge: unDia, path: "/"});
	if (actTema_id) res.cookie("actTema_id", actTema_id, {maxAge: unDia, path: "/"});
	if (actPestana_id) res.cookie("actPestana_id", actPestana_id, {maxAge: unDia, path: "/"});
	else res.clearCookie("actPestana_id");
	if (actEncabezado_id) res.cookie("actEncabezado_id", actEncabezado_id, {maxAge: unDia, path: "/"});
	else res.clearCookie("actEncabezado_id");

	// Fin
	// return next();
	return res.redirect(req.originalUrl.split("?")[0]);
};
