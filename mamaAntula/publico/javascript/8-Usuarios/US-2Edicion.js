"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Avatar del encabezado
		imagenHeader: document.querySelector("header #imagenUsuario"),

		// Formulario
		form: document.querySelector("#cuerpo #formEdicion"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

		// Inputs
		inputImagen: document.querySelector("#formEdicion #areaSoltar [name='imagen']"),
		apodo: document.querySelector("#formEdicion [name='apodo']"),
		contrasena: document.querySelector("#formEdicion [name='contrasena']"),
		notificacs: document.querySelector("#formEdicion [name='notificacs']"),

		// Drag & Drop
		areaSoltar: document.querySelector("#formEdicion #areaSoltar"),
		vistaImagen: document.querySelector("#formEdicion #areaSoltar img"),
	};
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],

		rutaValidaCampo: "/usuarios/api/us-campo-edicion-de-usuario",
		rutaGuardar: "/usuarios/api/us-edicion-de-usuario",
		unInputCambio: false,
		errores: {},
		archivoImgSubido: null,
	};

	// Funciones
	const FN = {
		nuevaImagen: async function (archsImagen, vistaImagen) {
			// Si no existen archivos, interrumpe la función
			if (!archsImagen.length) return;

			// Acciones si no se cargó una imagen
			const archImagen = archsImagen[0];
			const urlImagen = await procesaArchImg(archImagen, vistaImagen);
			if (!urlImagen) {
				v.errores = {imagen: "El archivo no pudo ser leído como imagen", hay: true};
				this.respuestas("imagen");
				return;
			}

			// Actualiza variables
			v.archivoImgSubido = urlImagen;
			const {name: imagen, size: tamano, type: tipo} = v.archivoImgSubido;
			v.datos = {...v.datos, imagen, tamano, tipo};
			v.errores = {};

			// Fin
			return;
		},
		respuestas: (campo) => {
			// Respuestas
			const mensaje = v.errores.hay
				? v.errores[campo]
				: (campo == "imagen" ? "La imagen" : "El valor del campo " + campo) + " se puede guardar";
			colorMensaje(DOM, v.errores.hay, mensaje);

			// Acciones si no hay errores
			if (!v.errores.hay) {
				DOM.confirma.classList.remove("inactivo");
				v.unInputCambio = true;
			}

			// Fin
			return;
		},
		accionesSubmit: {
			hayAlgoParaGuardar: () => {
				// Averigua si hay algo para guardar
				const hayAlgoParaGuardar = v.archivoImgSubido || v.unInputCambio;

				// Acciones si no hay nada para guardar
				if (!hayAlgoParaGuardar) {
					v.errores = {mensaje: "No se hicieron cambios a guardar", hay: true};
					colorMensaje(DOM, v.errores.hay, v.errores.mensaje);
				}

				// Fin
				return hayAlgoParaGuardar;
			},
			formData: () => {
				// Crea el formulario
				const formData = new FormData();

				// Le agrega los valores
				if (v.archivoImgSubido) {
					formData.append("archivo", v.archivoImgSubido);
					formData.append("imagen", v.archivoImgSubido.name);
					formData.append("tamano", v.archivoImgSubido.size);
					formData.append("tipo", v.archivoImgSubido.type);
				}
				if (DOM.contrasena.value) formData.append("contrasena", DOM.contrasena.value);
				formData.append("apodo", DOM.apodo.value);
				formData.append("notificacs", DOM.notificacs.checked ? 1 : 0);

				// Fin
				return formData;
			},
			finSubmit: () => {
				// Actualiza el mensaje
				const mensaje = v.errores.hay
					? Object.values(v.errores)
							.filter((n) => !!n && n !== true && n !== false)
							.join(". ") // quita los 'no errores' y el 'hay'
					: "Los cambios fueron guardados";
				colorMensaje(DOM, v.errores.hay, mensaje);

				// Actualiza la imagen en el header
				if (v.archivoImgSubido && !v.errores.imagen) {
					DOM.imagenHeader.src = URL.createObjectURL(v.archivoImgSubido);
				}

				// Cambia el nombre en el encabezado
				DOM.imagenHeader.setAttribute("title", "Hola " + DOM.apodo.value);

				// Resetea variables
				v.archivoImgSubido = null;
				v.unInputCambio = false;

				// Fin
				return;
			},
		},
	};

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensaje.classList.add("invisible");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - Busca un archivo de imagen
	DOM.areaSoltar.addEventListener("click", () => DOM.inputImagen.click());
	// Eventos - Drag & Drop
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
	DOM.areaSoltar.addEventListener("drop", async (e) => {
		// Variables
		v.datos = {campo: "imagen"};
		await FN.nuevaImagen(e.dataTransfer.files, DOM.vistaImagen);
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
			await FN.nuevaImagen(DOM.inputImagen.files, DOM.vistaImagen);
			if (v.errores.hay) return;
		}

		// Averigua si hay un error
		v.errores = await fetch(v.rutaValidaCampo, postJson(v.datos)).then((n) => n.json());

		// Respuestas
		FN.respuestas(campo);

		// Fin
		return;
	});
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Si confirmar está inactivo, interrumpe la función
		e.preventDefault();
		if (DOM.confirma.className.includes("inactivo")) return;
		DOM.confirma.classList.add("inactivo"); // se deja inactivo hasta que se vuelve a hacer un input en el formulario

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
});
