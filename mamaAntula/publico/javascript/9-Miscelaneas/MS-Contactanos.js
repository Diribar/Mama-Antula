"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domForm = document.querySelector("#cuerpo form");
	const DOM = {
		mensaje: domForm.querySelector("[name='mensaje']"),
		submit: domForm.querySelector("button[type='submit']"),
		espera: domForm.querySelector("#espera"),
	};
	const ruta = "/contactanos/api/enviar";
	let respuesta;

	// Eventos - change
	domForm.addEventListener("change", (e) => {
		// Variables
		const campo = e.target.name;
		if (!e.target.value) return;

		// Quita espacios innecesarios
		e.target.value = e.target.value.trim();
		e.target.value = e.target.value.replace(/\s+/g, " ");

		// Inicial mayúscula
		if (["nombre", "institucion", "mensaje"].includes(campo) && e.target.value) e.target.value = inicialMayus(e.target.value);
	});

	// Eventos - submit
	domForm.addEventListener("submit", async (e) => {
		// Si confirmar está oculto, interrumpe la función
		e.preventDefault();
		if (DOM.submit.className.includes("ocultar")) return;
		DOM.submit.classList.add("ocultar");
		DOM.espera.classList.remove("ocultar");

		// Crea el FormData y agrega los datos
		const formData = new FormData(domForm);

		// Valida y guarda los cambios del form
		respuesta = await fetch(ruta, postForm(formData)).then((n) => n.json());

		// Feedback al emisor
		const mensaje = respuesta.error || "Le hemos enviado tu mensaje al equipo.";
		await carteles[respuesta.error ? "error" : "exito"](mensaje);

		// Borra el mensaje
		if (!respuesta.error) DOM.mensaje.value = "";

		// Quite el mensaje de espera
		DOM.submit.classList.remove("ocultar");
		DOM.espera.classList.add("ocultar");

		// Fin
		return;
	});

	// Fin
	return;
});
