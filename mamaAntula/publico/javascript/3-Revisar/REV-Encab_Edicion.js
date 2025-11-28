"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domSectorEdiciones = document.querySelector("#cuerpo #sectorEdicion");
	const domOpciones = domEdiciones.querySelectorAll(".opcion");
	const rutaEdicion = "/revisar/api/rev-encabezado-edicion";
	const encab_id = cookie("actualizaEncabezado_id");
	const {edicion_id} = domSectorEdiciones.dataset;

	// Eventos
	for (const domOpcion of domOpciones) {
		domOpcion.addEventListener("click", () => {
			// Variables
			const campoEdicion = domOpcion.parentNode;
			const {campo} = campoEdicion.dataset;
			const original = domOpcion.classList.contains("original");
			const edicion = domOpcion.classList.contains("edicion");

			// Remueve las opciones
			DOM.camposEdicion[i].remove();

			// Arma la información a enviar al BE
			const datos = {encab_id, edicion_id, campo, opcOriginal, opcEdicion};

			// Envía la información al BE
			fetch(rutaEdicion, putJson(datos));

			// Fin
			return;
		});
	}

	// Fin
	return;
});
