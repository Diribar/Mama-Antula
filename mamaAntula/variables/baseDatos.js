"use strict";

export default {
	lecturasDeBd: async () => {
		// Obtiene las lecturas de BD
		const lecturas = {
			// Niveles
			secciones: baseDatos.obtieneTodosConOrden("secciones", "orden"),
			temasSecciones: baseDatos
				.obtieneTodosPorCondicion("temasSecciones", {inactivo: false}, ["indicesFecha", "indicesLugar"])
				.then((n) => n.sort((a, b) => a.orden - b.orden)),
			pestanasTemas: baseDatos.obtieneTodosConOrden("pestanasTemas", "orden"),
			contLayouts: baseDatos.obtieneTodosConOrden("contLayouts", "orden"),
			indicesFecha: baseDatos.obtieneTodos("indicesFecha"),
			indicesLugar: baseDatos.obtieneTodosConOrden("indicesLugar", "codigo"),

			// Cartas
			idiomas: baseDatos.obtieneTodosConOrden("idiomas", "orden"),
			lugares: baseDatos.obtieneTodosConOrden("lugares", "nombre"),
			personajes: baseDatos.obtieneTodosConOrden("personajes", "orden"),

			// Usuarios
			roles: baseDatos.obtieneTodosConOrden("roles", "orden"),
			statusRegistrosUs: baseDatos.obtieneTodosConOrden("statusRegistrosUs", "orden"),

			// Otros
			iconosAgrupados: baseDatos.obtieneTodosConOrden("iconosAgrupados", "orden"),
			statusRegistros: baseDatos.obtieneTodosConOrden("statusRegistros", "orden"),
			versionWeb: baseDatos.obtieneTodosConOrden("novsDelSitio", "fecha").then((n) => n.at(-1).version),
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
			rolesCambioRoles_ids: roles.filter((n) => n.cambioRoles).map((n) => n.id),

			// 2. Status de usuario
			mailPendValidar_id: statusRegistrosUs.find((n) => n.codigo == "mailPendValidar").id,
			mailValidado_id: statusRegistrosUs.find((n) => n.codigo == "mailValidado").id,
			conApodo_id: statusRegistrosUs.find((n) => n.codigo == "conApodo").id,

			// 3. Status de contenido
			creado_id: statusRegistros.find((n) => n.codigo == "creado").id,
			aprobado_id: statusRegistros.find((n) => n.codigo == "aprobado").id,
			inactivar_id: statusRegistros.find((n) => n.codigo == "inactivar").id,
			inactivo_id: statusRegistros.find((n) => n.codigo == "inactivo").id,

			// Otros
			indicesCartas: indicesFecha.filter((n) => n.tema_id == 10).sort((a, b) => (a.fechaDesde < b.fechaDesde ? -1 : 1)), // el tema_id es el de cartas
			indicesRestoFechas: indicesFecha
				.filter((n) => n.tema_id != 10)
				.sort((a, b) => (b.fechaDesde < a.fechaDesde ? -1 : 1)),
		};

		// Fin
		return respuesta;
	},
};
