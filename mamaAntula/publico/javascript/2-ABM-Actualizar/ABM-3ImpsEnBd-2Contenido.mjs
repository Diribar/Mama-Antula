"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Contenido
		guardaNuevo: document.querySelector("#sectorContNuevo #iconoGuardar"),
		pestanasGuardar: document.querySelectorAll("#pestanasGuardar .pestana"),
	};
	const rutas = {
		// Contenido
		guardaContenido: "/contenido/api/abm-guarda-contenido",
		eliminaContenido: "/contenido/api/abm-elimina-contenido/?id=",
	};

	// Impacto en BD (contenido - original) - Eliminar
	// Impacto en BD (contenido - nuevo) - Guardar/Actualizar
	DOM.guardaNuevo.addEventListener("click", async () => {
		// Arma el feedback del encabezado
		const formData = new FormData();
		formData.append("encabezado_id", DOM.filtroEncabezado.value);
		formData.append("tipoEncab", cac.tipoEncab);

		// Completa el feedback en función de la pestanaGuardar
	});

	// Impacto en BD (contenido - edicion) - Guardar/Actualizar
	// Impacto en FE (contenido - edición) - Mostrar
	// Impacto en FE (contenido - edición) - Cancelar
	// Impacto en BD (contenido - edición) - Eliminar

	// Fin
	return;
});
