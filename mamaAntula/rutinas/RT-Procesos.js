"use strict";

export default {
	eliminaRegistro: async ({tabla, registros, i, espera}) => {
		// Elimina el registro 'i'
		espera.push(baseDatos.eliminaPorId(tabla, registros[i].id)); // es crítico que esté antes del splice
		registros.splice(i, 1);

		// Completa el lote
		if (espera.length < esperaLoteMx) return;
		await Promise.all(espera);
		espera.length = 0;

		// Fin
		return;
	},
};
