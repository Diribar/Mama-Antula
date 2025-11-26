"use strict";

window.addEventListener("load", () => {
	// Variables
	const DOM = {logout: document.querySelector("#menuLogout #logout")};
	const rutaApi = "/usuarios/api/us-logout";

	// Evento logout
	DOM.logout.addEventListener("click", async () => {
		await fetch(rutaApi);
		location.reload();
	});
});
