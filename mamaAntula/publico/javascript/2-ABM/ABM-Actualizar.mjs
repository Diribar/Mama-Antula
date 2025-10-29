"use strict";

window.addEventListener("load", async () => {
	console.log(123);

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

	// Eventos
	DOM.seccion.addEventListener("change", async () => {
		await actualizarTemas();
	});
	DOM.tema.addEventListener("change", async () => {
		await actualizarPestanas();
	});
	DOM.pestana.addEventListener("change", async () => {
		await actualizarTitulos();
	});
});