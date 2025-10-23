"use strict";

window.addEventListener("load", async () => {
	const dropArea = document.getElementById("drop-area");
	const fileInput = document.getElementById("fileElem");
	const preview = document.getElementById("preview");

	// Prevenir comportamiento por defecto para drag & drop
	["dragenter", "dragover", "dragleave", "drop"].forEach((eventName) => {
		dropArea.addEventListener(eventName, (e) => e.preventDefault());
	});

	// Efecto visual cuando arrastran sobre el área
	["dragenter", "dragover"].forEach((eventName) => {
		dropArea.addEventListener(eventName, () => dropArea.classList.add("dragover"));
	});

	["dragleave", "drop"].forEach((eventName) => {
		dropArea.addEventListener(eventName, () => dropArea.classList.remove("dragover"));
	});

	// Manejar el drop
	dropArea.addEventListener("drop", (e) => {
		const files = e.dataTransfer.files;
		handleFiles(files);
	});

	// Abrir selector al hacer clic
	dropArea.addEventListener("click", () => fileInput.click());
	fileInput.addEventListener("change", (e) => handleFiles(fileInput.files));

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
			preview.src = e.target.result;
			preview.style.display = "block";
		};
		reader.readAsDataURL(file);
	}
});
