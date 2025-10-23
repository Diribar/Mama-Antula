"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		areaSoltar: document.querySelector("#formEdicion #areaSoltar"),
		botonImagen: document.querySelector("#formEdicion #areaSoltar button"),
		inputImagen: document.querySelector("#formEdicion #areaSoltar input"),
		vistaImagen: document.querySelector("#formEdicion #areaSoltar img"),
	};
	DOM.botonImagen.addEventListener("click", () => DOM.inputImagen.click());
	const entrada = ["dragenter", "dragover"];
	const salida = ["dragleave", "drop"];

	// Manejar el drop
	DOM.areaSoltar.addEventListener("drop", (e) => {
		const files = e.dataTransfer.files;
		handleFiles(files);
	});

	// Abrir selector al hacer clic
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
	DOM.inputImagen.addEventListener("change", (e) => handleFiles(DOM.inputImagen.files));

	// Función para mostrar la imagen
	function handleFiles(files) {
		if (files.length === 0) return;
		const file = files[0];
		if (!file.type.startsWith("image/")) {
			alert("Solo se permiten imágenes.");
			return;
		}

		const reader = new FileReader();
		reader.onload = (e) => {
			DOM.vistaImagen.src = e.target.result;
			DOM.vistaImagen.style.display = "block";
		};
		reader.readAsDataURL(file);
	}

	// Eventos - Efectos visuales
	[...entrada, ...salida].forEach((evento) => DOM.areaSoltar.addEventListener(evento, (e) => e.preventDefault()));// Prevenir comportamiento por defecto para drag & drop
	entrada.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima")));// Efectos visuales de entrada
	salida.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima")));// Efectos visuales de salida

});
