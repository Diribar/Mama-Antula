"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#sectorContNuevo #layouts #imagen");
	const DOM = {
		// Drag & Drop
		areaSoltar: domLayout.querySelector("#areaSoltar"),
		inputImagen: domLayout.querySelector("#areaSoltar [name='imagen']"),
		vistaImagen: domLayout.querySelector("#areaSoltar img"),

		// Formulario
		inputLeyenda: domLayout.querySelector("[name='leyenda']"),
	};
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],
		tiposAdmitidos: ["jpg", "jpeg", "png", "webp"],
	};

	// Funciones
	const obtieneNuevaImagen = async function (archsImagen) {
		// Si no existen archivos, interrumpe la función
		if (!archsImagen.length) return;

		// Acciones si no se cargó una imagen
		const archInput = archsImagen[0];
		let urlImagen = await procesaArchImg(archInput, DOM.vistaImagen);
		if (!urlImagen) return;

		// Valida que sea una archivo de imagen
		if (!urlImagen.type.startsWith("image/"))
			return console.log("El tipo de archivo '" + urlImagen.type + "' no es una imagen");

		// Valida el tipo de archivo
		const tipo = urlImagen.type.split("/")[1];
		console.log(tipo);
		if (!v.tiposAdmitidos.includes(tipo))
			return console.log(
				"El tipo de imagen '" + tipo + "' no es admitido (sólo se aceptan tipos " + v.tiposAdmitidos.join(", ") + ")"
			);

		// Conversores a JPG
		console.log(urlImagen.type);
		if (tipo != "image/jpg") urlImagen = await conversorJpg[tipo](urlImagen);
		console.log(urlImagen.type);

		// Actualiza variables
		archImagen = urlImagen;

		// Fin
		return;
	};

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
let archImagen;
