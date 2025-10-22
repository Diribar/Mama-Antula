"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		form: document.querySelector("#contenidoTemas #formAltaOlvido"),
		email: document.querySelector("#formAltaOlvido input[name='email']"),
		mensaje: document.querySelector("#formAltaOlvido #mensaje"),
		confirma: document.querySelector("#formAltaOlvido button"),
	};
	const rutaApi = "/usuarios/api/us-alta-de-mail-u-olvido-de-contrasena/?email=";

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensaje.innerHTML = "";
		DOM.mensaje.classList.remove("error");
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
			DOM.mensaje.innerHTML = errorMail;
			DOM.mensaje.classList.add("error");
			DOM.confirma.classList.add("inactivo");
		}

		// Fin
		return;
	});
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Si existe un error, interrumpe la función
		e.preventDefault();
		if (errorMail) return;
		if (DOM.confirma.className.includes("inactivo")) return;
		DOM.confirma.classList.add("inactivo");

		// Envía el mail al backend
		const respuesta = await fetch(rutaApi + DOM.email.value).then((n) => n.json());

		// Acciones en función de la respuesta recibida
		DOM.mensaje.classList[!respuesta.hay ? "add" : "remove"]("exito");
		DOM.mensaje.classList[respuesta.hay ? "add" : "remove"]("error");
		DOM.mensaje.innerHTML = respuesta.email || respuesta.mensaje;

		// Fin
		return;
	});
});

// Variables
const cartelMailVacio = "Necesitamos que escribas un correo electrónico";
const cartelMailFormato = "Debes escribir un formato de correo válido";
const formatoMail = /^\w+([\.-_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
let errorMail;
