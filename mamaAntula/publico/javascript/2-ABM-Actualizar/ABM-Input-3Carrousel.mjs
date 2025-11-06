"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #carrousel");
	const DOM = {
		// Drag & Drop
		dragDrop: domLayout.querySelector("#dragDrop"),
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),

		// Otros
		carrImgs: domLayout.querySelector("#carrImgs"),
		imgModeloVista: domLayout.querySelector("img#modeloVistaImagen"),
		inputLeyenda: domLayout.querySelector("[name='leyenda']"),
	};
	console.log(DOM.areaSoltar);
	console.log(DOM.inputImagen);


	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],
		archCarrousel: null,
	};

	// Funciones
	const obtieneNuevaImagen = async function (archImagen) {
		// Crea un nuevo hijo
		const nuevaVistaImagen = DOM.imgModeloVista.cloneNode();

		// Acciones si no se cargó una imagen
		const nuevaImagen = await procesaArchImg(archImagen, nuevaVistaImagen);
		if (!nuevaImagen) return;

		// Actualiza vista
		nuevaVistaImagen.removeAttribute("id");
		DOM.carrImgs.appendChild(nuevaVistaImagen);

		// Actualiza variables
		archCarrousel = nuevaImagen;

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
let archCarrousel;
