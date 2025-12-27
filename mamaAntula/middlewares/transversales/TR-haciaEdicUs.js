"use strict"; // Obtiene 'usuario' y 'cliente'

export default async (req, res, next) => {
	// Si es una de las aplicaciones triviales, avanza
	if (comp.omitirMiddlewsTransv(req)) return next();

	// Variables
	const {usuario} = req.session;

	// Si el usuario está en status mailValidado, debe pasar al status 'conApodo'
	if (
		usuario &&
		usuario.statusRegistro_id == mailValidado_id &&
		!req.originalUrl.startsWith("/usuarios" + rutasUsuario.edicion)
	)
		return res.redirect("/usuarios" + rutasUsuario.edicion);

	// Fin
	return next();
};
