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
		campos_id: {encabCartas: "carta_id", encabResto: "encab_id"},
		cruds: ["guarda", "baja", "sube", "elimina"],
		funcsComps: {
			guarda: (datos) => postJson(datos),
			baja: (datos) => putJson(datos),
			sube: (datos) => putJson(datos),
			elimina: (datos) => deleteJson(datos),
		},
	};
	const rutasContenido = {obtiene: "/contenido/api/abm-obtiene-contenidos/?"};
	for (const crud of v.cruds) rutasContenido[crud] = "/contenido/api/abm-" + crud + "-contenido";

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

					// Crud del contenido
					await fetch(rutasContenido[crud], v.funcsComps[crud]({id})).then((n) => n.json());

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
	};

	// Lo actualiza por cambio en el encabezado
	DOM.filtroEncab.addEventListener("change", async () => {
		// Variables
		const encabezado_id = DOM.filtroEncab.value;
		const campo_id = v.campos_id[comp1234.entidad];
		const ruta = rutasContenido.obtiene + "encab_id=" + encabezado_id + "&campo_id=" + campo_id;

		// Limpia el DOM
		DOM.sectorContenido.innerHTML = "";

		// Si el sector no tiene contenidos, interrumpe la función
		v.contenidos = v.encabezado_id != "nuevo" ? await fetch(ruta).then((n) => n && n.json()) : [];
		if (!v.contenidos.length) return DOM.sectorContenido.classList.add("ocultar");
		// Muestra el sector contenidos
		else DOM.sectorContenido.classList.remove("ocultar");

		// Actualiza el DOM
		creaContenidoIconos();

		// Fin
		return;
	});
});
