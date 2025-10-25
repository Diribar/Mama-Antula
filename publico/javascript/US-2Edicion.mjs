"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#contenidoTemas #formEdicion"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

		// Inputs
		inputImagen: document.querySelector("#formEdicion #areaSoltar [name='imagen']"),
		apodo: document.querySelector("#formEdicion [name='apodo']"),
		contrasena: document.querySelector("#formEdicion [name='contrasena']"),
		notificacs: document.querySelector("#formEdicion [name='notificacs']"),

		// Drag & Drop
		areaSoltar: document.querySelector("#formEdicion #areaSoltar"),
		botonImagen: document.querySelector("#formEdicion #areaSoltar button"),
		vistaImagen: document.querySelector("#formEdicion #areaSoltar img"),
	};
	const v = {
		entrada: ["dragenter", "dragover"],
		salida: ["dragleave", "drop"],

		rutaValidaCampo: "/usuarios/api/us-valida-campo-edicion",
		rutaGuardar: "/usuarios/api/us-guarda-edicion-en-usuario",
		unInputCambio: false,
		errores: {},
		archivoImgSubido: false,
	};

	// Funciones
	const FN = {
		colorMensaje: () => {
			// Cambia el color en la respuesta
			DOM.mensaje.classList[!v.errores.hay ? "add" : "remove"]("exito");
			DOM.mensaje.classList[v.errores.hay ? "add" : "remove"]("error");
			DOM.mensaje.classList.remove("invisible");

			// Fin
			return;
		},
		nuevaImagen: async function (archImagen, vistaImagen) {
			// Procesa el archivo
			const nuevaImagen = await procesaArchImg(archImagen, vistaImagen);

			if (nuevaImagen) {
				v.archivoImgSubido = nuevaImagen;
				v.errores = {};
			} else {
				// Averigua si hay un error
				v.errores = {imagen: "El archivo no pudo ser leído como imagen", hay: true};

				// Respuestas
				this.respuestas("imagen");
				return;
			}

			// Crea los datos a enviar al backend
			const {name: imagen, size: tamano, type: tipo} = v.archivoImgSubido;
			v.datos = {...v.datos, imagen, tamano, tipo};

			// Fin
			return;
		},
		respuestas: function (campo) {
			// Respuestas
			DOM.mensaje.innerHTML = v.errores.hay
				? v.errores[campo]
				: (campo == "imagen" ? "La imagen" : "El valor del campo " + campo) + " se puede guardar";
			this.colorMensaje();

			// Acciones si no hay errores
			if (!v.errores.hay) {
				DOM.confirma.classList.remove("inactivo");
				v.unInputCambio = true;
			}

			// Fin
			return;
		},
		postJson: () => ({method: "POST", headers: {"Content-Type": "application/json"}, body: JSON.stringify(v.datos)}),
		postForm: (formData) => ({method: "POST", body: formData}),
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
		await FN.nuevaImagen(e.dataTransfer.files, DOM.vistaImagen);
		if (v.errores.hay) return;

		// Respuestas
		FN.respuestas(campo);

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
		v.errores = await fetch(v.rutaValidaCampo, FN.postJson()).then((n) => n.json());

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

		// Si no se hicieron cambios, interrumpe la función
		const hayAlgoParaguardar = archivoImgSubido || v.unInputCambio;
		if (!hayAlgoParaguardar) {
			DOM.mensaje.innerHTML = "No se hicieron cambios a guardar";
			v.errores = {hay: true};
			return FN.colorMensaje();
		}

		// Crea el FormData y agrega los datos del archivo de imagen
		const formData = new FormData();
		if (archivoImgSubido) {
			formData.append("imagen", archivoImgSubido.name);
			formData.append("tamano", archivoImgSubido.size);
			formData.append("tipo", archivoImgSubido.type);
		}

		// Agrega los demás campos
		if (DOM.apodo.value) formData.append("apodo", DOM.apodo.value);
		if (DOM.contrasena.value) formData.append("contrasena", DOM.contrasena.value);
		formData.append("notificacs", DOM.notificacs.checked);

		// Valida y guarda los cambios del form
		const errores = await fetch(v.rutaGuardar, FN.postForm(formData)).then((n) => n.json());
		console.log(errores);

		// Acciones en función de la respuesta recibida
		v.unInputCambio = false;
		DOM.mensaje.innerHTML = errores.hay
			? Object.values(errores)
					.filter((n) => !!n && n !== true && n !== false)
					.join(". ") // quita los 'no errores' y el 'hay'
			: "Los cambios fueron guardados";
		FN.colorMensaje();

		// Fin
		return;
	});
});
