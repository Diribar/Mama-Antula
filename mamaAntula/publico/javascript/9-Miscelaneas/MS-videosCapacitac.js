"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domBotones = document.querySelectorAll("#cuerpo button");

	// Función
	const html = (url) => `
		<video controls autoplay style="width:100%; max-height:70vh;">
			<source src="${url}" type="video/mp4">
		</video>
	`;

	// Evento
	for (const boton of domBotones)
		boton.addEventListener("click", () =>
			Swal.fire({
				html: html(boton.dataset.video),
				width: 800,
				showConfirmButton: false,
				padding: 0,

				// 👉 Cerrar al hacer clic fuera
				allowOutsideClick: true,
				backdrop: true,
			})
		);
});

