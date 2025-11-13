"use strict";
window.addEventListener("load", async () => {
	// Variables
	const domTimer = document.querySelector("#timer");
	const unMinuto = 60 * 1000;
	const minutosDispon = 60;

	// Funciones
	const FN = {
		timer: setInterval(() => {
			// Actualiza los minutos disponibles
			minutosDispon--;
			if (minutosDispon < 0) minutosDispon = 0;
			domTimer.innerText = minutosDispon + " min.";

			// Acciones si se acabó el tiempo
			if (minutosDispon == 0) {
				clearInterval(FN.timer);
				return FN.funcionCartel();
			}

			// Si sigue habiendo tiempo, actualiza el formato
			else FN.formatoTimer();
		}, unMinuto),
		formatoTimer: () =>
			(minutosDispon <= 15 && (DOM.timer.style.backgroundColor = "var(--rojoOscuro)")) ||
			(minutosDispon <= 30 && (DOM.timer.style.backgroundColor = "var(--naranjaOscuro)")),
	};

	// Start-up
});

// Variables
let minutosDispon;
