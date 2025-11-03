"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncabezado: document.querySelector("#filtros select[name='encabezado']"),

		// Inputs del encabezado
		sectorEncabezado: document.querySelector("#sectorEncabezado"),
		encabezados: document.querySelectorAll("#sectorEncabezado .encabezado"),
		encabIconos: document.querySelector("#sectorEncabezado .iconos"),

		// Contenido actual
		sectorContActual: document.querySelector("#sectorContActual"),
		iconosActual: document.querySelector("#sectorContActual .iconos"),

		// Contenido nuevo
		sectorContNuevo: document.querySelector("#sectorContNuevo"),
	};
	const rutas = {
		obtieneContenidos: "/contenido/api/abm-obtiene-contenidos/?",
	};
	const v = {};

	// Funciones
	const FN = {
		creaContenedorContenidoIconos: function () {
			// Variables
			v.inicial_id = v.contenidos[0]?.id;
			v.final_id = v.contenidos.at(-1)?.id;

			// Agrega los contenidos
			for (const contenido of v.contenidos) {
				this.agregaBloqueLectura(contenido);
				// this.agregaBloqueEdicion(contenido);
			}

			// Fin
			return;
		},
		agregaBloqueLectura: function (contenido) {
			// Crea el DOM contenedor
			const domBloqueLectura = document.createElement("div");
			domBloqueLectura.classList.add("bloque", "sector");

			// Crea el DOM contenido
			this.creaElContenido.consolidado(contenido); // puede ser: div (para texto, texto-imagen, carrousel), img, video
			v.domContenido.classList.add("contenido");
			domBloqueLectura.appendChild(v.domContenido);

			// Crea el DOM íconos
			const domIconos = DOM.iconosActual.cloneNode(true);
			if (v.inicial_id == contenido.id) domIconos.querySelector(".subir").classList.add("ocultar");
			if (v.final_id == contenido.id) domIconos.querySelector(".bajar").classList.add("ocultar");
			domBloqueLectura.appendChild(domIconos);

			// Agrega el DOM contenedor al DOM sector
			DOM.sectorContActual.appendChild(domBloqueLectura);

			// Fin
			return;
		},
		agregaBloqueEdicion: () => {
			const domBloqueEdicion = sectorContNuevo.cloneNode(true);
			// continuar
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
				domImagen.src = "/imgsEditables/1-Contenido/" + contenido.imagen;
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

	// Eventos del filtro de encabezado
	DOM.filtroEncabezado.addEventListener("change", async () => {
		// Variables
		const encabezado_id = DOM.encabezado.value;
		const campo_id =
			cac.tipoEncab == "encabCartas" ? "carta_id" : cac.tipoEncab == "encabExpers" ? "experiencia_id" : "sinIndice_id";
		const ruta = rutas.obtieneContenidos + "encab_id=" + encabezado_id + "&campo_id=" + campo_id;

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
	});
});
