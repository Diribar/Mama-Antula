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
		inputLeyenda: domLayout.querySelector("[name='leyenda']"),

		// Modelo Vista
		modeloVista: domLayout.querySelector("#modeloVista"),
		modeloVistaImg: domLayout.querySelector("#modeloVista img"),

		// Carrusel de imágenes
		carrImgs: domLayout.querySelector("#carrImgs"),
	};

	// Funciones
	const obtieneNuevasImagenes = async function (archsCrsl) {
		// Si no existen archivos, interrumpe la función
		if (!archsCrsl.length) return;

		// Recorre los archivos
		for (const archCrsl of archsCrsl) {
			// Si ya se alcanzó la cantidad máxima, interrumpe la rutina
			if (urls.length >= cantMax) break;

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

		// Fin
		return;
	});

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => await obtieneNuevasImagenes(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", async () => await obtieneNuevasImagenes(DOM.inputImagen.files));
	DOM.inputLeyenda.addEventListener("change", () => (DOM.inputLeyenda.value = inicialMayus(DOM.inputLeyenda.value)));
	otrosEventos(DOM);

	// Fin
	return;
};
