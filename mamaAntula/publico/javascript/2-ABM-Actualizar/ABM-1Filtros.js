"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		seccion: document.querySelector("#filtros select[name='seccion_id']"),
		tema: document.querySelector("#filtros select[name='tema_id']"),
		pestana: document.querySelector("#filtros select[name='pestana_id']"),
		encabezado: document.querySelector("#filtros select[name='encabezado']"),
		anchorLectura: document.querySelector("footer #iconosFooterOtros a#lectura"),
	};
	const rutas = {
		datosIniciales: "/articulos/api/abm-filtros-datos-inciales",
		obtieneEncabs: "/articulos/api/abm-filtros-obtiene-encabezados/?",
	};
	comp1234 = {startUp: true, ...(await fetch(rutas.datosIniciales).then((n) => n.json()))};
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
			const respuesta = await fetch(rutas.obtieneEncabs + datos).then((n) => n.json());

			// ENCABEZADO - Si hubo un error, muestra el mensaje e interrumpe la función
			if (respuesta.error) {
				if (respuesta.error.includes("[horario]")) {
					// Variables
					const horario = new Date(respuesta.horario);
					const fechaResp = horario.getDate() + "/" + mesesAbrev[horario.getMonth()];
					const hora = horario.getHours();
					const minutos = String(horario.getMinutes()).padStart(2, "0");
					const horaResp = " a las " + hora + ":" + minutos + "hs";
					const horarioLocal = fechaResp + horaResp;

					// Reemplaza el texto
					respuesta.error = respuesta.error.replace("[horario]", horarioLocal);
				}

				// Configuraciones
				DOM.encabezado.innerHTML = "";
				delete comp1234.startUp;

				// Muestra el error e interrumpe la función
				return carteles.error(respuesta.error);
			}

			// ENCABEZADO - Guarda los encabezados
			comp1234.encabezados = respuesta;

			// ENCABEZADO - Crea las opciones
			const campo = comp1234.esLugares ? "tituloAbm" : "tituloElab";
			agregaOpciones(comp1234.encabezados, DOM.encabezado, campo);

			// ENCABEZADO - Si 'conIndice', crea la opción NUEVO - sin indice siempre tiene un encabezado creado y no puede tener más de uno
			if (comp1234.conIndice) {
				const option = document.createElement("option");
				option.value = "nuevo";
				option.textContent = "Encabezado nuevo";
				DOM.encabezado.prepend(option);
				DOM.encabezado.classList.remove("ocultar");
			}

			// ENCABEZADO - Si es start-up, elige la opción de la cookie
			const valoresPosiblesOpciones = Array.from(DOM.encabezado.querySelectorAll("option")).map((n) => n.value);
			v.encab_id = cookie("actualizaEncabezado_id");
			if (comp1234.startUp && v.encab_id && valoresPosiblesOpciones.includes(v.encab_id)) DOM.encabezado.value = v.encab_id;
			delete comp1234.startUp;

			// ENCABEZADO - Dispara el evento
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
			const urlEncabezado = comp1234.conIndice ? "/?id=" + v.encab_id : "";

			// Actualiza el DOM
			DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + urlEncabezado;

			// Fin
			return;
		},
	};

	// Eventos de filtros
	DOM.seccion.addEventListener("change", () => {
		// SECCION - Si es start-up, elige la opción de la cookie
		let seccion_id = cookie("actualizaSeccion_id");
		if (comp1234.startUp && seccion_id && comp1234.secciones.find((n) => n.id == seccion_id)) DOM.seccion.value = seccion_id;
		else delete comp1234.startUp; // si no se pudo elegir la cookie, descarta las futuras cookies

		// SECCIÓN - Guarda la cookie
		seccion_id = DOM.seccion.value;
		if (!comp1234.startUp) document.cookie = "actualizaSeccion_id=" + seccion_id + "; path=/";

		// TEMA - Crea las opciones
		const temasSecciones = comp1234.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		agregaOpciones(temasSecciones, DOM.tema, "titulo");

		// TEMA - Elige el tema
		v.temasPosibles = comp1234.temasSecciones.filter((n) => n.seccion_id == DOM.seccion.value);
		const tema_id = cookie("actualizaTema_id");

		// TEMA - Si es start-up, elige la opción de la cookie
		if (comp1234.startUp && tema_id && v.temasPosibles.find((n) => n.id == tema_id)) DOM.tema.value = tema_id;
		else delete comp1234.startUp; // si no se pudo elegir la cookie, descarta las futuras cookies

		// TEMA - Los muestra y dispara el evento
		DOM.tema.classList.remove("ocultar");
		DOM.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.tema.addEventListener("change", () => {
		// TEMA -  Guarda la cookie
		const tema_id = DOM.tema.value;
		if (!comp1234.startUp) document.cookie = "actualizaTema_id=" + tema_id + "; path=/";

		// Averigua si el tema es 'Cartas'
		comp1234.temaActual = comp1234.temasSecciones.find((n) => n.id == tema_id);
		comp1234.esCarta = comp1234.temaActual.codigo == "cartas";
		comp1234.esLugares = comp1234.temaActual.codigo == "lugaresDevocion";
		comp1234.conIndice = !!(comp1234.temaActual.indicesFecha.length || comp1234.temaActual.indicesLugar.length);
		comp1234.tipoEncab =
			(comp1234.esCarta && "encabCartas") ||
			(comp1234.esLugares && "encabLugares") ||
			(comp1234.conIndice && "encabConIndice") ||
			"encabSinIndice";

		// PESTAÑA - Crea las opciones
		comp1234.pestanasTema = comp1234.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (comp1234.pestanasTema.length) {
			// PESTANA - Crea las opciones
			agregaOpciones(comp1234.pestanasTema, DOM.pestana, "titulo");

			// PESTAÑA - Si es start-up, elige la opción de la cookie
			const pestana_id = cookie("actualizaPestana_id");
			const pestanasPosibles = comp1234.pestanasTema.filter((n) => n.tema_id == DOM.tema.value);
			if (comp1234.startUp && pestana_id && pestanasPosibles.find((n) => n.id == pestana_id))
				DOM.pestana.value = pestana_id;
			else delete comp1234.startUp; // si no se pudo elegir la cookie, descarta las futuras cookies

			// PESTANA - Las muestra y dispara el evento
			DOM.pestana.classList.remove("ocultar");
			DOM.pestana.dispatchEvent(new Event("change"));
		}
		// ENCABEZADO - Si no tiene pestañas, obtiene los encabezados
		else {
			DOM.pestana.value = "";
			document.cookie = "actualizaPestana_id=; path=/";
			DOM.pestana.classList.add("ocultar");
			FN.actualizaFiltroEncabezado();
		}

		// Fin
		return;
	});
	DOM.pestana.addEventListener("change", () => {
		// PESTAÑA -  Guarda la cookie
		const pestana_id = DOM.pestana.value;
		if (!comp1234.startUp) document.cookie = "actualizaPestana_id=" + pestana_id + "; path=/";

		// ENCABEZADO - Los obtiene y genera el evento 'change'
		FN.actualizaFiltroEncabezado();
	});
	// Eventos del filtro de encabezado
	DOM.encabezado.addEventListener("change", async () => {
		// ENCABEZADO - Guarda la cookie
		document.cookie = "actualizaEncabezado_id=" + DOM.encabezado.value + "; path=/";

		// Actualiza el anchor de flitros
		v.encab_id = DOM.encabezado.value;
		FN.actualizaHref();

		// Hace scroll hacia abajo
		setTimeout(() => {
			const domEditables = document.querySelector("#editables");
			domEditables.scrollTo({top: domEditables.scrollHeight, behavior: "smooth"});
		}, 100);

		// Fin
		return;
	});

	// Startup
	DOM.seccion.dispatchEvent(new Event("change"));
});

// Variables
let comp1234; // compartirActualizarContenidos
const agregaOpciones = (opciones, domSelect, campoNombre) => {
	// Averigua si tiene una opción sin valor, para conservarla
	const opcSinValor = domSelect.querySelector("option[value='']");

	// Limpia las opciones del select
	domSelect.innerHTML = "";
	if (opcSinValor) domSelect.appendChild(opcSinValor);

	// Agrega las opciones
	for (const opcion of opciones) {
		// Si corresponde, saltea la rutina
		if (opcion.codigo == "1introduccion") continue;

		// Crea la opción
		const domOpcion = document.createElement("option");
		domOpcion.value = opcion.id;
		domOpcion.textContent = opcion[campoNombre] || "Sin título";

		// Agrega la opción
		domSelect.appendChild(domOpcion);
	}

	// Fin
	return;
};
