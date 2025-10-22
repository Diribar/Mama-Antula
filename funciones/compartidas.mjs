"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	fechaHora: {
		// En uso
		anoMesDia: (fecha) => new Date(fecha).toISOString().slice(0, 10),
		ahora: () => new Date(new Date().toUTCString()), // <-- para convertir en horario 'UTC'
	},
	obtieneUsuarioPorMail: (email) => {
		const include = ["rol", "statusRegistro"];
		return baseDatos.obtienePorCondicion("usuarios", {email}, include);
	},
	omitirMiddlewsTransv: (req) => {
		// Si es un url irrelevante
		if (["/favicon.ico"].includes(req.originalUrl)) return true;
		if (req.originalUrl.includes("/api/")) return true;
		if (req.originalUrl == "/.well-known/appspecific/com.chrome.devtools.json") return true;
		if (req.originalUrl.startsWith("/xmlrpc.php")) return true;
		if (["/imgsEstables/", "/imgsEditables/", "/9-Imagenes/"].some((n) => req.originalUrl.startsWith(n))) return true;

		// Si se desconoce el origen
		if (!req.headers["user-agent"]) return true;

		// Si es una aplicación conocida que no es de navegación, pero que muestra datos del url visitado
		if (requestsTriviales.some((n) => req.headers["user-agent"].startsWith(n))) return true;

		// Fin
		return false;
	},
	enviaMail: async ({nombre, email, asunto, comentario}) => {
		// Variables
		const {host, puerto: port, mailEnvios: user, contrEnvios: pass, seguro: secure} = credencsSitio.mail;
		const datosTransporte = {host, port, auth: {user, pass}, secure};
		const transporte = nodemailer.createTransport(datosTransporte);
		const datos = {
			from: nombre + " <" + user + ">",
			to: email,
			subject: asunto,
			html: comentario,
		};
		let mailEnviado = false;

		// Envío del mail
		await transporte
			.sendMail(datos)
			.then(() => (mailEnviado = true))
			.catch((error) => console.log("Mail no enviado. ", error));

		// Fin
		return mailEnviado;
	},
};
