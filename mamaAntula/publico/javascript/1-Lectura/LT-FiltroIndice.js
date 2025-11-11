"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltroIndice = document.querySelector("#filtroIndice");
	const DOM = {
		titulos: domFiltroIndice.querySelectorAll(".titulo"),
	};

	// Eventos
	for (const titulo of DOM.titulos)
		titulo.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			const mostrar = titulo.querySelector(".mostrar");
			mostrar.classList.toggle("girar");

			// Alterna entre mostrar y ocultar los encabezados
			const padre = titulo.closest(".tituloEncabs");
			const encabezados = padre.querySelector(".encabezados");
			encabezados.classList.toggle("ocultar");

			// Fin
			return;
		});
});
