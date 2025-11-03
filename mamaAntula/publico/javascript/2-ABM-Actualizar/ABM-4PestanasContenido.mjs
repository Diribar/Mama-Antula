"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domPestanas = document.querySelectorAll("#pestanasGuardar .pestana");

	// Eventos
	for (const pestana of domPestanas)
		pestana.addEventListener("click", () => {
			document.cookie = "actualizaPestanaInput_id=" + pestana.id;
			for (const p of domPestanas) p.classList[p.id == pestana.id ? "add" : "remove"]("activo");
		});

	// Start-up
	const pestanaActiva = cookie("actualizaPestanaInput_id") || "textoImagen";
	for (const pestana of domPestanas) if (pestana.id == pestanaActiva) pestana.classList.add("activo");

	// Fin
	return;
});
