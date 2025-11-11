"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		body: document.body,
		imagenes: document.querySelectorAll(".imgLeyenda .imagen"),
	};
	if (!DOM.imagenes.length) return;

	// Crea el fondoImg negro
	const fondoImg = document.createElement("div");
	fondoImg.id = "fondoImg";
	fondoImg.classList.add("ocultar", "absoluteCentro");
	DOM.body.appendChild(fondoImg);

	// Genera un modal por imagen
	for (const imagen of DOM.imagenes) {
		// Crea la imagen
		const img = document.createElement("img");
		img.src = imagen.src;
		img.classList.add("imgGrande", "ocultar");
		fondoImg.appendChild(img);

		// Eventos
		imagen.addEventListener("click", () => {
			fondoImg.classList.remove("ocultar");
			img.classList.remove("ocultar");
		});
	}

	// Eventos
	fondoImg.addEventListener("click", () => {
		fondoImg.classList.add("ocultar");
		fondoImg.querySelector(".imgGrande:not(.ocultar)").classList.add("ocultar");
	});
	window.addEventListener("keydown", (e) => e.key == "Escape" && fondoImg.dispatchEvent(new Event("click")));
});
