"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#contenidoTemas #formEdicion"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

		// Inputs
		inputs: document.querySelectorAll("#formEdicion .input"),
		apodo: document.querySelector("#formEdicion #apodo"),
		contrasena: document.querySelector("#formEdicion #contrasena"),
		notificacs: document.querySelector("#formEdicion #notificacs"),
	};
	const v = {
		rutaApi: "/usuarios/api/us-alta-de-mail-u-olvido-de-contrasena/?email=",
		unInputCambio: false,
		errores: {},
	};

	// Funciones
	const FN = {
		respuestas: () => {
			DOM.mensaje.classList[!v.errores.hay ? "add" : "remove"]("exito");
			DOM.mensaje.classList[v.errores.hay ? "add" : "remove"]("error");
			DOM.confirma.classList[v.errores.hay ? "add" : "remove"]("inactivo");
			return;
		},
	};

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensaje.innerHTML = "";
		DOM.mensaje.classList.remove("error");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - change
	DOM.form.addEventListener("change", async (e) => {
		// Variables
		const campo = e.target.name;
		DOM.confirma.classList.add("inactivo");

		// Averigua si hay un error
		v.errores = await fetch(v.rutaApi + campo + "=" + e.target.value).then((n) => n.json());
		DOM.mensaje.innerHTML = v.errores[campo];

		// Acciones si no hay errores
		if (!v.errores.hay) {
			v.unInputCambio = true;
			DOM.confirma.classList.remove("inactivo");
		}

		// Fin
		return;
	});
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Si confirmar está inactivo, interrumpe la función
		e.preventDefault();
		if (DOM.confirma.className.includes("inactivo")) return;
		DOM.confirma.classList.add("inactivo");

		// Si no se hicieron cambios, interrumpe la función
		const hayAlgoParaguardar = archivoImgSubido || v.unInputCambio;
		if (!hayAlgoParaguardar) {
			DOM.mensaje.innerHTML = "No se hicieron cambios a guardar";
			v.errores = {hay: true};
			return FN.respuestas();
		}

		// Crea el FormData y agrega los campos
		const formData = new FormData();
		if (archivoImgSubido) {
			formData.append("imagen", archivoImgSubido.name);
			formData.append("tamano", archivoImgSubido.size);
			formData.append("tipo", archivoImgSubido.type);
		}
		if (DOM.apodo.value) formData.append("apodo", input.value);
		if (DOM.contrasena.value) formData.append("contrasena", input.value);
		formData.append("notificacs", input.checked);

		// Averigua si hay errores
		const errores = await fetch("/usuarios/api/us-guarda-edicion/", {
			method: "POST",
			body: formData,
		}).then((n) => n.json());

		// Acciones en función de la respuesta recibida
		v.unInputCambio = false;
		DOM.mensaje.innerHTML = errores.hay
			? Object.values(errores)
					.filter((n) => !!n && n !== true && n !== false)
					.join(". ") // quita los 'no errores' y el 'hay'
			: "Los cambios fueron guardados";
		FN.respuestas();

		// Fin
		return;
	});
});
