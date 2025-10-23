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
		// Si no había una imagen, interrumpe la función
		if (!files.length) return;

		// Si no es una imagen, interrumpe la función
		const file = files[0];
		if (!file.type.startsWith("image/")) return alert("Solo se permiten imágenes.");

		const reader = new FileReader();
		reader.onload = (e) => {
			DOM.vistaImagen.src = e.target.result;
			DOM.vistaImagen.style.display = "block";
		};
		reader.readAsDataURL(file);
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
