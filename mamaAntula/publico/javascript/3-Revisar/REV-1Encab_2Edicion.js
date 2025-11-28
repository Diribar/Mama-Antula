"use strict";
window.addEventListener("load", () => {
	// Variables
	const domSectorEdiciones = document.querySelector("#cuerpo #sectorEdicion");
	if (!domSectorEdiciones) return;
	const DOM = {
		ediciones: domSectorEdiciones.querySelector("#ediciones"),
		opciones: domSectorEdiciones.querySelectorAll("#ediciones .opcion"),
	};
	const rutaEdicion = "/revisar/api/rev-encabezado-edicion";
	const encab_id = cookie("actualizaEncabezado_id");
	const {edicion_id} = domSectorEdiciones.dataset;

	// Eventos
	for (const domOpcion of DOM.opciones) {
		domOpcion.addEventListener("click", async () => {
			// Variables
			const domCampoEdicion = domOpcion.parentNode;
			const {campo} = domCampoEdicion.dataset;
			const opcOriginal = domOpcion.classList.contains("original");
			const opcEdicion = domOpcion.classList.contains("edicion");

			// Oculta las opciones
			domCampoEdicion.classList.add("ocultar");

			// Envía la información al BE
			const datos = {encab_id, edicion_id, campo, opcOriginal, opcEdicion};
			const respuesta = await fetch(rutaEdicion, putJson(datos)).then((n) => n.json());

			// Si hubo un error, muestra el mensaje e interrumpe la función
			if (respuesta.error) {
				domCampoEdicion.classList.remove("ocultar");
				return carteles.error(respuesta.error);
			}

			// Remueve las opciones
			domCampoEdicion.remove();

			// Si ya no quedan más ediciones, recarga la vista
			if (DOM.ediciones.children.length == 0 || opcEdicion) location.reload();

			// Fin
			return;
		});
	}

	// Fin
	return;
});
