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
	comp1234 = {startUp: true, ...(await fetch(rutas.datosIniciales).then((n) => n && n.json()))};
	const v = {};

	// Funciones
	const FN = {
		actualizaFiltroEncabezado: async () => {
			// Variables
			comp1234.seccion_id = DOM.seccion.value;
			comp1234.tema_id = DOM.tema.value;
			comp1234.pestana_id = DOM.pestana.value;

			// ENCABEZADO - Si corresponde, oculta el sector encabezados - 'sin índice' solo puede tener un encabezado
			if (!comp1234.conIndice) DOM.encabezado.classList.add("ocultar");

			// ENCABEZADO - Obtiene los encabezados
			const datos =
				"seccion_id=" + comp1234.seccion_id + "&tema_id=" + comp1234.tema_id + "&pestana_id=" + comp1234.pestana_id;
			comp1234.encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n && n.json());

			// ENCABEZADO - Crea las opciones
			agregaOpciones(comp1234.encabezados, DOM.encabezado, "tituloCons");

			// ENCABEZADO - Si 'conIndice', crea la opción NUEVO - sin indice siempre tiene un encabezado creado y no puede tener más de uno
			if (comp1234.conIndice) {
				const option = document.createElement("option");
				option.value = "nuevo";
				option.textContent = "Encabezado nuevo";
				DOM.encabezado.appendChild(option);
				DOM.encabezado.classList.remove("ocultar");
			}

			// ENCABEZADO - Si es start-up, elige la opción de la cookie
			if (comp1234.startUp && cookie("actualizaEncabezado_id")) DOM.encabezado.value = cookie("actualizaEncabezado_id");
			DOM.encabezado.dispatchEvent(new Event("change"));

			// Fin
			return;
		},
		actualizaHref: () => {
			// Obtiene los url
			const urlSeccion = "/" + comp1234.secciones.find((n) => n.id == comp1234.seccion_id).url;
			const urlTema = "/" + comp1234.temasSecciones.find((n) => n.id == comp1234.tema_id).url;
			const urlPestana =
				(comp1234.pestana_id && "/" + comp1234.pestanasTemas.find((n) => n.id == comp1234.pestana_id).url) || "";
			const urlEncabezado = (v.encabezado_id && "/" + v.encabezado_id) || "";

			// Actualiza el DOM
			DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + urlEncabezado;

			// Fin
			return;
		},
	};

	// Eventos de filtros
	DOM.seccion.addEventListener("change", () => {
		// SECCION - Si es start-up, elige la opción de la cookie
		if (comp1234.startUp && cookie("actualizaSeccion_id")) DOM.seccion.value = cookie("actualizaSeccion_id");

		// SECCIÓN - Guarda la cookie
		const seccion_id = DOM.seccion.value;
		if (!comp1234.startUp) document.cookie = "actualizaSeccion_id=" + seccion_id;

		// TEMA - Crea las opciones
		const temasSecciones = comp1234.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		agregaOpciones(temasSecciones, DOM.tema, "titulo");

		// TEMA - Los muestra y dispara el evento
		DOM.tema.classList.remove("ocultar");
		DOM.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.tema.addEventListener("change", () => {
		// TEMA - Si es start-up, elige la opción de la cookie
		if (comp1234.startUp && cookie("actualizaTema_id")) DOM.tema.value = cookie("actualizaTema_id");

		// TEMA -  Guarda la cookie
		const tema_id = DOM.tema.value;
		if (!comp1234.startUp) document.cookie = "actualizaTema_id=" + tema_id;

		// Averigua si el tema es 'Cartas'
		const temaActual = comp1234.temasSecciones.find((n) => n.id == tema_id);
		comp1234.esCarta = temaActual.codigo == "cartas";
		comp1234.conIndice = !!temaActual.indices.length;
		comp1234.tipoEncab = comp1234.esCarta ? "encabCartas" : comp1234.conIndice ? "encabConIndice" : "encabSinIndice";
		comp1234.entidad = comp1234.esCarta ? "encabCartas" : "encabResto";

		// PESTAÑA - Crea las opciones
		comp1234.pestanasTema = comp1234.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (comp1234.pestanasTema.length) {
			// PESTANA - Crea las opciones
			agregaOpciones(comp1234.pestanasTema, DOM.pestana, "titulo");

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
		if (comp1234.startUp && cookie("actualizaPestana_id")) DOM.pestana.value = cookie("actualizaPestana_id");
		delete comp1234.startUp;

		// PESTAÑA -  Guarda la cookie
		const pestana_id = DOM.pestana.value;
		if (!comp1234.startUp) document.cookie = "actualizaPestana_id=" + pestana_id;

		// ENCABEZADO - Los obtiene y genera el evento 'change'
		FN.actualizaFiltroEncabezado();
	});
	// Eventos del filtro de encabezado
	DOM.encabezado.addEventListener("change", async () => {
		// ENCABEZADO - Guarda la cookie
		if (!comp1234.startUp) document.cookie = "actualizaEncabezado_id=" + DOM.encabezado.value;
		else delete comp1234.startUp;

		// Actualiza el anchor de flitros
		FN.actualizaHref();

		// Fin
		return;
	});

	// Startup
	DOM.seccion.dispatchEvent(new Event("change"));
});

// Variables
let comp1234; // compartirActualizarContenidos
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
