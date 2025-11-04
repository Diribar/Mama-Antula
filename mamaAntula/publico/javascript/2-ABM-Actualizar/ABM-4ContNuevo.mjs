"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs
		textoInput: document.querySelector("#texto .input"),
		videoInput: document.querySelector("#video .input"),

		// Ouputs
		iconoGuardar: document.querySelector("#pestanasGuardar #iconoGuardar"),
		textoOutput: document.querySelector("#texto .output"),

		// Video
		outputVideoId: document.querySelector("#video [name='video']"),
		muestraLeyendaVideo: document.querySelector("#video .muestraLeyenda"),
		inputsVideo: document.querySelectorAll("#video .input"),
		divsVideo: document.querySelectorAll("#video .div"),
	};
	const rutas = {
		guardaContenido: "/contenido/api/abm-guarda-contenido",
	};
	const v = {};

	// Funciones
	const FN = {
		creaElForm: () => {
			// Variables
			const campo_id = campos_id[cac.tipoEncab];
			const encabezado_id = DOM.filtroEncabezado.value;

			// Crea el form
			v.formData = new FormData();
			v.formData.append("campo_id", campos_id[cac.tipoEncab]);
			v.formData.append("encabezado_id", encabezado_id);
			v.formData.append("pestanaActiva", v.nombrePestanaActiva);
			v.formData.append(campo_id, encabezado_id);
			return;
		},
	};

	// Guarda los cambios
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Obtiene la pestaña activa
		v.nombrePestanaActiva = document.querySelector("#pestanasGuardar .pestana.activo")?.id;

		// Feedback si carrousel
		if (v.nombrePestanaActiva == "carrousel") {
		} else {
			// Crea el form
			FN.creaElForm();

			// Feedback si texto (textoImagen o texto)
			if (["textoImagen", "texto"].includes(v.nombrePestanaActiva)) {
				v.formData.append("texto", DOM.textoOutput.value);
			}

			// Feedback si video
			if (v.nombrePestanaActiva == "video") {
				v.formData.append("video", DOM.outputVideoId.value);
				v.formData.append("leyenda", DOM.muestraLeyendaVideo.innerText);
			}

			// Feedback si imagen (textoImagen o imagen)
		}

		// Guarda el contenido en la BD
		const respuesta = await fetch(rutas.guardaContenido, postForm(v.formData)).then((n) => n.json());

		// Actualiza
		DOM.filtroEncabezado.dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	// Lo actualiza por cambio en el encabezado
	DOM.filtroEncabezado.addEventListener("change", async () => {
		// Texto
		DOM.textoInput.querySelector(".ql-editor").innerHTML = "";

		// Video
		for (const input of DOM.inputsVideo) input.value = "";
		for (const div of DOM.divsVideo) div.innerHTML = "";

		// Fin
		return;
	});

	// Fin
	return;
});
