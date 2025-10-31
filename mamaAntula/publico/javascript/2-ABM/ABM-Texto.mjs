"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		barraHerrams: document.querySelector("#barraHerrams-texto"),
		input: document.querySelector("#input-texto"),
		output: document.querySelector("#output-texto"),
	};
	const v = {
		barraHerrams: {
			grupo1: [
				{codigo: "negrita", clase: "ql-bold", title: "Negrita"},
				{codigo: "cursiva", clase: "ql-italic", title: "Cursiva"},
			],
			grupo2: [
				{codigo: "listaNum", clase: "ql-list", valor: "ordered", title: "Lista numerada"},
				{codigo: "dots", clase: "ql-list", valor: "bullet", title: "Lista con viñetas"},
				{codigo: "cita", clase: "ql-blockquote", title: "Cita"},
			],
			grupo3: [{codigo: "link", clase: "ql-link", title: "Insertar enlace"}],
			grupo4: [{codigo: "limpiar", clase: "ql-clean", title: "Quitar formato"}],
		},
	};

	// Obtiene el nombre de las etiquetas
	const nombreEtiquetas = Object.values(v.barraHerrams)
		.flat()
		.map((n) => n.clase.replace("ql-", ""));

	// Arma la barra de herramientas
	for (const grupo in v.barraHerrams) {
		// Agrega el contenedor
		const span = document.createElement("span");
		span.classList.add("ql-formats");
		DOM.barraHerrams.appendChild(span);

		// Crea los botones
		for (const herramienta of v.barraHerrams[grupo]) {
			// Crea el botón
			const button = document.createElement("button");
			button.classList.add(herramienta.clase);
			button.title = herramienta.title;
			if (herramienta.valor) button.setAttribute("value", herramienta.valor);

			// Agrega el boton
			span.appendChild(button);
		}
	}

	// Funciones - Inicializamos Quill
	const input = "#" + DOM.input.id; // el tag donde se pega el texto con formato
	const toolbar = "#" + DOM.barraHerrams.id; // el tag que contiene los botones
	const formats = [...new Set(nombreEtiquetas)]; // los botones
	const placeholder = "Escribí acá tu contenido...";
	const quill = new Quill(input, {modules: {toolbar}, formats, placeholder, theme: "snow"});

	// Función para sincronizar textarea y previsualización
	const actualizarContenido = () => {
		// Optiene el input y lo pule
		const html = quill.root.innerHTML
			.replace("&nbsp;", " ") // reemplaza por espacios normales;
			.replace(/\s+/g, " ") // reemplaza espacios duplicados
			.replace(" </", "</") // reemplaza espacios mal puestos
			.trim(); // reemplaza espacios al final

		// Lo pega en el output
		DOM.output.value = html;

		// Fin
		return;
	};

	// EVENTO - Escuchamos cambios en Quill
	quill.on("text-change", actualizarContenido);

	// Capturamos submit
	// document.getElementById("miForm").addEventListener("submit", function (e) {
	// 	e.preventDefault();
	// 	console.log("Título:", document.getElementById("titulo").value);
	// 	console.log("Contenido HTML:", document.getElementById("contenidoText").value);
	// 	alert("Formulario listo para enviar. Revisa la consola.");
	// });
});
