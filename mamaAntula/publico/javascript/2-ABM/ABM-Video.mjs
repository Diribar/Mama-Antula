"use strict";

window.addEventListener("load", async () => {
	// Inicializamos Quill
	const quill = new Quill("#editor-container", {
		theme: "snow",
		placeholder: "Escribí acá tu contenido...",
		modules: {toolbar: "#toolbar"},
		formats: ["bold", "italic", "color", "list", "blockquote", "link", "image", "video"],
	});

	// Función para sincronizar textarea y previsualización
	const actualizarContenido = () => {
		const html = quill.root.innerHTML
			.replace("&nbsp;", " ") // reemplaza por espacios normales;
			.replace(/\s+/g, " ") // reemplaza espacios duplicados
			.replace(" </", "</") // reemplaza espacios mal puestos
			.trim(); // reemplaza espacios al final
		document.getElementById("contenidoText").value = html;
		return;
	};

	// EVENTO - Escuchamos cambios en Quill
	quill.on("text-change", actualizarContenido);

	// Evitar que se peguen estilos de color al pegar
	quill.clipboard.addMatcher(Node.ELEMENT_NODE, (node, delta) => {
		delta.ops.forEach((op) => op.attributes && delete op.attributes.color);
		return delta;
	});

	// Capturamos submit
	document.getElementById("miForm").addEventListener("submit", function (e) {
		e.preventDefault();
		console.log("Título:", document.getElementById("titulo").value);
		console.log("Contenido HTML:", document.getElementById("contenidoText").value);
		alert("Formulario listo para enviar. Revisa la consola.");
	});
});
