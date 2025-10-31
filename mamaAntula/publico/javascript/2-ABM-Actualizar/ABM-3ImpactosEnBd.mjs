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

		// Contenido
		guardaNuevo: document.querySelector("#sectorContNuevo #iconoGuardar"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/contenido/api/abm-guarda-encabezado/",
		eliminaEncabezado: "/contenido/api/abm-elimina-encabezado/?id=",

		// Contenido
		guardaContenido: "/contenido/api/abm-guarda-contenido/?",
		eliminaContenido: "/contenido/api/abm-elimina-contenido/?id=",
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
	}
	// Impacto en BD (encabezado - nuevo) - Guarda/Actualiza
	DOM.guardaEncabezado.addEventListener("click", async () => {
		// Arma el feedback
		const formData = new FormData(document.querySelector("#sectorEncabezado"));
		formData.append("encabezado_id", DOM.filtroEncabezado.value);
		formData.append("tipoEncab", cac.tipoEncab);

		// Guarda el encabezado en la BD
		const nuevo_id = await fetch(rutas.guardaEncabezado, postForm(formData));

		// Guarda el nuevo_id en la cookie y establece que se actualicen los filtros por las cookies
		console.log(nuevo_id);
		if (nuevo_id.ok) {
			document.cookie = "actualizaEncabezado_id=" + nuevo_id.id;
			cac.startUp = true;
		}

		// Se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
		DOM[!cac.pestanasTema.length ? "filtroTema" : "filtroPestana"].dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	// Impacto en BD (encabezado - original) - Elimina
	DOM.eliminaEncabezado.addEventListener("click", async () => {
		// Limpia el FE
		for (const input of DOM.encabezadoInputs) input.value = "";

		// Elimina de la BD, el encabezado y sus contenidos
		await fetch(rutas.eliminaEncabezado + DOM.filtroEncabezado.value);

		// Se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
		DOM[!cac.pestanasTema.length ? "filtroTema" : "filtroPestana"].dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	// Impacto en BD (contenido - original) - Eliminar
	// Impacto en BD (contenido - nuevo) - Guardar/Actualizar

	// Impacto en BD (encabezado - edición) - Guardar/Actualizar + Muestra el botón de eliminar el encabezado
	// Impacto en BD (encabezado - edición) - Eliminar
	// Impacto en BD (contenido - edicion) - Guardar/Actualizar
	// Impacto en FE (contenido - edición) - Mostrar
	// Impacto en FE (contenido - edición) - Cancelar
	// Impacto en BD (contenido - edición) - Eliminar

	// Fin
	return;
});
