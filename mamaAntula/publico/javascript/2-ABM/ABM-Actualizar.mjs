"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtros: {
			seccion: document.querySelector("#filtros select[name='seccion_id']"),
			tema: document.querySelector("#filtros select[name='tema_id']"),
			pestana: document.querySelector("#filtros select[name='pestana_id']"),
			encabezado: document.querySelector("#filtros select[name='encabezado']"),
		},
		anchorLectura: document.querySelector("a#linkLectura"),

		// Inputs del encabezado
		sectorEncabezados: document.querySelector("#sectorEncabezados"),
		encabezados: document.querySelectorAll("#sectorEncabezados .encabezado"),
		encabIconos: document.querySelector("#sectorEncabezados .iconos"),

		// Contenido actual
		sectorContActual: document.querySelector("#sectorContActual"),
		iconosActual: document.querySelector("#sectorContActual .iconos"),
	};
	const rutas = {
		datosIniciales: "/contenido/api/abm-datos-inciales",
		obtieneEncabs: "/contenido/api/abm-obtiene-encabezados/?",
		obtieneContenidos: "/contenido/api/abm-obtiene-contenidos/?",
	};
	const v = {
		...(await fetch(rutas.datosIniciales).then((n) => n && n.json())),
	};

	// Funciones
	const FN = {
		// Operaciones
		actualizaFiltroEncabezado: async () => {
			// Si corresponde, oculta el sector encabezados
			const ocultarEncabezado = v.tipoEncab == "encabSinIndice" && !DOM.filtros.pestana.value;
			if (ocultarEncabezado) DOM.filtros.encabezado.classList.add("ocultar");

			// Variables
			v.seccion_id = DOM.filtros.seccion.value;
			v.tema_id = DOM.filtros.tema.value;
			v.pestana_id = DOM.filtros.pestana.value;

			// Obtiene los encabezados
			const datos = "seccion_id=" + v.seccion_id + "&tema_id=" + v.tema_id + "&pestana_id=" + v.pestana_id;
			v.encabezados = await fetch(rutas.obtieneEncabs + datos).then((n) => n && n.json());

			// Crea las opciones
			FN.agregaOpciones(v.encabezados, DOM.filtros.encabezado, "tituloCons");

			// Crea una opción más para un título nuevo
			const option = document.createElement("option");
			option.value = "nuevo";
			option.textContent = "Encabezado nuevo";
			DOM.filtros.encabezado.appendChild(option);

			// Muestra los encabezados y dispara el evento
			if (!ocultarEncabezado) DOM.filtros.encabezado.classList.remove("ocultar");
			DOM.filtros.encabezado.dispatchEvent(new Event("change"));

			// Fin
			return;
		},
		actualizaEncabezado: () => {
			// Si corresponde, oculta el sector encabezados e interrumpe la función
			DOM.encabezado = document.querySelector("#sectorEncabezados .encabezado:not(.ocultar)");
			if (v.tipoEncab == "encabSinIndice" && !DOM.filtros.pestana.value) {
				DOM.sectorEncabezados.classList.add("ocultar");
				return;
			}
			// Muestra el sector encabezados
			else DOM.sectorEncabezados.classList.remove("ocultar");

			// Actualiza el DOM
			const encabezado = v.encabezados.find((n) => n.id == v.encabezado_id);
			DOM.inputs = DOM.encabezado.querySelectorAll(".input");
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) FN.agregaOpciones(v[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value = (encabezado && encabezado[campo]) || "";
			}

			// Actualiza el icono
			DOM.encabIconos.querySelector("#guardar").classList[v.encabezado_id == "nuevo" ? "remove" : "add"]("ocultar");
			DOM.encabIconos.querySelector("#eliminar").classList[v.encabezado_id == "nuevo" ? "add" : "remove"]("ocultar");

			// Fin
			return;
		},
		actualizaContenidoActual: async () => {
			// Variables
			const campo_id =
				v.tipoEncab == "encabCartas" ? "carta_id" : v.tipoEncab == "encabExpers" ? "experiencia_id" : "sinIndice_id";
			const ruta = rutas.obtieneContenidos + "encab_id=" + v.encabezado_id + "&campo_id=" + campo_id;

			// Limpia el DOM
			DOM.sectorContActual.innerHTML = "";

			// Si corresponde, interrumpe la función
			v.contenidos = v.encabezado_id != "nuevo" ? await fetch(ruta).then((n) => n && n.json()) : [];
			if (!v.contenidos.length) {
				DOM.sectorContActual.classList.add("ocultar");
				return;
			}
			// Muestra el sector contenidos
			else DOM.sectorContActual.classList.remove("ocultar");

			// Actualiza el DOM
			FN.creaContenedorContenidoIconos();

			// Fin
			return;
		},
		actualizaHref: () => {
			// Variables
			const urlSeccion = "/" + v.secciones.find((n) => n.id == v.seccion_id).url;
			const urlTema = "/" + v.temasSecciones.find((n) => n.id == v.tema_id).url;
			const urlPestana = (v.pestana_id && "/" + v.pestanasTemas.find((n) => n.id == v.pestana_id).url) || "";

			// Actualiza el DOM
			DOM.anchorLectura.href = urlSeccion + urlTema + urlPestana + "/" + v.encabezado_id;
		},

		// Auxiliares
		agregaOpciones: (opciones, domSelect, campoNombre) => {
			// Limpia las opciones del select
			domSelect.innerHTML = "";

			// Agrega las opciones
			for (const opcion of opciones) {
				const domOpcion = document.createElement("option");
				domOpcion.value = opcion.id;
				domOpcion.textContent = opcion[campoNombre] || "Sin título";
				domSelect.appendChild(domOpcion);
			}

			// Fin
			return;
		},
		creaContenedorContenidoIconos: () => {
			// Agrega los contenidos
			for (const contenido of v.contenidos) {
				// Crea el DOM contenedor
				const domBloque = document.createElement("div");
				domBloque.classList.add("bloque", "sector");

				// Crea el DOM contenido
				FN.creaElContenido.consolidado(contenido); // puede ser: div (para texto, texto-imagen, carrousel), img, video
				v.domContenido.classList.add("contenido");
				domBloque.appendChild(v.domContenido);

				// Crea el DOM íconos
				const domIconos = DOM.iconosActual.cloneNode(true);
				domBloque.appendChild(domIconos);

				// Agrega el DOM contenedor al DOM sector
				DOM.sectorContActual.appendChild(domBloque);
			}
		},
		creaElContenido: {
			consolidado: function (contenido) {
				// Crea el DOM
				v.domContenido = document.createElement("div");

				if (false) null;
				// Sólo texto
				else if (contenido.texto && !contenido.imagen) v.domContenido = this.texto(contenido).cloneNode(true);
				// Sólo una imagen
				else if (contenido.imagen && !contenido.texto) v.domContenido = this.imagen(contenido).cloneNode(true);
				// Texto e imagen
				else if (contenido.texto && contenido.imagen) {
					v.domContenido.appendChild(this.texto(contenido));
					v.domContenido.appendChild(this.imagen(contenido));
					v.domContenido.classList.add("textoImagen");
				}
				// Video
				else if (contenido.video) v.domContenido = this.video(contenido).cloneNode(true);
				// Carrousel
				else if (contenido.carrousel.length) null;

				// Fin
				return;
			},
			texto: (contenido) => {
				// Crea el contenedor
				const domTexto = document.createElement("div");
				domTexto.classList.add("texto");
				domTexto.innerHTML = contenido.texto;

				// Fin
				return domTexto;
			},
			imagen: function (contenido) {
				// Crea el contenedor
				const contenedor = document.createElement("div");
				contenedor.classList.add("contImagenLeyenda");

				// Crea la imagen
				const domImagen = document.createElement("img");
				domImagen.src = "/imgsEditables/1-Final/" + contenido.imagen;
				domImagen.classList.add("imagen");
				contenedor.appendChild(domImagen);

				// Crea la leyenda
				const domLeyenda = this.leyenda(contenido);
				contenedor.appendChild(domLeyenda);

				// Fin
				return contenedor;
			},
			video: function (contenido) {
				// Crea el contenedor
				const contenedor = document.createElement("div");
				contenedor.classList.add("contVideoLeyenda");

				// Crea la imagen
				const domVideo = document.createElement("video");
				domVideo.src = contenido.video;
				domVideo.classList.add("video");
				contenedor.appendChild(domVideo);

				// Crea la leyenda
				const domLeyenda = this.leyenda(contenido);
				contenedor.appendChild(domLeyenda);

				// Fin
				return contenedor;
			},
			leyenda: (contenido) => {
				// Crea el contenedor
				const domLeyenda = document.createElement("div");
				domLeyenda.innerHTML = contenido.leyenda;
				domLeyenda.classList.add("leyenda");

				// Fin
				return domLeyenda;
			},
		},
	};

	// Eventos de filtros
	DOM.filtros.seccion.addEventListener("change", () => {
		// Averigua si la sección es 'Experiencias'
		v.tipoEncab =
			DOM.filtros.seccion.value == v.secciones.find((n) => n.codigo == "experiencias")?.id
				? "encabExpers"
				: "encabSinIndice";

		// TEMA - Limpieza inicial
		DOM.filtros.pestana.classList.add("ocultar");

		// TEMA - Crea las opciones
		const seccion_id = DOM.filtros.seccion.value;
		const temasSecciones = v.temasSecciones.filter((n) => n.seccion_id == seccion_id);
		FN.agregaOpciones(temasSecciones, DOM.filtros.tema, "titulo");

		// TEMA - Los muestra y dispara el evento
		DOM.filtros.tema.classList.remove("ocultar");
		DOM.filtros.tema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});
	DOM.filtros.tema.addEventListener("change", () => {
		// Averigua si el tema es 'Cartas'
		if (v.tipoEncab != "encabExpers")
			v.tipoEncab =
				DOM.filtros.tema.value == v.temasSecciones.find((n) => n.codigo == "cartas")?.id
					? "encabCartas"
					: "encabSinIndice";

		// PESTANA - Si las tiene, las actualiza
		const tema_id = DOM.filtros.tema.value;
		const pestanasTema = v.pestanasTemas.filter((n) => n.tema_id == tema_id);
		if (pestanasTema.length) {
			// PESTANA - Crea las opciones
			FN.agregaOpciones(pestanasTema, DOM.filtros.pestana, "titulo");

			// PESTANA - Las muestra y dispara el evento
			DOM.filtros.pestana.classList.remove("ocultar");
			DOM.filtros.pestana.dispatchEvent(new Event("change"));
		}
		// ENCABEZADO - Si no tiene pestañas, obtiene los encabezados
		else {
			DOM.filtros.pestana.value = "";
			DOM.filtros.pestana.classList.add("ocultar");
			FN.actualizaFiltroEncabezado();
		}

		// Fin
		return;
	});
	DOM.filtros.pestana.addEventListener("change", () => FN.actualizaFiltroEncabezado()); // ENCABEZADO - Los obtiene y genera el evento 'change'
	DOM.filtros.encabezado.addEventListener("change", async () => {
		// Actualiza el anchor de flitros
		FN.actualizaHref();

		// Muestra el encabezado que corresponde, y oculta los demás
		for (const encabezado of DOM.encabezados)
			encabezado.classList[encabezado.id == v.tipoEncab ? "remove" : "add"]("ocultar");

		// Actualiza el encabezado
		v.encabezado_id = DOM.filtros.encabezado.value;
		FN.actualizaEncabezado();

		// Actualiza el contenido actual
		FN.actualizaContenidoActual();

		// Fin
		return;
	});

	// Startup
	DOM.filtros.seccion.dispatchEvent(new Event("change"));
});
