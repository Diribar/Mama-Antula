"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		seccion: document.querySelector("#filtros select[name='seccion_id']"),
		tema: document.querySelector("#filtros select[name='tema_id']"),
		pestana: document.querySelector("#filtros select[name='pestana_id']"),
		encabezado: document.querySelector("#filtros select[name='encabezado']"),
		anchorLectura: document.querySelector("a#linkLectura"),
	};
	const rutas = {
		datosIniciales: "/contenido/api/abm-datos-inciales",
		obtieneEncabs: "/contenido/api/abm-obtiene-encabezados/?",
	};
	cac = await fetch(rutas.datosIniciales).then((n) => n && n.json());
	const v = {startUp: true};

	// Funciones
	const FN = {
		actualizaFiltroEncabezado: async () => {
			// Si corresponde, oculta el sector encabezados - encabSinIndice solo puede tener un encabezado
			if (cac.tipoEncab == "encabSinIndice") DOM.encabezado.classList.add("ocultar");

			// Variables
			cac.seccion_id = DOM.seccion.value;
			cac.tema_id = DOM.tema.value;
			cac.pestana_id = DOM.pestana.value;

			// Obtiene los encabezados
			const datos = "seccion_id=" + cac.seccion_id + "&tema_id=" + cac.tema_id + "&pestana_id=" + cac.pestana_id;
			cac.encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n && n.json());

			// Crea las opciones
			agregaOpciones(cac.encabezados, DOM.encabezado, "tituloCons");

			// Si corresponde, crea la opción NUEVO - encabSinIndice siempre tiene un encabezado creado y no puede tener más de uno
			if (cac.tipoEncab != "encabSinIndice") {
				const option = document.createElement("option");
				option.value = "nuevo";
				option.textContent = "Encabezado nuevo";
				DOM.encabezado.appendChild(option);
			}

			// Muestra los encabezados y dispara el evento
			if (cac.tipoEncab != "encabSinIndice") DOM.encabezado.classList.remove("ocultar");
			DOM.encabezado.dispatchEvent(new Event("change"));

			// Fin
			return;
		},
		actualizaHref: () => {
			// Obtiene los url
			const urlSeccion = "/" + cac.secciones.find((n) => n.id == cac.seccion_id).url;
			const urlTema = "/" + cac.temasSecciones.find((n) => n.id == cac.tema_id).url;
			const urlPestana = (cac.pestana_id && "/" + cac.pestanasTemas.find((n) => n.id == cac.pestana_id).url) || "";

			// Actualiza el DOM
			DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + "/" + v.encabezado_id;

			// Fin
			return;
		},
	};

	// Eventos de filtros
	DOM.seccion.addEventListener("change", () => {
		// SECCION - Si es start-up, elige la opción de la cookie
		if (v.startUp && cookie("actualizaSeccion_id")) DOM.seccion.value = cookie("actualizaSeccion_id");

		// SECCIÓN - Guarda la cookie
		const seccion_id = DOM.seccion.value;
		if (!v.startUp) document.cookie = "actualizaSeccion_id=" + seccion_id;

		// Averigua si la sección es 'Experiencias'
		cac.tipoEncab =
			DOM.seccion.value == cac.secciones.find((n) => n.codigo == "experiencias")?.id ? "encabExpers" : "encabSinIndice";

		// TEMA - Crea las opciones
		const temasSecciones = cac.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		agregaOpciones(temasSecciones, DOM.tema, "titulo");

		// TEMA - Los muestra y dispara el evento
		DOM.tema.classList.remove("ocultar");
		DOM.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.tema.addEventListener("change", () => {
		// TEMA - Si es start-up, elige la opción de la cookie
		if (v.startUp && cookie("actualizaTema_id")) DOM.tema.value = cookie("actualizaTema_id");

		// TEMA -  Guarda la cookie
		const tema_id = DOM.tema.value;
		if (!v.startUp) document.cookie = "actualizaTema_id=" + tema_id;

		// Averigua si el tema es 'Cartas'
		if (cac.tipoEncab != "encabExpers")
			cac.tipoEncab =
				tema_id == cac.temasSecciones.find((n) => n.codigo == "cartas")?.id ? "encabCartas" : "encabSinIndice";

		// PESTAÑA - Crea las opciones
		cac.pestanasTema = cac.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (cac.pestanasTema.length) {
			// PESTANA - Crea las opciones
			agregaOpciones(cac.pestanasTema, DOM.pestana, "titulo");

			// PESTANA - Las muestra y dispara el evento
			DOM.pestana.classList.remove("ocultar");
			DOM.pestana.dispatchEvent(new Event("change"));
		}
		// ENCABEZADO - Si no tiene pestañas, obtiene los encabezados
		else {
			DOM.pestana.value = "";
			DOM.pestana.classList.add("ocultar");
			FN.actualizaFiltroEncabezado();
		}

		// Fin
		return;
	});
	DOM.pestana.addEventListener("change", () => {
		// PESTAÑA - Si es start-up, elige la opción de la cookie
		if (v.startUp && cookie("actualizaPestana_id")) DOM.pestana.value = cookie("actualizaPestana_id");
		delete v.startUp;

		// PESTAÑA -  Guarda la cookie
		const pestana_id = DOM.pestana.value;
		if (!v.startUp) document.cookie = "actualizaPestana_id=" + pestana_id;

		// ENCABEZADO - Los obtiene y genera el evento 'change'
		FN.actualizaFiltroEncabezado();
	});
	// Eventos del filtro de encabezado
	DOM.encabezado.addEventListener("change", async () => {
		// ENCABEZADO - Guarda la cookie
		if (!v.startUp) document.cookie = "actualizaEncabezado_id=" + DOM.encabezado.value;
		// ENCABEZADO - Si es start-up, elige la opción de la cookie
		else if (v.startUp) {
			if (cookie("actualizaEncabezado_id")) DOM.encabezado.value = cookie("actualizaEncabezado_id");
			delete v.startUp;
		}

		// Actualiza el anchor de flitros
		FN.actualizaHref();

		// Fin
		return;
	});

	// Startup
	DOM.seccion.dispatchEvent(new Event("change"));
});

// Variables
let cac; // compartirActualizarContenidos
const agregaOpciones = (opciones, domSelect, campoNombre) => {
	// Limpia las opciones del select
	domSelect.innerHTML = "";

	// Agrega las opciones
	for (const opcion of opciones) {
		const domOpcion = document.createElement("option");
		domOpcion.value = opcion.id;
		domOpcion.textContent = opcion[campoNombre] || "Sin título";
		domSelect.appendChild(domOpcion);
	}

	// Fin
	return;
};
