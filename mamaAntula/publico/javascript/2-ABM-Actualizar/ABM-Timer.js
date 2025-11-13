"use strict";
window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		timer: document.querySelector("#timer"),
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),
	};
	const unMinuto = 60 * 1000;
	const minutosPermitidos = 60;
	let minutosDispon;

	// Funciones
	const FN = {
		formatoTimer: () =>
			(minutosDispon <= 15 && (DOM.timer.style.backgroundColor = "var(--rojoOscuro)")) ||
			(minutosDispon <= 30 && (DOM.timer.style.backgroundColor = "var(--naranjaOscuro)")),
		cartelDeAviso: () => {
			// Mensaje
			const mensaje =
				"Se detectaron " +
				minutosPermitidos +
				" min. sin guardado de novedades." +
				"<br>" +
				"Para poder volver a usar esta vista, necesitamos que la vuelvas a cargar.";

			// Aviso
			Swal.fire({
				// General
				...{background: "rgb(242,242,242)", title: "Atención", icon: "warning", html: mensaje}, // grisClaro

				// Botón cancel
				...{showCancelButton: true, reverseButtons: true},
				...{cancelButtonText: "Salir de esta vista", cancelButtonColor: "firebrick"}, // rojoOscuro

				// Botón confirm
				...{confirmButtonText: "Recargar vista", confirmButtonColor: "rgb(79,98,40)"}, // verdeOscuro
			}).then(async (n) => {
				if (n.isConfirmed) location.reload();
				else if (n.isDismissed) {
					const redirigeLectura = await actualizaUrlLectura();
					location.href = redirigeLectura;
				}
			});

			// Fin
			return;
		},
	};

	DOM.filtroEncab.addEventListener("change", () => {
		// Si el encabezado no tiene un valor, interrumpe la función
		if (!DOM.filtroEncab.value) return;

		// Actualiza el timer
		if (timer) clearInterval(timer);
		minutosDispon = minutosPermitidos;
		DOM.timer.innerText = minutosDispon + " min.";

		// Rutina de timer
		timer = setInterval(() => {
			// Actualiza los minutos disponibles
			minutosDispon--;
			if (minutosDispon < 0) minutosDispon = 0;
			DOM.timer.innerText = minutosDispon + " min.";

			// Acciones si se acabó el tiempo
			if (minutosDispon == 0) {
				clearInterval(timer);
				return FN.cartelDeAviso();
			}

			// Si sigue habiendo tiempo, actualiza el formato
			else FN.formatoTimer();
		}, unMinuto);

		// Fin
		return;
	});

	// Fin
	return;
});

// Variables
let minutosDispon;
let timer; // variable global para guardar el intervalo
