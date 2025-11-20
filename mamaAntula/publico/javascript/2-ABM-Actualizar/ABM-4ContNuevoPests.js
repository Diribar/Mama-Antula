"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domPestanas = document.querySelectorAll("#pestanasGuardar .pestana");

	// Eventos
	for (const pestana of domPestanas)
		pestana.addEventListener("click", () => {
			document.cookie = "actualizaContNuevo_id=" + pestana.id + "; path=/";
			for (const p of domPestanas) p.classList[p.id == pestana.id ? "add" : "remove"]("activo");
		});

	// Start-up
	const pestanaActiva = cookie("actualizaContNuevo_id") || "textoImagen";
	for (const pestana of domPestanas) if (pestana.id == pestanaActiva) pestana.classList.add("activo");

	// Fin
	return;
});
