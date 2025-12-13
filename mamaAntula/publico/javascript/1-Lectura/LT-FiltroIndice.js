"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltroIndice = document.querySelector("#filtroIndice");
	const DOM = {
		titulos: domFiltroIndice.querySelectorAll(".titulo"),
	};

	// Eventos - Gira el ícono y muestra/oculta los encabezados
	for (const titulo of DOM.titulos)
		titulo.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			const mostrar = titulo.querySelector(".mostrar");
			if (!mostrar) return;
			mostrar.classList.toggle("girar");

			// Alterna entre mostrar y ocultar los encabezados
			const padre = titulo.closest(".tituloEncabs") || titulo.closest("#tituloFiltros");
			if (!padre) return;
			const encabsFiltros = padre.querySelector(".encabezados")||padre.querySelector("#filtros");
			encabsFiltros.classList.toggle("ocultar");
		});

	// Eventos - Si no se eligió un título o ícono, endereza todos los íconos y oculta los encabezados
	document.addEventListener("click", (e) => {
		// Si se eligió un título o ícono, interrumpe la función
		if (["titulo", "mostrar"].some((n) => e.target.classList.contains(n))) return;

		// Endereza todos los íconos y oculta los encabezados
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
