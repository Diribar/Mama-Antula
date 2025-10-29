"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	barraHerramsEdicion: [
		{grupo: 1, tipo: "button", clase: "ql-bold", title: "Negrita", permitir: "bold"},
		{grupo: 1, tipo: "button", clase: "ql-italic", title: "Cursiva", permitir: "italic"},
		{grupo: 1, tipo: "select", clase: "ql-color", title: "Color del texto", permitir: "color"},

		{grupo: 2, tipo: "button", clase: "ql-list", value: "ordered", title: "Lista numerada", permitir: "list"},
		{grupo: 2, tipo: "button", clase: "ql-list", value: "bullet", title: "Lista con viñetas", permitir: "list"},
		{grupo: 2, tipo: "button", clase: "ql-blockquote", title: "Cita", permitir: "blockquote"},

		{grupo: 3, tipo: "button", clase: "ql-link", title: "Insertar enlace", permitir: "link"},
		{grupo: 3, tipo: "button", clase: "ql-image", title: "Insertar imagen", permitir: "image"},
		{grupo: 3, tipo: "button", clase: "ql-video", title: "Insertar video", permitir: "video"},

		{grupo: 4, tipo: "button", clase: "ql-clean", title: "Quitar formato"},
	],
};
