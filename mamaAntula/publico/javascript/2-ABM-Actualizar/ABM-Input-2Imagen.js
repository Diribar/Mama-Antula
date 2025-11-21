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

	// Eventos drag & drop
	DOM.areaSoltar.addEventListener(
		"drop",
		async (e) => (archImagen = await obtieneNuevaImagen(e.dataTransfer.files, DOM.vistaImagen))
	);
	otrosEventos(DOM);

	// Eventos del formulario
	DOM.inputImagen.addEventListener(
		"change",
		async () => (archImagen = await obtieneNuevaImagen(DOM.inputImagen.files, DOM.vistaImagen))
	);
	DOM.inputLeyenda.addEventListener("change", () => (DOM.inputLeyenda.value = inicialMayus(DOM.inputLeyenda.value)));

	// Fin
	return;
});
