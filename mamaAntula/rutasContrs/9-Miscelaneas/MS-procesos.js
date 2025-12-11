"use strict";

export default {
	busquedaRapida: {
		condiciones:{
			encabezado: ({palabras, statusRegistro_id}) => {
				// Variables
				const acumuladoPalabrasEnCampo = [];

				// Todas las palabras deben estar en 'campo'
				for (const palabra of palabras) {
					const condicionPalabraEnCampo = {
						titulo: {[Op.or]: [{[Op.like]: palabra + "%"}, {[Op.like]: "% " + palabra + "%"}]},
					};
					acumuladoPalabrasEnCampo.push(condicionPalabraEnCampo);
				}

				// Exige que cada palabra del conjunto esté presente en el campo
				const consolidadoCampo = {[Op.and]: acumuladoPalabrasEnCampo};

				// Fin
				return {...consolidadoCampo, statusRegistro_id};
			},
			contenido: ({palabras, campos, statusRegistro_id}) => {
				// Variables
				const consolidadoCampos = [];

				// Consolidado de que en cada campo se cumplan todas las palabras
				for (const campo of campos) {
					// Variables
					const acumuladoPalabrasEnCampo = [];

					// Todas las palabras deben estar en 'campo'
					for (const palabra of palabras) {
						const condicionPalabraEnCampo = {
							[campo]: {[Op.or]: [{[Op.like]: palabra + "%"}, {[Op.like]: "% " + palabra + "%"}]}, // En el comienzo del texto o de una palabra
						};
						acumuladoPalabrasEnCampo.push(condicionPalabraEnCampo);
					}

					// Exige que cada palabra del conjunto esté presente en el campo
					const consolidadoCampo = {[Op.and]: acumuladoPalabrasEnCampo};

					// Consolida las condiciones por campo
					consolidadoCampos.push(consolidadoCampo);
				}

				// Todas las palabras deben estar en alguno de los campos
				const condicPalabras = {[Op.or]: consolidadoCampos};

				// Fin
				return {...condicPalabras, statusRegistro_id};
			},
		}
	},
};
