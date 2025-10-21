"use strict";

export default {
	lecturasDeBd: async () => {
		// Obtiene las lecturas de BD
		const lecturas = {
			// Niveles
			secciones: baseDatos.obtieneTodosConOrden("secciones", "orden"),
			temasSecciones: baseDatos.obtieneTodosConOrden("temasSecciones", "orden"),
			pestanasTemas: baseDatos.obtieneTodosConOrden("pestanasTemas", "orden"),

			// Cartas
			idiomas: baseDatos.obtieneTodosConOrden("idiomas", "orden"),
			lugares: baseDatos.obtieneTodosConOrden("lugares", "orden"),
			personajes: baseDatos.obtieneTodosConOrden("personajes", "orden"),

			// Otros
			iconosAgrupados: baseDatos.obtieneTodosConOrden("iconosAgrupados", "orden"),
			rolesUs: baseDatos.obtieneTodosConOrden("rolesUs", "orden"),
			statusRegistrosUs: baseDatos.obtieneTodosConOrden("statusRegistrosUs", "orden"),
			//novedadesWeb: baseDatos.obtieneTodosConOrden("novedadesWeb", "fecha"),
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
			rolLectura_id: rolesUs.find((n) => n.codigo == "lectura").id,
			rolesEdicion_ids: rolesUs.filter((n) => n.edicion).map((n) => n.id),
			rolesRevision_ids: rolesUs.filter((n) => n.revision).map((n) => n.id),
			rolesAdmin_ids: rolesUs.filter((n) => n.abmUs).map((n) => n.id),

			// 2. Status de usuario
			mailPendValidar_id: statusRegistrosUs.find((n) => n.codigo == "mailPendValidar").id,
			mailValidado_id: statusRegistrosUs.find((n) => n.codigo == "mailValidado").id,
		};

		// Fin
		return respuesta;
	},
};
