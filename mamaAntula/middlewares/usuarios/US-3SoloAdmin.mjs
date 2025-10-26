export default (req, res, next) => {
	if (!req.session.usuario || !req.session.usuario.rol.admin) return res.redirect("/usuarios" + rutasUsuario.altaOlvido);

	return next();
};
