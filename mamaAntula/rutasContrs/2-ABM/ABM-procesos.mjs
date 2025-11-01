"use strict";
// import procesos from "./US-procesos.mjs";
const temaVista = "abmArticulos";

export default {
	obtieneEncabs: {
		consolidado: async function ({entidad, condicion, includesConEdics, orden, usuario}) {
			// Obtiene los encabezados con todas sus ediciones
			let encabezados = await this.conTodasLasEdiciones({entidad, condicion, includesConEdics, orden});

			// Funde los originales con las ediciones del usuario
			encabezados = this.fundeConLaEdicionDelUsuario({encabezados, usuario});

			// Les agrega los títulos
			encabezados = comp.contenido.tituloCons[entidad](encabezados);

			// Fin
			return encabezados;
		},
		conTodasLasEdiciones: async ({entidad, condicion, includesConEdics, orden}) => {
			// Obtiene los encabezados
			let encabezados =
				entidad == "encabCartas"
					? baseDatos
							.obtieneTodos(entidad, includesConEdics)
							.then((n) => n.sort((a, b) => new Date(a[orden]) - new Date(b[orden])))
					: entidad == "encabExpers"
					? baseDatos
							.obtieneTodosPorCondicion(entidad, condicion, includesConEdics)
							.then((n) => n.sort((a, b) => new Date(b[orden]) - new Date(a[orden])))
					: baseDatos
							.obtieneTodosPorCondicion(entidad, condicion, includesConEdics)
							.then((n) => n.sort((a, b) => a.orden - b.orden));
			encabezados = await encabezados;

			// Si la entidad es encabSinIndice y no existe un registro, lo crea
			if (entidad == "encabSinIndice" && !encabezados.length) {
				const creadoPor_id = req.session.usuario.id;
				const statusRegistro_id = aprobado_id;
				const datos = {...condicion, creadoPor_id, statusRegistro_id};
				const encabezado = await baseDatos.agregaRegistroIdCorrel(entidad, datos);
				encabezado.ediciones = [];
				encabezados = [encabezado];
			}
		},
		fundeConLaEdicionDelUsuario: ({encabezados, usuario}) => {
			// Rutina por encabezado
			for (const encabezado of encabezados) {
				// Obtiene la edicion del usuario y elimina el método ediciones
				const edicion = encabezado.ediciones.find((n) => n.editadoPor_id == usuario.id);
				delete encabezado.ediciones;

				// Funde el original con su edición
				if (edicion) {
					for (const campo in edicion) if (!edicion[campo]) delete edicion[campo];
					delete edicion.id;
					encabezado = {...encabezado, ...edicion};
				}
			}

			// Fin
			return encabezados;
		},
	},
};
