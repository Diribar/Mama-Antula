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
			const domBloqueLectura = document.createElement("div");
			domBloqueLectura.classList.add("bloque", "sector");

			// Crea el DOM contenido
			this.creaElContenido(contenido); // puede ser: div (para texto, texto-imagen, carrusel), img, video
			v.domContenido.classList.add("contenido");
			domBloqueLectura.appendChild(v.domContenido);

			// Crea el DOM íconos
			const domIconos = DOM.iconos.cloneNode(true);
			domIconos.dataset.id = contenido.id;
			domIconos.dataset.statusRegistro_id = contenido.statusRegistro_id;

			// Si corresponde, elimina los íconos de subir y/o bajar
			if (v.final_id == contenido.id || contenido.statusRegistro_id != 1) domIconos.querySelector(".baja").remove();
			if (v.inicial_id == contenido.id || contenido.statusRegistro_id != 1) domIconos.querySelector(".sube").remove();

			// Agrega el DOM de los íconos
			domBloqueLectura.appendChild(domIconos);

			// Agrega el DOM contenedor al DOM sector
			DOM.sectorContenido.appendChild(domBloqueLectura);

			// Fin
			return;
		},
		creaElContenido: function (contenido) {
			// Crea el DOM
			v.domContenido = document.createElement("div");

			if (false) null;
			// Libros
			else if (comp1234.temaActual.codigo == "libros")  v.domContenido = this.libro(contenido);
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

		// Bloques
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
			const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";
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
		libro: function (contenido) {
			// Crea el contenedor
			const contenedor = document.createElement("div");
			contenedor.classList.add("contImagenLeyenda");

			// Crea la imagen
			const domImagen = document.createElement("img");
			const subCarpeta = contenido.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";
			domImagen.src = "/imgsEditables/" + subCarpeta + contenido.imagen;
			domImagen.classList.add("imagen");
			contenedor.appendChild(domImagen);

			// Agrega la información del libro
			contenedor.appendChild(this.infoLibro(contenido.titulo, "tituloLibro"));
			contenedor.appendChild(this.infoLibro(contenido.autor, "autorLibro"));
			const anoEditorial =
				(contenido.anoLanzam || "") +
				(contenido.anoLanzam && contenido.editorial ? " - " : "") +
				(contenido.editorial || "");
			contenedor.appendChild(this.infoLibro(anoEditorial, "anoEditorial"));

			// Fin
			return contenedor;
		},

		// Auxiliares
		agregaImgsCrsl: (contenido) => {
			// Recorre el carrusel
			for (const registro of contenido.carrusel) {
				// Variables
				const subCarpeta = registro.statusRegistro_id == 1 ? "2-Revisar/" : "1-Final/";

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
			domLeyenda.innerText = contenido.leyenda;

			// Fin
			return domLeyenda;
		},
		infoLibro: (texto, formato) => {
			// Crea el contenedor
			const div = document.createElement("div");
			div.classList.add(formato);
			div.innerText = texto;

			// Fin
			return div;
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
