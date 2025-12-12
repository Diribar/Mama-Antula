"use strict";

export default {
	busquedaRapida: {
		condicion: ({palabras, campos, usuario_id, original, autTablEnts, omitirUserId, omitirStatus}) => {
			// Variables
			const todasLasPalabrasEnAlgunCampo = [];
			let condicStatusEdicion = null; // debe decir null porque se usa en la BD

			// Condiciones de "palabras"
			palabras = palabras.split(" ");
			for (const campo of campos) {
				// Variables
				let palabrasEnElCampo = [];

				// Dónde debe buscar cada palabra dentro del campo
				for (const palabra of palabras) {
					const palabraEnElCampo = {
						[Op.or]: [
							{[campo]: {[Op.like]: palabra + "%"}}, // En el comienzo del texto
							{[campo]: {[Op.like]: "% " + palabra + "%"}}, // En el comienzo de una palabra
						],
					};
					palabrasEnElCampo.push(palabraEnElCampo);
				}

				// Exige que cada palabra del conjunto esté presente
				const todasLasPalabrasEnElCampo = {[Op.and]: palabrasEnElCampo};

				// Consolida el resultado
				todasLasPalabrasEnAlgunCampo.push(todasLasPalabrasEnElCampo);
			}
			const condicPalabras = {[Op.or]: todasLasPalabrasEnAlgunCampo};

			// Condiciones de "status del registro"
			if (original && !omitirStatus)
				condicStatusEdicion = omitirUserId
					? {statusRegistro_id: activos_ids}
					: {
							[Op.or]: [
								{statusRegistro_id: aprobados_ids},
								{[Op.and]: [{statusRegistro_id: creado_id}, !autTablEnts ? {creadoPor_id: usuario_id} : null]}, // si es un usuario con rol 'autTablEnts', se le permite ver todos los creados
							],
					  };
			// Se fija que una edición sea del usuario
			else if (!omitirUserId) condicStatusEdicion = {editadoPor_id: usuario_id};

			// Consolida las condiciones
			const condicConsolidada = {[Op.and]: [condicPalabras, condicStatusEdicion]};

			// Fin
			return condicConsolidada;
		},
		registros: async (condicion, dato) => {
			// Obtiene los registros
			const registros = await baseDatos.obtieneTodosPorCondicionConLimite(dato.entidad, condicion, 10).then((n) =>
				n.map((m) => {
					let respuesta = {
						id: m.id,
						nombre: m[dato.campos[0]],
						entidad: dato.entidad,
						familia: dato.familia,
						avatar: m.avatar, // específicos para PA-Desambiguar
					};
					if (m.anoEstreno) respuesta.anoEstreno = m.anoEstreno;
					if (m.nombreOriginal) respuesta.nombreOriginal = m.nombreOriginal; // específicos para PA-Desambiguar

					return respuesta;
				})
			);

			// Fin
			return registros;
		},
		ediciones: async (condicion, dato) => {
			// Obtiene los registros
			const registros = await baseDatos
				.obtieneTodosPorCondicionConLimite(dato.entidad, condicion, 10, dato.include)
				.then((n) =>
					n.map((m) => {
						const entidad = comp.obtieneDesdeCampo_id.entidad(m, dato.entidad);
						const asoc = comp.obtieneDesdeEntidad.asociacion(entidad);
						return {
							entidad,
							id: m[comp.obtieneDesdeEntidad.campo_id(entidad)],
							anoEstreno: m.anoEstreno ? m.anoEstreno : m[asoc].anoEstreno,
							nombre: m[dato.campos[0]] ? m[dato.campos[0]] : m[dato.campos[1]],
							familia: dato.familia,
						};
					})
				);

			// Fin
			return registros;
		},
	},
};
