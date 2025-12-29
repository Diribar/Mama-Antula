"use strict";
// Definir variables
import imageSize from "image-size";

export default {
	// De uso general - Vista Form
	obtieneImagenesAlAzar: () => {
		// Variables
		const carpeta = path.join(carpImgsEstables, "Mama-Antula");
		let archivos;

		// Obtiene el nombre de los archivos
		archivos = fs.readdirSync(carpeta);
		archivos = archivos.filter((archivo) => {
			// Obtiene la ruta y nombre del archivo en formato que imageSize lo pueda entender
			const rutaArchivo = path.join(carpeta, archivo);
			const buffer = fs.readFileSync(rutaArchivo);

			// Averigua si la imagen es vertical
			const {width, height, type} = imageSize(buffer);
			return height > width;
		});

		// Obtiene dos al azar
		const i = Math.floor(Math.random() * archivos.length);
		let j = i;
		while (j === i) j = Math.floor(Math.random() * archivos.length);
		archivos = [archivos[i], archivos[j]];

		// Les agrega la ruta
		archivos = archivos.map((archivo) => path.join("/imgsEstables", "Mama-Antula", archivo));

		// Fin
		return archivos;
	},

	// API- Guardar
	altaOlvido: {
		enviaMailContrasena: async (usuario) => {
			// Variables
			const {email, contrasena} = usuario;
			const nombre = "Familia Mama Antula";
			const asunto = "Contraseña para login";
			const mensajeContrasena = "Podés hacer el login con tu mail y esta contraseña: ";
			const comentario = (!usuario.id ? "Hemos creado tu usuario. " : "") + mensajeContrasena + contrasena;

			// Envía el mail
			const mailEnviado = await comp.enviaMail({nombre, email, asunto, comentario});

			// Genera el mensaje de respuesta
			const mensajeFe = mailEnviado
				? (!usuario.id ? "Hemos creado tu usuario y te" : "Te") +
				  " hemos enviado un mensaje al mail <b><em>" +
				  email +
				  "</em></b> con la contraseña para loguearte."
				: "No hemos podido enviar el mail";

			// Fin
			return {mensajeFe, mailEnviado};
		},
		creaElUsuario: async ({email, contrEncriptada}) => {
			// Crea el usuario
			const usuario = await baseDatos.agregaRegistro("usuarios", {email, contrasena: contrEncriptada, versionWeb});

			// Agrega 'cliente_id' en 'usuarios'
			const cliente_id = "U" + String(usuario.id).padStart(10, "0");
			await baseDatos.actualizaPorId("usuarios", usuario.id, {cliente_id}); // es necesario el 'await' que lo lea al crear session

			// Fin
			return;
		},
	},
	login: {
		actualizaUsuario: async ({usuario, cliente, esVisita}) => {
			// Variables
			const {cliente_id} = cliente;
			const datosUs = {};

			if (esVisita) {
				// Actualiza datos
				datosUs.fechaUltNaveg = cliente.fechaUltNaveg;

				// Actualiza 'diasNaveg'
				if (usuario.fechaUltNaveg < cliente.fechaUltNaveg) {
					const diaInicial = new Date(usuario.fechaUltNaveg).getTime();
					const diaFinal = new Date(cliente.fechaUltNaveg).getTime();
					const diasTransc = (diaFinal - diaInicial) / unDia;
					datosUs.diasNaveg = usuario.diasNaveg + Math.min(cliente.diasNaveg, diasTransc);
				}

				// Elimina el registro de la tabla visitas
				baseDatos.eliminaPorCondicion("visitas", {cliente_id});
			}
			if (!usuario.visitaCreadaEn) datosUs.visitaCreadaEn = cliente.visitaCreadaEn; // si existe la del usuario, se conserva
			if (usuario.statusRegistro_id == mailPendValidar_id) datosUs.statusRegistro_id = mailValidado_id; // si corresponde, le cambia el status a 'mailValidado'

			// Guarda la info en usuario
			await baseDatos.actualizaPorId("usuarios", usuario.id, datosUs);
			for (const dato in datosUs) usuario[dato] = datosUs[dato];

			// Fin
			return;
		},
		actualizaTablaPersWebDia: async (usuario) => {
			const {id: usuario_id} = usuario;
			const datosND = {
				cliente_id: usuario.cliente_id,
				usuario_id,
				visitaCreadaEn: comp.fechaHora.anoMesDia(usuario.visitaCreadaEn),
				diasNaveg: usuario.diasNaveg,
			};
			const hoy = new Date().toISOString().slice(0, 10);
			await baseDatos
				.actualizaPorCondicion("persWebDia", {cliente_id, fecha: hoy}, datosND) // la variable 'cliente_id' puede diferir del 'usuario.cliente_id'
				.then(() => procesos.eliminaDuplicados(usuario.id));
		},
		cambiaVisitaEnNavegsDia: async ({cliente_id, cliente_idViejo}) => {
			// Varables
			const fechaHoy = comp.fechaHora.ahora().setHours(0, 0, 0);
			const condicion = {cliente_id: cliente_idViejo, fecha: {[Op.gte]: fechaHoy}};

			// Reemplaza el campo cliente_id por el del usuario
			await baseDatos.actualizaPorCondicion("navegsDia", condicion, {cliente_id});

			// Fin
			return;
		},
	},
	actualizacsEdicion: (datos, usuario) => {
		// Elimina el archivo anterior, si lo hubiera
		if (datos.imagen && usuario.imagen) comp.gestionArchs.elimina(carpUsuarios, usuario.imagen);

		// Actualiza la tabla usuarios
		datos.statusRegistro_id = conApodo_id;
		baseDatos.actualizaPorId("usuarios", usuario.id, datos);

		// Actualiza session
		const {apodo, anotacs, statusRegistro_id} = datos;
		const datosSession = {apodo, anotacs, statusRegistro_id};
		if (datos.imagen) datosSession.imagen = datos.imagen;

		// Fin
		return datosSession;
	},
};
