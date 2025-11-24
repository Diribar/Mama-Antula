"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domLayout = document.querySelector("#layouts #texto");
	const DOM = {
		barraHerrams: domLayout.querySelector(".barraHerrams"),
		input: domLayout.querySelector(".input"),
		output: domLayout.querySelector("[name='texto'].output"),
	};
	const barraHerrams = {
		grupo1: [
			{codigo: "titulo", clase: "ql-header", valor: "2", title: "Título"},
			{codigo: "pegarPlano", clase: "ql-pastePlain", title: "Pegar texto sin formato"},
			{codigo: "limpiar", clase: "ql-clean", title: "Quitar formato"},
		],
		grupo2: [
			{codigo: "negrita", clase: "ql-bold", title: "Negrita"},
			{codigo: "cursiva", clase: "ql-italic", title: "Cursiva"},
			{codigo: "cita", clase: "ql-blockquote", title: "Cita"},
		],
		grupo4: [
			{codigo: "listaNum", clase: "ql-list", valor: "ordered", title: "Lista numerada"},
			{codigo: "dots", clase: "ql-list", valor: "bullet", title: "Lista con viñetas"},
		],
		grupo3: [{codigo: "link", clase: "ql-link", title: "Insertar enlace"}],
	};

	// Obtiene el nombre de las etiquetas
	const nombreEtiquetas = Object.values(barraHerrams)
		.flat()
		.map((n) => n.clase.replace("ql-", ""));

	// Arma la barra de herramientas
	for (const grupo in barraHerrams) {
		// Agrega el contenedor
		const span = document.createElement("span");
		span.classList.add("ql-formats");
		DOM.barraHerrams.appendChild(span);

		// Crea los botones
		for (const herramienta of barraHerrams[grupo]) {
			// Crea el botón
			const button = document.createElement("button");
			button.classList.add(herramienta.clase);
			button.title = herramienta.title;
			if (herramienta.valor) button.setAttribute("value", herramienta.valor);

			// Agrega el boton
			span.appendChild(button);
		}
	}

	// ⭐ ICONO PARA EL BOTÓN "PEGAR PLANO"
	const icons = Quill.import("ui/icons");
	icons["pastePlain"] = `
		<svg viewBox="0 0 18 18">
			<rect x="5" y="1" width="8" height="3" rx="1" ry="1" fill="none" stroke="currentColor" stroke-width="2"/>
			<rect x="3" y="4" width="12" height="13" rx="2" ry="2" fill="none" stroke="currentColor" stroke-width="2"/>
			<line x1="6" y1="9" x2="12" y2="9" stroke="currentColor" stroke-width="2"/>
			<line x1="6" y1="12" x2="12" y2="12" stroke="currentColor" stroke-width="2"/>
		</svg>
	`;

	// Función para pegar solo texto puro
	const pastePlainText = async (quill) => {
		const texto = await navigator.clipboard.readText();
		const limpio = texto.replace(/<[^>]+>/g, "").trim();
		const pos = quill.getSelection(true).index;
		quill.insertText(pos, limpio);
	};

	// Funciones - Inicializamos Quill
	const input = DOM.input; // el tag donde se pega el texto con formato
	const toolbar = DOM.barraHerrams; // el tag que contiene los botones
	const modules = {toolbar: {container: toolbar, handlers: {pastePlain: () => pastePlainText(quill)}}};
	const formats = [...new Set(nombreEtiquetas)]; // los botones
	const placeholder = "Escribí acá tu contenido...";
	const quill = new Quill(input, {modules, formats, placeholder, theme: "snow"});

	// Pule el input y lo pega en el output
	const actualizaContenido = (delta, oldDelta, source) =>
		// ACTUALIZA EL INPUT - si el cambio no fue hecho por el usuario, interrumpe la función

		setTimeout(() => {
			if (source !== "user") return;

			const parrafos = quill.root.querySelectorAll("p");
			for (let i = parrafos.length - 1; i >= 0; i--) {
				// ACTUALIZA EL INPUT - 1. Si el parrafo es <p><br></p> lo elimina del editor
				const parrafo = parrafos[i];
				if (["<br>", ""].includes(parrafo.innerHTML) && i < parrafos.length - 1) {
					const blot = Quill.find(parrafo);
					if (blot) blot.remove();
					continue;
				}

				// ACTUALIZA EL INPUT - 2. Elimina saltos de línea innecesarios
				if (!i) continue;
				const p1 = parrafos[i - 1];
				const p2 = parrafos[i];

				// Si corresponde, une los párrafos
				const textoP2 = p2.innerText.trim();
				if (textoP2.startsWith(",")) {
					p1.innerHTML = p1.innerHTML + p2.innerHTML;
					p2.remove();
				}
			}

			// ACTUALIZA EL OUTPUT -
			DOM.output.value = quill.root.innerHTML
				.replaceAll("&nbsp;", " ") // reemplaza por espacios normales;
				.replaceAll("  ", " ") // reemplaza espacios duplicados
				.replace("<p><br></p>", "") // reemplaza el último, porque los demás ya fueron quitados
				.trim(); // reemplaza espacios al final
		}, 100);

	// EVENTO - Cambios en el input actualizan el output
	quill.on("text-change", actualizaContenido);

	// Fin
	return;
});
