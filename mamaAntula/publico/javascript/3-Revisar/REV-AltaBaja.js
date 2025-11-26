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
	const rutas = {
		datosIniciales: "/revisar/api/rev-datos-inciales",
		cambioStatus: "/revisar/api/rev-encabezado-cambios-status",
	};
	const v = {
		encab_id: domEncabezado.dataset.encab_id,
		...(await fetch(rutas.datosIniciales).then((n) => n.json())),
	};
	const temaActual = v.temasSecciones.find((n) => n.id == tema_id);
	const conIndice = temaActual.indicesFecha.length || temaActual.indicesLugar.length;

	// Actualiza el anchorLectura
	const urlSeccion = "/" + v.secciones.find((n) => n.id == seccion_id).url;
	const urlTema = "/" + v.temasSecciones.find((n) => n.id == tema_id).url;
	const urlPestana = (pestana_id && "/" + v.pestanasTemas.find((n) => n.id == pestana_id).url) || "";
	const urlEncabezado = conIndice ? "/?id=" + encab_id : "";
	DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + urlEncabezado;

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
			const respuesta = await fetch(rutas.cambioStatus, putJson(datos)).then((n) => n.json());
			for (const icono of DOM.eventos) icono.classList.remove("inactivo");

			// Si hubo un error, muestra el mensaje e interrumpe la función
			if (respuesta.error) return carteles.error(respuesta.error);

			// Fin
			location.reload();
		});

	// Fin
	return;
});

// Variables
const seccion_id = cookie("actualizaSeccion_id");
const tema_id = cookie("actualizaTema_id");
const pestana_id = cookie("actualizaPestana_id");
const encab_id = cookie("actualizaEncabezado_id");
