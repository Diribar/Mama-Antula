"use strict";

// Broadcast that you're opening a page
localStorage.estaPestana = Date.now();

// Funciones
const unaSolaPestana = async (e) => {
	// Sólo dispara el evento en las demás pestañas
	if (e.key == "estaPestana") localStorage.otraPestana = Date.now();

	// Si otra pestaña avisa que está abierta, esta pestaña cambia su url al de lectura
	if (e.key == "otraPestana") {
		const redirigeLectura = await actualizaUrlLectura();
		location.href = redirigeLectura;

		// Fin
		return;
	}
};
const actualizaUrlLectura = async () => {
	// Obtiene los ids del url
	const seccion_id = cookie("actualizaSeccion_id");
	const tema_id = cookie("actualizaTema_id");
	const pestana_id = cookie("actualizaPestana_id");
	const encabezado_id = cookie("actualizaEncabezado_id");

	// Obtiene los datos iniciales
	const v = await fetch("/contenido/api/abm-filtros-datos-inciales").then((n) => n.json());

	// Obtiene los url
	const urlSeccion = v.secciones.find((n) => n.id == seccion_id)?.url || "";
	const urlTema = (urlSeccion && v.temasSecciones.find((n) => n.id == tema_id)?.url) || "";
	const urlPestana = (urlTema && v.pestanasTemas.find((n) => n.id == pestana_id)?.url) || "";
	const urlEncabezado = (urlTema && encabezado_id && "/?id=" + encabezado_id) || "";

	// Redirige
	const redirigeLectura = "/" + urlSeccion + (urlTema && "/") + urlTema + (urlPestana && "/") + urlPestana + urlEncabezado;

	// Fin
	return redirigeLectura;
};

// Evento - provocado por otra pestaña, mediante 'localStorage.otraPestana'
window.addEventListener("storage", unaSolaPestana);
