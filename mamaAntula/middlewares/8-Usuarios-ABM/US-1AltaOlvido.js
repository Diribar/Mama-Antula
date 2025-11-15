"use strict";

export default async (req, res, next) => {
	// Variables
	const {email} = req.body;
	let errores;

	// Verifica el formato del mail
	errores = comp.formatoMail(email);
	if (errores.hay) return res.json(errores);

	// Obtiene la fecha de contraseña del usuario
	const usuario = (await baseDatos.obtienePorCondicion("usuarios", {email})) || {};
	req.body.usuario = usuario;
	const {fechaContrasena} = usuario;

	// Detecta si ya se le envió una contraseña en las últimas 24hs
	if (fechaContrasena) {
		// Variables
		const ahora = comp.fechaHora.ahora();
		const diferencia =  (ahora.getTime() - fechaContrasena.getTime()) / unaHora;
		const envioReciente = diferencia < 24;

		// Mensaje de error
		errores = envioReciente ? {email: mailYaEnviado, hay: true} : {};
		if (errores.hay) return res.json(errores);
	}

	// Fin
	return next();
};

// Variables
const mailYaEnviado =
	"Ya te enviamos un mail con la contraseña. Para evitar <em>spam</em>, esperamos 24hs antes de enviarte una nueva.";
