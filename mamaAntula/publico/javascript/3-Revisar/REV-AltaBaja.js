"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domEncabezado = document.querySelector("#cuerpo #encabezado");
	const DOM = {
		// Cambios de status
		aprobar: domEncabezado.querySelector("i#aprobar"),
		rechazar: domEncabezado.querySelector("i#rechazar"),

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

	// Obtiene los url
	const urlSeccion = "/" + v.secciones.find((n) => n.id == seccion_id).url;
	const urlTema = "/" + v.temasSecciones.find((n) => n.id == tema_id).url;
	const urlPestana = (pestana_id && "/" + v.pestanasTemas.find((n) => n.id == pestana_id).url) || "";
	const urlEncabezado = conIndice ? "/?id=" + encab_id : "";

	// Actualiza el DOM
	DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + urlEncabezado;

	// Eventos
	DOM.aprobar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.aprobar.classList.contains("inactivo")) return;

		// Inactiva los botones para impedir confusiones
		DOM.aprobar.classList.add("inactivo");
		DOM.rechazar.classList.add("inactivo");

		// Guarda la información en la BD
		const datos = {encab_id, aprueba: true};
		const respuesta = await fetch(rutas.cambioStatus, putJson(datos)).then((n) => n.json());

		// Fin
		location.reload();
	});
	DOM.rechazar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.rechazar.classList.contains("inactivo")) return;

		// Pide que confirme
		const mensaje = "¿Estás seguro/a de que querés eliminar este encabezado y su contenido?";
		const cancelButtonText = "Conservar";
		const confirmButtonText = "Eliminar";
		const confirma = await carteles.confirmar({mensaje, cancelButtonText, confirmButtonText});
		if (!confirma) return;

		// Inactiva los botones para impedir confusiones
		DOM.aprobar.classList.add("inactivo");
		DOM.rechazar.classList.add("inactivo");

		// Guarda la información en la BD
		const datos = {encab_id, rechaza: true};
		const respuesta = await fetch(rutas.cambioStatus, putJson(datos)).then((n) => n.json());

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
