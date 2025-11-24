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
	const v = {
		cruds: ["baja", "sube", "elimina"],
		funcsComps: {
			baja: (datos) => putJson(datos),
			sube: (datos) => putJson(datos),
			elimina: (datos) => deleteJson(datos),
		},
	};
	const rutasContenido = {obtiene: "/articulos/api/abm-contenido-obtiene/?"};
	for (const crud of v.cruds) rutasContenido[crud] = "/articulos/api/abm-contenido-" + crud;

	// Funciones
	const creaContenidoIconos = () => {
		// Variables
		v.inicial_id = v.contenidos[0]?.id;
		v.final_id = v.contenidos.at(-1)?.id;

		// Agrega los contenidos
		for (const contenido of v.contenidos) auxCci.agregaBloque(contenido);

		// Genera los eventos de los íconos
		eventosIconos();

		// Fin
		return;
	};

	const eventosIconos = () => {
		// Rutina por evento
		for (const crud of v.cruds) {
			// Obtiene los íconos
			const domIconos = document.querySelectorAll("#sectorContActual .iconos ." + crud);

			// Les asigna el evento a c/u
			for (const domIcono of domIconos) {
				domIcono.addEventListener("click", async () => {
					// Variables
					const id = domIcono.parentNode.dataset.id;

					// Si es para eliminar, pide la confirmación del usuario
					if (crud == "elimina") {
						const mensaje = "¿Estás seguro/a de que querés eliminar este contenido?";
						const cancelButtonText = "Conservar";
						const confirmButtonText = "Eliminar";
						if (!(await carteles.pregunta({mensaje, cancelButtonText, confirmButtonText}))) return;
					}

					// Crud del contenido
					const respuesta = await fetch(rutasContenido[crud], v.funcsComps[crud]({id})).then((n) => n.json());

					// Si hubo un error, muestra el mensaje e interrumpe la función
					if (respuesta.error) return carteles.error(respuesta.error);

					// Actualiza el DOM
					DOM.filtroEncab.dispatchEvent(new Event("change"));

					// Fin
					return;
				});
			}
		}
	};

	// Funciones auxiliares de crea contenido e íconos
	const auxCci = {
		agregaBloque: function (contenido) {
			// Crea el DOM contenedor
			const domBloque = document.createElement("div");
			domBloque.classList.add("bloque", "sector");

			// Crea y agrega el contenido
			this.creaElContenido(contenido);
			domBloque.appendChild(v.domContenido);

			// Crea y agrega los íconos
			this.creaLosIconos(contenido);
			domBloque.appendChild(v.domIconos);

			// Agrega el bloque al sector
			DOM.sectorContenido.appendChild(domBloque);
			return;
		},
		creaElContenido: function (contenido) {
			// Agrega el contenido
			if (contenido.layout.codigo == "textoImagen") {
				v.domContenido = document.createElement("div");
				v.domContenido.appendChild(this.imagen(contenido));
				v.domContenido.appendChild(this.texto(contenido));
			} else
				v.domContenido =
					(contenido.layout.codigo == "texto" && this.texto(contenido).cloneNode(true)) ||
					(contenido.layout.codigo == "imagen" && this.imagen(contenido).cloneNode(true)) ||
					(contenido.layout.codigo == "carrusel" && this.carrusel(contenido)) ||
					(contenido.layout.codigo == "video" && this.video(contenido)) ||
					(contenido.layout.codigo == "libro" && this.libro(contenido)) ||
					(contenido.layout.codigo == "estampa" && this.estampa(contenido));

			// Agrega las clases
			v.domContenido.classList.add("contenido", "bloque-" + contenido.layout.codigo);

			// Fin
			return;
		},
		creaLosIconos: (contenido) => {
			// Crea el DOM
			v.domIconos = DOM.iconos.cloneNode(true);

			// Determina si muestra la imagen o los íconos
			const muestraImagen =
				contenido.statusRegistro_id != comp1234.aprobado_id && // el contenido no está aprobado
				contenido.statusSugeridoPor_id != comp1234.usuario.id; // el staus fue generado por otro usuario

			// Muestra la imagen
			if (muestraImagen) {
				// Muestra la imagen
				v.domIconos.querySelector("img").src = "/imgsEditables/8-Usuarios/" + contenido.statusSugeridoPor.imagen;
				v.domIconos.querySelector("img").title = contenido.statusSugeridoPor.nombreCompleto;

				// Oculta los íconos
				const iconos = v.domIconos.querySelectorAll("i");
				for (const icono of iconos) icono.classList.add("ocultar");
			}

			// Muestra los íconos
			else {
				// Muestra los íconos
				v.domIconos.dataset.id = contenido.id;
				if (v.final_id == contenido.id || contenido.statusRegistro_id != comp1234.creado_id)
					v.domIconos.querySelector(".baja").remove();
				if (v.inicial_id == contenido.id || contenido.statusRegistro_id != comp1234.creado_id)
					v.domIconos.querySelector(".sube").remove();

				// Oculta la imagen
				v.domIconos.querySelector("img").src = "";
			}

			// Fin
			return;
		},

		// Bloques
		texto: (contenido) => {
			// Crea el contenedor
			const domTexto = document.createElement("div");
			domTexto.innerHTML = contenido.texto;

			// Fin
			return domTexto;
		},
		imagen: function (contenido) {
			// Crea el contenedor
			const contenedor = document.createElement("div");
			contenedor.classList.add("imgLeyenda", "flexColAlign");

			// Crea la imagen y la agrega al contenedor
			const domImagen = document.createElement("img");
			const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";
			domImagen.src = "/imgsEditables/" + subCarpeta + contenido.imagen;
			domImagen.classList.add("imagen");
			contenedor.appendChild(domImagen);

			// Crea la leyenda y la agrega al contenedor
			if (contenido.leyenda) contenedor.appendChild(this.leyenda(contenido));

			// Fin
			return contenedor;
		},
		carrusel: function (contenido) {
			// Crea el contenedor global
			const contenedor = document.createElement("div");
			contenedor.classList.add("flexColAlign");

			// Crea el contenedor de las imagenes
			const contenedorImgs = document.createElement("div");
			contenedorImgs.classList.add("contenedorImgs", "flexRow");
			contenedorImgs.style.setProperty("--anchorName", "--carrusel-" + contenido.id);

			// Recorre el carrusel
			for (const carrusel of contenido.carrusel) contenedorImgs.appendChild(this.imgsCrsl(carrusel));
			contenedor.appendChild(contenedorImgs);

			// Crea la leyenda
			if (contenido.leyenda) contenedor.appendChild(this.leyenda(contenido));

			// Fin
			return contenedor;
		},
		video: function (contenido) {
			// Crea el contenedor
			const contenedor = document.createElement("div");
			contenedor.classList.add("flexColAlign", "imgLeyenda");

			// Crea el iframe
			const iframe = document.createElement("iframe");
			iframe.src = "https://www.youtube.com/embed/" + contenido.video + "?autoplay=1";
			contenedor.appendChild(iframe);

			// Crea la leyenda
			if (contenido.leyenda) contenedor.appendChild(this.leyenda(contenido));

			// Fin
			return contenedor;
		},
		libro: function (contenido) {
			// Crea el contenedor
			const contenedor = document.createElement("div");
			contenedor.classList.add("flexColAlign");

			// Crea la imagen
			const img = document.createElement("img");
			const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";
			img.src = "/imgsEditables/" + subCarpeta + contenido.imagen;
			contenedor.appendChild(img);

			// Agrega la información del libro
			const texto = document.createElement("div");
			texto.classList.add("texto");
			texto.appendChild(this.textoLibro(contenido.titulo, "titulo"));
			texto.appendChild(this.textoLibro(contenido.autor, "autor"));
			const anoEditorial =
				(contenido.anoLanzam || "") +
				(contenido.anoLanzam && contenido.editorial ? " - " : "") +
				(contenido.editorial || "");
			texto.appendChild(this.textoLibro(anoEditorial, "anoEditorial"));
			contenedor.appendChild(texto);

			// Fin
			return contenedor;
		},
		estampa: function (contenido) {
			// Crea el contenedor
			const contenedor = document.createElement("div");
			contenedor.classList.add("flexColAlign");

			// Le agrega el título
			if (contenido.titulo) {
				const h3 = document.createElement("h3");
				h3.classList.add("titulo");
				h3.innerText = contenido.titulo;
				contenedor.appendChild(h3);
			}

			// Le agrega la imágenes
			contenedor.appendChild(this.imgsEstampa(contenido));

			// Fin
			return contenedor;
		},

		// Auxiliares
		imgsCrsl: (carrusel) => {
			// Variables
			const subCarpeta = carrusel.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";

			// Crea el contenedor de cada imagen
			const contenedorImg = document.createElement("div");
			contenedorImg.classList.add("contenedorImg", "flexColAlign");

			// Crea el domImagen
			const img = document.createElement("img");
			img.src = "/imgsEditables/" + subCarpeta + carrusel.imagen;

			// La agrega al padre
			contenedorImg.appendChild(img);

			// Fin
			return contenedorImg;
		},
		leyenda: (contenido) => {
			// Crea el contenedor
			const domLeyenda = document.createElement("div");
			domLeyenda.classList.add("leyenda");
			domLeyenda.innerText = contenido.leyenda;

			// Fin
			return domLeyenda;
		},
		textoLibro: (texto, formato) => {
			// Crea el contenedor
			const div = document.createElement("div");
			div.classList.add(formato);
			div.innerText = texto;

			// Fin
			return div;
		},
		imgsEstampa: (contenido) => {
			// Variables
			const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";

			// Crea el contenedor de cada imagen
			const imagenes = document.createElement("div");
			imagenes.classList.add("imagenes", "flexRow");

			// Crea las imágenes
			const img1 = document.createElement("img");
			const img2 = document.createElement("img");
			img1.src = "/imgsEditables/" + subCarpeta + contenido.imagen;
			img2.src = "/imgsEditables/" + subCarpeta + contenido.imagen2;

			// Las agrega al padre
			imagenes.appendChild(img1);
			imagenes.appendChild(img2);

			// Fin
			return imagenes;
		},
	};

	// Lo actualiza por cambio en el encabezado
	DOM.filtroEncab.addEventListener("change", async () => {
		// Variables
		const encab_id = DOM.filtroEncab.value;
		const ruta = rutasContenido.obtiene + "encab_id=" + encab_id;

		// Limpia el DOM
		DOM.sectorContenido.innerHTML = "";

		// Obtiene los contenidos
		v.contenidos = v.encab_id != "nuevo" ? await fetch(ruta).then((n) => n.json()) : [];

		// Si el sector no tiene contenidos, interrumpe la función
		if (!v.contenidos.length) return DOM.sectorContenido.classList.add("ocultar");
		// Muestra el sector contenidos
		else DOM.sectorContenido.classList.remove("ocultar");

		// Actualiza el DOM
		creaContenidoIconos();

		// Fin
		return;
	});
});
