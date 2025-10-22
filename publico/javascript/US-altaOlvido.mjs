"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		form: document.querySelector("#contenidoTemas #formAltaOlvido"),
		email: document.querySelector("#formAltaOlvido input[name='email']"),
		mensajeError: document.querySelector("#formAltaOlvido #mensajeError"),
		confirma: document.querySelector("#formAltaOlvido button"),
	};

	// Eventos - 'input'
	DOM.form.addEventListener("input", () => (DOM.mensajeError.innerHTML = ""));
	DOM.form.addEventListener("change", async (e) => {
		// Variables
		const {name: campo, value: valor} = e.target;

		// Garantiza que el mail esté en minúsculas
		e.target.value = valor.toLowerCase();

		// Actualiza los errores
		errorMail = !valor ? cartelMailVacio : !formatoMail.test(valor) ? cartelMailFormato : "";

		// Actualiza la vista
		FN.actualizaLosErrores();

		// Fin
		return;
	});
});

// Variables
let errorMail;
