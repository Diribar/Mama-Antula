"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Menú de temas
		iconoMenuTemas: document.querySelector("#menuTemas #iconoMenuTemas"),
		menuTemas: document.querySelector("#menuTemas #menuTemas"),
		temas: document.querySelectorAll("#menuTemas #menuTemas .tema"),
		tituloTema: document.querySelector("#menuTituloTema #tituloTema"),

		// Contenido
		contenidosTema: document.querySelectorAll("#contenidoTemas .contenidoTema"),
		listadosPestanas: document.querySelectorAll("#contenidoTemas .listadoPestanas"),
		contenidoPestanas: document.querySelectorAll(".contenidoPestana"),
	};
	const v = {
		...(await fetch("/api/temas-pestanas/?url=" + pathname).then((res) => res.json())),
	};

	// Eventos - temas
	for (const tema of DOM.temas)
		tema.addEventListener("click", () => {
			// Variables
			const tema_id = tema.getAttribute("data-tema_id");

			// Actualiza el título del tema
			DOM.tituloTema.textContent = tema.textContent;

			// Muestra el contenido del tema activo, y oculta el de los demás
			for (const contenidoTema of DOM.contenidosTema)
				contenidoTema.classList[contenidoTema.getAttribute("data-tema_id") == tema_id ? "remove" : "add"]("ocultar");

			// Muestra el listado de pestañas del tema, y oculta los demás
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
				// Variables
				const pestana_id = pestanaActiva.getAttribute("data-pestana_id");

				// Activa la pestaña actual, y desactiva las demás
				for (const pestana of pestanas)
					pestana.classList[pestana.getAttribute("data-pestana_id") == pestana_id ? "add" : "remove"]("activo");

				// Muestra el contenido de la pestaña activa, y oculta el de las demás
				for (const contenidoPestana of DOM.contenidoPestanas)
					contenidoPestana.classList[contenidoPestana.getAttribute("data-pestana_id") == pestana_id ? "remove" : "add"](
						"ocultar"
					);
			});
	}

	// Fin
	return;
});

// Variables
const {pathname} = location;
