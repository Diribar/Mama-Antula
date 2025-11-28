"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domEncabezado = document.querySelector("#cuerpo #encabezado");
	const DOM = {
		// Cambios de status
		eventos: domEncabezado.querySelectorAll("i"),

		// Otros
		anchorLectura: document.querySelector("footer #iconosFooterOtros a#lectura"),
	};
	const rutaCambioStatus = "/revisar/api/rev-encabezado-cambios-status";
	const encab_id = cookie("actualizaEncabezado_id");

	// Eventos
	for (const domEvento of DOM.eventos)
		domEvento.addEventListener("click", async () => {
			// Si confirmar está inactivo, interrumpe la función
			if (domEvento.classList.contains("inactivo")) return;

			// Pide que confirme
			if (domEvento.id == "rechaza") {
				const mensaje = "¿Estás seguro/a de que querés eliminar este encabezado y su contenido?";
				const cancelButtonText = "Conservar";
				const confirmButtonText = "Eliminar";
				const confirma = await carteles.confirmar({mensaje, cancelButtonText, confirmButtonText});
				if (!confirma) return;
			}

			// Inactiva los botones para impedir confusiones
			for (const icono of DOM.eventos) icono.classList.add("inactivo");

			// Guarda la información en la BD
			const datos = {encab_id, [domEvento.id]: true};
			const respuesta = await fetch(rutaCambioStatus, putJson(datos)).then((n) => n.json());

			// Si hubo un error, muestra el mensaje e interrumpe la función
			for (const icono of DOM.eventos) icono.classList.remove("inactivo");
			if (respuesta.error) return carteles.error(respuesta.error);

			// Fin
			location.reload();
		});

	// Fin
	return;
});
