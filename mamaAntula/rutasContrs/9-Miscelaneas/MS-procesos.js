"use strict";

export default {
	busquedaRapida: {
		condicionContenido: ({palabras, campos, statusRegistro_id}) => {
			// Variables
			palabras = palabras.split(" ");
			const consolidadoCampos = [];

			// Consolidado de que en cada campo se cumplan todas las palabras
			for (const campo of campos) {
				// Variables
				let acumuladoPalabrasEnCampo = [];

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
			return [condicPalabras, statusRegistro_id];
		},
	},
};
