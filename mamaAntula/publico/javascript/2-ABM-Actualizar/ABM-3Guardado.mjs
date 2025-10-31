"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Guardado de títulos
		guardarEncabezado: document.querySelector("#sectorEncabezado #iconoGuardar"),

		// Guardado de contenido
		guardarContenido: document.querySelector("#sectorContNuevo #iconoGuardar"),
	};

	// Eventos
	DOM.confirma.addEventListener("click", () => location.reload());

	// Fin
	return;
});