"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs
		textoInput: document.querySelector("#texto .input"),
		videoInput: document.querySelector("#video .input"),

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
		consolidado: () => {
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
			// Le agrega los valores
			if (archivoImgSubido) {
				v.formData.append("archivo", archivoImgSubido);
				v.formData.append("imagen", archivoImgSubido.name);
				v.formData.append("tamano", archivoImgSubido.size);
				v.formData.append("tipo", archivoImgSubido.type);
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
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Si confirmar está inactivo, interrumpe la función
		if (DOM.iconoGuardar.className.includes("inactivo")) return;
		DOM.iconoGuardar.classList.add("inactivo"); // se deja inactivo hasta que se vuelve a hacer un input en el formulario

		// Obtiene la pestaña activa
		v.nombrePestanaActiva = document.querySelector("#pestanasGuardar .pestana.activo")?.id;

		// Crea el form
		creaElForm.consolidado();

		// Guarda el contenido en la BD y actualiza
		await fetch(rutas.guardaContenido, postForm(v.formData)).then((n) => n.json());
		DOM.filtroEncab.dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	DOM.form.addEventListener("submit", async (e) => {
		// Si no hay algo para guardar, interrumpe la función
		if (!FN.accionesSubmit.hayAlgoParaGuardar()) return;

		// Crea el FormData y agrega los datos
		const formData = FN.accionesSubmit.formData();

		// Valida y guarda los cambios del form
		v.errores = await fetch(v.rutaGuardar, postForm(formData)).then((n) => n.json());

		// Acciones finales
		FN.accionesSubmit.finSubmit();

		// Fin
		return;
	});

	// Fin
	return;
});
