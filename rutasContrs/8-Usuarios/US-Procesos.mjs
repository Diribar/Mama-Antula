"use strict";
// Definir variables
import bcryptjs from "bcryptjs";

export default {
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
	envioDeMailConContrasena: async ({email, altaMail}) => {
		// Variables
		const nombre = "Familia Mama Antula";
		const asunto = "Nueva contraseña";

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
	credsInvalidas: {
		altaMail: "Esa dirección de email ya existe en nuestra base de datos.",
		login: "Credenciales inválidas.",
		olvidoContr: "Algún dato no coincide con el de nuestra base de datos.",
		datosPeren: "Ya existe un usuario con esas credenciales. De ser necesario, comunicate con nosotros.",
	},
};
