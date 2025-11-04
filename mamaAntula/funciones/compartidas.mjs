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
		diaMesAnoUTC: (fecha) => FN.diaMesAnoUTC(fecha),
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
	contenido: {
		obtieneDatosDeTabla: ({tema_id, pestana_id}) => {
			// Variables
			if (!tema_id) tema_id = pestanasTemas.find((n) => n.id == pestana_id).tema_id;
			const temaActual = temasSecciones.find((n) => n.id == tema_id);
			const seccionActual = secciones.find((n) => n.id == temaActual.seccion_id);

			// Obtiene los datos
			const [entidad, campo_id, includes] = false
				? false
				: temaActual.codigo == "cartas"
				? ["encabCartas", "carta_id", ["nombreDesde", "nombreHacia", "lugar", "idioma"]]
				: seccionActual.codigo == "experiencias"
				? ["encabExpers", "experiencia_id", ["lugar"]]
				: ["encabSinIndice", "sinIndice_id", [""]];

			// Fin
			return {entidad, campo_id, includes};
		},
		tituloCons: {
			encabCartas: function (encabs) {
				for (const encab of encabs) encab.tituloCons = this.encabCarta(encab);

				// Fin
				return encabs;
			},
			encabExpers: (encabs) => {
				for (const encab of encabs)
					encab.tituloCons = FN.diaMesAnoUTC(encab.fechaEvento) + " - " + encab.titulo + " - " + encab.lugar.nombre;

				// Fin
				return encabs;
			},
			encabSinIndice: (encabs) => encabs.map((encab) => ({...encab, tituloCons: encab.titulo})),
			encabCarta: (encab) => {
				const tituloCons = encab
					? "Carta " +
					  encab.numero +
					  " - " +
					  (encab.nombreDesde.nombre.startsWith("P.") ? "Del" : "De") +
					  " " +
					  encab.nombreDesde.nombre +
					  " para " +
					  (encab.nombreHacia.nombre.startsWith("P.") ? "el " : "") +
					  encab.nombreHacia.nombre +
					  " - " +
					  encab.lugar.nombre +
					  " - " +
					  FN.diaMesAnoUTC(encab.fechaEvento)
					: "";

				// Fin
				return tituloCons;
			},
		},
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
	inicialMayus: (texto) => texto.slice(0, 1).toUpperCase() + texto.slice(1),
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
	diaMesAnoUTC: (fecha) => {
		// Variables
		fecha = new Date(fecha);
		const dia = fecha.getUTCDate();
		const mes = mesesAbrev[fecha.getUTCMonth()];
		const año = fecha.getUTCFullYear().toString();

		// Fin
		return dia + "/" + mes + "/" + año;
	},
};
