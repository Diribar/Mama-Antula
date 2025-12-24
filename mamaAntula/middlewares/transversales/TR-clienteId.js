"use strict"; // Obtiene 'usuario' y 'cliente'

export default async (req, res, next) => {
	// Si es una de las aplicaciones triviales, avanza
	if (comp.omitirMiddlewsTransv(req)) return next();

	// Variables
	const fechaHoy = comp.fechaHora.anoMesDia(new Date());
	let {usuario, cliente} = req.session;
	let cliente_id = cliente && cliente.cliente_id;

	// Si el 'cliente_id' tiene un valor y coincide en ambas variables, interrumpe la función
	if (usuario && cliente && usuario.cliente_id && usuario.cliente_id == cliente_id) {
		// Si corresponde, actualiza la fecha de última navegación
		if (usuario.fechaUltNaveg < fechaHoy) {
			const diasNaveg = ++cliente.diasNaveg;
			req.session.usuario = {...req.session.usuario, fechaUltNaveg: fechaHoy, diasNaveg};
			req.session.cliente = {...req.session.cliente, fechaUltNaveg: fechaHoy, diasNaveg};
			await baseDatos.actualizaPorId("usuarios", usuario.id, {fechaUltNaveg: fechaHoy, diasNaveg});
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

	// Cliente: 1. Lo obtiene del usuario y actualiza la cookie
	if (usuario && (!cliente || usuario.cliente_id != cliente_id)) {
		// Obtiene el cliente
		cliente = obtieneCamposNecesarios(usuario);

		// Si corresponde, actualiza la cookie
		({cliente_id} = cliente); // es el cliente_id del usuario
		if (!req.cookies.cliente_id || req.cookies.cliente_id != cliente_id)
			res.cookie("cliente_id", cliente_id, {maxAge: unAno, path: "/"});
	}

	// Cliente: 2. Lo obtiene de la cookie y si no existe el registro en la BD, elimina la cookie y recarga el url
	if (!cliente && req.cookies && req.cookies.cliente_id) {
		// Variables
		({cliente_id} = req.cookies);
		const esUsuario = cliente_id.startsWith("U");

		// Obtiene el cliente
		const tabla = esUsuario ? "usuarios" : "visitas";
		cliente = await baseDatos.obtienePorCondicion(tabla, {cliente_id}).then((n) => n && obtieneCamposNecesarios(n)); // no se obtiene el usuario por medida de seguridad, ya que no existe la cookie del mail

		// Si el cliente no existe, elimina la cookie y recarga la vista
		if (!cliente) {
			res.clearCookie("cliente_id");
			return res.redirect(req.originalUrl);
		}
	}

	// Cliente: 3. Como no existe, lo crea
	if (!cliente) {
		// Crea el cliente
		const originalUrl = req.originalUrl.split("?")[0].slice(0, 200); // para analizar el url
		const datos = {versionWeb, originalUrl};
		cliente = await baseDatos.agregaRegistroIdCorrel("visitas", datos);

		// Crea un nuevo 'cliente_id' y actualiza o crea la cookie
		cliente_id = "V" + String(cliente.id).padStart(10, "0");
		res.cookie("cliente_id", cliente_id, {maxAge: unAno, path: "/"});

		// Actualiza el 'cliente_id' en la BD y la variable
		await baseDatos.actualizaPorId("visitas", cliente.id, {cliente_id}); // es crítico el 'await'
		cliente = await baseDatos.obtienePorId("visitas", cliente.id).then((n) => obtieneCamposNecesarios(n));
	}

	// Variables
	const esUsuario = cliente_id.startsWith("U");
	const tabla = esUsuario ? "usuarios" : "visitas";

	// Si corresponde, actualiza la fecha de última navegación
	if (cliente.fechaUltNaveg < fechaHoy) {
		// Actualiza el cliente
		cliente.fechaUltNaveg = fechaHoy;
		const diasNaveg = ++cliente.diasNaveg;

		// Actualiza el usuario
		baseDatos.actualizaPorId(tabla, cliente.id, {fechaUltNaveg: fechaHoy, diasNaveg});
		if (usuario) usuario = {...usuario, fechaUltNaveg: fechaHoy, diasNaveg};
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
		"versionWeb", // para mostrar carteles
	];

	// Obtiene los datos para la variable cliente
	const cliente = {};
	for (const campo of camposNecesarios) cliente[campo] = usuario[campo];

	// Adecua el campo 'visitaCreadaEn'
	cliente.visitaCreadaEn = comp.fechaHora.anoMesDia(cliente.visitaCreadaEn);

	// Fin
	return cliente;
};
