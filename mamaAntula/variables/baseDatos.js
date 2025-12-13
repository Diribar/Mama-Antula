"use strict";

export default {
	lecturasDeBd: async () => {
		// Obtiene las lecturas de BD
		const lecturas = {
			// Niveles
			seccionesLectura: baseDatos.obtieneTodosConOrden("seccionesLectura", "orden"),
			temasSecciones: baseDatos
				.obtieneTodosPorCondicion("temasSecciones", {inactivo: false}, ["indicesFecha", "indicesDevoc"])
				.then((n) => n.sort((a, b) => a.orden - b.orden)),
			pestanasTemas: baseDatos.obtieneTodosConOrden("pestanasTemas", "orden"),
			contLayouts: baseDatos.obtieneTodosConOrden("contLayouts", "orden"),
			indicesFecha: baseDatos.obtieneTodos("indicesFecha"),
			indicesDevoc: baseDatos
				.obtieneTodos("indicesDevoc")
				.then((n) => n.sort((a, b) => (a.nombre < b.nombre ? -1 : 1)))
				.then((n) => n.sort((a, b) => a.orden - b.orden)),

			// Cartas
			idiomas: baseDatos.obtieneTodosConOrden("idiomas", "nombre"),
			lugaresCartas: baseDatos.obtieneTodosConOrden("lugaresCartas", "nombre"),
			personajes: baseDatos.obtieneTodosConOrden("personajes", "nombre"),

			// Usuarios
			roles: baseDatos.obtieneTodosConOrden("roles", "orden"),
			statusRegistrosUs: baseDatos.obtieneTodos("statusRegistrosUs"),

			// Otros
			lugaresExpers: baseDatos.obtieneTodosConOrden("lugaresExpers", "nombre"),
			iconosAgrupados: baseDatos.obtieneTodosConOrden("iconosAgrupados", "orden").then((n) => n.filter((m) => m.activo)),
			statusRegistros: baseDatos.obtieneTodos("statusRegistros"),
			novsDelSitio: baseDatos.obtieneTodosConOrden("novsDelSitio", "fecha"),
		};

		// Await
		const valores = await Promise.all(Object.values(lecturas));
		Object.keys(lecturas).forEach((campo, i) => (lecturas[campo] = valores[i]));

		// Fin
		return lecturas;
	},
	datosPartics: () => {
		// Variables
		const respuesta = {
			// 1. Roles de usuario
			rolLectura_id: roles.find((n) => n.codigo == "lectura").id,
			rolesActualizac_ids: roles.filter((n) => n.actualizac).map((n) => n.id),
			rolesRevision_ids: roles.filter((n) => n.revision).map((n) => n.id),
			rolesCambioRoles_ids: roles.filter((n) => n.cambioRol).map((n) => n.id),

			// 2. Status de usuario
			mailPendValidar_id: statusRegistrosUs.find((n) => n.codigo == "mailPendValidar").id,
			mailValidado_id: statusRegistrosUs.find((n) => n.codigo == "mailValidado").id,
			conApodo_id: statusRegistrosUs.find((n) => n.codigo == "conApodo").id,

			// 3. Status de contenido
			creado_id: statusRegistros.find((n) => n.codigo == "creado").id,
			creadoAprob_id: statusRegistros.find((n) => n.codigo == "creadoAprob").id,
			aprobado_id: statusRegistros.find((n) => n.codigo == "aprobado").id,
			rechazar_id: statusRegistros.find((n) => n.codigo == "rechazar").id,
			rechazado_id: statusRegistros.find((n) => n.codigo == "rechazado").id,

			// Índices de fecha
			indicesExpers: indicesFecha
				.filter((n) => n.tema_id != temaCarta_id)
				.sort((a, b) => (b.fechaDesde < a.fechaDesde ? -1 : 1)),
			indicesCartas: indicesFecha
				.filter((n) => n.tema_id == temaCarta_id)
				.sort((a, b) => (a.fechaDesde < b.fechaDesde ? -1 : 1)),

			// Personajes agrupados
			persAgrupados: {
				"Mas frecuentes": personajes.filter((n) => n.id <= 3),
				Sacerdotes: personajes.filter((n) => n.id > 3 && n.nombre.startsWith("P.")),
				Laicos: personajes.filter((n) => n.id > 3 && !n.nombre.startsWith("P.")),
			},

			// Otros
			versionWeb: novsDelSitio.at(-1)?.version,
		};

		// Fin
		return respuesta;
	},
};
