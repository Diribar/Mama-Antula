"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Form
		menuLogin: document.querySelector("#menuLogin"),

		// Inputs
		email: document.querySelector("#menuLogin input[name='email']"),
		contrasena: document.querySelector("#menuLogin input[name='contrasena']"),

		// Mensaje y confirma
		mensajeError: document.querySelector("#menuLogin #mensajeError"),
		confirma: document.querySelector("#menuLogin #confirmaLogin"),
	};

	// Eventos - Input
	DOM.menuLogin.addEventListener("input", (e) => {
		DOM.mensajeError.innerText = ""; // Borra el mensaje de error
		DOM.confirma.classList.remove("inactivo"); // Se activa el botón 'Confirma'
		return;
	});

	// Eventos - Change
	DOM.menuLogin.addEventListener("change", () => e.target.name == "email" && (e.target.value = e.target.value.toLowerCase()));

	// Eventos - Submit
	DOM.confirma.addEventListener("click", async () => {
		// Si confirma está inactivo, interrumpe la función
		if (DOM.confirma.className.includes("inactivo")) return;
		else DOM.confirma.classList.add("inactivo"); // Se inactiva el botón 'Confirma'

		// Variables
		const email = DOM.email.value;
		const contrasena = DOM.contrasena.value;

		// Valida los valores
		const errores = await fetch(rutaApi + "email=" + email + "&contrasena=" + contrasena).then((n) => n.json());
		const {email: errorEmail, contrasena: errorContrasena, credenciales} = errores;
		DOM.mensajeError.innerText = errorEmail || errorContrasena || credenciales || "";

		// Si no hubieron errores, se recarga la página
		if (!errores.hay) location.reload();

		// Fin
		return;
	});
});

// Variables
const rutaApi = "/usuarios/api/us-login/?";
