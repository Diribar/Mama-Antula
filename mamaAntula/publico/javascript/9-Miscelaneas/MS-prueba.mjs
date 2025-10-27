"use strict";

window.addEventListener("load", async () => {
	// Inicializamos Quill
	const quill = new Quill("#editor-container", {
		theme: "snow",
		placeholder: "Escribe aquí tu contenido...",
		modules: {toolbar: "#toolbar"},
	});

	// Función para sincronizar textarea y previsualización
	function actualizarContenido() {
		const html = quill.root.innerHTML;
		document.getElementById("contenidoText").value = html;
		document.getElementById("preview").innerHTML = html;
	}

	// Escuchamos cambios en Quill
	quill.on("text-change", actualizarContenido);

	// Inicializamos previsualización
	actualizarContenido();

	// Capturamos submit
	document.getElementById("miForm").addEventListener("submit", function (e) {
		e.preventDefault();
		console.log("Título:", document.getElementById("titulo").value);
		console.log("Contenido HTML:", document.getElementById("contenidoText").value);
		alert("Formulario listo para enviar. Revisa la consola.");
	});
});
