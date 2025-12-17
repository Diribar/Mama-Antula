"use strict";

window.addEventListener("load", () => {
	// Variables
	const DOM = {
		fondoImg: document.querySelector("main #fondoImg"),
		imagenes: document.querySelectorAll("#cuerpo img:not(.noAgrandar)"),
	};
	if (!DOM.imagenes.length) return;

	// Genera un modal por imagen
	for (const imagen of DOM.imagenes) {
		// Crea la imagen
		const img = document.createElement("img");
		img.src = imagen.src;
		img.classList.add("imgGrande", "ocultar");
		DOM.fondoImg.appendChild(img);

		// Eventos
		imagen.addEventListener("click", () => {
			DOM.fondoImg.classList.remove("ocultar");
			img.classList.remove("ocultar");
		});
	}

	// Eventos
	DOM.fondoImg.addEventListener("click", () => {
		DOM.fondoImg.classList.add("ocultar");
		DOM.fondoImg.querySelector(".imgGrande:not(.ocultar)").classList.add("ocultar");
	});
	window.addEventListener("keydown", (e) => e.key == "Escape" && fondoImg.dispatchEvent(new Event("click")));
});
