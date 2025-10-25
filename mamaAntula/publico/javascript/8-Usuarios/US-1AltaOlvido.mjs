"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		form: document.querySelector("#contenidoTemas #formAltaOlvido"),
		email: document.querySelector("#formAltaOlvido input[name='email']"),
		mensaje: document.querySelector("#formAltaOlvido #mensaje"),
		confirma: document.querySelector("#formAltaOlvido #confirma"),
	};
	const rutaApi = "/usuarios/api/us-envia-contrasena-por-mail/?email=";

	const fnErrorMail = () => {
		// Garantiza que el mail esté en minúsculas
		const valor = DOM.email.value.toLowerCase();
		DOM.email.value = valor;

		// Averigua si hay un error simple
		errorMail = !valor ? cartelMailVacio : !formatoMail.test(valor) ? cartelMailFormato : "";

		// Acciones si hay un error
		if (errorMail) {
			fnUsuariosComp.colorMensaje(DOM, true, errorMail);
			DOM.confirma.classList.add("inactivo");
		}
	};

	// Eventos - input
	DOM.form.addEventListener("input", () => {
		DOM.mensaje.classList.add("invisible");
		DOM.confirma.classList.remove("inactivo");
	});
	// Eventos - change
	DOM.form.addEventListener("change", async () => fnErrorMail());
	// Eventos - submit
	DOM.form.addEventListener("submit", async (e) => {
		// Evita el confirm
		e.preventDefault();

		// Si no se revisaron los errores, los revisa
		if (errorMail === undefined) fnErrorMail();

		// Si existe un error, interrumpe la función
		if (errorMail) return;
		if (DOM.confirma.className.includes("inactivo")) return;
		DOM.confirma.classList.add("inactivo");

		// Envía el mail
		const respuesta = await fetch(rutaApi + DOM.email.value).then((n) => n.json());

		// Acciones en función de la respuesta recibida
		fnUsuariosComp.colorMensaje(DOM, respuesta.hay, respuesta.email || respuesta.mensaje);

		// Fin
		return;
	});
});

// Variables
const cartelMailVacio = "Necesitamos que escribas un correo electrónico";
const cartelMailFormato = "Debes escribir un formato de correo válido";
const formatoMail = /^\w+([\.-_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
let errorMail;
