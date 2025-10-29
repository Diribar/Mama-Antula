"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtros: {
			seccion: document.querySelector("#filtros select[name='seccion_id']"),
			tema: document.querySelector("#filtros select[name='tema_id']"),
			pestana: document.querySelector("#filtros select[name='pestana_id']"),
			encabezado: document.querySelector("#filtros select[name='encabezado']"),
		},

		// Inputs del encabezado
		encabezados: document.querySelectorAll("#sectorEncabezados .encabezado"),

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
		actualizaFiltroEncab: async () => {
			// Limpieza inicial
			DOM.filtros.encabezado.innerHTML = "";

			// Variables
			const datos =
				"seccion_id=" +
				DOM.filtros.seccion.value +
				"&tema_id=" +
				DOM.filtros.tema.value +
				"&pestana_id=" +
				DOM.filtros.pestana.value;
			v.encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n && n.json());

			// Crea las opciones
			FN.agregaOpciones(v.encabezados, DOM.filtros.encabezado, "tituloCons");
			for (const encabezado of v.encabezados) {
				const option = document.createElement("option");
				option.value = encabezado.id;
				option.textContent = encabezado.tituloCons || "Sin título";
				DOM.filtros.encabezado.appendChild(option);
			}

			// Crea una opción más para un título nuevo
			const option = document.createElement("option");
			option.value = "nuevo";
			option.textContent = "Encabezado nuevo";
			DOM.filtros.encabezado.appendChild(option);

			// Muestra los encabezados y dispara el evento
			DOM.filtros.encabezado.classList.remove("ocultar");
			DOM.filtros.encabezado.dispatchEvent(new Event("change"));

			// Fin
			return;
		},
		actualizaEncabezado: () => {
			// Obtiene el DOM de los inputs
			DOM.encabezado = document.querySelector("#sectorEncabezados .encabezado:not(.ocultar)");
			DOM.inputs = DOM.encabezado.querySelectorAll(".input");

			// Actualiza los inputs
			v.encabezado_id = DOM.filtros.encabezado.value;
			v.encabezado = v.encabezados.find((n) => n.id == v.encabezado_id);
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) FN.agregaOpciones(v[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value = (v.encabezado && v.encabezado[campo]) || "";
			}

			// Fin
			return;
		},

		// Auxiliares
		agregaOpciones: (opciones, domSelect, campoNombre) => {
			for (const opcion of opciones) {
				const domOpcion = document.createElement("option");
				domOpcion.value = opcion.id;
				domOpcion.textContent = opcion[campoNombre] || "Sin título";
				domSelect.appendChild(domOpcion);
			}
			return;
		},
	};

	// Eventos de filtros
	DOM.filtros.seccion.addEventListener("change", () => {
		// Averigua si la sección es 'Experiencias'
		v.tipoEncab =
			DOM.filtros.seccion.value == v.secciones.find((n) => n.codigo == "experiencias")?.id
				? "encabExpers"
				: "encabSinIndice";

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
				DOM.filtros.tema.value == v.temasSecciones.find((n) => n.codigo == "cartas")?.id
					? "encabCartas"
					: "encabSinIndice";

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
		else FN.actualizaFiltroEncab();

		// Fin
		return;
	});
	DOM.filtros.pestana.addEventListener("change", () => FN.actualizaFiltroEncab()); // ENCABEZADO - Los obtiene y genera el evento 'change'
	DOM.filtros.encabezado.addEventListener("change", async () => {
		// Muestra el encabezado que corresponde, y oculta los demás
		for (const encabezado of DOM.encabezados)
			encabezado.classList[encabezado.id == v.tipoEncab ? "remove" : "add"]("ocultar");

		// Actualiza el encabezado
		FN.actualizaEncabezado();

		// Fin
		return;
	});

	// Startup
	DOM.filtros.seccion.dispatchEvent(new Event("change"));
});
