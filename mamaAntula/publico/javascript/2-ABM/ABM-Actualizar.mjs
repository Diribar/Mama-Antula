"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		seccion: document.querySelector("#filtros select[name='seccion_id']"),
		tema: document.querySelector("#filtros select[name='tema_id']"),
		pestana: document.querySelector("#filtros select[name='pestana_id']"),
		encabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs del encabezado
		encabCartas: document.querySelector("#encabezado #encabCartas"),
		encabExpers: document.querySelector("#encabezado #encabExpers"),
		encabSinIndice: document.querySelector("#encabezado #encabSinIndice"),

		// Inputs del contenido
		contenidoActual: document.querySelector("#contenidoActual"),
		contenidoNuevo: document.querySelector("#contenidoNuevo"),
	};
	const rutas = {
		datosIniciales: "/contenido/api/abm-datos-inciales",
		obtieneEncabs: "/contenido/api/abm-obtiene-encabezados/?",
	};
	const v = {
		...(await fetch(rutas.datosIniciales).then((n) => n.json())),
	};

	// Funciones
	const FN = {
		obtieneEncabs: async () => {
			// Limpieza inicial
			DOM.encabezado.innerHTML = "";

			// Variables
			const datos = "seccion_id=" + DOM.seccion.value + "&tema_id=" + DOM.tema.value + "&pestana_id=" + DOM.pestana.value;
			const encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n.json());

			// Crea las opciones
			for (const encabezado of encabezados) {
				const option = document.createElement("option");
				option.value = encabezado.id;
				option.textContent = encabezado.tituloCons || "Sin título";
				DOM.encabezado.appendChild(option);
			}

			// Crea una opción más para un título nuevo
			const option = document.createElement("option");
			option.value = "nuevo";
			option.textContent = "Título nuevo";
			DOM.encabezado.appendChild(option);

			// Muestra las pestañas
			DOM.encabezado.classList.remove("ocultar");

			// Fin
			return;
		},
	};

	// Eventos de filtros
	DOM.seccion.addEventListener("change", () => {
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
	DOM.tema.addEventListener("change", () => {
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

			// Muestra las pestañas y dispara el evento en temas
			DOM.pestana.classList.remove("ocultar");
			DOM.pestana.dispatchEvent(new Event("change"));
		} else FN.obtieneEncabs();

		// Fin
		return;
	});
	DOM.pestana.addEventListener("change", () => FN.obtieneEncabs());
	DOM.encabezado.addEventListener("change", async () => {});
});
