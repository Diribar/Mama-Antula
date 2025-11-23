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
		iconos: domSectorEncabezado.querySelector(".iconos"),
		iconoGuardar: domSectorEncabezado.querySelector(".iconos #guardar"),
		iconoEliminar: domSectorEncabezado.querySelector(".iconos #eliminar"),
	};
	const rutas = {
		// Encabezado
		guardaEncabezado: "/articulos/api/abm-encabezado-guarda",
		eliminaEncabezado: "/articulos/api/abm-encabezado-elimina/?id=",
	};
	const v = {};

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
			v.encabezado = comp1234.encabezados.find((n) => n.id == DOM.filtroEncab.value);
			for (const input of DOM.inputs) {
				// Agrega las opciones
				const {tabla} = input.dataset;
				if (input.type == "select-one" && tabla) agregaOpciones(comp1234[tabla], input, "nombre");

				// Actualiza el valor elegido de todos los inputs
				const campo = input.name;
				input.value = v.encabezado && (v.encabezado[campo] || v.encabezado[campo] === 0) ? v.encabezado[campo] : "";
			}

			// Fin
			return;
		},
		actualizaLosIconos: () => {
			// Muestra la imagen del usuario
			if (
				v.encabezado &&
				v.encabezado.statusRegistro.codigo != "aprobado" && // no está en status aprobado
				v.encabezado.statusSugeridoPor_id != usuario_id // el status fue sugerido por otro usuario
			) {
				// Muestra la imagen del usuario y oculta los íconos
				const {imagen} = v.encabezado.statusSugeridoPor;
				DOM.img.src = imagen ? "/imgsEditables/8-Usuarios/" + imagen : "/imgsEstables/Varios/usuarioGenerico.jpg";
				DOM.title = v.encabezado.statusSugeridoPor.nombreCompleto;
				DOM.iconos.classList.add("ocultar");
			}
			// Muestra los íconos
			else {
				// Muestra los íconos y oculta la imagen del usuario
				DOM.iconos.classList.remove("ocultar");
				DOM.img.src = "";

				// Si es un encabezado nuevo, oculta el ícono de eliminar
				DOM.iconoEliminar.classList[DOM.filtroEncab.value == "nuevo" ? "add" : "remove"]("ocultar");
			}
		},
	};

	// Impactos del filtro - Actualiza el encabezado
	DOM.filtroEncab.addEventListener("change", () => {
		// Muestra el encabezado que corresponde, y oculta los demás
		FN.actualizaLaVisibilidadDelSector();
		if (domSectorEncabezado.classList.contains("ocultar")) return;

		// Muestra el encabezado que corresponde, y oculta los demás
		for (const domEncabezado of DOM.encabezados)
			domEncabezado.classList[domEncabezado.id == comp1234.tipoEncab ? "remove" : "add"]("ocultar");

		// Actualiza los valores del encabezado
		DOM.encabezado = document.querySelector("#sectorEncabezado .encabezado:not(.ocultar)");
		if (!DOM.encabezado) return;
		FN.actualizaSusValores();

		// Actualiza los íconos
		FN.actualizaLosIconos();

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
