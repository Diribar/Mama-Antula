"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		mini: document.getElementById("mini"),
		modal: document.getElementById("modal"),
	};

	// Eventos
	mini.addEventListener("click", () => (modal.style.display = "flex"));
	modal.addEventListener("click", () => (modal.style.display = "none"));
});
