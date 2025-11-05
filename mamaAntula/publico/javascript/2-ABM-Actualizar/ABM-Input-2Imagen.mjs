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

		rutaValidaCampo: "/usuarios/api/us-valida-campo-edicion",
		rutaGuardar: "/usuarios/api/us-guarda-edicion-en-usuario",
		unInputCambio: false,
		errores: {},
		archivoImgSubido: null,
	};

	// Funciones
	const obtieneNuevaImagen = async function (archImagen, vistaImagen) {
		// Acciones si no se cargó una imagen
		const nuevaImagen = await procesaArchImg(archImagen, vistaImagen);
		if (!nuevaImagen) {
			v.errores = {imagen: "El archivo no pudo ser leído como imagen", hay: true};
			this.respuestas("imagen");
			return;
		}

		// Actualiza variables
		v.archivoImgSubido = nuevaImagen;
		const {name: imagen, size: tamano, type: tipo} = v.archivoImgSubido;
		v.datos = {...v.datos, imagen, tamano, tipo};
		v.errores = {};

		// Fin
		return;
	};

	DOM.areaSoltar.addEventListener("drop", async (e) => {
		// Variables
		v.datos = {campo: "imagen"};
		await obtieneNuevaImagen(e.dataTransfer.files, DOM.vistaImagen);
		if (v.errores.hay) return;

		// Averigua si hay un error
		v.errores = await fetch(v.rutaValidaCampo, postJson(v.datos)).then((n) => n.json());

		// Respuestas
		FN.respuestas("imagen");

		// Fin
		return;
	});
	// Eventos - change
	DOM.form.addEventListener("change", async (e) => {
		// Inactiva confirmar
		DOM.confirma.classList.add("inactivo");

		// Crea los datos a enviar
		const campo = e.target.name;
		v.datos = {campo, [campo]: e.target.value};

		if (campo == "imagen") {
			await obtieneNuevaImagen(DOM.inputImagen.files, DOM.vistaImagen);
			if (v.errores.hay) return;
		}

		// Fin
		return;
	});

	// Evento para simular el click en el input - Busca un archivo de imagen
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
});
