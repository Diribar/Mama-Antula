"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),
		iconoGuardar: document.querySelector("#pestanasGuardar #iconoGuardar"),

		// Inputs
		texto: document.querySelector("#texto textarea"),
		video: document.querySelector("#video input"),
	};
	const rutas = {
		guardaContenido: "/contenido/api/abm-guarda-contenido",
	};
	const v = {};

	// Funciones
	const FN = {
		creaElForm: () => {
			v.formData = new FormData();
			v.formData.append("encabezado_id", DOM.filtroEncabezado.value);
			v.formData.append("tipoEncab", cac.tipoEncab);
			return;
		},
	};

	// Guarda los cambios
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Obtiene la pestaña activa
		const nombrePestanaActiva = document.querySelector("#pestanasGuardar .pestana.activo")?.id;

		// Feedback si carrousel
		if (nombrePestanaActiva == "carrousel") {
		} else {
			// Crea el form
			FN.creaElForm();

			// Feedback si texto (textoImagen o texto)
			if (["textoImagen", "texto"].includes(nombrePestanaActiva)) {
				v.formData.append("texto", DOM.texto.value);
			}

			// Feedback si video
			if (nombrePestanaActiva == "video") {
				v.formData.append("video", DOM.video.value);
			}

			// Feedback si imagen (textoImagen o imagen)
		}

		// Guarda el contenido en la BD
		const respuesta = await fetch(rutas.guardaContenido, postForm(v.formData)).then((n) => n.json());

		// Actualiza
		DOM.filtroEncabezado.dispatchEvent(new Event("change"));

		// Fin
	});

	// Fin
	return;
});
