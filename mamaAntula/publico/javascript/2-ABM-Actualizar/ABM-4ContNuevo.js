"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Form
		sectorContNuevo: document.querySelector("#sectorContNuevo"),
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs
		textoInput: document.querySelector("#texto .input"),
		videoInput: document.querySelector("#video .input"),
		leyendaImagen: document.querySelector("#imagen [name='leyenda']"),
		leyendaCarrusel: document.querySelector("#carrusel [name='leyenda']"),

		// Ouputs
		iconoGuardar: document.querySelector("#pestanasGuardar #iconoGuardar"),
		textoOutput: document.querySelector("#texto #output"),

		// Video
		outputVideoId: document.querySelector("#video [name='video']"),
		muestraLeyendaVideo: document.querySelector("#video #muestraLeyenda"),
		limpiarValue: document.querySelectorAll("#video .input"),
		limpiarHTML: document.querySelectorAll("#video .limpiar"),
	};
	const rutas = {
		guardaContenido: "/articulos/api/abm-nuevo-contenido-guarda",
		guardaCarrusel: "/articulos/api/abm-nuevo-carrusel-guarda",
	};
	const v = {};

	// Funciones
	const creaElForm = {
		consolidado: function () {
			// Crea el form
			v.formData = new FormData();
			this.encabezado();

			// Le agrega info en función de la pestaña activa
			this[v.nombrePestanaActiva]();

			// Fin
			return;
		},
		// Partes del form
		encabezado: () => {
			// Encabezado
			const encab_id = DOM.filtroEncab.value;
			v.formData.append("encab_id", encab_id);

			// Campo_id
			v.formData.append("encab_id", encab_id);

			// Fin
			return;
		},
		// Funciones a usar según la pestaña activa
		textoImagen: function () {
			// Texto
			if (DOM.textoOutput.value) v.formData.append("texto", DOM.textoOutput.value);

			// Si no se subió un archivo, interrumpe la función
			if (!archImagen) return;

			// Agrega el archivo de la imagen
			this.archImg(archImagen, "");

			// Agrega la leyenda de la imagen
			if (DOM.leyendaImagen.value) v.formData.append("leyenda", DOM.leyendaImagen.value);

			// Fin
			return;
		},
		carrusel: function () {
			// Si no se subieron por lo menos 2 archivos, interrumpe la función
			if (!urlsCrsl || urlsCrsl.length < 2) return;

			// Agrega las imágenes
			for (const urlCrsl of urlsCrsl) this.archImg(urlCrsl, "s");

			// Agrega la leyenda del carrusel
			v.formData.append("leyenda", DOM.leyendaCarrusel.value);

			// Fin
			return;
		},
		video: () => {
			// Video y leyenda
			v.formData.append("video", DOM.outputVideoId.value);
			v.formData.append("leyenda", DOM.muestraLeyendaVideo.innerText);

			// Fin
			return;
		},
		libro: function () {
			// Si no se subió un archivo, interrumpe la función
			if (!archLibro) return;

			// Agrega el archivo del libro
			this.archImg(archLibro, "");

			// Agrega los demás datos del libro
			v.formData.append("imagen", archivo.name);
			v.formData.append("tamano", archivo.size);
			v.formData.append("tipo", archivo.type);

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

	// Actualiza el sector por cambio en el encabezado
	DOM.filtroEncab.addEventListener("change", async () => {
		// Texto
		DOM.textoInput.querySelector(".ql-editor").innerHTML = "";

		// Imagen

		// Video
		for (const limpiar of DOM.limpiarValue) limpiar.value = "";
		for (const limpiar of DOM.limpiarHTML) limpiar.innerHTML = "";

		// Fin
		return;
	});

	// Guarda los cambios
	DOM.sectorContNuevo.addEventListener("input", () => DOM.iconoGuardar.classList.remove("inactivo"));
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.iconoGuardar.className.includes("inactivo")) return;
		DOM.iconoGuardar.classList.add("inactivo"); // se deja inactivo hasta que se vuelve a hacer un input en el formulario

		// Obtiene la pestaña activa
		v.nombrePestanaActiva = document.querySelector("#pestanasGuardar .pestana.activo")?.id;

		// Crea el form
		creaElForm.consolidado();

		// Guarda la información en la BD
		const ruta = v.nombrePestanaActiva == "carrusel" ? "guardaCarrusel" : "guardaContenido";
		await fetch(rutas[ruta], postForm(v.formData)).then((n) => n.json());

		// Recarga la vista, para que limpie todo
		location.reload();

		// Fin
		return;
	});

	// Fin
	return;
});

// Variables
let archImagen;
let urlsCrsl = [];
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
