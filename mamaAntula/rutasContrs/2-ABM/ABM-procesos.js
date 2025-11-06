"use strict";

export default {
	obtieneEncabs: {
		consolidado: async function ({entidad, condicion, includesConEdics, usuario}) {
			// Obtiene los encabezados con todas sus ediciones
			let encabezados = await this.conTodasLasEdiciones({entidad, condicion, includesConEdics, usuario});

			// Funde los originales con las ediciones del usuario
			encabezados = this.fundeConLaEdicionDelUsuario({encabezados, usuario});

			// Les agrega los títulos
			encabezados = comp.contenido.tituloCons[entidad](encabezados);

			// Fin
			return encabezados;
		},
		conTodasLasEdiciones: async ({entidad, condicion, includesConEdics, usuario}) => {
			// Obtiene los encabezados
			let encabezados =
				entidad == "encabCartas"
					? baseDatos
							.obtieneTodos(entidad, includesConEdics)
							.then((n) => n.sort((a, b) => new Date(a.fechaEvento) - new Date(b.fechaEvento)))
					: entidad == "encabExpers"
					? baseDatos
							.obtieneTodosPorCondicion(entidad, condicion, includesConEdics)
							.then((n) => n.sort((a, b) => new Date(b.fechaEvento) - new Date(a.fechaEvento)))
					: baseDatos.obtieneTodosPorCondicion(entidad, condicion, includesConEdics);

			encabezados = await encabezados;

			// Si la entidad es encabSinIndice y no existe un registro, lo crea
			if (entidad == "encabSinIndice" && !encabezados.length) {
				const creadoPor_id = usuario.id;
				const statusRegistro_id = aprobado_id;
				const datos = {...condicion, creadoPor_id, statusRegistro_id};
				const encabezado = await baseDatos.agregaRegistroIdCorrel(entidad, datos);
				encabezado.ediciones = [];
				encabezados = [encabezado];
			}

			// Fin
			return encabezados;
		},
		fundeConLaEdicionDelUsuario: ({encabezados, usuario}) => {
			// Rutina por encabezado
			for (const encabezado of encabezados) {
				// Obtiene la edicion del usuario y elimina el método ediciones
				const edicion = encabezado.ediciones.find((n) => n.editadoPor_id == usuario.id);
				delete encabezado.ediciones;

				// Funde el original con su edición
				if (edicion)
					for (const campo in encabezado) if (edicion[campo] && campo != "id") encabezado[campo] = edicion[campo];
			}

			// Fin
			return encabezados;
		},
	},
	eliminaDepends: async (entidad, id) => {
		// Obtiene los contenidos y los elimina
		const campo_id = comp.contenido.obtieneCampo_id(entidad);
		const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {[campo_id]: id}, "imgsCarrousel");
		if (!contenidos.length) return;

		// Elimina los carrouseles
		const espera = [];
		for (const contenido of contenidos) {
			// Obtiene la ruta del archivo
			const ruta = contenido.statusRegiastro_id == creado_id ? carpRevisar : carpContenido;

			// Carrouseles
			for (const imgCarrousel of contenido.imgsCarrousel) comp.gestionArchs.elimina(ruta, imgCarrousel.imagen);
			await baseDatos.eliminaPorCondicion("imgsCarrousel", {contenido_id: contenido.id});

			// Contenidos
			if (contenido.imagen) comp.gestionArchs.elimina(ruta, contenido.imagen);
			espera.push(baseDatos.eliminaPorId("contenidos", contenido.id));
		}
		await Promise.all(espera);

		// Fin
		return;
	},
};
