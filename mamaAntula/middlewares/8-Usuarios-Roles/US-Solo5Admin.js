export default (req, res, next) => {
	const {usuario} = req.session;
	if (!usuario || !usuario.rol.cambioRoles) return res.redirect("/usuarios" + rutasUsuario.altaOlvido);

	return next();
};
