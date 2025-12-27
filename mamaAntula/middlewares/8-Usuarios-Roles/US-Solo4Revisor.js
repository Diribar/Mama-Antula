"use strict";

export default (req, res, next) => {
	const {usuario} = req.session;
	if (!usuario || !usuario.rol.revision) return res.redirect("/");

	return next();
};
