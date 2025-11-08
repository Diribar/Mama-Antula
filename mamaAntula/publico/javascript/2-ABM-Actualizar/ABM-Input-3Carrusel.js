"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #carrusel");
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
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],
	};

	// Funciones
	const obtieneNuevaImagen = async function (archsImagen) {
		// Si no existen archivos, interrumpe la función
		if (!archsImagen.length) return;

		// Recorre los archivos
		for (const archImagen of archsImagen) {
			// CRSL - Crea un nuevo hijo
			const nuevoModeloVista = DOM.modeloVista.cloneNode(true);
			nuevoModeloVista.removeAttribute("id");
			const nuevaImg = nuevoModeloVista.querySelector("img");

			// Obtiene el url de la imagen
			const urlImagen = await procesaArchImg(archImagen, nuevaImg);
			if (!urlImagen) return;

			// CRSL - Actualiza la variable donde se almacenan los url de cada imagen
			urlsCarrusel.push(urlImagen);

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
		urlsCarrusel.splice(indice, 1);
	});

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => await obtieneNuevaImagen(e.dataTransfer.files));
	DOM.inputImagen.addEventListener("change", async () => await obtieneNuevaImagen(DOM.inputImagen.files));
	DOM.inputLeyenda.addEventListener("change", () => (DOM.inputLeyenda.value = inicialMayus(DOM.inputLeyenda.value)));

	// Evento click en el input - Busca un archivo de imagen
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
	// Eventos preventivos - Drag & Drop
	[...v.entrada, ...v.salida].forEach((evento) =>
		DOM.areaSoltar.addEventListener(evento, (e) => {
			e.preventDefault();

			// Eventos - Efectos visuales
			v.entrada.forEach((evento) => DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima")));
			v.salida.forEach((evento) =>
				DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima"))
			);
		})
	);

	// Fin
	return;
});

// Variables
let urlsCarrusel = [];
