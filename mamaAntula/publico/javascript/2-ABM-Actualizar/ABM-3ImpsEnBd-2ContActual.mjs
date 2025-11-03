"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Contenido
		iconosEliminar: document.querySelectorAll("#sectorContActual .iconos #iconoEliminar"),
	};
	const rutas = {
		// Contenido
		guardaContenido: "/contenido/api/abm-guarda-contenido",
		eliminaContenido: "/contenido/api/abm-elimina-contenido/?id=",
	};

	// Impacto en BD (contenido - nuevo) - Guardar/Actualizar
	DOM.guardaNuevo.addEventListener("click", async () => {
		// Arma el feedback del encabezado
		const formData = new FormData();
		formData.append("encabezado_id", DOM.filtroEncabezado.value);
		formData.append("tipoEncab", cac.tipoEncab);

		// Completa el feedback en función de la pestanaGuardar
	});

	// Impacto en BD (contenido - actual) - Editar
	// Impacto en BD (contenido - actual) - Subir
	// Impacto en BD (contenido - actual) - Bajar
	// Impacto en BD (contenido - actual) - Eliminar
	DOM.iconosEliminar.forEach((iconoEliminar, i) => {

	})

	// Fin
	return;
});
