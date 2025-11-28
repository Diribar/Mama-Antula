"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domEncabezado = document.querySelector("#cuerpo #encabezado");
	const domContenido = document.querySelector("#cuerpo #contenidoRevisar");
	const DOM = {
		// Cambios de status
		eventosEncab: domEncabezado.querySelectorAll("i"),
		eventosCont: domContenido.querySelectorAll(".apruebaRechaza i"),
	};
	const rutasStatus = {
		encabezado: "/revisar/api/rev-encabezado-cambios-status",
		contenido: "/revisar/api/rev-contenido-cambios-status",
	};
	const encab_id = cookie("actualizaEncabezado_id");

	// Funciones
	const FN = async ({domEvento, ruta, datos, confirm, cancel, mensaje}) => {
		// Si confirmar está inactivo, interrumpe la función
		if (domEvento.classList.contains("inactivo")) return;

		// Pide que confirme
		if (domEvento.id == "rechaza") {
			const confirma = await carteles.confirmar({mensaje, cancelButtonText: cancel, confirmButtonText: confirm});
			if (!confirma) return;
		}

		// Inactiva los botones para impedir confusiones
		const domPadre = domEvento.parentNode;
		for (const icono of domPadre.children) icono.classList.add("inactivo");

		// Guarda la información en la BD
		const respuesta = await fetch(ruta, putJson(datos)).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		for (const icono of domPadre.children) icono.classList.remove("inactivo");
		if (respuesta.error) return carteles.error(respuesta.error);

		// Fin
		location.reload();
	};

	// Eventos - encabezado
	for (const domEvento of DOM.eventosEncab)
		domEvento.addEventListener("click", async () => {
			// Mensaje para confirmar el descarte
			const mensaje = "¿Estás seguro/a de que querés eliminar este encabezado y su contenido?";
			const cancel = "Conservar";
			const confirm = "Eliminar";

			// Información a guardar en la BD
			const datos = {encab_id, [domEvento.id]: true};
			const ruta = rutasStatus.encabezado;

			// Invoca la función
			await FN({domEvento, ruta, datos, confirm, cancel, mensaje});
		});

	// Eventos - contenido
	for (const domEvento of DOM.eventosCont)
		domEvento.addEventListener("click", async () => {
			// Mensaje para confirmar el descarte
			const mensaje = "¿Estás seguro/a de que querés avanzar para descartar esta sugerencia?";
			const cancel = "Retroceder";
			const confirm = "Avanzar";

			// Información a guardar en la BD
			const domPadre = domEvento.parentNode;
			const contenido_id = domPadre.dataset.contenido_id;
			const datos = {contenido_id, [domEvento.id]: true};
			const ruta = rutasStatus.contenido;

			// Invoca la función
			await FN({domEvento, ruta, datos, confirm, cancel, mensaje});
		});

	// Fin
	return;
});
