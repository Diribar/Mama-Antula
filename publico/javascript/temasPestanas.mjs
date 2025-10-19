"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Menú de temas
		iconoMenuTemas: document.querySelector("#menuTemas #iconoMenuTemas"),
		menuTemas: document.querySelector("#menuTemas #menuTemas"),
		temas: document.querySelectorAll("#menuTemas #menuTemas .tema"),
		tituloTema: document.querySelector("#menuTituloTema #tituloTema"),

		// Contenido
		contenidoTema: document.querySelectorAll("#contenidoTemas .contenidoTema"),
		listadosPestanas: document.querySelectorAll("#contenidoTemas .listadoPestanas"),
		contenidoPestanas: document.querySelectorAll(".contenidoPestanas"),
	};
	const v = {
		...(await fetch("/api/temas-pestanas/?url=" + pathname).then((res) => res.json())),
	};

	// Eventos - iconoMenuTemas
	DOM.iconoMenuTemas.addEventListener("click", () => DOM.menuTemas.classList.toggle("ocultar"));

	// Eventos - temas
	for (const tema of DOM.temas)
		tema.addEventListener("click", () => {
			// Actualiza el título del tema
			DOM.tituloTema.textContent = tema.textContent;

			// Actualiza el contenido visible del tema
			// for (const contenidoTema of DOM.contenidoTema)

			// Muestra el listado de pestañas del tema, y oculta los demás
			const tema_id = tema.getAttribute("data-tema");
			for (const listadoPestanas of DOM.listadosPestanas)
				listadoPestanas.classList[listadoPestanas.getAttribute("data-tema_id") == tema_id ? "remove" : "add"]("ocultar");

			// Fin
			return;
		});

	// Eventos - pestañas
	for (const listadoPestanas of DOM.listadosPestanas) {
		const pestanas = listadoPestanas.querySelectorAll(".pestana");
		for (const pestanaActiva of pestanas)
			pestanaActiva.addEventListener("click", () => {
				const pestana_id = pestanaActiva.getAttribute("data-pestana_id");

				// Muestra la pestaña activa, y desactiva las demás
				for (const pestana of pestanas)
					pestana.classList[pestana.getAttribute("data-pestana_id") == pestana_id ? "add" : "remove"]("activo");
			});
	}

	// Fin
	return;
});

// Variables
const {pathname} = location;
