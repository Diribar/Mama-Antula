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
	v.temaCodigo = v[v.seccionCodigo];
	v.pestanaCodigo = v[v.temaCodigo];

	// Eventos - temas
	for (const tema of DOM.temas)
		tema.addEventListener("click", () => {
			// Variables
			v.temaCodigo = tema.getAttribute("data-tema_codigo");
			v.pestanaCodigo = v[v.temaCodigo];

			// Actualiza la cookie y el título del tema
			document.cookie = v.seccionCodigo + "=" + v.temaCodigo;
			DOM.tituloTema.textContent = tema.textContent;

			// Activa la opción elegida del menú
			for (const tema of DOM.temas)
				tema.classList[tema.getAttribute("data-tema_codigo") == v.temaCodigo ? "add" : "remove"]("activo");

			// Muestra el contenido del tema activo
			for (const contenido of DOM.contenidosTema)
				contenido.classList[contenido.getAttribute("data-tema_codigo") == v.temaCodigo ? "remove" : "add"]("ocultar");

			// Muestra el listado de pestañas del tema activo
			for (const listado of DOM.listadosPestanas)
				listado.classList[listado.getAttribute("data-tema_codigo") == v.temaCodigo ? "remove" : "add"]("ocultar");

			// Muestra el contenido de la pestana activa
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
				// Actualiza la cookie de pestana
				v.pestanaCodigo = pestanaActiva.getAttribute("data-pestana_codigo");
				document.cookie = v.temaCodigo + "=" + v.pestanaCodigo;

				// Activa la pestaña actual
				for (const pest of pestanas)
					pest.classList[pest.getAttribute("data-pestana_codigo") == v.pestanaCodigo ? "add" : "remove"]("activo");

				// Muestra el contenido de la pestaña activa
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
