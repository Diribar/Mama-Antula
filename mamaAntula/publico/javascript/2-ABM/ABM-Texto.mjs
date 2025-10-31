"use strict";

window.addEventListener("load", async () => {
	// Variables
	const barraHerrams = {
		grupo1: [
			{codigo: "negrita", clase: "ql-bold", title: "Negrita"},
			{codigo: "cursiva", clase: "ql-italic", title: "Cursiva"},
		],
		grupo2: [
			{codigo: "listaNum", clase: "ql-list", value: "ordered", title: "Lista numerada"},
			{codigo: "dots", clase: "ql-list", value: "bullet", title: "Lista con viñetas"},
			{codigo: "cita", clase: "ql-blockquote", title: "Cita"},
		],
		grupo3: [{codigo: "link", clase: "ql-link", title: "Insertar enlace"}],
		grupo4: [{codigo: "limpiar", clase: "ql-clean", title: "Quitar formato"}],
	};
	console.log(Object.values(barraHerrams).flat().map(n=>n.clase.replace("ql-", "")));


	// Inicializamos Quill
	const quill = new Quill("#editor-container", {
		theme: "snow",
		placeholder: "Escribí acá tu contenido...",
		modules: {toolbar: "#toolbar"},
		formats: Object.values(barraHerrams).flat().map(n=>n.clase.replace("ql-", "")),
		//["bold", "italic", "color", "list", "blockquote", "link", "image", "video"],
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
