"use strict";

window.addEventListener("load", async () => {
	// Inicializamos Quill
	const quill = new Quill("#editor-container", {
		theme: "snow",
		placeholder: "Escribí acá tu contenido...",
		modules: {toolbar: "#toolbar"},
		formats: ["bold", "italic", "list", "list", "blockquote", "link", "image", "video"],
	});

	// Función para sincronizar textarea y previsualización
	function actualizarContenido() {
		const html = quill.root.innerHTML
			.replace(/&nbsp;/g, " ") // reemplaza por espacios normales;
			.replace(/\s+/g, " ") // reemplaza espacios duplicados
			.replace(" </", "</") // reemplaza espacios al inicio
			.trim(); // reemplaza espacios al final
		document.getElementById("contenidoText").value = html;
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
