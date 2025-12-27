// Muestra carteles que se activan con el acceso al sitio (no se usa con apis)
"use strict";

export default (req, res, next) => {
	// Si corresponde, interrumpe la función
	if (req.method != "GET") return next();
	if (comp.omitirMiddlewsTransv(req)) return next();

	// Variables
	const {usuario, cliente} = req.session;
	if (cliente.versionWeb == versionWeb) return next();

	// Actualiza el cliente y el usuario
	req.session.cliente.versionWeb = versionWeb;
	if (usuario) req.session.usuario.versionWeb = versionWeb;

	// Actualiza la BD
	const {cliente_id} = cliente;
	const esUsuario = cliente_id.startsWith("U");
	const tabla = esUsuario ? "usuarios" : "visitas";
	baseDatos.actualizaPorId(tabla, cliente.id, {versionWeb});

	// Genera la información a mostrar
	const novs = novsDelSitio.filter((n) => n.version > cliente.versionWeb); // obtiene las novedades
	const titulo = "Novedad" + (novs.length > 1 ? "es" : "") + " del sitio";
	const informacion = {
		tituloPagina: titulo,
		trabajando: true,
		titulo,
		mensajes: novs.map((n) => n.comentario + "."),
		reload: true,
	};

	// Fin
	return res.render("CMP-0Estructura", {informacion});
};
