"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	obtieneUsuarioPorMail: (email) => {
		const include = ["rol", "statusRegistro", "genero"];
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
};
