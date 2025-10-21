"use strict";
// Definir variables
import bcryptjs from "bcryptjs";

export default {
	// Middleware
	infoNoPerenne: (req) => {
		// Variables
		const entidad = comp.obtieneEntidadDesdeUrl(req);
		const {id, origen} = req.query;
		const linkVolver =
			entidad && id
				? "/" + entidad + "/inactivar-captura/?id=" + id + "&origen=" + (origen || "DT")
				: req.session.urlSinLogin;

		// Información
		const informacion = {
			mensajes: [
				"Nos agrada que nuestros usuarios nos aporten información.",
				"Ese permiso requiere responsabilidad.",
				"Necesitamos algunos datos tuyos, para asignarte ese rol.",
				"Para avanzar, elegí el ícono de la flecha hacia la derecha.",
			],
			iconos: [
				variables.vistaAnterior(linkVolver),
				{
					clase: iconos.derecha,
					link: "/usuarios/perennes",
					titulo: "Obtener el rol 'Apto Input'",
					autofocus: true,
				},
			],
			titulo: "Rol Apto Input",
			trabajando: true,
		};

		// Fin
		return informacion;
	},

	// ControlVista: loginGuardar, altaPerennesGuardar, altaEditablesGuardar
	eliminaDuplicados: async (usuario_id) => {
		// Obtiene los registros
		const registros = await baseDatos.obtieneTodosPorCondicion("persWebDia", {usuario_id});

		// Elimina los duplicados
		for (let i = registros.length - 1; i > 0; i--)
			if (registros[i].fecha == registros[i - 1].fecha) baseDatos.eliminaPorId("persWebDia", registros[i].id);

		// Fin
		return;
	},
	logout: (req, res) => {
		// Borra los datos de session y cookie
		delete req.session.usuario;
		res.clearCookie("email", {...global.dominio});

		// Fin
		return;
	},

	// ControlAPI
	envioDeMailConContrasena: async ({email, altaMail}) => {
		// Variables
		const nombre = "ELC - Alta de contraseña";
		const asunto = "Contraseña para ELC";

		// Contraseña
		const contrasena = Math.round(Math.random() * Math.pow(10, 6))
			.toString()
			.padStart(6, "0"); // más adelante cambia por la codificada

		// Comentario
		let comentario = "";
		comentario += "¡Hola!";
		if (altaMail) {
			comentario += "<br>" + "Ya tenés tu usuario para usar en nuestro sitio.";
			comentario += "<br>" + "Necesitamos que completes el alta antes de que transcurran 24hs.";
			comentario += "<br>" + "Si no se completa en ese plazo, se dará de baja.";
		}
		comentario += "<br>" + "La contraseña de tu usuario es: <bold><u>" + contrasena + "</u></bold>";

		// Envía el mail al usuario y actualiza la contraseña
		const mailEnviado = await comp.enviaMail({nombre, email, asunto, comentario});
		const contrEncriptada = bcryptjs.hashSync(contrasena, 10);

		// Fin
		console.log("Contraseña: " + contrasena);
		return {contrasena: contrEncriptada, mailEnviado};
	},
	creaElUsuario: async ({cliente, email, contrasena}) => {
		// Variables
		const {diasNaveg, visitaCreadaEn, versionWeb: versionWebCliente} = cliente;

		// Crea el usuario
		const usuario = await baseDatos.agregaRegistroIdCorrel("usuarios", {
			...{email, contrasena},
			...{diasNaveg, visitaCreadaEn},
			statusRegistro_id: mailPendValidar_id,
			versionWeb: versionWebCliente,
		});

		// Actualiza 'cliente_id' en la BD 'usuarios' y en la cookie 'cliente_id'
		const cliente_id = "U" + String(usuario.id).padStart(10, "0");
		await baseDatos.actualizaPorId("usuarios", usuario.id, {cliente_id}); // es necesario el 'await' para session

		// Fin
		return cliente_id;
	},

	// Ambos
	cambiaVisitaEnNavegsDia: async ({cliente_id, cliente_idViejo}) => {
		// Varables
		const fechaHoy = comp.fechaHora.ahora().setHours(0, 0, 0);
		const condicion = {cliente_id: cliente_idViejo, fecha: {[Op.gte]: fechaHoy}};

		// Cambia el campo de la visita_id
		cliente_id == "U0000000011"
			? await baseDatos.eliminaPorCondicion("navegsDia", condicion)
			: await baseDatos.actualizaPorCondicion("navegsDia", condicion, {cliente_id});

		// Fin
		return;
	},
	comentarios: {
		credsInvalidas: {
			altaMail: "Esa dirección de email ya existe en nuestra base de datos.",
			login: "Credenciales inválidas.",
			olvidoContr: "Algún dato no coincide con el de nuestra base de datos.",
			datosPeren: "Ya existe un usuario con esas credenciales. De ser necesario, comunicate con nosotros.",
		},
		accesoSuspendido: (tema) =>
			"Por motivos de seguridad debido a los intentos fallidos " +
			tema +
			", te pedimos que esperes para volver a intentarlo.",
	},
};
