"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domEncabezado = document.querySelector("#cuerpo #encabezado");
	const DOM = {
		aprobar: domEncabezado.querySelector("i#aprobar"),
		rechazar: domEncabezado.querySelector("i#rechazar"),
	};
	const rutas = {
		aprobar: "/revisar/api/rev-aprueba-encabezado",
		rechazar: "/revisar/api/rev-rechaza-encabezado",
	};
	const encab_id = domEncabezado.dataset.encab_id;

	// Eventos
	DOM.aprobar.addEventListener("click", async () => {
		const respuesta = await fetch(rutas.aprobar, putJson({encab_id})).then((n) => n.json());
		console.log(respuesta);
	});
	DOM.rechazar.addEventListener("click", async () => await fetch(rutas.rechazar, putJson({encab_id})));

	// Fin
	return;
});
