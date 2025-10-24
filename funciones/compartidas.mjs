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
	validacs: {
		longitud: (dato, corto, largo) => {
			return dato.length < corto
				? "El contenido debe ser más largo"
				: dato.length > largo
				? "El contenido debe ser más corto"
				: "";
		},
		castellano: {
			basico: (dato) => {
				let formato = /^[a-záéíóúüñ ,.'\-]+$/i;
				return !formato.test(dato) ? "Sólo se admiten letras del abecedario castellano" : "";
			},
			completo: (dato) => {
				let formato = /^[a-záéíóúüñ ,.'&$:;…"°¿?¡!+/()\d\-]+$/i;
				return !formato.test(dato) ? "Sólo se admiten letras del abecedario castellano" : "";
			},
		},
		inicial: {
			basico: (dato) => {
				let formato = /^[A-ZÁÉÍÓÚÜÑ]/;
				return !formato.test(dato) ? "La primera letra debe ser en mayúscula" : "";
			},
			completo: (dato) => {
				let formato = /^[A-ZÁÉÍÓÚÜÑ¡¿"\d]/;
				return !formato.test(dato) ? "La primera letra debe ser en mayúscula" : "";
			},
			sinopsis: (dato) => {
				let formato = /^[A-ZÁÉÍÓÚÜÑ¡¿"\d]/;
				return !formato.test(dato) ? "La primera letra debe ser en mayúscula" : "";
			},
		},
		imagen: (datos) => {
			// Variables
			const {imagen, tamano, tipo} = datos;
			const ext = path.extname(imagen).toLowerCase().slice(1);
			const extValidas = ["jpg", "png", "jpeg"];

			// Valida la extensión y el tamaño
			const respuesta = !ext // Valida la extensión
				? "El archivo debe tener alguna extensión"
				: !extValidas.includes(ext) || !extValidas.some((n) => tipo.endsWith(n))
				? "Usaste un archivo con la extensión " + ext + ". Las extensiones válidas son " + extValidas.join(", ")
				: !tipo.startsWith("image/")
				? "El archivo debe ser de tipo imagen"
				: tamano && tamano > tamMaxImagen // Valida el tamaño
				? "El archivo tiene " + Math.ceil((tamano / Mb1) * 100) / 100 + " MB. Necesitamos que no supere 1 MB"
				: "";

			// Fin
			return respuesta;
		},
	},
};
