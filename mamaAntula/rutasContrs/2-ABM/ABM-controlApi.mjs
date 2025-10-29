"use strict";

export default {
	datosIniciales: (req, res) => {
		// Variables
		const datosIniciales = {secciones, temasSecciones, pestanasTemas};

		// Fin
		return res.json(datosIniciales);
	},
};
