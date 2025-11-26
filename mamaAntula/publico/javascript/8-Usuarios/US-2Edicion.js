"use strict";

window.addEventListener("load", () => {
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
		eliminaImg: document.querySelector("#formEdicion #areaSoltar #eliminaImg"),
	};
	const rutas = {
		validaCampo: "/usuarios/api/us-edicion-de-usuario-campo",
		eliminaImagen: "/usuarios/api/us-edicion-de-usuario-elimina-imagen",
		guarda: "/usuarios/api/us-edicion-de-usuario-guarda",
	};
	const v = {
		// Eventos
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],

		// Imagen
		archivoImgSubido: null,
		imgInicial: !!DOM.vistaImagen.getAttribute("src"),

		// Otros
		unInputCambio: false,
		errores: {},
		apodoOk: DOM.apodo.value,
	};

	// Funciones
	const FN = {
		nuevaImagen: async function (archsEdicion, vistaImagen) {
			// Si no existen archivos, interrumpe la función
			if (!archsEdicion.length) return;

			// Acciones si no se cargó una imagen
			const archEdicion = archsEdicion[0];
			const urlImagen = await procesaArchImg(archEdicion, vistaImagen);
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
			const mensaje = v.errores.hay && v.errores[campo];

			// Acciones si hubieron errores
			if (mensaje) {
				if (campo == "apodo") v.apodoOk = false;
				return carteles.error(mensaje);
			}

			// Acciones si no hay errores
			if (campo == "apodo") v.apodoOk = true;
			if (v.apodoOk) DOM.confirma.classList.remove("ocultar");
			v.unInputCambio = true;

			// Fin
			return;
		},
		accionesSubmit: {
			hayAlgoParaGuardar: () => {
				// Averigua si hay algo para guardar
				const hayAlgoParaGuardar = v.archivoImgSubido || v.unInputCambio;

				// Acciones si no hay nada para guardar
				if (!hayAlgoParaGuardar) carteles.error("No se hicieron cambios a guardar");

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
			finSubmit: async () => {
				// Actualiza el mensaje
				const mensaje = v.errores.hay
					? Object.values(v.errores)
							.filter((n) => !!n && n !== true && n !== false) // quita los 'no errores' y el 'hay'
							.join(". ")
					: "Los cambios fueron guardados";

				// Actualiza el cartel
				await carteles[v.errores.hay ? "error" : "exito"](mensaje);
				if (v.errores.hay) return;

				// Fin
				return location.reload();
			},
		},
	};

	// Eventos - Busca un archivo de imagen
	DOM.areaSoltar.addEventListener("click", async (e) => {
		// Si no fue para eliminar, dispara el evento 'click'
		if (e.target.id != "eliminaImg") return DOM.inputImagen.click();

		// Si había una vista inicial, la elimina
		if (v.imgInicial) {
			// Pregunta al usuario si está seguro
			const mensaje = "¿Estás seguro/a de que querés eliminar la imagen guardada?";
			const respuesta = await carteles.confirmar({mensaje, cancelButtonText: "NO", confirmButtonText: "SI"});

			// Elimina la imagen del backend
			if (respuesta) await fetch(rutas.eliminaImagen, putJson({}));
		}

		// Recarga la vista
		return location.reload();
	});
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
		v.errores = await fetch(rutas.validaCampo, putJson(v.datos)).then((n) => n.json());

		// Respuestas
		FN.respuestas("imagen");

		// Fin
		return;
	});
	// Eventos - change
	DOM.form.addEventListener("change", async (e) => {
		// Crea los datos a enviar
		const campo = e.target.name;

		// Correcciones
		if (campo == "apodo") DOM.apodo.value = inicialMayus(DOM.apodo.value);

		// Inactiva confirmar
		DOM.confirma.classList.add("ocultar");

		// Variables
		v.datos = {campo, [campo]: e.target.value};
		if (campo == "imagen") {
			await FN.nuevaImagen(DOM.inputImagen.files, DOM.vistaImagen);
			if (v.errores.hay) return;
		}

		// Averigua si hay un error
		v.errores = await fetch(rutas.validaCampo, putJson(v.datos)).then((n) => n.json());

		// Respuestas
		FN.respuestas(campo);

		// Fin
		return;
	});
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Si confirmar está oculto, interrumpe la función
		e.preventDefault();
		if (DOM.confirma.className.includes("ocultar")) return;
		DOM.confirma.classList.add("ocultar"); // se deja ocultar hasta que se vuelve a hacer un input en el formulario

		// Si no hay algo para guardar, interrumpe la función
		if (!FN.accionesSubmit.hayAlgoParaGuardar()) return;

		// Crea el FormData y agrega los datos
		const formData = FN.accionesSubmit.formData();

		// Valida y guarda los cambios del form
		v.errores = await fetch(rutas.guarda, putForm(formData)).then((n) => n.json());

		// Acciones finales
		FN.accionesSubmit.finSubmit();

		// Fin
		return;
	});

	// Fin
	return;
});
