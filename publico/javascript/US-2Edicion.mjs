"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#contenidoTemas #formEdicion"),
		confirma: document.querySelector("#formEdicion #confirma"),
		mensaje: document.querySelector("#formEdicion #mensaje"),

		// Inputs
		inputs: document.querySelectorAll("#formEdicion .input"),
		apodo: document.querySelector("#formEdicion #apodo"),
		contrasena: document.querySelector("#formEdicion #contrasena"),
		novedades: document.querySelector("#formEdicion #novedades"),
	};
	const v = {
		rutaApi: "/usuarios/api/us-alta-de-mail-u-olvido-de-contrasena/?email=",
		unInputCambio: false,
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

		// Acciones en función de la respuesta recibida
		DOM.mensaje.innerHTML = v.errores[campo];
		if (!v.errores.hay) v.unInputCambio = true;

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
		const hayAlgoParaguardar = archivoCargado || v.unInputCambio;
		if (!hayAlgoParaguardar) {
			alert("No se hicieron cambios para guardar");
			return;
		}

		// Crea el FormData y agrega los campos
		const formData = new FormData();
		if (archivoCargado) formData.append("imagen", archivoCargado);
		if (DOM.apodo.value) formData.append("apodo", input.value);
		if (DOM.contrasena.value) formData.append("contrasena", input.value);
		formData.append("novedades", input.checked);

		// Averigua si hay errores
		const respuesta = await fetch("/usuarios/api/us-edicion-de-usuario/", {
			method: "POST",
			body: formData,
		}).then((n) => n.json());

		// Acciones en función de la respuesta recibida
		DOM.mensaje.innerHTML = respuesta.email || respuesta.mensaje;
		FN.respuestas();
		v.unInputCambio = false;

		// Fin
		return;
	});
});
