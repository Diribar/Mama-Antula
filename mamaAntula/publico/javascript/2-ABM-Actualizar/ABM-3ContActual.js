"use strict";

window.addEventListener("load", async () => {
	// Variables
	const DOM = {
		// Filtros
		filtroEncab: document.querySelector("#filtros select[name='encabezado']"),

		// Contenido actual
		sectorContenido: document.querySelector("#sectorContActual"),
		iconos: document.querySelector("#sectorContActual .iconos"),
	};
	const rutas = {
		// Lectura
		obtieneContenidos: "/contenido/api/abm-obtiene-contenidos/?",

		// Impactos en BD
		guardaContenido: "/contenido/api/abm-guarda-contenido",
		bajaContenido: "/contenido/api/abm-baja-contenido",
		subeContenido: "/contenido/api/abm-sube-contenido",
		eliminaContenido: "/contenido/api/abm-elimina-contenido",
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

			// Obtiene los íconos
			this.iconosEventos();

			// Fin
			return;
		},
		agregaBloque: function (contenido) {
			// Crea el DOM contenedor
			const domBloqueLectura = document.createElement("div");
			domBloqueLectura.classList.add("bloque", "sector");

			// Crea el DOM contenido
			this.creaElContenido.consolidado(contenido); // puede ser: div (para texto, texto-imagen, carrusel), img, video
			v.domContenido.classList.add("contenido");
			domBloqueLectura.appendChild(v.domContenido);

			// Crea el DOM íconos
			const domIconos = DOM.iconos.cloneNode(true);
			domIconos.dataset.id = contenido.id;
			domIconos.dataset.statusRegistro_id = contenido.statusRegistro_id;

			// Si corresponde, oculta los íconos de subir y bajar
			if (v.inicial_id == contenido.id || contenido.statusRegistro_id != 1) domIconos.querySelector(".iconoSubir").remove();
			//classList.add("ocultar");
			if (v.final_id == contenido.id || contenido.statusRegistro_id != 1) domIconos.querySelector(".iconoBajar").remove();
			domBloqueLectura.appendChild(domIconos);

			// Agrega el DOM contenedor al DOM sector
			DOM.sectorContenido.appendChild(domBloqueLectura);

			// Fin
			return;
		},
		iconosEventos: () => {
			// Variables
			const iconosEventos = [
				// "Editar",
				"Subir",
				"Bajar",
				"Eliminar",
			];

			// Rutina por evento
			for (const evento of iconosEventos) {
				// Obtiene los íconos
				const iconosEvento = "iconos" + evento;
				DOM[iconosEvento] = document.querySelectorAll("#sectorContActual .iconos .icono" + evento);

				// Les asigna el evento a c/u
				for (const icono of DOM[iconosEvento]) eventosClick["icono" + evento](icono);
			}
		},

		// Auxiliares
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
					v.domContenido.appendChild(this.imagen(contenido));
					v.domContenido.appendChild(this.texto(contenido));
					v.domContenido.classList.add("textoImagen");
				}
				// Carrusel
				else if (contenido.carrusel.length) this.carrusel(contenido);
				// Video
				else if (contenido.video) this.video(contenido);

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
				const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Contenido/";
				domImagen.src = "/imgsEditables/" + subCarpeta + contenido.imagen;
				domImagen.classList.add("imagen");
				contenedor.appendChild(domImagen);

				// Crea la leyenda
				if (contenido.leyenda) {
					const domLeyenda = this.leyenda(contenido);
					contenedor.appendChild(domLeyenda);
				}

				// Fin
				return contenedor;
			},
			carrusel: function (contenido) {
				// Crea el contenedor
				const contenedor = document.createElement("div");
				contenedor.classList.add("contImagenLeyenda");

				// Crea el carrusel
				v.carrImgs = document.createElement("div");
				v.carrImgs.classList.add("carrImgs");
				this.agregaImgsCrsl(contenido);
				v.domContenido.appendChild(v.carrImgs);

				// Crea la leyenda
				if (contenido.leyenda) {
					const domLeyenda = this.leyenda(contenido);
					v.domContenido.appendChild(domLeyenda);
				}

				// Fin
				return;
			},
			video: function (contenido) {
				// Crea el iframe
				const iframe = document.createElement("iframe");
				iframe.src = "https://www.youtube.com/embed/" + contenido.video + "?autoplay=1";
				v.domContenido.appendChild(iframe);

				// Crea la leyenda
				if (contenido.leyenda) {
					const domLeyenda = this.leyenda(contenido);
					v.domContenido.appendChild(domLeyenda);
				}

				// Fin
				return;
			},

			// Auxiliares
			agregaImgsCrsl: (contenido) => {
				// Recorre el carrusel
				for (const registro of contenido.carrusel) {
					// Variables
					const subCarpeta = registro.statusRegistro_id == 1 ? "2-Revisar/" : "1-Contenido/";

					// Crea el domImagen
					const img = document.createElement("img");
					img.src = "/imgsEditables/" + subCarpeta + registro.imagen;

					// La agrega al padre
					v.carrImgs.appendChild(img);
				}

				// Fin
				return;
			},
			leyenda: (contenido) => {
				// Crea el contenedor
				const domLeyenda = document.createElement("div");
				domLeyenda.classList.add("leyenda");
				domLeyenda.innerHTML = contenido.leyenda;

				// Fin
				return domLeyenda;
			},
		},
	};
	const eventosClick = {
		iconoBajar: (iconoBajar) => {
			iconoBajar.addEventListener("click", async () => {
				// Si el ícono está oculto, interrumpe la función
				if (iconoBajar.classList.contains("ocultar")) return;

				// Baja el contenido y actualiza el DOM
				const id = iconoBajar.parentNode.dataset.id;
				await fetch(rutas.bajaContenido, putJson({id})).then((n) => n.json());
				DOM.filtroEncab.dispatchEvent(new Event("change"));

				// Fin
				return;
			});
		},
		iconoSubir: (iconoSubir) => {
			iconoSubir.addEventListener("click", async () => {
				// Si el ícono está oculto, interrumpe la función
				if (iconoSubir.classList.contains("ocultar")) return;

				// Sube el contenido y actualiza el DOM
				const id = iconoSubir.parentNode.dataset.id;
				await fetch(rutas.subeContenido, putJson({id})).then((n) => n.json());
				DOM.filtroEncab.dispatchEvent(new Event("change"));

				// Fin
				return;
			});
		},
		iconoEliminar: (iconoEliminar) => {
			iconoEliminar.addEventListener("click", async () => {
				// Variables
				const id = iconoEliminar.parentNode.dataset.id;

				// Elimina el contenido
				await fetch(rutas.eliminaContenido, deleteJson({id})).then((n) => n.json());

				// Actualiza el DOM
				DOM.filtroEncab.dispatchEvent(new Event("change"));

				// Fin
				return;
			});
		},
	};

	// Lo actualiza por cambio en el encabezado
	DOM.filtroEncab.addEventListener("change", async () => {
		// Variables
		const encabezado_id = DOM.filtroEncab.value;
		const campo_id = campos_id[comp1234.entidad];
		const ruta = rutas.obtieneContenidos + "encab_id=" + encabezado_id + "&campo_id=" + campo_id;

		// Limpia el DOM
		DOM.sectorContenido.innerHTML = "";

		// Si el sector no tiene contenidos, interrumpe la función
		v.contenidos = v.encabezado_id != "nuevo" ? await fetch(ruta).then((n) => n && n.json()) : [];
		if (!v.contenidos.length) return DOM.sectorContenido.remove();

		// Muestra el sector contenidos
		else DOM.sectorContenido.classList.remove("ocultar");

		// Actualiza el DOM
		creaContenidoIconos.consolidado();

		// Fin
		return;
	});

	// Editar
	// Subir
	// Bajar
});

// Variables
const campos_id = {
	encabCartas: "carta_id",
	encabResto: "encab_id",
};
