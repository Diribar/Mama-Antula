"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtros:{
			seccion: document.querySelector("#filtros select[name='seccion_id']"),
			tema: document.querySelector("#filtros select[name='tema_id']"),
			pestana: document.querySelector("#filtros select[name='pestana_id']"),
			encabezado: document.querySelector("#filtros select[name='encabezado']"),
		},

		// Inputs del encabezado
		encabezados: document.querySelectorAll("#encabezados .encabezado"),
		// encabCartas: document.querySelector("#encabezados #encabCartas"),
		// encabExpers: document.querySelector("#encabezados #encabExpers"),
		// encabSinIndice: document.querySelector("#encabezados #encabSinIndice"),

		// Inputs del contenido
		contenidoActual: document.querySelector("#contenidoActual"),
		contenidoNuevo: document.querySelector("#contenidoNuevo"),
	};
	const rutas = {
		datosIniciales: "/contenido/api/abm-datos-inciales",
		obtieneEncabs: "/contenido/api/abm-obtiene-encabezados/?",
	};
	const v = {
		...(await fetch(rutas.datosIniciales).then((n) => n && n.json())),
	};

	// Funciones
	const FN = {
		obtieneEncabs: async () => {
			// Limpieza inicial
			DOM.filtros.encabezado.innerHTML = "";

			// Variables
			const datos = "seccion_id=" + DOM.filtros.seccion.value + "&tema_id=" + DOM.filtros.tema.value + "&pestana_id=" + DOM.filtros.pestana.value;
			const encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n && n.json());

			// Crea las opciones
			for (const encabezado of encabezados) {
				const option = document.createElement("option");
				option.value = encabezado.id;
				option.textContent = encabezado.tituloCons || "Sin título";
				DOM.filtros.encabezado.appendChild(option);
			}

			// Crea una opción más para un título nuevo
			const option = document.createElement("option");
			option.value = "nuevo";
			option.textContent = "Título nuevo";
			DOM.filtros.encabezado.appendChild(option);

			// Muestra los encabezados y dispara el evento
			DOM.filtros.encabezado.classList.remove("ocultar");
			DOM.filtros.encabezado.dispatchEvent(new Event("change"));

			// Fin
			return;
		},
	};

	// Eventos de filtros
	DOM.filtros.seccion.addEventListener("change", () => {
		// Averigua si la sección es 'Experiencias'
		v.tipoEncab =
			DOM.filtros.seccion.value == v.secciones.find((n) => n.codigo == "experiencias")?.id ? "encabExpers" : "encabSinIndice";

		// TEMA - Limpieza inicial
		DOM.filtros.tema.innerHTML = "";
		DOM.filtros.pestana.classList.add("ocultar");

		// TEMA - Crea las opciones
		const seccion_id = DOM.filtros.seccion.value;
		const temasSecciones = v.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		for (const tema of temasSecciones) {
			// Crea la opción
			const option = document.createElement("option");
			option.value = tema.id;
			option.textContent = tema.titulo;
			DOM.filtros.tema.appendChild(option);
		}

		// TEMA - Los muestra y dispara el evento
		DOM.filtros.tema.classList.remove("ocultar");
		DOM.filtros.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.filtros.tema.addEventListener("change", () => {
		// Averigua si el tema es 'Cartas'
		if (v.tipoEncab != "encabExpers")
			v.tipoEncab =
				DOM.filtros.tema.value == v.temasSecciones.find((n) => n.codigo == "cartas")?.id ? "encabCartas" : "encabSinIndice";

		// PESTANA - Limpieza inicial
		DOM.filtros.pestana.innerHTML = "";

		// PESTANA - Si las tiene, las actualiza
		const tema_id = DOM.filtros.tema.value;
		const pestanasTemas = v.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (pestanasTemas.length) {
			// PESTANA - Crea las opciones
			for (const pestana of pestanasTemas) {
				// Crea la opción
				const option = document.createElement("option");
				option.value = pestana.id;
				option.textContent = pestana.titulo;
				DOM.filtros.pestana.appendChild(option);
			}

			// PESTANA - Las muestra y dispara el evento
			DOM.filtros.pestana.classList.remove("ocultar");
			DOM.filtros.pestana.dispatchEvent(new Event("change"));
		}
		// ENCABEZADO - Si no tiene pestañas, obtiene los encabezados
		else FN.obtieneEncabs();

		// Fin
		return;
	});
	DOM.filtros.pestana.addEventListener("change", () => FN.obtieneEncabs()); // ENCABEZADO - Los obtiene y genera el evento 'change'
	DOM.filtros.encabezado.addEventListener("change", async () => {
		// Variables
		const seccion_id = DOM.filtros.seccion.value;
		const tema_id = DOM.filtros.tema.value;

		// Averigua qué encabezado mostrar, y oculta los demás
		for (const encabezado of DOM.encabezados)
			encabezado.classList[encabezado.id == v.tipoEncab ? "remove" : "add"]("ocultar");

		// Actualiza el contenido del encabezado
		DOM.encab

		// Fin
		return;
	});

	// Startup
	DOM.filtros.seccion.dispatchEvent(new Event("change"));
});
