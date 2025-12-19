"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		muestraFiltroIndice: document.querySelector("#muestraFiltroIndice"),
		filtroIndice: document.querySelector("#filtroIndice"),
		titulos: document.querySelectorAll("#filtroIndice .titulo"),
	};

	// Funciones
	const ocultaMuestra = ({titulo, accion}) => {
		// Obtiene el padre
		const padre = titulo.closest(".tituloEncabs") || titulo.closest("#tituloFiltros");
		if (!padre) return;

		// Obtiene el hijo a ocultar/mostrar
		const hijo = padre.querySelector(".encabezados") || padre.querySelector("#filtros");

		// Oculta/muestra el hijo
		hijo.classList[accion]("ocultar");

		// Fin
		return;
	};

	// Eventos - Muestra el lado izquierdo
	DOM.muestraFiltroIndice.addEventListener("click", () => {
		// Ancho de la zona de filtros
		DOM.filtroIndice.classList.add("aumentaX");
		DOM.filtroIndice.classList.remove("disminuyeX");
	});

	// Eventos - Oculta el lado izquierdo
	document.addEventListener("click", (e) => {
		const ignorar = e.target.closest("#tituloFiltros, #indice, #muestraFiltroIndice");
		const hayQueDisminuir = DOM.filtroIndice.classList.contains("aumentaX");
		if (ignorar || !hayQueDisminuir) return;

		// Ancho de la zona de filtros
		DOM.filtroIndice.classList.add("disminuyeX");
		DOM.filtroIndice.classList.remove("aumentaX");
	});

	// Eventos - Gira el ícono 'muestraFiltroAnchors' y muestra/oculta los filtros y anchors
	for (const titulo of DOM.titulos)
		titulo.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			const muestraFiltroAnchors = titulo.querySelector(".muestraFiltroAnchors");
			if (!muestraFiltroAnchors) return;
			muestraFiltroAnchors.classList.toggle("girar");

			// Alterna entre mostrar y ocultar los encabezados
			ocultaMuestra({titulo, accion: "toggle"});

			// Fin
			return;
		});

	// Eventos - Si no se eligió un título o ícono, endereza todos los íconos y oculta los encabezados/filtros
	document.addEventListener("click", (e) => {
		// Si se eligió un título o ícono, interrumpe la función
		if (e.target.closest("#tituloFiltros") || e.target.closest("#indice")) return;

		// Endereza todos los íconos y oculta los encabezados
		for (const titulo of DOM.titulos) {
			// Endereza el ícono
			const muestraFiltroAnchors = titulo.querySelector(".muestraFiltroAnchors");
			if (!muestraFiltroAnchors) continue;
			muestraFiltroAnchors.classList.remove("girar");

			// Oculta los encabezados/filtros
			ocultaMuestra({titulo, accion: "add"});
		}
	});
});
