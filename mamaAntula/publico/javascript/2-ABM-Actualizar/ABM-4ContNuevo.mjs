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

		// Ouputs
		iconoGuardar: document.querySelector("#pestanasGuardar #iconoGuardar"),
		textoOutput: document.querySelector("#texto .output"),

		// Video
		outputVideoId: document.querySelector("#video [name='video']"),
		muestraLeyendaVideo: document.querySelector("#video .muestraLeyenda"),
		limpiarValue: document.querySelectorAll("#video .input"),
		limpiarHTML: document.querySelectorAll("#video .limpiar"),
	};
	const rutas = {
		guardaContenido: "/contenido/api/abm-guarda-contenido",
	};
	const v = {};

	// Funciones
	const creaElForm = {
		consolidado: function () {
			// Crea el form
			v.formData = new FormData();

			// Encabezado
			this.encabezado();

			// Inputs
			v.formData.append("pestanaActiva", v.nombrePestanaActiva);
			if (["textoImagen", "texto"].includes(v.nombrePestanaActiva)) v.formData.append("texto", DOM.textoOutput.value);
			if (v.nombrePestanaActiva == "video") this.video();
			if (["textoImagen", "imagen"].includes(v.nombrePestanaActiva)) this.imagen();
			if (v.nombrePestanaActiva == "carrousel") return;

			// Fin
			return;
		},
		encabezado: () => {
			// Encabezado
			const encabezado_id = DOM.filtroEncab.value;
			v.formData.append("encabezado_id", encabezado_id);

			// Campo_id
			const campo_id = campos_id[comp1234.tipoEncab];
			v.formData.append("campo_id", campos_id[comp1234.tipoEncab]);
			v.formData.append(campo_id, encabezado_id);

			// Fin
			return;
		},
		imagen: () => {
			// Si se subió un archivo, le agrega los valores
			if (archivoImgSubido) {
				// El archivo de imagen
				v.formData.append("archivo", archivoImgSubido);

				// La leyenda de la imagen
				v.formData.append("leyenda", DOM.leyendaImagen.value);

				// Datos para validar la imagen
				v.formData.append("imagen", archivoImgSubido.name);
				v.formData.append("tamano", archivoImgSubido.size);
				v.formData.append("tipo", archivoImgSubido.type);

				// Fin
				archivoImgSubido = null;
			}

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

		// Guarda el contenido en la BD
		await fetch(rutas.guardaContenido, postForm(v.formData)).then((n) => n.json());

		// Recarga la vista, para que limpie todo
		location.reload();

		// Fin
		return;
	});

	// Fin
	return;
});
