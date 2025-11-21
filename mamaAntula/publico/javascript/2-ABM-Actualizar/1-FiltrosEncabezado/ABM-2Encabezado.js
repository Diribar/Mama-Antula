"use strict";

window.addEventListener("load", async () => {
	// Variables
	const domFiltros = document.querySelector("#filtros");
	const domEncabezado = document.querySelector("#sectorEncabezado");
	const DOM = {
		// Filtros
		filtroTema: domFiltros.querySelector("select[name='tema_id']"),
		filtroPestana: domFiltros.querySelector("select[name='pestana_id']"),
		filtroEncab: domFiltros.querySelector("select[name='encabezado']"),

		// Inputs del encabezado
		encabezados: domEncabezado.querySelectorAll(".encabezado"),
		inputs: domEncabezado.querySelectorAll(".input"),

		// Íconos
		encabIconos: domEncabezado.querySelector(".iconos"),
		iconoGuardar: domEncabezado.querySelector(".iconos #guardar"),
		iconoEliminar: domEncabezado.querySelector(".iconos #eliminar"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/articulos/api/abm-encabezado-guarda",
		eliminaEncabezado: "/articulos/api/abm-encabezado-elimina/?id=",
	};

	// Funciones
	const actualizaElEncabezado = {
		consolidado: function () {
			// Muestra u oculta el sector
			this.actualizaLaVisibilidadDelSector();
			if (domEncabezado.classList.contains("ocultar")) return;

			// Muestra el encabezado que corresponde, y oculta los demás
			for (const encabezado of DOM.encabezados)
				encabezado.classList[encabezado.id == comp1234.tipoEncab ? "remove" : "add"]("ocultar");

			// Si el encabezado está visible, actualiza sus valores
			this.actualizaSusValores();

			// Fin
			return;
		},

		// Auxiliares
		actualizaLaVisibilidadDelSector: () => {
			if (
				(!comp1234.conIndice && !DOM.filtroPestana.value) || // Si es 'sin índice' y viene de un tema, lo oculta porque sus campos no poseen ningún valor
				DOM.filtroEncab.value == comp1234.encabCartaIntro_id || // Si es la nota de introducción al tema cartas, oculta el encabezado
				DOM.filtroEncab.value == comp1234.encabLugaresIntro_id // Si es la nota de introducción al tema lugares, oculta el encabezado
			)
				domEncabezado.classList.add("ocultar");
			else domEncabezado.classList.remove("ocultar");

			// Fin
			return;
		},
		actualizaSusValores: () => {
			// Variables
			DOM.encabezado = document.querySelector("#sectorEncabezado .encabezado:not(.ocultar)");
			DOM.inputs = DOM.encabezado.querySelectorAll(".input");
			const encabezado = comp1234.encabezados.find((n) => n.id == DOM.filtroEncab.value);

			// Agrega los valores
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) agregaOpciones(comp1234[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value = encabezado && (encabezado[campo] || encabezado[campo] === 0) ? encabezado[campo] : "";
			}

			// Fin
			return;
		},
	};

	// Impactos del filtro - Actualiza el encabezado
	DOM.filtroEncab.addEventListener("change", () => {
		// Muestra el encabezado que corresponde, y oculta los demás
		actualizaElEncabezado.consolidado();

		// Actualiza los íconos
		DOM.encabIconos.querySelector("#eliminar").classList[DOM.filtroEncab.value == "nuevo" ? "add" : "remove"]("ocultar");

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
		input.addEventListener("change", () => {
			if (["titulo", "subTitulo"].includes(input.name)) input.value = inicialMayus(input.value);

			// Fin
			return;
		});
	}

	// Guarda/Actualiza en la BD
	DOM.iconoGuardar.addEventListener("click", async () => {
		// Arma el feedback
		const formVisible = document.querySelector("#sectorEncabezado form:not(.ocultar)"); // elige el unico formulario visible
		const formData = new FormData(formVisible);
		formData.append("id", DOM.filtroEncab.value);

		// Si no es una carta, le agrega el tema_id o pestana_id, según corresponda
		const campo_id = comp1234.pestana_id ? "pestana_id" : "tema_id";
		formData.append(campo_id, comp1234[campo_id]);

		// Guarda el encabezado en la BD
		const respuesta = await fetch(rutas.guardaEncabezado, postForm(formData)).then((n) => n.json());

		// Si hubo un error, muestra el mensaje e interrumpe la función
		if (respuesta.error) return carteles.error(respuesta.error);
		else carteles.exito("Los cambios fueron guardados");

		// Guarda el nuevo_id en la cookie y establece que se actualicen los filtros por las cookies
		if (respuesta.id) {
			// Guarda la nueva cookie y se genera un change en el tema, para que se reinicie el filtro del encabezado
			document.cookie = "actualizaEncabezado_id=" + respuesta.id + "; path=/";
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
		const confirma = await carteles.pregunta({mensaje, cancelButtonText, confirmButtonText});
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
