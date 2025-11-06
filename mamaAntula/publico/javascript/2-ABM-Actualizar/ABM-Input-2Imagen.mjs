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
		archImagen: null,
	};

	// Funciones
	const obtieneNuevaImagen = async function (archImagen) {
		// Acciones si no se cargó una imagen
		const nuevaImagen = await procesaArchImg(archImagen, DOM.vistaImagen);
		if (!nuevaImagen) return;

		// Actualiza variables
		archImagen = nuevaImagen;

		// Fin
		return;
	};

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => await obtieneNuevaImagen(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", async () => await obtieneNuevaImagen(DOM.inputImagen.files));
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

// Variables
let archImagen;
