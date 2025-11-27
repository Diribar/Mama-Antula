"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		timer: document.querySelector("#timer"),
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),
	};
	const unMinuto = 60 * 1000;
	const minutosPermitidos = 60;
	let minutosDispon = minutosPermitidos;
	let timer; // ← Necesario para reiniciar después

	// Funciones
	const FN = {
		formatoTimer: () =>
			(minutosDispon <= 15 && (DOM.timer.style.backgroundColor = "var(--rojoOscuro)")) ||
			(minutosDispon <= 30 && (DOM.timer.style.backgroundColor = "var(--naranjaOscuro)")),
		cartelDeAviso: async () => {
			// Variables
			const mensaje =
				"Transcurrieron " +
				minutosPermitidos +
				" min. sin guardado de novedades." +
				"<br>" +
				"Para poder volver a usar esta vista, necesitamos que la vuelvas a cargar.";
			const cancelButtonText = "Salir de esta vista";
			const confirmButtonText = "Recargar vista";

			// Aviso y acciones
			const confirma = await carteles.confirmar({mensaje, cancelButtonText, confirmButtonText});
			confirma ? location.reload() : (location.href = await actualizaUrlLectura());

			// Fin
			return;
		},
	};

	// Función para iniciar el timer
	const iniciarTimer = () =>
		setInterval(() => {
			minutosDispon--;
			if (minutosDispon < 0) minutosDispon = 0;
			DOM.timer.innerText = minutosDispon + " min.";

			if (minutosDispon == 0) {
				clearInterval(timer);
				return FN.cartelDeAviso();
			} else {
				FN.formatoTimer();
			}
		}, unMinuto);

	// Inicia el timer por primera vez
	timer = iniciarTimer();

	// Reinicia el timer al cambiar de encabezado
	DOM.filtroEncab &&
		DOM.filtroEncab.addEventListener("change", () => {
			// Si el encabezado no tiene un valor, interrumpe la función
			if (!DOM.filtroEncab.value) return;

			// Reinicia el timer
			clearInterval(timer);
			minutosDispon = minutosPermitidos;
			DOM.timer.innerText = minutosDispon + " min.";
			DOM.timer.style.backgroundColor = "";

			// Vuelve a arrancar
			timer = iniciarTimer();

			// Fin
			return;
		});

	// Start-up
	DOM.timer.innerText = minutosDispon + " min.";

	// Fin
	return;
});
