"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		aumentaDisminuye: document.querySelector("#ladoIzq #aumentaDisminuye"),
		filtroIndice: document.querySelector("#ladoIzq #filtroIndice"),
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

	// Eventos - Muestra/oculta el lado izquierdo
	DOM.aumentaDisminuye.addEventListener("click", () => {
		// Ancho de la zona de filtros
		DOM.filtroIndice.classList.toggle("aumentaX");
		const esAumentaX = DOM.filtroIndice.classList.contains("aumentaX");
		DOM.filtroIndice.classList[esAumentaX ? "remove" : "add"]("disminuyeX");

		// Flecha
		DOM.aumentaDisminuye.classList.toggle("flechaIzq");
		const esFlechaIzq = DOM.aumentaDisminuye.classList.contains("flechaIzq");
		DOM.aumentaDisminuye.classList[esFlechaIzq ? "remove" : "add"]("flechaDer");
	});

	// Eventos - Gira el ícono y muestra/oculta los encabezados
	for (const titulo of DOM.titulos)
		titulo.addEventListener("click", () => {
			// Alterna entre girar o no el ícono
			const mostrar = titulo.querySelector(".mostrar");
			if (!mostrar) return;
			mostrar.classList.toggle("girar");

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
			const mostrar = titulo.querySelector(".mostrar");
			if (!mostrar) continue;
			mostrar.classList.remove("girar");

			// Oculta los encabezados/filtros
			ocultaMuestra({titulo, accion: "add"});
		}
	});
});
