"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#layouts #texto");
	const DOM = {
		barraHerrams: domLayout.querySelector(".barraHerrams"),
		input: domLayout.querySelector(".input"),
		output: domLayout.querySelector(".output"),
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
	const input = DOM.input; // el tag donde se pega el texto con formato
	const toolbar = DOM.barraHerrams; // el tag que contiene los botones
	const formats = [...new Set(nombreEtiquetas)]; // los botones
	const placeholder = "Escribí acá tu contenido...";
	const quill = new Quill(input, {modules: {toolbar}, formats, placeholder, theme: "snow"});

	// Pule el input y lo pega en el output
	const actualizaContenido = () =>
		(DOM.output.value = quill.root.innerHTML
			.replaceAll("&nbsp;", " ") // reemplaza por espacios normales;
			.replaceAll("  ", " ") // reemplaza espacios duplicados
			.replaceAll("<p><br></p>", "")
			.replaceAll("<p></p>", "")
			.trim()); // reemplaza espacios al final

	// EVENTO - Cambios en el input actualizan el output
	quill.on("text-change", actualizaContenido);

	// Fin
	return;
});
