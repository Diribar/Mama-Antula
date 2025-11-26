export default (req, res, next) => {
	const {usuario} = req.session;
	if (!usuario || !usuario.rol.actualizac) return res.redirect("/");

	return next();
};
