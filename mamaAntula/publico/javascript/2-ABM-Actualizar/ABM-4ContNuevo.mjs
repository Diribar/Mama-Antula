"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Contenido
		iconoGuardar: document.querySelector("#pestanasGuardar #iconoGuardar"),
	};
	const rutas = {
		// Contenido
		guardaContenido: "/contenido/api/abm-guarda-contenido",
	};

	// Guarda los cambios
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Arma el feedback del encabezado
		const formData = new FormData();
		formData.append("encabezado_id", DOM.filtroEncabezado.value);
		formData.append("tipoEncab", cac.tipoEncab);

		// Completa el feedback en función de la pestanaGuardar
	});

	// Fin
	return;
});
