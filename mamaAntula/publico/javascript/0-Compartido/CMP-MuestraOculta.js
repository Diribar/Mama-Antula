"use strict";
window.addEventListener("load", () => {
	// DOM
	const DOM = {
		// Todos los lugares donde hacer click y qué mostrar
		clicks: document.querySelectorAll(".mostrarClick"),
		menus: document.querySelectorAll(".mostrarToggle"),

		// Relacionado con búsqueda rápida
		menuMobile: document.querySelector("header #menuMobile"),
		brMostrar: document.querySelector("header #busquedaRapida .mostrarToggle"), // es el contenedor del input
		brInput: document.querySelector("header #busquedaRapida .mostrarToggle input"), // es el input
	};

	// Mensajes de ayuda
	window.addEventListener("click", (e) =>
		DOM.clicks.forEach((click, i) => {
			// Si el 'click' fue dentro del menú, saltea la rutina
			const menu = DOM.menus[i];
			if (menu.contains(e.target)) return;

			// Se fija si el 'click' fue en el ícono y si está activo
			e.target == click && !click.classList.contains("inactivo")
				? menu.classList.toggle("ocultar") // caso exitoso, toggle del menu
				: menu.classList.add("ocultar"); // caso fallido, oculta el menu

			// Si el click fue 'menú Mobile búsqueda rápida', muestra el input
			if (e.target.classList.contains("brMobile")){
				DOM.brMostrar.classList.remove("ocultar");
				DOM.menuMobile.classList.add("ocultar");
			}

			// Pone el foco en el input de la búsqueda rápida
			if (!DOM.brMostrar.classList.contains("ocultar")) DOM.brInput.focus();
		})
	);
});
