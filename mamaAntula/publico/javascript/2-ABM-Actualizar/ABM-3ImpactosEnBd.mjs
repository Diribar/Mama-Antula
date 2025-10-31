"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Encabezado
		encabezadoInputs: document.querySelectorAll("#sectorEncabezado .input"),
		guardaEncabezado: document.querySelector("#sectorEncabezado #guardar"),

		// Contenido
		guardaContenido: document.querySelector("#sectorContNuevo #iconoGuardar"),
	};

	// Impacto en FE - Edición del encabezado
	for (const encabezadoInput of DOM.encabezadoInputs) {
		encabezadoInput.addEventListener("change", () => {
			// Muestra botón de guardar
			DOM.guardaEncabezado.classList.remove("ocultar");

			// Le actualiza el title
			const leyenda = DOM.filtroEncabezado.value == "nuevo" ? "Encabezado nuevo" : "Edición del encabezado";
			DOM.guardaEncabezado.title = leyenda;

			// Fin
			return;
		});
	}

	// Impacto en FE - Editar contenido actual

	// Impacto en BD (encabezado - nuevo) - Guardar/Actualizar
	// Impacto en BD (encabezado - nuevo) - Eliminar
	// Impacto en BD (encabezado - edición) - Guardar/Actualizar
	// Impacto en BD (encabezado - edición) - Eliminar

	// Impacto en BD (contenido - original) - Guardar/Actualizar
	// Impacto en BD (contenido - original) - Eliminar
	// Impacto en BD (contenido - edicion) - Guardar/Actualizar
	// Impacto en BD (contenido - edicion) - Eliminar

	// Fin
	return;
});
