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
	const handleFiles = (files) => {
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
			const image = new Image();
			image.src = reader.result; // valida que el contenido sea una imagen (renderizable)

			// Acciones si realmente es una imagen
			image.onload = async () => {
				// Actualiza la imagen visible
				DOM.vistaImagen.src = reader.result;

				// Actualiza el valor en el input
				DOM.inputImagen.value = DOM.inputImagen.files[0].name;

				// Fin
				return;
			};

			// Acciones si no es una imagen
			image.onerror = async () => alert("Solo se permiten imágenes.");
		};
	};

	// Muestra la imagen
	DOM.areaSoltar.addEventListener("drop", (e) => handleFiles(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", (e) => handleFiles(DOM.inputImagen.files));

	// Eventos - Efectos visuales
	[...entrada, ...salida].forEach((evento) => DOM.areaSoltar.addEventListener(evento, (e) => e.preventDefault())); // Prevenir comportamiento por defecto para drag & drop
	entrada.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima"))); // Efectos visuales de entrada
	salida.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima"))); // Efectos visuales de salida

	// Eventos - Busca el archivo
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
});
