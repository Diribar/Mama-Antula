export default (req, res, next) => {
	if (!req.session.usuario || !req.session.usuario.rol.actualizac) return res.redirect("/");

	return next();
};
