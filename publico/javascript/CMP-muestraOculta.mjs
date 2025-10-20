"use strict";
window.addEventListener("load", () => {
	// DOM
	const DOM = {
		// Todos los lugares donde hacer click y qué mostrar
		clicks: document.querySelectorAll(".clickIcono"),
		menus: document.querySelectorAll(".toggleMenu"),
	};

	// Mensajes de ayuda
	window.addEventListener("click", (e) => {
		// Rutina por cada dupla
		for (let i = 0; i < DOM.clicks.length; i++) {

			// Se fija si el 'click' fue en el ícono y si está activo
			e.target == DOM.clicks[i] && !DOM.clicks[i].className.includes("inactivo")
				? DOM.menus[i].classList.toggle("ocultar") // caso exitoso, toggle del menu
				: DOM.menus[i].classList.add("ocultar"); // caso fallido, oculta el menu
		}
	});
});
