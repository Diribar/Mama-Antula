"use strict";

export default async (req, res, next) => {
	// Broadcast that you're opening a page
	localStorage.openpages = Date.now();

	// Funcion
	var onLocalStorageEvent = (e) => {
		console.log(e.key);

		// Listen if anybody else is opening the same page!
		// if (e.key == "openpages") localStorage.page_available = Date.now();

		// if (e.key == "page_available") location.href = "/";
	};

	// Evento
	window.addEventListener("storage", onLocalStorageEvent, false);

	// Fin
	return next();
}
