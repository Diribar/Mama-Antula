"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		areaSoltar: document.querySelector("#formEdicion #areaSoltar"),
		botonImagen: document.querySelector("#formEdicion #areaSoltar button"),
		inputImagen: document.querySelector("#formEdicion #areaSoltar input"),
		vistaImagen: document.querySelector("#formEdicion #areaSoltar img"),
	};
	const entrada = ["dragenter", "dragover"];
	const salida = ["dragleave", "drop"];

	// Función para mostrar la imagen
	const procesaArchImg = (files) => {
		// Si no hay una imagen, interrumpe la función
		if (!files.length) return;

		// Si no tiene extensión de imagen, interrumpe la función
		const file = files[0];
		if (!file.type.startsWith("image/")) return alert("Solo se permiten imágenes.");

		const maxBytes = 2 * 1024 * 1024;
		if (file.size > maxBytes) alert("El archivo supera el tamaño máximo permitido (" + MAX_SIZE_MB + ")");

		// Lee el archivo
		const reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onload = () => {
			// Valida que el contenido sea una imagen (renderizable)
			const image = new Image();
			image.src = reader.result;

			// Acciones si realmente es una imagen
			image.onload = async () => {
				DOM.vistaImagen.src = reader.result; // hace visible la imagen
				archivoCargado = file; // guardamos el archivo en memoria
			};

			// Acciones si no es una imagen
			image.onerror = async () => alert("Solo se permiten imágenes.");
		};
	};

	// Muestra la imagen
	DOM.areaSoltar.addEventListener("drop", (e) => procesaArchImg(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", () => procesaArchImg(DOM.inputImagen.files));

	// Eventos - Efectos visuales
	[...entrada, ...salida].forEach((evento) => DOM.areaSoltar.addEventListener(evento, (e) => e.preventDefault())); // Prevenir comportamiento por defecto para drag & drop
	entrada.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima"))); // Efectos visuales de entrada
	salida.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima"))); // Efectos visuales de salida

	// Eventos - Busca el archivo
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
});

let archivoCargado;

