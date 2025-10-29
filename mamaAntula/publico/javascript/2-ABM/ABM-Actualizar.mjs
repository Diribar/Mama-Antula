"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		seccion: document.querySelector("#filtros select[name='seccion_id']"),
		tema: document.querySelector("#filtros select[name='tema_id']"),
		pestana: document.querySelector("#filtros select[name='pestana_id']"),
		titulo: document.querySelector("#filtros select[name='titulo']"),

		// Inputs del encabezado
		encabSinIndice: document.querySelector("#encabezado #encabSinIndice"),
		encabCartas: document.querySelector("#encabezado #encabCartas"),
		encabExps: document.querySelector("#encabezado #encabExps"),

		// Inputs del contenido
		contenidoActual: document.querySelector("#contenidoActual"),
		contenidoNuevo: document.querySelector("#contenidoNuevo"),
	};
	const v = {
		...(await fetch("/contenido/api/abm-datos-inciales").then((n) => n.json())),
	};

	// Eventos
	DOM.seccion.addEventListener("change", async () => {
		// Limpieza inicial
		DOM.tema.innerHTML = "";
		DOM.pestana.classList.add("ocultar");

		// Crea las opciones de temas
		const seccion_id = DOM.seccion.value;
		const temasSecciones = v.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		for (const tema of temasSecciones) {
			// Crea la opción
			const option = document.createElement("option");
			option.value = tema.tema_id;
			option.textContent = tema.titulo;
			DOM.tema.appendChild(option);
		}

		// Muestra los temas
		DOM.tema.classList.remove("ocultar");

		// Fin
		return;
	});
	DOM.tema.addEventListener("change", async () => {
		await actualizarPestanas();
	});
	DOM.pestana.addEventListener("change", async () => {
		await actualizarTitulos();
	});
});
