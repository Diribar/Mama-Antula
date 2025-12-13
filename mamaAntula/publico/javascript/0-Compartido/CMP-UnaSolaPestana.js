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
	const seccion_id = cookie("actSeccion_id");
	const tema_id = cookie("actTema_id");
	const pestana_id = cookie("actPestana_id");
	const encab_id = cookie("actEncabezado_id");

	// Obtiene los datos iniciales
	const ruta = "/actualizar/api/act-filtros-datos-inciales";
	const v = await fetch(ruta).then((n) => n.json());

	// Obtiene los url
	const urlSeccion = v.seccionesLectura.find((n) => n.id == seccion_id)?.url || "";
	const urlTema = (urlSeccion && v.temasSecciones.find((n) => n.id == tema_id)?.url) || "";
	const urlPestana = (urlTema && v.pestanasTemas.find((n) => n.id == pestana_id)?.url) || "";
	const urlEncabezado = (urlTema && encab_id && "/?id=" + encab_id) || "";

	// Redirige
	const redirigeLectura = "/" + urlSeccion + (urlTema && "/") + urlTema + (urlPestana && "/") + urlPestana + urlEncabezado;

	// Fin
	return redirigeLectura;
};

// Evento - provocado por otra pestaña, mediante 'localStorage.otraPestana'
window.addEventListener("storage", unaSolaPestana);
