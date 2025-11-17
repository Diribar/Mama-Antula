export default (req, res, next) => {
	if (!req.session.usuario || !req.session.usuario.rol.cambioRol) return res.redirect("/usuarios" + rutasUsuario.altaOlvido);

	return next();
};
