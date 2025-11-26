"use strict";
import procesos from "./LT-procesos.js";
const temaVista = "secciones";

export default {
	temas: async (req, res) => {
		// Variables
		const codigoVista = "temas";
		let {urlSeccion, urlTema} = req.params;
		urlSeccion = urlSeccion || LP_urlSeccion;
		urlTema = urlTema || LP_urlTema;

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);
		const indices = {
			esCarta: temaActual.codigo == "cartas",
			esLugares: temaActual.codigo == "lugaresDevocion",
			conIndice: !!(temaActual.indicesFecha.length || temaActual.indicesLugar.length),
		};

		// Condición - si el usuario no tiene el permiso de edición, no se le permite ver los contenidos que tengan status 'creado'
		const condicion = {tema_id: temaActual.id};
		const soloStatusAprob = !req.session.usuario || !rolesActualizac_ids.includes(req.session.usuario.rol_id);
		if (soloStatusAprob) condicion.statusRegistro_id = aprobado_id;

		// Obtiene el encabezado y contenido
		const encab_id = req.query.id;

		const {encabezados, encabezado} = await procesos.encabezados({encab_id, condicion, ...indices});
		console.log(33, condicion, encabezado);
		const contenidos = encabezado && (await procesos.contenidos({encabezado, soloStatusAprob}));

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion},
			...{seccionActual, temaActual},
			...{encabezado, contenidos, encabezados},
			...indices,
		});
	},
	pestanas: async (req, res) => {
		// Variables
		const codigoVista = "pestanas";
		const {urlSeccion, urlTema, urlPestana} = req.params;

		// Sección
		const seccionActual = secciones.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		const temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		const temaActual = temasSeccion.find((n) => n.url == urlTema);

		// Pestaña
		const pestanasTema = pestanasTemas.filter((n) => n.tema_id == temaActual.id);
		const pestanaActual = pestanasTema.find((n) => n.url == urlPestana);

		// Condición - si el usuario no tiene el permiso de edición, no se le permite ver los contenidos que tengan status 'creado'
		const condicion = {pestana_id: pestanaActual.id};
		const soloStatusAprob = !req.session.usuario || !rolesActualizac_ids.includes(req.session.usuario.rol_id);
		if (soloStatusAprob) condicion.statusRegistro_id = aprobado_id;

		// Obtiene el encabezado y contenido
		const encab_id = req.query.id;
		const {encabezados, encabezado} = await procesos.encabezados({encab_id, condicion});
		const contenidos = encabezado && (await procesos.contenidos({encabezado, soloStatusAprob}));

		// Datos para la vista
		const indices = {esCarta: null, esLugares: null, conIndice: null};

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			...{encabezado, contenidos, encabezados},
			...indices,
		});
	},
};
