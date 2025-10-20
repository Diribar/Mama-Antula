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
		...{agregar: "fa-circle-plus", califica: "fa-chart-simple", eliminar: "fa-trash-can"},
		...{izqDer: "fa-arrow-right-arrow-left", arrAbajo: "fa-arrow-right-arrow-left girar90"},
		...{detalle: "fa-circle-info", edicion: "fa-pen", edicionCambiada: "fa-arrow-right-long", rotar: "fa-rotate-90"},
		...{graficos: "fa-chart-line", chart: "fa-chart-pie", columnas: "fa-chart-simple", area: "fa-chart-area"},
		...{prod: "fa-video", rclv: "fa-child", link: "fa-link", instituc: "fa-building-columns", mail: "fa-envelope"},
		...{login: "fa-circle-user", altaUser: "fa-user-plus", revision: "fa-user-graduate", mantenim: "fa-tools"},
	},
	iconosMarca: [
		{
			nombre: "Facebook",
			link: "https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561",
			clase: "fa-facebook",
		},
		{nombre: "Instagram", link: "https://www.instagram.com/beatificacionantula/", clase: "fa-instagram"},
		{nombre: "Twitter", link: "https://twitter.com/beatificaciona1", clase: "fa-twitter"},
		{nombre: "TikTok", link: "https://www.tiktok.com/@mamaantula.com", clase: "fa-tiktok"},
	],
};
