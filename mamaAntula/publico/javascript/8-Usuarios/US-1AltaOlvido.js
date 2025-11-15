"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		form: document.querySelector("#formAltaOlvido"),
		email: document.querySelector("#formAltaOlvido input[name='email']"),
	};
	const ruta = "/usuarios/api/us-alta-olvido-contrasena";
	let contador;

	// Eventos - change
	DOM.form.addEventListener("submit", (e) => e.preventDefault());
	DOM.email.addEventListener("keydown", (e) => e.key == " " && e.preventDefault());
	DOM.email.addEventListener("change", async () => {
		// Garantiza que el mail esté en minúsculas
		const valor = DOM.email.value.toLowerCase().trim();
		DOM.email.value = valor;

		// Valida
		const respuesta = await fetch(ruta, postJson({email: DOM.email.value})).then((n) => n.json());

		// Respuestas
		if (respuesta.email) return carteles.error(respuesta.email);
		carteles.exito(respuesta.mensaje);

		// Fin
		return;
	});
});
