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
		iconos: document.querySelector("#sectorContActual .iconos"),
		iconosEliminar: document.querySelectorAll("#sectorContActual .iconos #iconoEliminar"),

		// Contenido nuevo
		sectorContNuevo: document.querySelector("#sectorContNuevo"),
	};
	const rutas = {
		// Lectura
		obtieneContenidos: "/contenido/api/abm-obtiene-contenidos/?",

		// Impactos en BD
		guardaContenido: "/contenido/api/abm-guarda-contenido",
		eliminaContenido: "/contenido/api/abm-elimina-contenido/?id=",
	};
	const v = {};

	// Funciones
	const creaContenidoIconos = {
		consolidado: function () {
			// Variables
			v.inicial_id = v.contenidos[0]?.id;
			v.final_id = v.contenidos.at(-1)?.id;

			// Agrega los contenidos
			for (const contenido of v.contenidos) this.agregaBloque(contenido);

			// Fin
			return;
		},
		agregaBloque: function (contenido) {
			// Crea el DOM contenedor
			const domBloqueLectura = document.createElement("div");
			domBloqueLectura.classList.add("bloque", "sector");

			// Crea el DOM contenido
			this.creaElContenido.consolidado(contenido); // puede ser: div (para texto, texto-imagen, carrousel), img, video
			v.domContenido.classList.add("contenido");
			domBloqueLectura.appendChild(v.domContenido);

			// Crea el DOM íconos
			const domIconos = DOM.iconos.cloneNode(true);
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

	// Lo actualiza por cambio en el encabezado
	DOM.filtroEncabezado.addEventListener("change", async () => {
		// Variables
		const encabezado_id = DOM.filtroEncabezado.value;
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
		creaContenidoIconos.consolidado();

		// Fin
		return;
	});

	// Impacto en BD (contenido - actual) - Editar
	// Impacto en BD (contenido - actual) - Subir
	// Impacto en BD (contenido - actual) - Bajar
	// Impacto en BD (contenido - actual) - Eliminar
	DOM.iconosEliminar.forEach((iconoEliminar, i) => {});
});
