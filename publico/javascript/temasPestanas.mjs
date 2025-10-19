"use strict";

window.addEventListener("load", async () => {
	const DOM = {
		iconoTemas: document.querySelector("#menuTemas #iconoTemas"),
		pestanas: document.querySelectorAll(".pestana"),
	};
	const v = {
		...(await fetch("/api/temas-pestanas/?url=" + pathname).then((res) => res.json())),
	};
	console.log(v);

	// Eventos


	// Fin
	return
});

// Variables
const {pathname} = location;
