"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		menuLogin: document.querySelector("#menuLogin"),
		inputs: form.querySelectorAll("#menuLogin input"),
		confirma: document.querySelector("#menuLogin #confirmaLogin"),
		mensajeError: document.querySelectorAll("#menuLogin #mensajeError"),
	};

	// Eventos
	// Eventos - Input
	DOM.menuLogin.addEventListener("input", (e) => {
		e.target.name == "email" && (e.target.value = e.target.value.toLowerCase()); // e-mail en minúscula
		DOM.mensajeError.innerText = "";// borra el mensaje de error
		return;
	});
	DOM.confirma.addEventListener("click", async () => {
		// Variables
		const email = DOM.inputs[0].value;
		const contrasena = DOM.inputs[1].value;
	});
});

// Variables
const rutaApi = "/usuarios/api/us-valida-login/?";
