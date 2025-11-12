export default (req, res, next) => {
	if (!req.session.usuario || !req.session.usuario.rol.edicion) return res.redirect("/");

	return next();
};
