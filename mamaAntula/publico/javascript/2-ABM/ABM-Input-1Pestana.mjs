"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		pestanas: document.querySelectorAll("#pestanas .pestana"),
	};

	// Eventos
	for (const pestana of DOM.pestanas)
		pestana.addEventListener("click", () => {
			for (const p of DOM.pestanas) p.classList[p.id == pestana.id ? "add" : "remove"]("activo");
		});
});
