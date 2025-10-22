"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		form: document.querySelector("#contenidoTemas #formAltaOlvido"),
		email: document.querySelector("#formAltaOlvido input[name='email']"),
		mensajeError: document.querySelector("#formAltaOlvido #mensajeError"),
		confirma: document.querySelector("#formAltaOlvido button"),
	};

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensajeError.innerHTML = "";
		DOM.mensajeError.classList.remove("error");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - change
	DOM.form.addEventListener("change", async (e) => {
		// Garantiza que el mail esté en minúsculas
		const valor = e.target.value.toLowerCase();
		e.target.value = valor;

		// Averigua si hay un error simple
		errorMail = !valor ? cartelMailVacio : !formatoMail.test(valor) ? cartelMailFormato : "";

		// Acciones si hay un error
		if (errorMail) {
			DOM.mensajeError.innerHTML = errorMail;
			DOM.mensajeError.classList.add("error");
			DOM.confirma.classList.add("inactivo");
		}

		// Fin
		return;
	});
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Si existe un error, interrumpe la función
		e.preventDefault();
		DOM.confirma.classList.add("inactivo");
		if (errorMail) return;

		// Envía el mail al backend
		const respuesta = await fetch(rutaApi + DOM.email.value).then((n) => n.json());

		// Acciones en función de la respuesta recibida
		DOM.confirma.classList[respuesta.hay ? "add" : "remove"]("error");
		DOM.confirma.classList[!respuesta.hay ? "add" : "remove"]("OK");
		DOM.mensajeError.innerHTML = respuesta.mensaje;
	});
});

// Variables
const cartelMailVacio = "Necesitamos que escribas un correo electrónico";
const cartelMailFormato = "Debes escribir un formato de correo válido";
const formatoMail = /^\w+([\.-_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
const rutaApi = "/usuarios/api/us-alta-de-mail-u-olvido-de-contrasena/?email=";
let errorMail;
