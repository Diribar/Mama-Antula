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
	const rutas={
		datosIniciales: "/contenido/api/abm-datos-inciales",
		obtieneTitulos: "/contenido/api/abm-obtiene-titulos",
	}
	const v = {
		...(await fetch(rutas.datosIniciales).then((n) => n.json())),
	};

	// Funciones
	const FN={
		obtieneTitulos: async () => {
			// Variables
			const titulos = await fetch(rutas.obtieneTitulos).then((n) => n.json());
			DOM.titulo.innerHTML = "";

			// Crea las opciones
			for (const titulo of titulos) {
				const option = document.createElement("option");
				option.value = titulo.titulo;
				option.textContent = titulo.titulo;
				DOM.titulo.appendChild(option);
			}
		}
	}

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
			option.value = tema.id;
			option.textContent = tema.titulo;
			DOM.tema.appendChild(option);
		}

		// Muestra los temas y dispara el evento en temas
		DOM.tema.classList.remove("ocultar");
		DOM.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.tema.addEventListener("change", async () => {
		// Limpieza inicial
		DOM.pestana.innerHTML = "";

		// Averigua si tiene pestañas
		const tema_id = DOM.tema.value;
		const pestanasTemas = v.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (pestanasTemas.length) {
			// Crea las opciones de pestanas
			for (const pestana of pestanasTemas) {
				// Crea la opción
				const option = document.createElement("option");
				option.value = pestana.id;
				option.textContent = pestana.titulo;
				DOM.pestana.appendChild(option);
			}

			// Muestra las pestañas
			DOM.pestana.classList.remove("ocultar");
		}else {
			// Obtiene los títulos
			// Crea las opciones de títulos
			for (const pestana of pestanasTemas) {
				// Crea la opción
				const option = document.createElement("option");
				option.value = pestana.id;
				option.textContent = pestana.titulo;
				DOM.pestana.appendChild(option);
			}

			// Muestra las pestañas
			DOM.pestana.classList.remove("ocultar");

		}

		// Fin
		return;
	});
	DOM.pestana.addEventListener("change", async () => {});
	DOM.titulos.addEventListener("change", async () => {});
});
