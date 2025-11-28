"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domContenido = document.querySelector("#cuerpo #contenidoRevisar");
	const DOM = {
		eventos: domContenido.querySelectorAll(".apruebaRechaza i"),
	};
	const rutaCambioStatus = "/revisar/api/rev-contenido-cambios-status";

	// Eventos
	for (const domEvento of DOM.eventos)
		domEvento.addEventListener("click", async () => {
			// Si confirmar está inactivo, interrumpe la función
			if (domEvento.classList.contains("inactivo")) return;

			// Pide que confirme
			if (domEvento.id == "rechaza") {
				const mensaje = "¿Estás seguro/a de que querés avanzar para descartar esta sugerencia?";
				const cancelButtonText = "Retroceder";
				const confirmButtonText = "Avanzar";
				const confirma = await carteles.confirmar({mensaje, cancelButtonText, confirmButtonText});
				if (!confirma) return;
			}

			// Inactiva los botones para impedir confusiones
			const domApruebaRechaza = domEvento.parentNode;
			console.log(domApruebaRechaza.children);

			for (const icono of domApruebaRechaza.children) icono.classList.add("inactivo");

			// Guarda la información en la BD
			const contenido_id = domApruebaRechaza.dataset.contenido_id;
			const datos = {contenido_id, [domEvento.id]: true};
			const respuesta = await fetch(rutaCambioStatus, putJson(datos)).then((n) => n.json());

			// Si hubo un error, muestra el mensaje e interrumpe la función
			for (const icono of domApruebaRechaza.children) icono.classList.remove("inactivo");
			if (respuesta.error) return carteles.error(respuesta.error);

			// Fin
			location.reload();
		});

	// Fin
	return;
});
