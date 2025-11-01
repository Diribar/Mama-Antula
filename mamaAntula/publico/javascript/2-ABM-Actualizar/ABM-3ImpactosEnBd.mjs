"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Encabezado
		encabezadoInputs: document.querySelectorAll("#sectorEncabezado .input"),
		guardaEncabezado: document.querySelector("#sectorEncabezado #guardar"),
		eliminaEncabezado: document.querySelector("#sectorEncabezado #eliminar"),

		// Contenido
		guardaNuevo: document.querySelector("#sectorContNuevo #iconoGuardar"),
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
	// Impacto en BD (encabezado - nuevo) - Guardar/Actualizar
	// Impacto en BD (encabezado - nuevo) - Eliminar

	// Impacto en BD (contenido - nuevo) - Guardar/Actualizar
	// Impacto en BD (contenido - original) - Eliminar

	// Impacto en BD (encabezado - edición) - Guardar/Actualizar + Muestra el botón de eliminar el encabezado
	// Impacto en BD (encabezado - edición) - Eliminar
	// Impacto en BD (contenido - edicion) - Guardar/Actualizar
	// Impacto en FE (contenido - edición) - Mostrar
	// Impacto en FE (contenido - edición) - Cancelar
	// Impacto en BD (contenido - edición) - Eliminar

	// Fin
	return;
});
