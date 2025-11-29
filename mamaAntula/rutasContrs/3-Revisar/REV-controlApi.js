"use strict";
import procesos from "./REV-procesos.js";

export default {
	cambioStatus: {
		encabezado: async (req, res) => {
			// Variables
			const {encab_id, aprueba, rechaza} = req.body;
			const statusRegistro_id = (aprueba && aprobado_id) || (rechaza && rechazado_id);
			const statusSugeridoPor_id = req.session.usuario.id;

			// Cambia el status del encabezado y sus dependencias
			await procesos.cambioStatus.encabezadoContenidos({encab_id, statusRegistro_id, statusSugeridoPor_id});

			// Mueve los archivos de imagen
			await procesos.cambioStatus.mueveArchivosImg(encab_id);

			// Fin
			return res.json({});
		},
		contenido: async (req, res) => {
			// Variables
			const {aprueba, rechaza} = req.body;
			const {contenido} = req;
			const statusRegistro_id = (aprueba && aprobado_id) || (rechaza && rechazado_id);
			const statusSugeridoPor_id = req.session.usuario.id;

			// Cambia el status de sus dependencias y mueve los archivos de imagen
			await procesos.cambioStatus.contenido({contenido, statusRegistro_id, statusSugeridoPor_id});

			// Fin
			return res.json({});
		},
	},
	edicion: async (req, res) => {
		// Variables
		const {encab_id, edicion_id, campo, opcEdicion} = req.body;
		const {edicion} = req;

		// Si se eligió la opción editada, actualiza el original
		if (opcEdicion) await baseDatos.actualizaPorId("encabezados", encab_id, {[campo]: edicion[campo]});

		// Revisa si la edición ya no tiene más campos
		delete edicion[campo];
		for (const campo in edicion) if (!edicion[campo] || !camposEdicion.tabla.includes(campo)) delete edicion[campo];

		// Actualiza/elimina la edición
		const eliminarEdicion = !Object.keys(edicion).length;
		if (eliminarEdicion) await baseDatos.eliminaPorId("encabEdics", edicion_id);
		else baseDatos.actualizaPorId("encabEdics", edicion_id, {[campo]: null});

		// Fin
		return res.json({});
	},
};
