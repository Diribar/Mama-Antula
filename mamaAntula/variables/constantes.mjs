"use strict";
// Variables
const unaHora = 60 * 60 * 1000;
const unDia = unaHora * 24;
const unaSemana = unDia * 7;
const unMes = unDia * 30;
const unAno = unDia * 365;

export default {
	logoOficial: "/imgsEstables/Varios/logoOficial.jpg",
	...{unaHora, unDia, unaSemana, unMes, unAno},
	iconos: {
		...{faSolid: "fa-solid", hogar: "fa-home", ayuda: "fa-circle-question"}, // Uso general
		...{triangulo: "fa-triangle-exclamation", entendido: "fa-thumbs-up"}, // Carteles
		...{izquierda: "fa-circle-left", derecha: "fa-circle-right", check: "fa-circle-check", xMark: "fa-circle-xmark"}, // Formularios

		// Ocasionales
		...{agregar: "fa-circle-plus", califica: "fa-chart-simple", eliminar: "fa-trash-can", guardar:"fa-floppy-disk"},
		...{izqDer: "fa-arrow-right-arrow-left", arrAbajo: "fa-arrow-right-arrow-left girar90"},
		...{detalle: "fa-circle-info", edicion: "fa-pen", edicionCambiada: "fa-arrow-right-long", rotar: "fa-rotate-90"},
		...{graficos: "fa-chart-line", chart: "fa-chart-pie", columnas: "fa-chart-simple", area: "fa-chart-area"},
		...{prod: "fa-video", rclv: "fa-child", link: "fa-link", instituc: "fa-building-columns", mail: "fa-envelope"},
		...{login: "fa-circle-user", altaUser: "fa-user-plus", revision: "fa-user-graduate", mantenim: "fa-tools"},
	},

	// Carpetas de imágenes
	carpContenido: path.join(rutaHome, "..", "9-Imagenes", "1-Contenido"),
	carpRevisar: path.join(rutaHome, "..", "9-Imagenes", "2-Revisar"),
	carpUsuarios: path.join(rutaHome, "..", "9-Imagenes", "8-Usuarios"),
	carpProvisorio: path.join(rutaHome, "..", "9-Imagenes", "9-Provisorio"), // carpeta donde se guardan las imágenes inicialmente

	// Otras
	requestsTriviales: ["WhatsApp", "Postman", "TelegramBot", "TwitterBot", "Zabbix"], // evita que se cuenten como visitas
	continentes: ["América", "Europa", "Africa", "Asia", "Oceanía"],
	rutasUsuario: {altaOlvido: "/alta-u-olvido-de-contrasena", edicion: "/edicion", cambioRoles: "/cambio-de-roles"},
	tamMaxArch: 1024 * 1024, // 1Mb
	Mb1: 1024 * 1024,
	mesesAbrev: ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"],
};
