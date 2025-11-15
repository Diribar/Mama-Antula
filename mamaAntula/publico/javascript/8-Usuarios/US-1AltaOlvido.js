"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domEmail = document.querySelector("#formAltaOlvido input[name='email']");
	const ruta = "/usuarios/api/us-alta-olvido-contrasena";
	let respuesta;

	// Eventos - change
	domEmail.addEventListener("change", async () => {
		// Garantiza que el mail esté en minúsculas
		const valor = domEmail.value.toLowerCase().trim();
		domEmail.value = valor;

		// Valida
		respuesta = await fetch(ruta, postJson({email: domEmail.value})).then((n) => n.json());

		// Respuesta de error
		if (respuesta.error) return carteles.error(respuesta.error);

		// Respuesta de OK
		carteles.exito(respuesta.mensaje);

		// Fin
		return;
	});
});
