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
	gestionArchivos: {
		existe: (rutaNombre) => rutaNombre && fs.existsSync(rutaNombre),
		elimina: (ruta, archivo, output) => FN.elimina(ruta, archivo, output),
		descarga: async function (url, rutaYnombre, output) {
			// Carpeta donde descargar
			const ruta = rutaYnombre.slice(0, rutaYnombre.lastIndexOf("/"));
			if (!this.existe(ruta)) fs.mkdirSync(ruta);

			// Realiza la descarga
			let writer = fs.createWriteStream(rutaYnombre);
			let response = await axios({method: "GET", url, responseType: "stream"});
			response.data.pipe(writer);

			// Obtiene el resultado de la descarga
			let resultado = await new Promise((resolve, reject) => {
				writer.on("finish", () => {
					const nombre = rutaYnombre.slice(rutaYnombre.lastIndexOf("/") + 1);
					if (output) console.log("Imagen '" + nombre + "' descargada");
					resolve("OK");
				});
				writer.on("error", (error) => {
					console.log("Error en la descarga", error);
					reject("Error");
				});
			});
			// Fin
			return resultado;
		},
		mueveImagen: function (nombre, carpOrigen, carpDestino) {
			// Variables
			const rutaNombreOrigen = path.join(carpOrigen, nombre);
			const rutaNombreDestino = path.join(carpDestino, nombre);

			// Si no existe la carpeta de destino, la crea
			if (!this.existe(carpDestino)) fs.mkdirSync(carpDestino);

			// Si no encuentra el archivo de origen, lo avisa
			if (!this.existe(rutaNombreOrigen)) console.log("No se encuentra el archivo " + rutaNombreOrigen + " para moverlo");
			// Mueve el archivo
			else
				fs.renameSync(rutaNombreOrigen, rutaNombreDestino, (error) => {
					if (error) throw error;
				});

			// Fin
			return;
		},
		copiaImagen: function (rutaNombreOrigen, rutaNombreDestino, carpDestino) {
			// Si no existe la carpeta de destino, la crea
			if (carpDestino && !this.existe(carpDestino)) fs.mkdirSync(carpDestino);

			// Si no existe el archivo de origen, lo avisa
			if (!this.existe(rutaNombreOrigen)) console.log("No se encuentra el archivo " + rutaNombreOrigen + " para copiarlo");
			// Si existe, lo copia o avisa el error
			else
				fs.copyFile(rutaNombreOrigen, rutaNombreDestino, (error) => {
					if (error) throw error;
				});

			// Fin
			return;
		},
		imagenAlAzar: (carpeta) => {
			// Obtiene el listado de archivos
			const archivos = fs.readdirSync(carpeta);

			// Elije al azar el n° de imagen
			const indice = parseInt(Math.random() * archivos.length);

			// Obtiene el nombre del archivo
			const imagenAlAzar = archivos[indice];

			// Fin
			return imagenAlAzar;
		},
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
};
