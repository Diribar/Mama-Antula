"use strict";
import procesos from "./LT-procesos.js";
const temaVista = "seccionesLectura";

export default {
	temas: async (req, res) => {
		// Datos del url
		const encab_id = req.query.id;
		let {urlSeccion, urlTema} = req.params;

		// Variables
		const codigoVista = "temas";
		urlSeccion = urlSeccion || LP_urlSeccion;
		urlTema = urlTema || LP_urlTema1;

		// Sección
		const seccionActual = seccionesLectura.find((n) => n.url == urlSeccion);
		const tituloPagina = seccionActual.nombre;

		// Tema
		let temasSeccion = temasSecciones.filter((n) => n.seccion_id == seccionActual.id);
		if (seccionActual.url == LP_urlSeccion) {
			// Averigua si hay novedades
			const hayNovedades = await baseDatos
				.obtienePorCondicion("encabezados", {tema_id: landingPage_id}, "contenidos")
				.then((n) => !!n.contenidos.length);

			if (!hayNovedades) {
				// Si el urlTema es 'Novedades', lo cambia por el alternativo
				if (urlTema == LP_urlTema1) {
					// Si viene del url, redirige
					if (req.params.urlTema) return res.redirect("/inicio/" + LP_urlTema2);
					else urlTema = LP_urlTema2;
				}

				// Quita el tema del menú
				temasSeccion = temasSeccion.filter((n) => n.url != LP_urlTema1);
			}
		}
		const temaActual = temasSeccion.find((n) => n.url == urlTema);
		const tema_id = temaActual.id;
		const tipoDeTema = comp.tipoDeTema(tema_id);

		// Condición - si el usuario no tiene el permiso de edición, no se le permite ver los contenidos que tengan status 'creado'
		const condicion = {tema_id: temaActual.id};
		const soloStatusAprob = !req.session.usuario || !rolesActualizac_ids.includes(req.session.usuario.rol_id);
		const statusRegistro_id = soloStatusAprob ? aprobado_id : [creado_id, aprobado_id];
		condicion.statusRegistro_id = statusRegistro_id;

		// Obtiene el encabezado y contenido
		const {encabezados, encabezado, esExpers} = await procesos.obtieneEncabezados({tema_id, encab_id, condicion});
		const contenidos = encabezado && (await procesos.contenidos({encabezado, statusRegistro_id}));

		// Obtiene los lugares de experiencia
		let lugaresExpersFiltro;
		if (encabezados && esExpers) {
			const lugaresExpers_ids = encabezados.map((n) => n.lugarExper_id).filter((n) => !!n);
			lugaresExpersFiltro = lugaresExpers.filter((n) => lugaresExpers_ids.includes(n.id));
		}

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion},
			...{seccionActual, temaActual},
			...{encabezado, contenidos, encabezados, lugaresExpersFiltro},
			...tipoDeTema,
		});
	},
	pestanas: async (req, res) => {
		// Variables
		const codigoVista = "pestanas";
		const {urlSeccion, urlTema, urlPestana} = req.params;

		// Sección
		const seccionActual = seccionesLectura.find((n) => n.url == urlSeccion);
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
		const statusRegistro_id = soloStatusAprob ? aprobado_id : [creado_id, aprobado_id];
		condicion.statusRegistro_id = statusRegistro_id;

		// Obtiene el encabezado y contenido
		const encab_id = req.query.id;
		const {encabezados, encabezado} = await procesos.obtieneEncabezados({encab_id, condicion});
		const contenidos = encabezado && (await procesos.contenidos({encabezado, statusRegistro_id}));

		// Datos para la vista
		const tipoDeTema = comp.tipoDeTema();

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista, codigoVista, temasSeccion, pestanasTema},
			...{seccionActual, temaActual, pestanaActual},
			...{encabezado, contenidos, encabezados},
			...tipoDeTema,
		});
	},
};
