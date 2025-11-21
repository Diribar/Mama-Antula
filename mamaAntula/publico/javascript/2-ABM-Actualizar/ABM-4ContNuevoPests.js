"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltros = document.querySelector("#filtros");
	const contPestanas = document.querySelector("#pestanasGuardar");
	const DOM = {
		// Filtros
		temaFiltro: domFiltros.querySelector("select[name='tema_id']"),

		// Contenido nuevo
		pestanas: contPestanas.querySelectorAll(".pestana"),
	};
	const pestanaActiva = cookie("actualizaContNuevo_id") || "textoImagen";
	const filtrosNoEstandar = {
		libros: ["libro"],
		videos: ["texto", "video"],
		estampas: ["estampa"],
	};
	const pestanasNoEstandar = [
		"texto", // videos
		"libro", // libros
		"estampa", // estampas
	];

	// Funciones
	const particsPestanas = () => {
		// Variables
		const tema_id = DOM.temaFiltro.value;
		const temaCodigo = comp1234.temasSecciones.find((n) => n.id == tema_id)?.codigo;
		if (!temaCodigo) return;

		// Deja las pestañas que corresponden
		for (const pestana of DOM.pestanas) {
			// Averigua si la pestaña debe estar visible
			const mostrar =
				(!filtrosNoEstandar[temaCodigo] && !pestanasNoEstandar.includes(pestana.id)) || // el filtro es estándar y la pestaña también
				(filtrosNoEstandar[temaCodigo] && filtrosNoEstandar[temaCodigo].includes(pestana.id)); // el filtro no es estandar e incluye la pestaña

			// Muestra u Oculta la pestaña
			pestana.classList[mostrar ? "remove" : "add"]("ocultar");
		}

		// Se asegura de que la pestaña activa esté visible
		const domActiva = contPestanas.querySelector(".pestana.activo");
		if (!domActiva || domActiva.classList.contains("ocultar")) {
			// Inactiva la pestaña oculta
			if (domActiva) domActiva.classList.remove("activo");

			// Activa la primera pestaña visible
			const domVisible = contPestanas.querySelector(".pestana:not(.ocultar)");
			domVisible.classList.add("activo");

			// Guarda la cookie
			document.cookie = "actualizaContNuevo_id=" + domVisible.id + "; path=/";
		}
	};

	// Eventos - click en una pestaña
	for (const pestana of DOM.pestanas)
		pestana.addEventListener("click", () => {
			// Guarda la cookie
			document.cookie = "actualizaContNuevo_id=" + pestana.id + "; path=/";

			// Activa la pestaña activa y desactiva las demás
			for (const p of DOM.pestanas) {
				const addRemove = p.id == pestana.id ? "add" : "remove";
				p.classList[addRemove]("activo");
			}
		});

	// Eventos por cambio de tema
	DOM.temaFiltro.addEventListener("change", () => particsPestanas());

	// Start-up
	for (const pestana of DOM.pestanas) if (pestana.id == pestanaActiva) pestana.classList.add("activo"); // elige la pestaña activa
	contPestanas.classList.remove("invisible"); // muestra la barra de herramientas

	// Fin
	return;
});
