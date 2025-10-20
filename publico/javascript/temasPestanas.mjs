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
		ulsPestanas: document.querySelectorAll("#contenidoTemas .pestanas"),
		pestanas: document.querySelectorAll(".pestanas .pestana"),
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
			// for ()


			// Actualiza las pestañas del tema
			const tema_id = tema.getAttribute("data-tema");
			for (const ulPestanas of DOM.ulsPestanas)
				ulPestanas.classList[ulPestanas.getAttribute("data-tema_id") == tema_id ? "remove" : "add"]("ocultar");

			// Fin
			return;
		});

	// Eventos - pestañas
	for (const revisarPestana of DOM.pestanas)
		revisarPestana.addEventListener("click", () => {
			const pestana_id = revisarPestana.getAttribute("data-pestana_id");
			for (const actPestana of DOM.pestanas)
				actPestana.classList[actPestana.getAttribute("data-pestana_id") == pestana_id ? "add" : "remove"]("activo");
		});

	// Fin
	return;
});

// Variables
const {pathname} = location;
