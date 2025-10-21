"use strict";
window.addEventListener("load", () => {
	// Variables
	const form = document.querySelector("form");
	const DOM = {
		mensajeError: form.querySelectorAll(".inputError .mensajeError"),
		inputs: form.querySelectorAll(".inputError .input"),
		button: form.querySelector("button[type='submit']"),
	};
	const v = {
		inputs: Array.from(DOM.inputs).map((n) => n.name),
		rutaApi: "/usuarios/api/us-valida-login/?",
	};

	// Funciones
	const FN = {
		// Base
		actualizaVarios: async function (indice) {
			// Detecta si hay errores
			errores = await this.averiguaLosErrores(indice);
			this.muestraLosErrores(errores, indice);

			// Activa/Desactiva el botón 'Guardar'
			this.actualizaBotonGuardar();
		},
		startUp: async function () {
			// Averigua y muestra los errores
			for (let indice = 0; indice < DOM.inputs.length; indice++) {
				errores = await this.averiguaLosErrores(indice);
				this.muestraLosErrores(errores, indice);
			}

			// Activa/Desactiva el botón 'Guardar'
			this.actualizaBotonGuardar();
		},

		// Auxiliares
		averiguaLosErrores: async (indice) => {
			// Variables
			const campo = DOM.inputs[indice].name;
			const valor = encodeURIComponent(DOM.inputs[indice].value);

			// Averigua los errores
			errores = DOM.inputs[indice].value ? await fetch(v.rutaApi + campo + "=" + valor).then((n) => n.json()) : "";

			// Fin
			return errores;
		},
		muestraLosErrores: (error, indice) => {
			// Variables
			const campo = DOM.inputs[indice].name;
			let mensaje = error[campo];

			// Reemplaza el mensaje, con particularidad para 'avatar'
			DOM.mensajesError[indice].innerHTML = mensaje;

			// Acciones en función de si hay o no mensajes de error
			DOM.iconosError[indice].classList[mensaje ? "remove" : "add"]("ocultar");
		},
		actualizaBotonGuardar: () => {
			// Variables
			const OK = Array.from(DOM.iconosOK)
				.map((n) => n.className)
				.every((n) => !n.includes("ocultar"));
			const error = Array.from(DOM.iconosError)
				.map((n) => n.className)
				.every((n) => n.includes("ocultar"));

			// Fin
			DOM.button.classList[OK && error?"remove":"add"]("inactivo")
		},
	};

	// Eventos - Input
	form.addEventListener("change", async (e) => {
		// Variables
		const input = e.target;
		const campo = input.name;
		const valor = input.value;
		const indice = v.inputs.indexOf(campo);

		// e-mail en minúscula
		if (campo == "email") input.value = valor.toLowerCase();

		// Acciones para los demás campos
		if (indice > -1) await FN.actualizaVarios(indice);
	});

	// Eventos - Submit
	form.addEventListener("submit", async (e) => {
		if (DOM.button.className.includes("inactivo")) {
			e.preventDefault();
			FN.startUp();
		}
	});
});

// Variables
let errores = {};
