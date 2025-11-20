"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #imagen");
	const DOM = {
		// Drag & Drop
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),
		vistaImagen: domLayout.querySelector("#areaSoltar img"),

		// Formulario
		inputLeyenda: domLayout.querySelector("[name='leyenda']"),
	};
	const v = {};

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => (archImagen = await nuevaImg(e.dataTransfer.files, DOM.vistaImagen)));
	DOM.inputImagen.addEventListener("change", async () => (archImagen = await nuevaImg(DOM.inputImagen.files, DOM.vistaImagen)));
	DOM.inputLeyenda.addEventListener("change", () => (DOM.inputLeyenda.value = inicialMayus(DOM.inputLeyenda.value)));
	otrosEventos(DOM);

	// Fin
	return;
});
