"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltros = document.querySelector("#filtros");
	const domSectorEncabezado = document.querySelector("#sectorEncabezado");
	const DOM = {
		// Filtros
		filtroTema: domFiltros.querySelector("select[name='tema_id']"),
		filtroPestana: domFiltros.querySelector("select[name='pestana_id']"),
		filtroEncab: domFiltros.querySelector("select[name='encabezado']"),

		// Inputs del encabezado
		encabezados: domSectorEncabezado.querySelectorAll(".encabezado"),
		inputs: domSectorEncabezado.querySelectorAll(".input"),

		// Íconos
		iconos: domSectorEncabezado.querySelectorAll(".iconos i"),
		iconoGuardar: domSectorEncabezado.querySelector(".iconos #guardar"),
		iconoEliminar: domSectorEncabezado.querySelector(".iconos #eliminar"),
		img: domSectorEncabezado.querySelector(".iconos img"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/actualizar/api/act-encabezado-guarda",
		eliminaEncabezado: "/actualizar/api/act-encabezado-elimina/?id=",
	};

	// Funciones
	const FN = {
		actualizaLaVisibilidadDelSector: () => {
			const oculta =
				(!comp1234.conIndice && !DOM.filtroPestana.value) || // Si es 'sin índice' y viene de un tema, lo oculta porque sus campos no poseen ningún valor
				DOM.filtroEncab.value == comp1234.encabCartaIntro_id || // Si es la nota de introducción al tema cartas, oculta el encabezado
				DOM.filtroEncab.value == comp1234.encabLugaresIntro_id; // Si es la nota de introducción al tema lugares, oculta el encabezado
			domSectorEncabezado.classList[oculta ? "add" : "remove"]("ocultar");

			// Fin
			return;
		},
		actualizaSusValores: () => {
			// Agrega los valores
			DOM.inputs = DOM.encabezado.querySelectorAll(".input");
			comp1234.encabezado = comp1234.encabezados.find((n) => n.id == DOM.filtroEncab.value);
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) agregaOpciones(comp1234[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value =
					comp1234.encabezado && (comp1234.encabezado[campo] || comp1234.encabezado[campo] === 0)
						? comp1234.encabezado[campo]
						: "";
			}

			// Fin
			return;
		},
		actualizaIconos: () => {
			// Averigua si se deben ocultar los íconos
			const ocultaIconos =
				comp1234.encabezado &&
				((comp1234.encabezado.statusRegistro_id == comp1234.creado_id &&
					comp1234.encabezado.statusSugeridoPor_id != comp1234.usuario.id) || // el encabezado está en status creado y no fue creado por el usuario actual
					[comp1234.rechazar_id, comp1234.rechazado_id].includes(comp1234.encabezado.statusRegistro_id)); // el encabezado está en status rechazar/rechazado

			// Si oculta íconos, muestra la imagen del usuario
			if (ocultaIconos) {
				// Muestra la imagen y oculta los íconos
				DOM.img.src = "/imgsEditables/8-Usuarios/" + comp1234.encabezado.statusSugeridoPor.imagen;
				DOM.img.title = comp1234.encabezado.statusSugeridoPor.nombreCompleto;
				for (const iconos of DOM.iconos) iconos.classList.add("ocultar");
			} else {
				// Oculta la imagen y muestra los íconos
				DOM.img.src = "";

				// Acciones si es un encabezado nuevo
				if (DOM.filtroEncab.value == "nuevo") {
					DOM.iconoGuardar.classList.remove("ocultar");
					DOM.iconoEliminar.classList.add("ocultar");
				} else {
					DOM.iconoGuardar.classList.add("ocultar");
					DOM.iconoEliminar.classList.remove("ocultar");
				}
			}
		},
	};

	// Impactos del filtro - Actualiza el encabezado
	DOM.filtroEncab.addEventListener("change", () => {
		// Muestra el encabezado que corresponde, y oculta los demás
		FN.actualizaLaVisibilidadDelSector();
		if (domSectorEncabezado.classList.contains("ocultar")) return;

		// Le agrega una clase en función del status del encabezado
		console.log(comp1234.encabezado);

		const status = comp1234.encabezados.find((n) => n.id == DOM.filtroEncab.value).statusRegistro_id;
		domSectorEncabezado.classList[status == comp1234.aprobado_id ? "add" : "remove"]("aprobado");
		domSectorEncabezado.classList[status == comp1234.rechazar_id ? "add" : "remove"]("rechazado");

		// Muestra el encabezado que corresponde, y oculta los demás
		for (const domEncabezado of DOM.encabezados)
			domEncabezado.classList[domEncabezado.id == comp1234.tipoEncab ? "remove" : "add"]("ocultar");

		// Actualiza los valores del encabezado
		DOM.encabezado = document.querySelector("#sectorEncabezado .encabezado:not(.ocultar)");
		if (!DOM.encabezado) return;
		FN.actualizaSusValores();

		// Actualiza los íconos
		FN.actualizaIconos();

		// Fin
		return;
	});

	// Novedades en algún input - Muestra el botón de guardar
	for (const input of DOM.inputs) {
		input.addEventListener("input", () => {
			// Muestra el botón de guardar
			DOM.iconoGuardar.classList.remove("ocultar");

			// Les actualiza el título a guardar y eliminar
			const leyenda = DOM.filtroEncab.value == "nuevo" ? "Encabezado nuevo" : "Edición del encabezado";
			DOM.iconoGuardar.title = leyenda;
			DOM.iconoGuardar.title = leyenda;

			// Fin
			return;
		});
		input.addEventListener("change", () => input.name == "titulo" && (input.value = inicialMayus(input.value)));
	}

	// Guarda/Actualiza en la BD
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Arma el feedback
		const formVisible = document.querySelector("#sectorEncabezado form:not(.ocultar)"); // elige el unico formulario visible
		const formData = new FormData(formVisible);
		formData.append("encab_id", DOM.filtroEncab.value);

		// Si no es una carta, le agrega el tema_id o pestana_id, según corresponda
		const campo_id = comp1234.pestana_id ? "pestana_id" : "tema_id";
		formData.append(campo_id, comp1234[campo_id]);

		// Guarda el encabezado en la BD
		const respuesta = await fetch(rutas.guardaEncabezado, postForm(formData)).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);
		// Si no hubo error y es una edición, muestra el mensaje de exito
		else if (DOM.filtroEncab.value != "nuevo") carteles.exito("El encabezado fue actualizado");
		// Como es un encabezado nuevo, establece que se actualicen los filtros por las cookies
		else {
			comp1234.startUp = true;
			DOM.filtroTema.dispatchEvent(new Event("change"));
		}

		// Fin
		return;
	});

	// Elimina en la BD
	DOM.iconoEliminar.addEventListener("click", async () => {
		const mensaje = "¿Estás seguro/a de que querés eliminar este encabezado y su contenido?";
		const cancelButtonText = "Conservar";
		const confirmButtonText = "Eliminar";

		// Aviso y acciones
		const confirma = await carteles.confirmar({mensaje, cancelButtonText, confirmButtonText});
		if (!confirma) return;

		// Limpia el FE
		for (const input of DOM.inputs) input.value = "";

		// Elimina de la BD, el encabezado y sus contenidos
		const datos = {id: DOM.filtroEncab.value};
		const respuesta = await fetch(rutas.eliminaEncabezado, deleteJson(datos)).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);

		// Elimina la cookie y se genera un change en el tema o pestaña, para que se reinicie el filtro del encabezado
		document.cookie = "actualizaEncabezado_id=; path=/";
		comp1234.startUp = true;
		DOM.filtroTema.dispatchEvent(new Event("change"));

		// Fin
		return;
	});

	// Fin
	return;
});
