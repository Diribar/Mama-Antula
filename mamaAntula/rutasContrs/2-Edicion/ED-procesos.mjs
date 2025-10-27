"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	barraHerramsEdicion: [
		{grupo: 1, tipo: "button", clase: "ql-bold fa-bold", title: "Negrita"},
		{grupo: 1, tipo: "button", clase: "ql-italic fa-italic", title: "Cursiva"},
		{grupo: 1, tipo: "select", clase: "ql-color", title: "Color del texto"},
		{grupo: 1, tipo: "select", clase: "ql-background", title: "Color de fondo"},

		{grupo: 2, tipo: "button", clase: "ql-list fa-list-ol", value: "ordered", title: "Lista numerada"},
		{grupo: 2, tipo: "button", clase: "ql-list fa-list-ul", value: "bullet", title: "Lista con viñetas"},
		{grupo: 2, tipo: "button", clase: "ql-blockquote fa-quote-right", title: "Cita"},
		{grupo: 2, tipo: "button", clase: "ql-code-block fa-code", title: "Bloque de código"},

		{grupo: 3, tipo: "button", clase: "ql-link fa-link", title: "Insertar enlace"},
		{grupo: 3, tipo: "button", clase: "ql-image fa-image", title: "Insertar imagen"},
		{grupo: 3, tipo: "button", clase: "ql-video fa-video", title: "Insertar video"},

		{grupo: 4, tipo: "button", clase: "ql-clean fa-eraser", title: "Quitar formato"},
	],
};
