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
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],
	};

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => (archImagen = await obtieneNuevaImagen(e.dataTransfer.files)));
	DOM.inputImagen.addEventListener("change", async () => (archImagen = await obtieneNuevaImagen(DOM.inputImagen.files)));
	DOM.inputLeyenda.addEventListener("change", () => (DOM.inputLeyenda.value = inicialMayus(DOM.inputLeyenda.value)));

	// Evento click en el input - Busca un archivo de imagen
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
	// Eventos preventivos - Drag & Drop
	[...v.entrada, ...v.salida].forEach((evento) =>
		DOM.areaSoltar.addEventListener(evento, (e) => {
			e.preventDefault();

			// Eventos - Efectos visuales
			v.entrada.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima")));
			v.salida.forEach((evento) =>
				DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima"))
			);
		})
	);

	// Fin
	return;
});
