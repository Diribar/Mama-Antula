"use strict";

window.addEventListener("load", () => {
	// DOM
	const domHeader = document.querySelector("header");
	const DOM = {
		mostrarClick: domHeader.querySelector("#busquedaRapida .mostrarClick"),
		input: domHeader.querySelector("#busquedaRapida .mostrarToggle input"),
		muestraResultados: domHeader.querySelector("#busquedaRapida .mostrarToggle #muestraResultados"),
		escribiMas: domHeader.querySelector("#busquedaRapida .mostrarToggle #escribiMas"),
	};
	const rutaApi = "/busqueda-rapida/api/busca-en-bd";
	let resultados, buscaEnBe, color;

	// Funciones
	const sinResultados = (respuesta) => {
		// Crea el párrafo
		const p = document.createElement("p");
		p.classList.add("colorClaro");
		p.id = "sinResultados";

		// Le agrega el texto de la respuesta
		p.appendChild(document.createTextNode(respuesta));

		// Agrega el párrafo a la tabla
		DOM.muestraResultados.appendChild(p);

		// Fin
		return;
	};
	const muestraResultados = () => {
		console.log(resultados);
		// Rutina de creación de filas
		for (const ruta in resultados) {
			// Obtiene los encabezados
			const {encabezados} = resultados[ruta];

			// Acciones para 1 encabezado por ruta
			if (encabezados.length == 1) {
				// Agrega el anchor al cuerpo
				const anchor = document.createElement("a");
				anchor.href = encabezados[0].href;
				anchor.innerText = ruta;
				anchor.classList.add(color);
				color = color != "colorClaro" ? "colorClaro" : "colorOscuro";
				DOM.muestraResultados.appendChild(anchor);
			}

			// Acciones para varios encabezados por ruta
			else {
				// Agrega la ruta al cuerpo
				const div = document.createElement("div");
				div.innerText = ruta;
				div.classList.add("ruta", color);
				color = color != "colorClaro" ? "colorClaro" : "colorOscuro";
				DOM.muestraResultados.appendChild(div);

				// Agrega el ul de anchors al cuerpo
				const ul = creaElListado(encabezados);
				DOM.muestraResultados.appendChild(ul);
			}
		}

		// Fin
		return;
	};
	const creaElListado = (encabezados) => {
		// Crea el ul
		const ul = document.createElement("ul");

		// Crea los li
		for (const encabezado of encabezados) {
			// Crea el anchor
			const anchor = document.createElement("a");
			anchor.href = encabezado.href;
			const {titulo, tituloElab} = encabezado;
			anchor.innerText = tituloElab || titulo || "";

			// Crea el li y lo agrega al ul
			const li = document.createElement("li");
			li.classList.add(color);
			color = color != "colorClaro" ? "colorClaro" : "colorOscuro";
			li.appendChild(anchor);
			ul.appendChild(li);
		}

		// Fin
		return ul;
	};

	// Add Event Listener
	DOM.input.addEventListener("input", async () => {
		// Impide los caracteres que no son válidos
		DOM.input.value = DOM.input.value.replace(/[^a-záéíóúüñ'¡¿-\d\s]/gi, "").replace(/ +/g, " ");
		const dataEntry = DOM.input.value;
		localStorage.setItem("busqRapida", dataEntry);

		// Generar las condiciones para mostrar los 'muestraResultados'
		DOM.muestraResultados.innerHTML = "";
		let posicion = 0;
		color = "resaltar";

		// Elimina palabras repetidas
		let palabras = dataEntry.split(" ");
		for (let i = palabras.length - 1; i > 0; i--)
			if (palabras.filter((n) => n == palabras[i]).length > 1) palabras.splice(i, 1);
		let pasaNoPasa = palabras.join("");

		// Acciones si la palabra tiene menos de 3 caracteres significativos
		if (pasaNoPasa.length < 3) return DOM.escribiMas.classList.remove("ocultar"); // Muestra el cartel de "escribí más"

		// Cancela la búsqueda anterior si aún no terminó
		buscaEnBe?.abort();
		buscaEnBe = new AbortController();
		const {signal} = buscaEnBe;

		// Oculta el cartel de "escribí más"
		DOM.escribiMas.classList.add("ocultar");

		// Busca los productos
		palabras = palabras.join(" ");
		resultados = await fetch(rutaApi, {...postJson({palabras}), signal})
			.then((n) => n.json())
			.catch(() => {});

		// Muestra los resultados
		const hayResultados = !!Object.keys(resultados).length;
		hayResultados ? muestraResultados() : sinResultados("- No encontramos resultados -");

		// Fin
		return;
	});
	DOM.input.addEventListener("keydown", (e) => {
		// Variables
		if (!Array.isArray(resultados)) return;
		const cantResultados = DOM.muestraResultados.children && DOM.muestraResultados.children.length;

		// Resalta el resultado anterior
		if (e.key == "ArrowUp" && posicion) {
			DOM.muestraResultados.children[posicion].classList.remove("resaltar"); // Des-resalta el resultado vigente
			posicion--;
			DOM.muestraResultados.children[posicion].classList.add("resaltar"); // Resalta el resultado anterior
		}

		// Resalta el resultado siguiente
		if (e.key == "ArrowDown" && posicion < cantResultados - 1) {
			DOM.muestraResultados.children[posicion].classList.remove("resaltar"); // Des-resalta el resultado vigente
			posicion++;
			DOM.muestraResultados.children[posicion].classList.add("resaltar"); // Resalta el resultado siguiente
		}

		// Redirige a la vista del hallazgo
		if (e.key == "Enter") location.href = DOM.muestraResultados.children[posicion].href;

		// Oculta el sector de muestraResultados
		if (e.key == "Escape") DOM.mostrarClick.classList.add("ocultar");

		// Fin
		return;
	});
	DOM.muestraResultados.addEventListener("mouseover", (e) => {
		// Variables
		const opciones = Array.from(DOM.muestraResultados.children);
		const indice = opciones.findIndex((n) => n == e.target.parentNode);
		if (indice == -1) return;

		// Quita la clase resaltar de donde estaba
		if (posicion !== null) DOM.muestraResultados.children[posicion].classList.remove("resaltar");
		posicion = indice;
		DOM.muestraResultados.children[posicion].classList.add("resaltar");

		// Fin
		return;
	});

	// Start-up
	DOM.input.value = localStorage.getItem("busqRapida");

	// Fin
	return;
});
