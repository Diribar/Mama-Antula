"use strict";
// Definir variables
import bcryptjs from "bcryptjs";
import {imageSize} from "image-size"; // si usás ESM

export default {
	altaOlvido: {
		// Vista - Form
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
		enviaMailContrasena: async ({usuario, email, contrasena}) => {
			// Variables
			const nombre = "Familia Mama Antula";
			const asunto = "Contraseña para login";
			const comentario = (!usuario ? "Hemos creado tu usuario. " : "") + mensajeContrasena + contrasena;

			// Envía el mail
			const mailEnviado = await comp.enviaMail({nombre, email, asunto, comentario});

			// Genera el mensaje de respuesta
			const mensajeFe = mailEnviado
				? (!usuario ? "Hemos creado tu usuario y te" : "Te") + " hemos enviado un mail con la contraseña"
				: "No hemos podido enviar el mail";

			// Fin
			return {mensajeFe, mailEnviado};
		},
		creaElUsuario: async ({email, contrasena}) => {
			// Crea el usuario
			const contrEncriptada = bcryptjs.hashSync(contrasena, 10);
			const usuario = await baseDatos.agregaRegistroIdCorrel("usuarios", {email, contrasena: contrEncriptada, versionWeb});

			// Agrega 'cliente_id' en 'usuarios'
			const cliente_id = "U" + String(usuario.id).padStart(10, "0");
			await baseDatos.actualizaPorId("usuarios", usuario.id, {cliente_id}); // es necesario el 'await' para session

			// Fin
			return;
		},
	},
};

// Variables
const mensajeContrasena = "Podés hacer el login con tu mail y esta contraseña: ";
