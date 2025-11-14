"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domForm = document.querySelector("#cuerpo #cambioRoles");
	const DOM = {
		// Filtros
		rolFiltro: domForm.querySelector("select[name='rolFiltro']"),
		usuario: domForm.querySelector("select[name='usuario']"),
		usuarios: domForm.querySelectorAll("select[name='usuario'] option"),
		usuarioDefault: domForm.querySelector("select[name='usuario'] option[value='']"),

		// Actualización de datos
		nombre: domForm.querySelector("input[name='nombreCompleto']"),
		iconoNombre: domForm.querySelector("input[name='nombreCompleto'] + i"),
		rol_id: domForm.querySelector("select[name='rol_id']"),
		iconoRol: domForm.querySelector("select[name='rol_id'] + i"),
	};
	const rutaApi = "/usuarios/api/us-cambia-roles/?usuario_id=";

	// Eventos - Filtros - Rol
	DOM.rolFiltro.addEventListener("change", () => {
		// Actualiza los usuarios visibles
		for (const usuario of DOM.usuarios)
			usuario.dataset.rol_id == DOM.rolFiltro.value ? (usuario.hidden = false) : (usuario.hidden = true);

		// Si la opción de usuario seleccionada está oculta, selecciona el default
		const usuarioElegido = DOM.usuario.options[DOM.usuario.selectedIndex];
		if (usuarioElegido.hidden) {
			DOM.usuario.value = "";
			DOM.usuario.dispatchEvent(new Event("change"));
		}

		// Fin
		return;
	});
	// Eventos - Filtros - Usuario
	DOM.usuario.addEventListener("change", () => {
		// Variables
		const opcionElegida = DOM.usuario.options[DOM.usuario.selectedIndex];

		// Actualiza el nombre y el rol
		DOM.nombre.value = opcionElegida.dataset.nombre_completo || "";
		DOM.rol_id.value = opcionElegida.dataset.rol_id || "";

		// Fin
		return;
	});

	// Evento input - Oculta los íconos
	DOM.nombre.addEventListener("input", () => DOM.iconoNombre.classList.add("ocultar"));

	// Guarda las novedades
	DOM.nombre.addEventListener("change", async () => {
		// Variables
		const usuario_id = DOM.usuario.value;
		const nombreCompleto = DOM.nombre.value;
		if (!usuario_id || !nombre) return;

		// Guarda el nombreCompleto en el BE
		const respuesta = {error: "No se pudo actualizar el nombre"};
		//await fetch(rutaApi + usuario_id, putJson({nombreCompleto})).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		// if (respuesta.error) return carteles.error(respuesta.error);

		// Muestra el ícono de OK
		DOM.iconoNombre.classList.remove("ocultar");

		// Fin
		return;
	});
	DOM.rol_id.addEventListener("change", () => {
		// Variables
		const usuario_id = DOM.usuario.value;
		const rol_id = DOM.rol_id.value;
		if (!usuario_id || !rol_id) return;

		// Guarda el rol_id en el BE
		const respuesta = {error: "No se pudo actualizar el rol"};
		//await fetch(rutaApi + usuario_id, putJson({rol_id})).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		// if (respuesta.error) return carteles.error(respuesta.error);

		// Muestra el ícono de OK
		DOM.iconoRol.classList.remove("ocultar");

		// Fin
		return;
	});

	// Fin
	return;
});
