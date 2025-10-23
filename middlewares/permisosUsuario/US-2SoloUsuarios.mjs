export default (req, res, next) => {
	if (!req.session.usuario) return res.redirect("/usuarios" + rutasUsuario.altaOlvido);
	// const soloAdmin = req.session.usuario && req.session.usuario.rol.admin;

	return next();
};
