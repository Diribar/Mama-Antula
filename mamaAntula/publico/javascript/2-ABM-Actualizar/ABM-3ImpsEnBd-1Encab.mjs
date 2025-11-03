"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroTema: document.querySelector("#filtros select[name='tema_id']"),
		filtroPestana: document.querySelector("#filtros select[name='pestana_id']"),
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Encabezado
		encabezadoInputs: document.querySelectorAll("#sectorEncabezado .input"),
		guardaEncabezado: document.querySelector("#sectorEncabezado #guardar"),
		eliminaEncabezado: document.querySelector("#sectorEncabezado #eliminar"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/contenido/api/abm-guarda-encabezado",
		eliminaEncabezado: "/contenido/api/abm-elimina-encabezado/?id=",
	};

	// Impacto en FE - Muestra el botón de guardar el encabezado
	for (const encabezadoInput of DOM.encabezadoInputs) {
		encabezadoInput.addEventListener("input", () => {
			// Muestra el botón de guardar
			DOM.guardaEncabezado.classList.remove("ocultar");

			// Les actualiza el título a guardar y eliminar
			const leyenda = DOM.filtroEncabezado.value == "nuevo" ? "Encabezado nuevo" : "Edición del encabezado";
			DOM.guardaEncabezado.title = leyenda;
			DOM.eliminaEncabezado.title = leyenda;

			// Fin
			return;
		});
		encabezadoInput.addEventListener("change", () => {
			if (["titulo", "subTitulo"].includes(encabezadoInput.name))
				encabezadoInput.value = inicialMayus(encabezadoInput.value);

			// Fin
			return;
		});
	}

	// Impacto en BD (encabezado - nuevo) - Guarda/Actualiza
	DOM.guardaEncabezado.addEventListener("click", async () => {
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

			// Se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
			DOM[!cac.pestanasTema.length ? "filtroTema" : "filtroPestana"].dispatchEvent(new Event("change"));
		}

		// Fin
		return;
	});

	// Impacto en BD (encabezado - original) - Elimina
	DOM.eliminaEncabezado.addEventListener("click", async () => {
		// Limpia el FE
		for (const input of DOM.encabezadoInputs) input.value = "";

		// Elimina de la BD, el encabezado y sus contenidos
		const datos = {entidad: cac.tipoEncab, id: DOM.filtroEncabezado.value};
		await fetch(rutas.eliminaEncabezado, deleteJson(datos));

		// Elimina la cookie
		document.cookie = "actualizaEncabezado_id=";

		// Se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
		DOM[!cac.pestanasTema.length ? "filtroTema" : "filtroPestana"].dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	// Fin
	return;
});
