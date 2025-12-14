"use strict";
// Variables
const unMinuto = 60 * 1000;
const unaHora = 60 * 60 * 1000;
const unDia = unaHora * 24;
const unaSemana = unDia * 7;
const unMes = unDia * 30;
const unAno = unDia * 365;

export default {
	logoOficial: "/imgsEstables/Varios/logoOficial.jpg",
	...{unMinuto, unaHora, unDia, unaSemana, unMes, unAno},
	iconos: {
		...{faSolid: "fa-solid", hogar: "fa-home", ayuda: "fa-circle-question"}, // Uso general
		...{triangulo: "fa-triangle-exclamation", entendido: "fa-thumbs-up"}, // Carteles
		...{izquierda: "fa-circle-left", derecha: "fa-circle-right", check: "fa-circle-check", xMark: "fa-circle-xmark"}, // Formularios

		// Ocasionales
		...{agregar: "fa-circle-plus", califica: "fa-chart-simple", eliminar: "fa-trash-can", guardar: "fa-floppy-disk"},
		...{izqDer: "fa-arrow-right-arrow-left", arrAbajo: "fa-arrow-right-arrow-left girar90"},
		...{detalle: "fa-circle-info", edicion: "fa-pen", edicionCambiada: "fa-arrow-right-long", rotar: "fa-rotate-90"},
		...{graficos: "fa-chart-line", chart: "fa-chart-pie", columnas: "fa-chart-simple", area: "fa-chart-area"},
		...{video: "fa-video", link: "fa-link", instituc: "fa-building-columns", mail: "fa-envelope"},
		...{login: "fa-circle-user", altaUser: "fa-user-plus", revision: "fa-user-graduate", mantenim: "fa-tools"},
	},

	// Carpetas de imágenes
	carpFinal: path.join(rutaHome, "..", "9-Imagenes", "1-Final"),
	carpRevisar: path.join(rutaHome, "..", "9-Imagenes", "2-Revisar"),
	carpUsuarios: path.join(rutaHome, "..", "9-Imagenes", "8-Usuarios"),

	// Landing page
	LP_urlSeccion: "inicio",
	LP_urlTema1: "novedades",
	LP_urlTema2: "quien-es-mama-antula",

	// Temas y encabezados
	temaCarta_id: 10, // el id del tema "Cartas"
	encabCartaIntro_id: 33, // el id del encabezado sobre Introducción a las cartas
	temaLugares_id: 17, // el id del tema "Lugares"
	encabLugaresDevocIntro_id: 25, // el id del encabezado sobre Introducción a los lugaresDevoc

	// Encabezados
	includesEncabs: {
		cartas: ["nombreDesde", "nombreHacia", "idioma", "lugarCarta"],
		expers: ["lugarExper"],
		lugaresDevoc: ["indiceDevoc"],
	},
	camposEdicion: {
		vista: {
			// Referencias
			nombreDesde: "Remitente",
			nombreHacia: "Destinatario",
			idioma: "Idioma",
			lugarCarta: "Lugar",
			lugarExper: "Lugar",
			indiceDevoc: "Lugar geográfico",

			// Otros
			numero: "Número",
			titulo: "Título",
			fechaEvento: "Fecha de ocurrencia",
		},
		tabla: [
			...["numero", "nombreDesde_id", "nombreHacia_id", "idioma_id", "lugarCarta_id"],
			...["lugarExper_id", "titulo", "fechaEvento", "indiceDevoc_id"],
		],
	},

	// Otras
	requestsTriviales: ["WhatsApp", "Postman", "TelegramBot", "TwitterBot", "Zabbix"], // evita que se cuenten como visitas
	continentes: ["América", "Europa", "Africa", "Asia", "Oceanía"],
	rutasUsuario: {altaOlvido: "/alta-u-olvido-de-contrasena", edicion: "/edicion", cambioRol: "/cambio-de-rol"},
	tamMaxArch: 1024 * 1024, // 1Mb
	Mb1: 1024 * 1024,
	mesesAbrev: ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"],
};
