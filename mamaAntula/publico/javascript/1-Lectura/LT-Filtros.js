"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domForm = document.querySelector("#tituloFiltros #filtros");
	const ruta = "api/lt-filtros";
	let interrumpeFetch;

	// Eventos - input
	domForm.addEventListener("input", async (e) => {
		// Obtiene los valores del formulario
		const form = new FormData(domForm);
		// console.log([...form.entries()]);

		// Cancela la búsqueda anterior si aún no terminó
		interrumpeFetch?.abort();
		interrumpeFetch = new AbortController();
		const {signal} = interrumpeFetch;
		let interrupcion;

		// Envia los datos
		const respuesta = await fetch(ruta, {...postForm(form), signal})
			.then((n) => n.json())
			.catch(() => (interrupcion = true));
		if (interrupcion) return;

		// Actualiza los encabezados visibles

	});
});
