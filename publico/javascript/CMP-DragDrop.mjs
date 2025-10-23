"use strict";

window.addEventListener("load", async () => {
	const areaSoltar = document.getElementById("drop-area");
	const inputImagen = document.getElementById("fileElem");
	const vistaImagen = document.getElementById("vistaImagen");

	// Prevenir comportamiento por defecto para drag & drop
	["dragenter", "dragover", "dragleave", "drop"].forEach((eventName) => {
		areaSoltar.addEventListener(eventName, (e) => e.preventDefault());
	});

	// Efecto visual cuando arrastran sobre el área
	["dragenter", "dragover"].forEach((eventName) => {
		areaSoltar.addEventListener(eventName, () => areaSoltar.classList.add("encima"));
	});

	["dragleave", "drop"].forEach((eventName) => {
		areaSoltar.addEventListener(eventName, () => areaSoltar.classList.remove("encima"));
	});

	// Manejar el drop
	areaSoltar.addEventListener("drop", (e) => {
		const files = e.dataTransfer.files;
		handleFiles(files);
	});

	// Abrir selector al hacer clic
	areaSoltar.addEventListener("click", () => inputImagen.click());
	inputImagen.addEventListener("change", (e) => handleFiles(inputImagen.files));

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
			vistaImagen.src = e.target.result;
			vistaImagen.style.display = "block";
		};
		reader.readAsDataURL(file);
	}
});
