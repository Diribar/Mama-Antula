"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		retrocede: document.querySelector("#flechas #retrocede"),
		avanza: document.querySelector("#flechas #avanza"),
	};
	const v = {
		retrocede: DOM.retrocede && DOM.retrocede.href,
		avanza: DOM.avanza && DOM.avanza.href,
		umbral: 50, // píxeles mínimos para considerar swipe
	};
	let inicioX, inicioY;

	// Eventos - situación inicial
	window.addEventListener("touchstart", (e) => {
		const touch = e.touches[0];
		inicioX = touch.clientX;
		inicioY = touch.clientY;
	});

	// Eventos - deslizamiento
	window.addEventListener("touchend", (e) => {
		// Situación final
		const touch = e.changedTouches[0];
		const finX = touch.clientX;
		const finY = touch.clientY;

		// Diferencia
		const diffX = finX - inicioX;
		const diffY = finY - inicioY;

		// Desplazamiento horizontal
		if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > v.umbral) {
			if (diffX > 0 && v.retrocede) location.href = v.retrocede;
			if (diffX < 0 && v.avanza) location.href = v.avanza;
		}
	});
});
