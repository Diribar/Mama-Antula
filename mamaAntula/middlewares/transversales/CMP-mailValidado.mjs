"use strict"; // Obtiene 'usuario' y 'cliente'

export default async (req, res, next) => {
	// Variables
	const {usuario} = req.session;
	let redireccionEdicionUsuario;

	// Si el usuario está en status mailValidado, debe pasar al status conApodo
	if (usuario && usuario.statusRegistro_id == mailValidado_id && !req.originalUrl.startsWith("/usuarios/edicionUsuario"))
		return res.redirect("/usuarios/edicionUsuario");

	// Fin
	return next();
};
