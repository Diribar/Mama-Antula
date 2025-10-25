"use strict";

window.addEventListener("load", () => {
	// Variables
	const contrasena = document.querySelector("#menuLogin input[name='contrasena']");
	const ojito = document.querySelector("#menuLogin i#eye");

	// Funciones
	const muestra = () => {
		contrasena.type = "text";
		ojito.classList.replace("fa-eye-slash", "fa-eye");
		return;
	};
	const oculta = () => {
		contrasena.type = "password";
		ojito.classList.replace("fa-eye", "fa-eye-slash");
		return;
	};

	// Muestra
	ojito.addEventListener("mousedown", () => muestra());
	ojito.addEventListener("touchstart", () => muestra());

	// Oculta
	ojito.addEventListener("mouseup", () => oculta());
	ojito.addEventListener("touchend", () => oculta());
});
