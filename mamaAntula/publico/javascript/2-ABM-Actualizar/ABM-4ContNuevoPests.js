"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		contPestanas: document.querySelector("#pestanasGuardar"),
		pestanas: domPestsGuardar.querySelectorAll("#pestanasGuardar .pestana"),
	};
	const pestanaActiva = cookie("actualizaContNuevo_id") || "textoImagen";
	const pestanasOcasionales = [
		"texto", // videos
		"libros", // libros
		"estampas", // estampas
	];
	const filtrosSinPestanasStd = {
		libros: ["libros"],
		videos: ["texto", "videos"],
		estampas: ["estampas"],
	};

	// Rutina por pestaña
	for (const pestana of DOM.pestanas) {
		// Eventos
		pestana.addEventListener("click", () => {
			// Guarda la cookie
			document.cookie = "actualizaContNuevo_id=" + pestana.id + "; path=/";

			// Activa la pestaña activa y desactiva las demás
			for (const p of DOM.pestanas) {
				const addRemove = p.id == pestana.id ? "add" : "remove";
				p.classList[addRemove]("activo");
			}
		});

		// Start-up - elige la pestaña activa
		if (pestana.id == pestanaActiva) pestana.classList.add("activo");
	}

	// Start-up
	DOM.contPestanas.classList.remove("invisible");

	// Fin
	return;
});
