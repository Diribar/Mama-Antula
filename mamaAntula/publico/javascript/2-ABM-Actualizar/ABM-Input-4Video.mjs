"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#layouts #video");
	const DOM = {
		barraHerrams: domLayout.querySelector(".barraHerrams"),
		input: domLayout.querySelector(".input"),
		output: domLayout.querySelector(".output"),
	};

	// Crea el botón en la barra de herramientas
	const button = document.createElement("button");
	button.classList.add("ql-video");
	button.title = "Insertar link de video";
	DOM.barraHerrams.appendChild(button);

	// Funciones - Inicializamos Quill
	const input = DOM.input; // el tag donde se pega el texto con formato
	const toolbar = DOM.barraHerrams; // el tag que contiene los botones
	const formats = ["video"]; // los botones
	const quill = new Quill(input, {modules: {toolbar}, formats, theme: "snow"});

	// Pule el input y lo pega en el output
	const actualizarContenido = () =>
		(DOM.output.value = quill.root.innerHTML
			// .replace("&nbsp;", " ") // reemplaza por espacios normales;
			// .replace(/\s+/g, " ") // reemplaza espacios duplicados
			// .replace(" </", "</") // reemplaza espacios mal puestos
			.trim()); // reemplaza espacios al final

	// EVENTO - Cambios en el input actualizan el output
	quill.on("text-change", actualizarContenido);

	// Fin
	return;
});
