"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		form: document.querySelector("#tituloFiltros form#filtros"),
		anchors: document.querySelectorAll("#indice a"),
		tituloEncabs: document.querySelectorAll("#indice .tituloEncabs"),
	};
	let {pathname} = location;
	if (pathname.endsWith("/")) pathname = pathname.slice(0, -1);
	const ruta = pathname + "/api/lt-filtros";
	let interrumpeFetch, idsVisibles;

	// Funciones
	const muestraOcultaAnchors = () => {
		// Muestra/oculta los anchors, en función de los idsVisibles
		for (const anchor of DOM.anchors)
			anchor.classList[idsVisibles.includes(Number(anchor.dataset.id)) ? "remove" : "add"]("ocultar");

		// Muestra/oculta los tituloEncabs, en función de si tienen algún anchor visible
		for (const tituloEncab of DOM.tituloEncabs) {
			const anchors = tituloEncab.querySelectorAll("a");
			const visible = Array.from(anchors).some((n) => !n.classList.contains("ocultar"));
			tituloEncab.classList[visible ? "remove" : "add"]("ocultar");
		}
	};

	// Eventos - input
	DOM.form.addEventListener("input", async (e) => {
		// Obtiene los valores del formulario
		const form = new FormData(DOM.form);

		// Cancela la búsqueda anterior si aún no terminó
		interrumpeFetch?.abort();
		interrumpeFetch = new AbortController();
		const {signal} = interrumpeFetch;
		let interrupcion;

		// Envia los datos
		idsVisibles = await fetch(ruta, {...postForm(form), signal})
			.then((n) => n.json())
			.catch(() => (interrupcion = true));
		if (interrupcion) return;

		// Muestra/oculta los anchors
		muestraOcultaAnchors();

		// Reemplaza 'Sin Filtro" por "Elegí un valor"
		if (!e.target.value) e.target.value = "";

		// Fin
		return;
	});
});
