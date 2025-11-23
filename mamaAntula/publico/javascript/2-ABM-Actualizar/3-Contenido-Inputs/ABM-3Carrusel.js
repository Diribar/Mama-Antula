"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #carrusel");
	crslEstampa({domLayout, cantMax: 10, urls: urlsCrsl});

	// Fin
	return;
});

// Funciones
const crslEstampa = ({domLayout, cantMax, urls}) => {
	const DOM = {
		// Drag & Drop
		dragDrop: domLayout.querySelector("#dragDrop"),
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),

		// Modelo Vista
		modeloVista: domLayout.querySelector("#modeloVista"),
		modeloVistaImg: domLayout.querySelector("#modeloVista img"),

		// Carrusel de imágenes
		carrImgs: domLayout.querySelector("#carrImgs"),
		inputComentario: domLayout.querySelector("[name='comentario']"),
	};

	// Funciones
	const obtieneNuevasImagenes = async function (archsCrsl) {
		// Si no existen archivos, interrumpe la función
		if (!archsCrsl.length) return;

		// Recorre los archivos
		for (const archCrsl of archsCrsl) {
			// Si ya se alcanzó la cantidad máxima, interrumpe la rutina
			if (urls.length >= cantMax) {
				carteles.error("Se alcanzó la cantidad máxima de imagenes");
				break;
			}

			// CRSL - Crea un nuevo hijo
			const nuevoModeloVista = DOM.modeloVista.cloneNode(true);
			nuevoModeloVista.removeAttribute("id");
			const nuevaImg = nuevoModeloVista.querySelector("img");

			// Obtiene el url de la imagen
			const urlImagen = await procesaArchImg(archCrsl, nuevaImg);
			if (!urlImagen) return;

			// CRSL - Actualiza la variable donde se almacenan los url de cada imagen
			urls.push(urlImagen);

			// CRSL - Actualiza vista
			DOM.carrImgs.appendChild(nuevoModeloVista);
		}

		// Si se alcanzó la cantidad máxima, oculta el drag & drop
		if (urls.length >= cantMax) DOM.dragDrop.classList.add("ocultar");

		// Fin
		return;
	};

	// Eventos - Elimina una imagen
	DOM.carrImgs.addEventListener("click", (e) => {
		// Obtiene el indice
		const domEliminar = DOM.carrImgs.querySelectorAll(".eliminar");
		const indice = Array.from(domEliminar).indexOf(e.target);
		if (indice < 0) return;

		// Elimina el hijo
		DOM.carrImgs.removeChild(domEliminar[indice].parentNode);
		urls.splice(indice, 1);

		// Si está debajo de la cantidad máxima, muestra el drag & drop
		if (urls.length < cantMax) DOM.dragDrop.classList.remove("ocultar");

		// Fin
		return;
	});

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => await obtieneNuevasImagenes(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", async () => await obtieneNuevasImagenes(DOM.inputImagen.files));
	DOM.inputComentario.addEventListener("change", () => (DOM.inputComentario.value = inicialMayus(DOM.inputComentario.value)));
	otrosEventos(DOM);

	// Fin
	return;
};
