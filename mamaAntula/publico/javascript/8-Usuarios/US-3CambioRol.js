"use strict";

window.addEventListener("load", () => {
	// Variables
	const domForm = document.querySelector("#cuerpo #cambioRol");
	const DOM = {
		// Filtros
		rolFiltro: domForm.querySelector("select[name='rolFiltro']"),
		usuarioFiltro: domForm.querySelector("select[name='usuario']"),
		usuarioDefault: domForm.querySelector("select[name='usuario'] option[value='']"),
		usuarios: domForm.querySelectorAll("select[name='usuario'] option"),

		// Actualización de datos
		nombre: domForm.querySelector("input[name='nombreCompleto']"),
		iconoNombre: domForm.querySelector("input[name='nombreCompleto'] + i"),
		nuevoRol: domForm.querySelector("select[name='rol_id']"),
		iconoRol: domForm.querySelector("select[name='rol_id'] + i"),
	};
	const rutaApi = "/usuarios/api/us-cambio-de-roles";

	const cambioRol = () => {
		// Variables
		const rol_id = DOM.nuevoRol.value;

		// Cambia el rol en el filtro por usuario
		const usuarioElegido = DOM.usuarioFiltro.options[DOM.usuarioFiltro.selectedIndex];
		usuarioElegido.dataset.rol_id = rol_id;

		// Cambia el rol en el selector de roles
		DOM.rolFiltro.value = rol_id;

		// Dispara un evento change en el filtro por rol
		DOM.rolFiltro.dispatchEvent(new Event("change"));

		// Fin
		return;
	};

	// Eventos - Filtros - Rol
	DOM.rolFiltro.addEventListener("change", () => {
		// Actualiza los usuarios visibles
		for (const usuario of DOM.usuarios)
			usuario.dataset.rol_id == DOM.rolFiltro.value ? (usuario.hidden = false) : (usuario.hidden = true);

		// Si la opción de usuario seleccionada está oculta, selecciona el default
		const usuarioElegido = DOM.usuarioFiltro.options[DOM.usuarioFiltro.selectedIndex];
		if (usuarioElegido.hidden) {
			DOM.usuarioFiltro.value = "";
			DOM.usuarioFiltro.dispatchEvent(new Event("change"));
		}

		// Fin
		return;
	});
	// Eventos - Filtros - Usuario
	DOM.usuarioFiltro.addEventListener("change", () => {
		// Variables
		const opcionElegida = DOM.usuarioFiltro.options[DOM.usuarioFiltro.selectedIndex];

		// Actualiza el nombre y el rol
		DOM.nombre.value = opcionElegida.dataset.nombre_completo || "";
		DOM.nuevoRol.value = opcionElegida.dataset.rol_id || "";

		// Fin
		return;
	});

	// Evento input - Oculta los íconos
	DOM.nombre.addEventListener("input", () => DOM.iconoNombre.classList.add("ocultar"));

	// Guarda las novedades - mombreCompleto
	DOM.nombre.addEventListener("change", async () => {
		// Correcciones
		DOM.nombre.value = inicialMayus(DOM.nombre.value);

		// Variables
		const usuario_id = DOM.usuarioFiltro.value;
		const nombreCompleto = DOM.nombre.value;
		if (!usuario_id || !nombreCompleto) return;

		// Guarda el nombreCompleto en el BE
		const respuesta = await fetch(rutaApi, putJson({usuario_id, nombreCompleto})).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);

		// Muestra el ícono de OK
		DOM.iconoNombre.classList.remove("ocultar");

		// Fin
		return;
	});
	// Guarda las novedades - rol
	DOM.nuevoRol.addEventListener("change", async () => {
		// Variables
		const usuario_id = DOM.usuarioFiltro.value;
		const rol_id = DOM.nuevoRol.value;
		if (!usuario_id || !rol_id) return;

		// Guarda el rol_id en el BE
		const respuesta = await fetch(rutaApi, putJson({usuario_id, rol_id})).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);

		// Muestra el ícono de OK
		DOM.iconoRol.classList.remove("ocultar");

		// Acciones por el nuevo rol
		cambioRol();

		// Fin
		return;
	});

	// Fin
	return;
});
