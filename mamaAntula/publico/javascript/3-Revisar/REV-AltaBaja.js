"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domEncabezado = document.querySelector("#cuerpo #encabezado");
	const DOM = {
		aprobar: domEncabezado.querySelector("i#aprobar"),
		rechazar: domEncabezado.querySelector("i#rechazar"),
	};
	const ruta = "/revisar/api/rev-encabezado-cambios-status";
	const encab_id = domEncabezado.dataset.encab_id;

	// Eventos
	DOM.aprobar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.aprobar.classList.contains("inactivo")) return;
		DOM.aprobar.classList.add("inactivo");

		// Guarda la información en la BD
		const datos = {encab_id, aprueba: true};
		const respuesta = await fetch(ruta, putJson(datos)).then((n) => n.json());
		location.reload();
	});
	DOM.rechazar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.aprobar.classList.contains("inactivo")) return;
		DOM.aprobar.classList.add("inactivo");

		// Guarda la información en la BD
		const datos = {encab_id, rechaza: true};
		const respuesta = await fetch(ruta, putJson(datos)).then((n) => n.json());
		location.reload();
	});

	// Fin
	return;
});
