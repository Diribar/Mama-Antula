"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domForm = document.querySelector("#cuerpo form");
	const DOM = {
		mensaje: domForm.querySelector("[name='mensaje']"),
		submit: domForm.querySelector("button[type='submit']"),
	};
	const ruta = "/contactanos/api/enviar";
	let respuesta;

	// Eventos - change
	domForm.addEventListener("change", (e) => {
		const campo = e.target.name;
		const valor = e.target.value;
		if (["nombre", "institucion", "mensaje"].includes(campo) && valor) e.target.value = inicialMayus(valor);
	});

	// Eventos - submit
	domForm.addEventListener("submit", async (e) => {
		// Si confirmar está oculto, interrumpe la función
		e.preventDefault();
		if (DOM.submit.className.includes("invisible")) return;
		DOM.submit.classList.add("invisible");

		// Crea el FormData y agrega los datos
		const formData = new FormData(domForm);

		// Valida y guarda los cambios del form
		respuesta = await fetch(ruta, postForm(formData)).then((n) => n.json());

		// Feedback al emisor
		const mensaje = respuesta.error || "Le hemos enviado tu mensaje a los interesados.";
		await carteles[respuesta.error ? "error" : "exito"](mensaje);

		// Si hay error, vuelve a mostrar el botón de enviar
		if (respuesta.error) DOM.submit.classList.remove("invisible");
		// Borra el mensaje
		else DOM.mensaje.value = "";

		// Fin
		return;
	});

	// Fin
	return;
});
