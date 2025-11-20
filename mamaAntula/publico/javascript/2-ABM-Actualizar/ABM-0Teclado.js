"use strict";
window.addEventListener("load", async () => {
	const domEditables = document.querySelector("#editables");

	// Eventos de teclado
	document.addEventListener("keydown", (e) => {
		// Si el foco no está en el body, interrumpe la función
		if (document.activeElement != document.body) return;

		// se dirige al comienzo
		if (e.key == "Home") domEditables.scrollTo({top: 0, behavior: "smooth"});

		// se dirige al final
		if (e.key == "End") domEditables.scrollTo({top: domEditables.scrollHeight, behavior: "smooth"});

		// se desplaza hacia arriba
		if (e.key == "ArrowUp") domEditables.scrollBy({top: -domEditables.clientHeight, behavior: "smooth"});

		// se desplaza hacia abajo
		if (e.key == "ArrowDown") domEditables.scrollBy({top: domEditables.clientHeight, behavior: "smooth"});
	});

	// Fin
	return;
});
