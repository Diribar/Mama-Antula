"use strict";
import procesos from "./REV-procesos.js";

export default {
	encabezado: {
		cambiosStatus: async (req, res) => {
			// Variables
			const {encab_id, aprueba, rechaza} = req.body;
			const statusRegistro_id = (aprueba && aprobado_id) || (rechaza && rechazado_id);
			const statusSugeridoPor_id = req.session.usuario.id;

			// Cambia el status de sus dependencias y mueve los archivos de imagen
			await procesos.cambiosStatus({encab_id, statusRegistro_id, statusSugeridoPor_id});

			// Fin
			return res.json({});
		},
	},
};
