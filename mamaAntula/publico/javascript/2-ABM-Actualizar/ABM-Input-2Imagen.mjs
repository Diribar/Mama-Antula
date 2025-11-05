"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#cuerpo #formEdicion"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

		// Drag & Drop
		areaSoltar: document.querySelector("#sectorContNuevo #areaSoltar"),
		inputImagen: document.querySelector("#sectorContNuevo #areaSoltar [name='imagen']"),
		vistaImagen: document.querySelector("#sectorContNuevo #areaSoltar img"),
	};
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],
		archivoImgSubido: null,
	};

	// Funciones
	const obtieneNuevaImagen = async function (archImagen, vistaImagen) {
		// Acciones si no se cargó una imagen
		const nuevaImagen = await procesaArchImg(archImagen, vistaImagen);
		if (!nuevaImagen) return;

		// Actualiza variables
		archivoImgSubido = nuevaImagen;
		const {name: imagen, size: tamano, type: tipo} = archivoImgSubido;
		v.datos = {...v.datos, imagen, tamano, tipo};
		v.errores = {};

		// Fin
		return;
	};

	// Eventos nueva imagen
	DOM.areaSoltar.addEventListener("drop", async (e) => await obtieneNuevaImagen(e.dataTransfer.files, DOM.vistaImagen));
	DOM.inputImagen.addEventListener("change", async () => await obtieneNuevaImagen(DOM.inputImagen.files, DOM.vistaImagen));

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
let archivoImgSubido