"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #libro");
	const DOM = {
		// Drag & Drop
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),
		vistaImagen: domLayout.querySelector("#areaSoltar img"),
	};
	const camposInicialMayus = ["titulo", "subTitulo", "autor", "editorial"];

	// Eventos drag & drop
	otrosEventos(DOM);
	eventoDragDrop(DOM, archLibro);

	// Eventos del formulario
	DOM.inputImagen.addEventListener(
		"change",
		async () => (archLibro = await obtieneNuevaImagen(DOM.inputImagen.files, DOM.vistaImagen))
	);
	for (const campo of camposInicialMayus) {
		DOM[campo] = domLayout.querySelector("[name='" + campo + "']");
		DOM[campo].addEventListener("change", () => (DOM[campo].value = inicialMayus(DOM[campo].value)));
	}

	// Fin
	return;
});
