"use strict"; // Obtiene 'usuario' y 'cliente'

export default async (req, res, next) => {
	// Si es una de las aplicaciones triviales, avanza
	if (comp.omitirMiddlewsTransv(req)) return next();

	// Variables
	const fechaHoy = comp.fechaHora.anoMesDia(new Date());
	let {usuario, cliente} = req.session;
	let cliente_id;

	// Si el 'cliente_id' tiene un valor y coincide en ambas variables, interrumpe la función
	if (usuario && cliente && usuario.cliente_id && usuario.cliente_id == cliente.cliente_id) {
		// Si corresponde, actualiza la fecha de última navegación
		if (usuario.fechaUltNaveg < fechaHoy || usuario.versionWeb != versionWeb) {
			await baseDatos.actualizaPorId("usuarios", usuario.id, {fechaUltNaveg: fechaHoy, versionWeb});
			req.session.usuario = {...req.session.usuario, fechaUltNaveg: fechaHoy, versionWeb};
			req.session.cliente = {...req.session.cliente, fechaUltNaveg: fechaHoy, versionWeb};
		}

		// Actualiza locals
		res.locals.usuario = req.session.usuario;

		// Avanza
		return next();
	}

	// Obtiene el usuario de su cookie 'mail'
	if (!usuario && req.cookies && req.cookies.email && req.cookies.cliente_id) {
		// Obtiene el usuario
		let email;
		({email, cliente_id} = req.cookies);
		usuario = await comp.obtieneUsuarioPorMail(email);

		// Acciones si el cliente_id de la BD y de la cookie difieren
		if (usuario.cliente_id != cliente_id) {
			usuario = null; // anula el valor del usuario
			res.clearCookie("email"); // borra esa cookie
		}
	}

	// Cliente: 1. Lo obtiene del usuario
	if (usuario && (!cliente || usuario.cliente_id != cliente.cliente_id)) {
		// Obtiene el cliente
		cliente = obtieneCamposNecesarios(usuario);

		// Si corresponde, actualiza la cookie
		({cliente_id} = cliente); // es el cliente_id del usuario
		if (!req.cookies.cliente_id || req.cookies.cliente_id != cliente_id)
			res.cookie("cliente_id", cliente_id, {maxAge: unAno, path: "/"});
	}

	// Cliente: 2. Lo obtiene de la cookie
	if (!cliente && req.cookies && req.cookies.cliente_id) {
		// Variables
		({cliente_id} = req.cookies);
		const esUsuario = cliente_id.startsWith("U");

		// Obtiene el cliente
		const tabla = esUsuario ? "usuarios" : "visitas";
		cliente = await baseDatos.obtienePorCondicion(tabla, {cliente_id}, "rol").then((n) => n && obtieneCamposNecesarios(n));
		// no se obtiene el usuario por medida de seguridad, ya que no existe la cookie del mail
	}

	// Cliente: 3. Como no existe, lo crea
	if (!cliente) {
		// Variables
		const datos = {versionWeb};

		// Crea el cliente
		cliente = await baseDatos.agregaRegistroIdCorrel("visitas", datos);

		// Crea un nuevo 'cliente_id'
		cliente_id = "V" + String(cliente.id).padStart(10, "0");

		// Actualiza o crea la cookie
		res.cookie("cliente_id", cliente_id, {maxAge: unAno, path: "/"});

		// Actualiza el 'cliente_id' en la BD
		await baseDatos.actualizaPorId("visitas", cliente.id, {cliente_id}); // es crítico el 'await'

		// Actualiza el cliente con los campos necesarios
		cliente = await baseDatos.obtienePorId("visitas", cliente.id, "rol").then((n) => obtieneCamposNecesarios(n));
	}

	// Si corresponde, actualiza la fecha de última navegación
	if (cliente.fechaUltNaveg < fechaHoy || cliente.versionWeb != versionWeb) {
		// Actualiza el cliente
		cliente = {...cliente, fechaUltNaveg: fechaHoy, versionWeb};

		// Actualiza el usuario
		if (usuario) {
			baseDatos.actualizaPorId("usuarios", usuario.id, {fechaUltNaveg: fechaHoy, versionWeb});
			usuario = {...usuario, fechaUltNaveg: fechaHoy, versionWeb};
		}
		// Actualiza la visita
		else baseDatos.actualizaPorId("visitas", cliente.id, {fechaUltNaveg: fechaHoy, versionWeb});
	}

	// Actualiza usuario y cliente
	req.session.cliente = cliente;
	if (usuario) {
		req.session.usuario = usuario;
		res.locals.usuario = usuario;
	}

	// Fin
	return next();
};

const obtieneCamposNecesarios = (usuario) => {
	// Variables
	const camposNecesarios = [
		...["id", "cliente_id"], // identificación
		"fechaUltNaveg", // para el 'contador de navegaciones'
		...["diasNaveg", "visitaCreadaEn"], // para la tabla 'persWebDiaAcum'
		...["versionWeb", "rol"], // para mostrar carteles
	];

	// Obtiene los datos para la variable cliente
	const cliente = {};
	for (const campo of camposNecesarios) cliente[campo] = usuario[campo];

	// Adecua el campo 'visitaCreadaEn'
	cliente.visitaCreadaEn = comp.fechaHora.anoMesDia(cliente.visitaCreadaEn);

	// Fin
	return cliente;
};
