"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltroIndice = document.querySelector("#filtroIndice");
	const DOM = {
		titulos: domFiltroIndice.querySelectorAll(".titulo"),
	};

	// Eventos - click en el agrupador de encabezados
	for (const titulo of DOM.titulos)
		titulo.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			const mostrar = titulo.querySelector(".mostrar");
			if (!mostrar) return;
			mostrar.classList.toggle("girar");

			// Alterna entre mostrar y ocultar los encabezados
			const padre = titulo.closest(".tituloEncabs");
			if (!padre) return;
			const encabezados = padre.querySelector(".encabezados");
			encabezados.classList.toggle("ocultar");
		});

	document.addEventListener("click", (e) => {
		if (!["titulo", "mostrar"].some((n) => e.target.classList.contains(n)))
			for (const titulo of DOM.titulos) {
				// Endereza el ícono
				const mostrar = titulo.querySelector(".mostrar");
				if (!mostrar) continue;
				mostrar.classList.remove("girar");

				// Oculta los encabezados
				const padre = titulo.closest(".tituloEncabs");
				if (!padre) continue;
				const encabezados = padre.querySelector(".encabezados");
				encabezados.classList.add("ocultar");
			}
	});
});
