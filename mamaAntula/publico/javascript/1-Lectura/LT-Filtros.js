"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltroIndice = document.querySelector("#filtroIndice");
	const DOM = {
		tituloEncabs: domFiltroIndice.querySelectorAll(".tituloEncabs"),
		mostrar: domFiltroIndice.querySelectorAll(".mostrar"),
	};

	// Eventos
	for (const mostrar of DOM.mostrar)
		mostrar.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			mostrar.classList.toggle("girar");

			// Alterna entre mostrar y ocultar los encabezados
			const padre = mostrar.closest(".tituloEncabs");
			const encabezados = padre.querySelector(".encabezados");
			encabezados.classList.toggle("ocultar");

			// Fin
			return;
		});
});
