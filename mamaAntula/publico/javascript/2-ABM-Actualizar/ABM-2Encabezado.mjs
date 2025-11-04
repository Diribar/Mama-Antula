"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		tema: document.querySelector("#filtros select[name='tema_id']"),
		pestana: document.querySelector("#filtros select[name='pestana_id']"),
		encabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs del encabezado
		sectorEncabezado: document.querySelector("#sectorEncabezado"),
		encabezados: document.querySelectorAll("#sectorEncabezado .encabezado"),
		inputs: document.querySelectorAll("#sectorEncabezado .input"),

		// Íconos
		encabIconos: document.querySelector("#sectorEncabezado .iconos"),
		iconoGuardar: document.querySelector("#sectorEncabezado .iconos #guardar"),
		iconoEliminar: document.querySelector("#sectorEncabezado .iconos #eliminar"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/contenido/api/abm-guarda-encabezado",
		eliminaEncabezado: "/contenido/api/abm-elimina-encabezado/?id=",
	};

	// Funciones
	const actualizaElEncabezado = {
		consolidado: function () {
			// Muestra u oculta el sector
			this.actualizaLaVisibilidadDelSector();
			if (DOM.sectorEncabezado.classList.contains("ocultar")) return;

			// Muestra el encabezado que corresponde
			this.muestraElEncabezadoQueCorresponde();

			// Si el encabezado está visible, actualiza sus valores
			this.actualizaSusValores();

			// Fin
			return;
		},

		// Auxiliares
		actualizaLaVisibilidadDelSector: () => {
			// Si es 'encabSinIndice' y viene de un tema, lo oculta porque sus campos no poseen ningún valor
			if (cac.tipoEncab == "encabSinIndice" && !DOM.pestana.value) DOM.sectorEncabezado.classList.add("ocultar");
			else DOM.sectorEncabezado.classList.remove("ocultar");

			// Fin
			return;
		},
		muestraElEncabezadoQueCorresponde: () => {
			// Muestra el encabezado que corresponde, y oculta los demás
			for (const encabezado of DOM.encabezados)
				encabezado.classList[encabezado.id == cac.tipoEncab ? "remove" : "add"]("ocultar");

			// Fin
			return;
		},
		actualizaSusValores: () => {
			// Variables
			DOM.encabezado = document.querySelector("#sectorEncabezado .encabezado:not(.ocultar)");
			DOM.inputs = DOM.encabezado.querySelectorAll(".input");
			const encabezado = cac.encabezados.find((n) => n.id == DOM.encabezado.value);

			// Agrega los valores
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) agregaOpciones(cac[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value = (encabezado && encabezado[campo]) || "";
			}

			// Fin
			return;
		},
	};

	// Impactos del filtro - Actualiza el encabezado
	DOM.encabezado.addEventListener("change", () => {
		// Muestra el encabezado que corresponde, y oculta los demás
		actualizaElEncabezado.consolidado();

		// Actualiza los íconos
		DOM.encabIconos.querySelector("#eliminar").classList[DOM.encabezado.value == "nuevo" ? "add" : "remove"]("ocultar");

		// Fin
		return;
	});

	// Novedades en algún input - Muestra el botón de guardar
	for (const input of DOM.inputs) {
		input.addEventListener("input", () => {
			// Muestra el botón de guardar
			DOM.iconoGuardar.classList.remove("ocultar");

			// Les actualiza el título a guardar y eliminar
			const leyenda = DOM.filtroEncabezado.value == "nuevo" ? "Encabezado nuevo" : "Edición del encabezado";
			DOM.iconoGuardar.title = leyenda;
			DOM.iconoGuardar.title = leyenda;

			// Fin
			return;
		});
		input.addEventListener("change", () => {
			if (["titulo", "subTitulo"].includes(input.name)) input.value = inicialMayus(input.value);

			// Fin
			return;
		});
	}

	// Guarda/Actualiza en la BD
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Arma el feedback
		const formVisible = document.querySelector("#sectorEncabezado form:not(.ocultar)"); // elige el unico formulario visible
		console.log(formVisible);

		const formData = new FormData(formVisible);
		formData.append("entidad", cac.tipoEncab);
		formData.append("id", DOM.filtroEncabezado.value);
		if (cac.tipoEncab != "encabCartas")
			!cac.pestana_id ? formData.append("tema_id", cac.tema_id) : formData.append("pestana_id", cac.pestana_id);

		// Guarda el encabezado en la BD
		const respuesta = await fetch(rutas.guardaEncabezado, postForm(formData)).then((n) => n.json());

		// Guarda el nuevo_id en la cookie y establece que se actualicen los filtros por las cookies
		if (respuesta.id) {
			// Guarda la nueva cookie
			document.cookie = "actualizaEncabezado_id=" + respuesta.id;
			cac.startUp = true;

			// Se genera un change en el tema, para que se reinicie el filtro del encabezado
			DOM.tema.dispatchEvent(new Event("change"));
		}

		// Fin
		return;
	});

	// Elimina en la BD
	DOM.iconoEliminar.addEventListener("click", async () => {
		// Limpia el FE
		for (const input of DOM.encabezadoInputs) input.value = "";

		// Elimina de la BD, el encabezado y sus contenidos
		const datos = {entidad: cac.tipoEncab, id: DOM.filtroEncabezado.value};
		await fetch(rutas.eliminaEncabezado, deleteJson(datos));

		// Elimina la cookie
		document.cookie = "actualizaEncabezado_id=";
		cac.startUp = true;

		// Se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
		DOM.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	// Fin
	return;
});
