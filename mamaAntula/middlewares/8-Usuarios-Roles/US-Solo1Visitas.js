"use strict";

export default (req, res, next) => {
	if (req.session.usuario) return res.redirect("/usuarios" + rutasUsuario.edicion);

	return next();
};
