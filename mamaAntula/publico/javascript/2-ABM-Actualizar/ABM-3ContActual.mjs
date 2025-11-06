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
			for (const contenido of v.contenidos) {
				this.agregaBloqueLectura(contenido);
				// this.agregaBloqueEdicion(contenido);
			}

			// Obtiene los íconos
			this.eventos();

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
			const domIconos = DOM.iconos.cloneNode(true);
			domIconos.dataset.id = contenido.id;
			if (v.inicial_id == contenido.id) domIconos.querySelector(".subir").classList.add("ocultar");
			if (v.final_id == contenido.id) domIconos.querySelector(".bajar").classList.add("ocultar");
			domBloqueLectura.appendChild(domIconos);

			// Agrega el DOM contenedor al DOM sector
			DOM.sectorContenido.appendChild(domBloqueLectura);

			// Fin
			return;
		},
		agregaBloqueEdicion: () => {},
		eventos: () => {
			const eventos = ["Eliminar"];
			for (const evento of eventos) {
				DOM["iconos" + evento] = document.querySelectorAll("#sectorContActual .iconos .icono" + evento);
				for (const icono of DOM["iconos" + evento]) eventosClick["icono" + evento](icono);
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
					v.domContenido.appendChild(this.texto(contenido));
					v.domContenido.appendChild(this.imagen(contenido));
					v.domContenido.classList.add("textoImagen");
				}
				// Video
				else if (contenido.video) this.video(contenido);
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
				// Crea el iframe
				const iframe = document.createElement("iframe");
				iframe.src = "https://www.youtube.com/embed/" + contenido.video + "?autoplay=1";
				v.domContenido.appendChild(iframe);

				// Crea la leyenda
				const domLeyenda = this.leyenda(contenido);
				v.domContenido.appendChild(domLeyenda);

				// Fin
				return;
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
	const eventosClick = {
		// Eliminar
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
		const campo_id = campos_id[cac.tipoEncab];
		const ruta = rutas.obtieneContenidos + "encab_id=" + encabezado_id + "&campo_id=" + campo_id;

		// Limpia el DOM
		DOM.sectorContenido.innerHTML = "";

		// Si corresponde, interrumpe la función
		v.contenidos = v.encabezado_id != "nuevo" ? await fetch(ruta).then((n) => n && n.json()) : [];
		if (!v.contenidos.length) {
			DOM.sectorContenido.classList.add("ocultar");
			return;
		}
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
	encabExpers: "experiencia_id",
	encabSinIndice: "sinIndice_id",
};
