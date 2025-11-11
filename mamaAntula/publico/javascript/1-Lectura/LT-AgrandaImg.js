"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		body: document.body,
		imagenes: document.querySelectorAll(".imgLeyenda .imagen"),
	};
	if (!DOM.imagenes.length) return;

	// Crea el fondo negro
	const fondo = document.createElement("div");
	fondo.classList.add("fondo", "ocultar");
	DOM.body.appendChild(fondo);

	// Genera un modal por imagen
	for (const imagen of DOM.imagenes) {
		// Crea la imagen
		const img = document.createElement("img");
		img.src = imagen.src;
		img.classList.add("imgGrande", "ocultar");
		fondo.appendChild(img);

		// Eventos
		imagen.addEventListener("click", () => {
			fondo.classList.remove("ocultar");
			img.classList.remove("ocultar");
		});
	}

	// Eventos
	fondo.addEventListener("click", () => {
		fondo.classList.add("ocultar");
		fondo.querySelector(".imgGrande").classList.add("ocultar");
	});
});
