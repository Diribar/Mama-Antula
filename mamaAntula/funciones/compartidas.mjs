"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	// Funciones por tema
	fechaHora: {
		// En uso
		anoMesDia: (fecha) => new Date(fecha).toISOString().slice(0, 10),
		ahora: () => new Date(new Date().toUTCString()), // <-- para convertir en horario 'UTC'
	},
	validacs: {
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
		longitud: (dato, corto, largo) => {
			return dato.length < corto
				? "El contenido debe ser más largo"
				: dato.length > largo
				? "El contenido debe ser más corto"
				: "";
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
				: tamano && tamano > tamMaxArch // Valida el tamaño
				? "El archivo tiene " + Math.ceil((tamano / Mb1) * 100) / 100 + " MB. Necesitamos que no supere 1 MB"
				: "";

			// Fin
			return respuesta;
		},
	},
	gestionArchs: {
		existe: (rutaNombre) => rutaNombre && fs.existsSync(rutaNombre),
		elimina: (ruta, nombreArch, output) => FN.elimina(ruta, nombreArch, output),
		mueve: function (nombreArch, carpOrigen, carpDestino) {
			// Variables
			const rutaNombreOrigen = path.join(carpOrigen, nombreArch);
			const rutaNombreDestino = path.join(carpDestino, nombreArch);

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
		copia: function (rutaNombreOrigen, rutaNombreDestino, carpDestino) {
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
		alAzar: (carpeta) => {
			// Obtiene el listado de archivos
			const archivos = fs.readdirSync(carpeta);

			// Elije al azar el n° de imagen
			const indice = parseInt(Math.random() * archivos.length);

			// Obtiene el nombre del archivo
			const imagenAlAzar = archivos[indice];

			// Fin
			return imagenAlAzar;
		},
		nombreArchDesc: (reqFile) => Date.now() + path.extname(reqFile.originalname),
		descarga: (ruta, nombreArch, reqFile) => fs.promises.writeFile(path.join(ruta, nombreArch), reqFile.buffer), // descarga el archivo puesto en memoria por multer
	},

	// Tablas
	obtieneDatosTabla: ({seccionActual, temaActual}) => {
		// Obtiene los datos
		const [entidad, campo_id, orden, includes] = false
			? false
			: temaActual.codigo == "cartas"
			? ["encabCartas", "carta_id", "fechaEvento", ["nombreDesde", "nombreHacia", "lugar", "idioma"]]
			: seccionActual.codigo == "experiencias"
			? ["encabExpers", "experiencia_id", "fechaEvento", ["lugar"]]
			: ["encabSinIndice", "sinIndice_id", "orden"];

		// Fin
		return {entidad, campo_id, orden, includes};
	},
	tituloCons: {
		encabCartas: (encabezados) => {
			for (const encabezado of encabezados)
				encabezado.tituloCons =
					"Carta " +
					titulo.numero +
					" - De " +
					titulo.nombreDesde.nombre +
					" a " +
					titulo.nombreHacia.nombre +
					" - " +
					titulo.lugar.nombre +
					" - " +
					FN.fechaDiaMesAno(titulo.fechaEvento);

			// Fin
			return encabezados;
		},
		encabExpers: (encabs) => {
			for (const encab of encabs)
				encab.tituloCons = FN.fechaDiaMesAno(encab.fechaEvento) + " - " + encab.titulo + " - " + encab.lugar.nombre;

			// Fin
			return encabs;
		},
		encabSinIndice: (encabs) => encabs.map((encab) => ({...encab, tituloCons: encab.titulo})),
	},

	// Funciones puntuales
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

// Funciones
const FN = {
	elimina: (ruta, archivo, output) => {
		// Arma el nombre del archivo
		const rutaNombre = path.join(ruta, archivo);

		// Se fija si encuentra el archivo
		if (rutaNombre && fs.existsSync(rutaNombre)) {
			const queEs = fs.statSync(rutaNombre);
			if (queEs.isFile()) {
				fs.unlinkSync(rutaNombre); // Borra el archivo
				if (output) console.log("Archivo '" + rutaNombre + "' borrado"); // Avisa que lo borra
			} else if (queEs.isDirectory()) {
				fs.rmdirSync(rutaNombre); // Borra el directorio
				if (output) console.log("Carpeta '" + rutaNombre + "' borrada"); // Avisa que lo borra
			}
		}
		// Mensaje si no lo encuentra
		else if (output) console.log("Archivo/Carpeta " + rutaNombre + " no encontrado para borrar");

		// Fin
		return;
	},
	fechaDiaMesAno: (fecha) => {
		// Variables
		fecha = new Date(fecha);
		const dia = fecha.getDate();
		const mes = meses[fecha.getMonth()];
		const año = fecha.getFullYear().toString().slice(-2);

		// Fin
		return dia + "/" + mes + "/" + año;
	},
};
