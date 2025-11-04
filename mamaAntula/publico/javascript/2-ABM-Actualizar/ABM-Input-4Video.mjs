"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#layouts #video");
	const DOM = {
		// Inputs
		inputUrl: domLayout.querySelector("[name='url']"),
		inputLeyenda: domLayout.querySelector("[name='leyenda']"),

		// Muestra
		muestraVideo: domLayout.querySelector("#muestraVideo"),
		muestraLeyenda: domLayout.querySelector(".muestraLeyenda"),
	};
	console.log(DOM.inputUrl);

	const v = {};

	// Funciones
	const getYouTubeId = (url) => {
		const u = new URL(url);

		// Caso 1: URL normal con ?v=ID
		const idFromParam = u.searchParams.get("v");
		if (idFromParam) return idFromParam;

		// Caso 2: URL corta https://youtu.be/ID
		if (u.hostname === "youtu.be") return u.pathname.slice(1).split("/")[0].split("?")[0];

		return null; // No se pudo extraer
	};

	// Evento url
	DOM.inputUrl.addEventListener("input", () => {
		// Variables
		const inputUrl = DOM.inputUrl.value;
		if (!inputUrl.includes("youtu")) return;

		// Obtiene el id del video
		const youTubeId = getYouTubeId(inputUrl);
		if (!youTubeId) return;

		// Crea el iframe
		const iframe = document.createElement("iframe");
		iframe.src = "https://www.youtube.com/embed/" + youTubeId + "?autoplay=1";

		// Muestra el iframe
		DOM.muestraVideo.innerHTML = "";
		DOM.muestraVideo.appendChild(iframe);

		// Fin
		return;
	});

	// Fin
	return;
});
