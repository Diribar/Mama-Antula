"use strict";

export default (req, res, next) => {
	const {usuario} = req.session;
	if (!usuario || !usuario.rol.cambioRol) return res.redirect("/usuarios" + rutasUsuario.altaOlvido);

	return next();
};
