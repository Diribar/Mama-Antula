"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Menú de temas
		iconoMenuTemas: document.querySelector("#menuTemas #iconoMenuTemas"),
		menuTemas: document.querySelector("#menuTemas #menuTemas"),
		temas: document.querySelectorAll("#menuTemas #menuTemas .tema"),
		tituloTema: document.querySelector("#menuTituloTema #tituloTema"),

		// Contenido
		contenidosTema: document.querySelectorAll("#contenidoTemas .contenidoTema"),
		listadosPestanas: document.querySelectorAll("#contenidoTemas .listadoPestanas"),
		contenidoPestanas: document.querySelectorAll(".contenidoPestana"),
	};
	v.seccionCodigo = document.querySelector("#menuTituloTema").getAttribute("data-seccion_codigo");

	// Eventos - temas
	for (const tema of DOM.temas)
		tema.addEventListener("click", () => {
			// Variables
			v.temaCodigo = tema.getAttribute("data-tema_codigo");

			// Actualiza la cookie de tema
			document.cookie = v.seccionCodigo + "=" + v.temaCodigo;

			// Actualiza el título del tema
			DOM.tituloTema.textContent = tema.textContent;

			// Muestra el listado de pestañas del tema activo, y oculta el listado de los demás temas
			for (const listado of DOM.listadosPestanas)
				listado.classList[listado.getAttribute("data-tema_codigo") == v.temaCodigo ? "remove" : "add"]("ocultar");

			// Muestra el contenido del tema activo, y oculta el de los demás temas
			for (const contenido of DOM.contenidosTema)
				contenido.classList[contenido.getAttribute("data-tema_codigo") == v.temaCodigo ? "remove" : "add"]("ocultar");

			// Muestra el contenido de la pestana activa, y oculta el de las demás
			for (const cont of DOM.contenidoPestanas)
				cont.classList[cont.getAttribute("data-pestana_codigo") == v.pestanaCodigo ? "remove" : "add"]("ocultar");

			// Fin
			return;
		});

	// Eventos - pestañas
	for (const listadoPestanas of DOM.listadosPestanas) {
		// Obtiene las pestañas del listado
		const pestanas = listadoPestanas.querySelectorAll(".pestana");

		// Acciones cuando se cambia de pestaña
		for (const pestanaActiva of pestanas)
			pestanaActiva.addEventListener("click", () => {
				// Variables
				v.pestanaCodigo = pestanaActiva.getAttribute("data-pestana_codigo");

				// Actualiza la cookie de pestana
				document.cookie = v.temaCodigo + "=" + v.pestanaCodigo;

				// Activa la pestaña actual, y desactiva las demás
				for (const pest of pestanas)
					pest.classList[pest.getAttribute("data-pestana_codigo") == v.pestanaCodigo ? "add" : "remove"]("activo");

				// Muestra el contenido de la pestaña activa, y oculta el de las demás
				for (const cont of DOM.contenidoPestanas)
					cont.classList[cont.getAttribute("data-pestana_codigo") == v.pestanaCodigo ? "remove" : "add"]("ocultar");
			});
	}

	// Fin
	return;
});

// Variables
const v = {};
const cookies = document.cookie.split("; "); // separa las cookies individuales
for (const cookie of cookies) {
	const [key, value] = cookie.split("="); // separa nombre y valor
	v[key] = value;
}
