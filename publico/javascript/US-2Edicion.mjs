"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		// Formulario
		form: document.querySelector("#contenidoTemas #formEdicion"),
		inputs: document.querySelectorAll("#formEdicion .input"),
		mensaje: document.querySelector("#formEdicion #mensaje"),
		confirma: document.querySelector("#formEdicion #confirma"),

	};
	const rutaApi = "/usuarios/api/us-alta-de-mail-u-olvido-de-contrasena/?email=";

	// Eventos - input
	DOM.form.addEventListener("input", (e) => {
		console.log(e.target.name);

		DOM.mensaje.innerHTML = "";
		DOM.mensaje.classList.remove("error");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - change
	// DOM.form.addEventListener("change", async () => fnErrorMail());
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Evita el confirm
		e.preventDefault();
		return

		// Si no se revisaron los errores, los revisa
		if (errorMail === undefined) fnErrorMail();

		// Si existe un error, interrumpe la función
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
