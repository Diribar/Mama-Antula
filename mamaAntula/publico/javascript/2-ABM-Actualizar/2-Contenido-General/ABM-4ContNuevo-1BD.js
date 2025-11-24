"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domSector = document.querySelector("#sectorContNuevo");
	const DOM = {
		// Form
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),

		// Imagen, Carrousel
		leyendaImagen: domSector.querySelector("#imagen [name='leyenda']"),
		leyendaCarrusel: domSector.querySelector("#carrusel [name='comentario']"),

		// Video
		leyendaVideo: domSector.querySelector("#video [name='leyenda']"),
		videoId: domSector.querySelector("#video [name='video']"),

		// Libros, Estampas
		inputsLibro: domSector.querySelectorAll("#libro .inputs .input"),
		tituloEstampa: domSector.querySelector("#estampa [name='comentario']"),

		// Ouputs
		iconoGuardar: domSector.querySelector("#pestanasGuardar #iconoGuardar"),
		textoOutput: domSector.querySelector("#texto #output"),
	};
	const rutas = {
		guardaUnaImagen: "/articulos/api/abm-nuevo-contenido-guarda",
		guardaImagenes: "/articulos/api/abm-nuevo-carrusel-guarda",
	};
	const v = {};

	// Funciones
	const creaElForm = {
		consolidado: function () {
			// Obtiene la pestaña activa
			v.nombrePestanaActiva = document.querySelector("#pestanasGuardar .pestana.activo")?.id;

			// Crea el form
			v.formData = new FormData();
			v.formData.append("encab_id", DOM.filtroEncab.value);
			v.formData.append("layoutCodigo", v.nombrePestanaActiva);

			// Le agrega info en función de la pestaña activa
			this[v.nombrePestanaActiva]();

			// Fin
			return;
		},
		// Funciones a usar según la pestaña activa
		textoImagen: function () {
			// Texto
			if (DOM.textoOutput.value) v.formData.append("texto", DOM.textoOutput.value);

			// Agrega el archivo de la imagen
			if (archImagen) this.archImg(archImagen, "");

			// Agrega la leyenda de la imagen
			v.formData.append("leyenda", DOM.leyendaImagen.value);

			// Fin
			return;
		},
		texto: function () {
			// Texto
			if (DOM.textoOutput.value) v.formData.append("texto", DOM.textoOutput.value);

			// Fin
			return;
		},
		carrusel: function () {
			// Agrega las imágenes
			for (const url of urlsCrsl) this.archImg(url, "s");

			// Agrega la leyenda del carrusel
			v.formData.append("leyenda", DOM.leyendaCarrusel.value);

			// Fin
			return;
		},
		video: () => {
			// Video y leyenda
			v.formData.append("video", DOM.videoId.value);
			v.formData.append("leyenda", DOM.leyendaVideo.value);

			// Fin
			return;
		},
		libro: function () {
			// Si no se subió un archivo, interrumpe la función
			if (!archLibro) return;

			// Agrega el archivo del libro
			this.archImg(archLibro, "");

			// Agrega los demás datos del libro
			for (const input of DOM.inputsLibro) v.formData.append(input.name, input.value);

			// Fin
			return;
		},
		estampa: function () {
			// Agrega las imágenes
			for (const url of urlsEstampa) this.archImg(url, "s");

			// Agrega la leyenda
			v.formData.append("titulo", DOM.tituloEstampa.value);

			// Fin
			return;
		},

		// Auxiliares
		archImg: (archivo, s) => {
			// El archivo de imagen
			v.formData.append("archivo" + s, archivo);

			// Datos para validar la imagen
			v.formData.append("imagen" + s, archivo.name);
			v.formData.append("tamano" + s, archivo.size);
			v.formData.append("tipo" + s, archivo.type);

			// Fin
			return;
		},
	};

	// Guarda los cambios
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.iconoGuardar.className.includes("inactivo")) return;
		DOM.iconoGuardar.classList.add("inactivo"); // se deja inactivo hasta que se vuelve a hacer un input en el formulario

		// Crea el form
		creaElForm.consolidado();

		// Guarda la información en la BD
		const ruta = ["carrusel", "estampa"].includes(v.nombrePestanaActiva) ? "guardaImagenes" : "guardaUnaImagen"; // la diferencia es por el multer
		const respuesta = await fetch(rutas[ruta], postForm(v.formData)).then((n) => n.json());
		DOM.iconoGuardar.classList.remove("inactivo");

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);

		// Recarga la vista, para que limpie todo
		location.reload();

		// Fin
		return;
	});

	// Fin
	return;
});

// Variables
const urlsCrsl = [];
const urlsEstampa = [];
let archImagen;
let archLibro;

// Funciones
const obtieneNuevaImagen = async (archsImagen, vistaImagen) => archsImagen.length && procesaArchImg(archsImagen[0], vistaImagen);
const otrosEventos = (DOM) => {
	// Variables
	const eventos = {entrada: ["dragenter", "dragover"], salida: ["dragleave", "drop"]};

	// Eventos preventivos - Drag & Drop
	for (const evento of [...eventos.entrada, ...eventos.salida])
		DOM.areaSoltar.addEventListener(evento, (e) => e.preventDefault());

	// Eventos - Efectos visuales
	for (const evento of eventos.entrada) DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.add("encima"));
	for (const evento of eventos.salida) DOM.areaSoltar.addEventListener(evento, () => DOM.areaSoltar.classList.remove("encima"));

	// Evento click en el input - Busca un archivo de imagen
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());

	// Fin
	return;
};
const eventoDragDrop = (DOM, arch) => {
	// Evento drop
	const vistaImagen = DOM.vistaImagen;
	DOM.areaSoltar.addEventListener("drop", async (e) => (arch = await obtieneNuevaImagen(e.dataTransfer.files, vistaImagen)));
};
