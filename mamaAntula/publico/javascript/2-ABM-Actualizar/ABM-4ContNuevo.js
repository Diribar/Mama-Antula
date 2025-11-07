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
		textoOutput: document.querySelector("#texto .output"),

		// Video
		outputVideoId: document.querySelector("#video [name='video']"),
		muestraLeyendaVideo: document.querySelector("#video #muestraLeyenda"),
		limpiarValue: document.querySelectorAll("#video .input"),
		limpiarHTML: document.querySelectorAll("#video .limpiar"),
	};
	const rutas = {
		guardaContenido: "/contenido/api/abm-guarda-contenido",
		guardaCarrusel: "/contenido/api/abm-guarda-carrusel",
	};
	const v = {};

	// Funciones
	const creaElForm = {
		consolidado: async function () {
			// Crea el form
			v.formData = new FormData();
			this.encabezado();

			// Le agrega info en función de la pestaña
			if (["textoImagen", "texto"].includes(v.nombrePestanaActiva)) v.formData.append("texto", DOM.textoOutput.value);
			if (["textoImagen", "imagen"].includes(v.nombrePestanaActiva)) this.imagen();
			if (v.nombrePestanaActiva == "carrusel") this.carrusel();
			if (v.nombrePestanaActiva == "video") this.video();

			// Fin
			return;
		},
		// Partes del form
		encabezado: () => {
			// Encabezado
			const encabezado_id = DOM.filtroEncab.value;
			v.formData.append("encabezado_id", encabezado_id);
			v.formData.append("pestanaActiva", v.nombrePestanaActiva); // es la pestaña del contNuevo

			// Campo_id
			const campo_id = campos_id[comp1234.entidad];
			v.formData.append("campo_id", campos_id[comp1234.entidad]);
			v.formData.append(campo_id, encabezado_id);

			// Fin
			return;
		},
		imagen: function () {
			// Si no se subió un archivo, interrumpe la función
			if (!archImagen) return;

			// Agrega el archivo de la imagen
			this.archImg(archImagen, "");
			// archImagen = null;

			// Agrega la leyenda de la imagen
			v.formData.append("leyenda", DOM.leyendaImagen.value);

			// Fin
			return;
		},
		carrusel: function () {
			// Si no se subieron por lo menos 2 archivos, interrumpe la función
			if (!urlsCarrusel || urlsCarrusel.length < 2) return;

			// Agrega las imágenes
			for (const urlCarrusel of urlsCarrusel) this.archImg(urlCarrusel, "s");

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
		// Varios
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
		await creaElForm.consolidado();

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
