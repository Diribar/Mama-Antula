"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		pestanas: document.querySelectorAll("#pestanas .pestana"),
	};

	// Eventos
	for (const pestana of DOM.pestanas)
		pestana.addEventListener("click", () => {
			document.cookie = "actualizaPestanaInput_id=" + pestana.id;
			for (const p of DOM.pestanas) p.classList[p.id == pestana.id ? "add" : "remove"]("activo");
		});

	// Start-up
	const pestanaActiva = cookie("actualizaPestanaInput_id") || "textoImagen";
	for (const pestana of DOM.pestanas) if (pestana.id == pestanaActiva) pestana.classList.add("activo");

	// Fin
	return;
});
