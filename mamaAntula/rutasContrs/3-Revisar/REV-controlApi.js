"use strict";
import procesos from "./REV-procesos.js";

export default {
	encabezado: {
		aprueba: async (req, res) => {
			// Variables
			const {encab_id} = req.body;
			const statusRegistro_id = aprobado_id;
			const statusSugeridoPor_id = req.session.usuario.id;

			// Cambia el status de sus dependencias y mueve los archivos de imagen
			await procesos.altaEncabezado({encab_id, statusRegistro_id, statusSugeridoPor_id});

			// Fin
			return res.json({});
		},
		rechaza: (req, res) => {},
	},
};
