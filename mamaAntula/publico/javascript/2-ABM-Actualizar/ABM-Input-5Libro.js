"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #libro");
	const DOM = {
		// Drag & Drop
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),
		vistaImagen: domLayout.querySelector("#areaSoltar img"),

		// Otros campos del formulario
		titulo: domLayout.querySelector("[name='titulo']"),
		autor: domLayout.querySelector("[name='autor']"),
		anoLanzam: domLayout.querySelector("[name='anoLanzam']"),
		editorial: domLayout.querySelector("[name='editorial']"),
	};

	// Eventos drag & drop
	DOM.areaSoltar.addEventListener("drop", async (e) => (archLibro = await obtieneNuevaImagen(e.dataTransfer.files, DOM.vistaImagen)));
	otrosEventos(DOM);

	// Eventos del formulario
	DOM.inputImagen.addEventListener("change", async () => (archLibro = await obtieneNuevaImagen(DOM.inputImagen.files, DOM.vistaImagen)));
	DOM.titulo.addEventListener("change", () => (DOM.titulo.value = inicialMayus(DOM.titulo.value)));
	DOM.autor.addEventListener("change", () => (DOM.autor.value = inicialMayus(DOM.autor.value)));
	DOM.editorial.addEventListener("change", () => (DOM.editorial.value = inicialMayus(DOM.editorial.value)));

	// Fin
	return;
});
