"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		tituloTema: document.querySelector("#menuTituloTema #tituloTema"),
		iconoTema: document.querySelector("#menuTemas #iconoTemas"),
		listadoTemas: document.querySelector("#menuTemas #listadoTemas"),
		temas: document.querySelectorAll("#menuTemas #listadoTemas .tema"),
		ulsPestanas: document.querySelectorAll("#contenidoTemas .pestanas"),
		pestanas: document.querySelectorAll(".pestanas .pestana"),
	};
	const v = {
		...(await fetch("/api/temas-pestanas/?url=" + pathname).then((res) => res.json())),
	};
	console.log(v);

	// Eventos - iconoTema
	DOM.iconoTema.addEventListener("click", () => DOM.listadoTemas.classList.toggle("ocultar"));

	// Eventos - temas
	for (const tema of DOM.temas)
		tema.addEventListener("click", () => {
			// Actualiza el título del tema
			DOM.tituloTema.textContent = tema.textContent;

			// Actualiza las pestañas
			const tema_id = tema.getAttribute("data-tema");
			for (const ulPestanas of DOM.ulsPestanas)
				ulPestanas.classList[ulPestanas.getAttribute("data-tema_id") == tema_id ? "remove" : "add"]("ocultar");

			// Fin
			return;
		});

	// Fin
	return;
});

// Variables
const {pathname} = location;
