"use strict";

window.addEventListener("load", async () => {
	const DOM = {

		iconoTema: document.querySelector("#menuTemas #iconoTemas"),
		listadoTemas: document.querySelector("#menuTemas #listadoTemas"),
		temas: document.querySelectorAll("#menuTemas #listadoTemas .tema"),
		pestanas: document.querySelectorAll(".pestana"),
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
			const tema_id = tema.getAttribute("data-tema");
		});

	// Fin
	return;
});

// Variables
const {pathname} = location;
