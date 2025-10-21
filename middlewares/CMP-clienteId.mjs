"use strict"; // Obtiene 'usuario' y 'cliente'

export default async (req, res, next) => {
	// Si es una de las aplicaciones triviales, avanza
	if (comp.omitirMiddlewsTransv(req)) return next();

	// Variables
	let {usuario, cliente} = req.session;
	let cliente_id;

	// Si el 'cliente_id' tiene un valor y coincide en ambas variables, interrumpe la función
	if (usuario && cliente && usuario.cliente_id && usuario.cliente_id == cliente.cliente_id) {
		res.locals.usuario = usuario;
		return next();
	}

	// Obtiene el usuario de su cookie 'mail'
	if (!usuario && req.cookies && req.cookies.email && req.cookies.cliente_id) {
		// Obtiene el usuario
		const {email, cliente_id} = req.cookies;
		usuario = await comp.obtieneUsuarioPorMail(email);
		if (usuario.cliente_id != cliente_id) usuario = null;// si el cliente_id de la BD y de la cookie difieren, anula el valor del usuario

		// Si existe el usuario, lleva a cero el campo 'diasSinCartelBenefs'
		if (usuario) {
			baseDatos.actualizaPorId("usuarios", usuario.id, {diasSinCartelBenefs: 0});
			usuario.diasSinCartelBenefs = 0;
		}
		// De lo contrario, borra esa cookie
		else res.clearCookie("email", {...global.dominio});
	}

	// Cliente: 1. Lo obtiene del usuario
	if (usuario && (!cliente || usuario.cliente_id != cliente.cliente_id)) {
		// Obtiene el cliente
		cliente = obtieneCamposNecesarios(usuario);

		// Si corresponde, actualiza la cookie
		const {cliente_id} = cliente;
		if (!req.cookies.cliente_id || req.cookies.cliente_id != cliente_id)
			res.cookie("cliente_id", cliente_id, {maxAge: unAno, ...global.dominio});
	}

	// Cliente: 2. Lo obtiene de la cookie
	if (!cliente && req.cookies && req.cookies.cliente_id) {
		// Variables
		cliente_id = req.cookies.cliente_id;
		const esUsuario = cliente_id.startsWith("U");

		// Obtiene el cliente
		const tabla = esUsuario ? "usuarios" : "visitas";
		cliente = await baseDatos
			.obtienePorCondicion(tabla, {cliente_id}, "rol")
			.then((n) => (n ? obtieneCamposNecesarios(n) : null));
	}

	// Cliente: 3. No existe: lo crea
	if (!cliente) {
		// Variables
		const datos = {[campoVersion]: version};
		if (cliente_id) datos.diasNaveg = 1; // si existe el cliente_id, es que alguna vez hizo una navegación

		// Crea el cliente
		cliente = await baseDatos.agregaRegistroIdCorrel("visitas", datos);
		req.session.recienCreado = true;

		// Crea un nuevo 'cliente_id'
		cliente_id = "V" + String(cliente.id).padStart(10, "0");

		// Actualiza o crea la cookie
		res.cookie("cliente_id", cliente_id, {maxAge: unAno, ...global.dominio});

		// Actualiza el 'cliente_id' en la BD
		await baseDatos.actualizaPorId("visitas", cliente.id, {cliente_id}); // es crítico el 'await'

		// Actualiza el cliente con los campos necesarios
		cliente = await baseDatos.obtienePorId("visitas", cliente.id, "rol").then((n) => obtieneCamposNecesarios(n));
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
		...[campoVersion, "diasSinCartelBenefs"], // para mostrar carteles
		"rol", // para mostrar carteles
	];

	// Obtiene los datos para la variable cliente
	const cliente = {};
	for (const campo of camposNecesarios) cliente[campo] = usuario[campo];

	// Adecua el campo 'visitaCreadaEn'
	cliente.visitaCreadaEn = comp.fechaHora.anoMesDia(cliente.visitaCreadaEn);

	// Fin
	return cliente;
};
