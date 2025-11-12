"use strict";

window.addEventListener("load", () => {
	// Broadcast that you're opening a page
	localStorage.estaPestana = Date.now();

	// Funcion
	const evento = (e) => {
		// Dispara el evento en otras pestañas, mediante 'localStorage.otraPestana'
		if (e.key == "estaPestana") localStorage.otraPestana = Date.now();

		// Si otra pestaña avisa que está abierta, esta pestaña cambia su url
		if (e.key == "otraPestana") window.history.back();
	};

	// Evento - provocado por otra pestaña, mediante 'localStorage.otraPestana'
	window.addEventListener("storage", evento, false);
});
