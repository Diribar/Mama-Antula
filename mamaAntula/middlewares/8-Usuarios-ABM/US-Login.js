"use strict";

export default async (req, res, next) => {
	// Variables
	const {email, contrasena} = req.body;
	let errores;

	// Verifica el formato del mail
	errores = comp.validacs.formatoMail(email);
	if (errores.hay) return res.json(errores);

	// Verifica la contraseña
	errores.contrasena = (!contrasena && contrasenaVacia) || comp.validacs.largoContr(contrasena) || "";
	errores.hay = !!errores.contrasena;
	if (errores.hay) return res.json(errores);

	// Obtiene el usuario
	const usuario = await comp.obtieneUsuarioPorMail(email);
	req.body.usuario = usuario;

	// Revisa las credenciales
	const email_BD = !usuario;
	const contr_BD = usuario && !bcryptjs.compareSync(datos.contrasena, usuario.contrasena);
	errores.credenciales = email_BD || contr_BD ? "Credenciales erróneas" : "";
	errores.hay = !!errores.credenciales;
	if (errores.hay) return res.json(errores);

	// Fin
	return next();
};

// Variables
const contrasenaVacia = "Necesitamos que escribas una contraseña";
