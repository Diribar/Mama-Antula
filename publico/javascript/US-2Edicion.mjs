"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#contenidoTemas #formEdicion"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

		// Inputs
		apodo: document.querySelector("#formEdicion #apodo"),
		contrasena: document.querySelector("#formEdicion #contrasena"),
		notificacs: document.querySelector("#formEdicion #notificacs"),
	};
	const v = {
		rutaValidaCampo: "/usuarios/api/us-valida-campo-edicion",
		rutaGuardar: "/usuarios/api/us-guarda-edicion-en-usuario",
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
		metodoPost: (datos) => ({
			method: "POST",
			headers: {"Content-Type": "application/json"},
			body: JSON.stringify(datos),
		}),
	};

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensaje.innerHTML = "";
		DOM.mensaje.classList.remove("error");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - change
	DOM.form.addEventListener("change", async (e) => {
		// Inactiva confirmar
		DOM.confirma.classList.add("inactivo");

		// Crea los datos a enviar
		const campo = e.target.name;
		const datos = {campo, [campo]: e.target.value};

		// Averigua si hay un error
		v.errores = await fetch(v.rutaValidaCampo, FN.metodoPost(datos)).then((n) => n.json());

		// Respuestas
		DOM.mensaje.innerHTML = v.errores[campo];
		FN.respuestas();

		// Acciones si no hay errores
		if (!v.errores.hay) {
			v.unInputCambio = true;
			DOM.confirma.classList.remove("inactivo");
			DOM.mensaje.innerHTML = "El valor del campo " + campo + " se puede guardar";
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

		// Valida y guarda los cambios del form
		const errores = await fetch(rutaGuardar, FN.metodoPost(formData)).then((n) => n.json());

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
