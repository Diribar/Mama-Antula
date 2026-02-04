"use strict";
import procesos from "./MS-procesos.js";

export default {
	// ABM
	contactanos: async (req, res) => {
		// Variables
		const {nombre: remitenteNombre, email: remitenteMail, institucion, mensaje} = req.body;
		const nombre = "Familia Mama Antula";
		const asunto = "Mensaje de una visita";
		let comentario, mailEnviado;

		// Envía el mail a los miembros de la Familia Mama Antula y averigua si alguno fue enviado
		const emailsRevisores = await comp.emailsRevisores();
		comentario = procesos.comentarios.revisores({remitenteNombre, remitenteMail, institucion, mensaje});
		for (const email of emailsRevisores)
			mailEnviado = (await comp.enviaMail({nombre, email, asunto, comentario})) || mailEnviado;

		// Envía copia al remitente
		if (mailEnviado) {
			const email = remitenteMail;
			comentario = procesos.comentarios.remitente({remitenteNombre, mensaje});
			await comp.enviaMail({nombre, email, asunto, comentario});
		}

		// Genera el mensaje de respuesta
		const error = !mailEnviado ? "No hemos podido enviar el mail" : "";

		// Fin
		return res.json({error});
	},
	busquedaRapida: async function (req, res) {
		// Obtiene las palabras ingresadas
		const {palabras} = req.body;

		// Variables
		const soloStatusAprob = !req.session.usuario || !rolesActualizac_ids.includes(req.session.usuario.rol_id);
		const statusRegistro_id = soloStatusAprob ? aprobado_id : [creado_id, aprobado_id];

		// Obtiene todos los encabezados a buscar
		const encabs_id = await Promise.all([
			procesos.encabezados({palabras, statusRegistro_id}),
			procesos.contenidos({palabras, statusRegistro_id}),
		])
			.then(([a, b]) => [...a, ...b])
			.then((n) => [...new Set(n)]);

		// Obtiene los encabezados
		const condicion = {id: encabs_id, statusRegistro_id};
		const include = comp.includes();
		const encabezados = await baseDatos
			.obtieneTodosPorCondicion("encabezados", condicion, include)
			.then((n) => n.sort((a, b) => (a.titulo < b.titulo ? -1 : 1)))
			.then((n) => n.sort((a, b) => (a.fechaEvento < b.fechaEvento ? -1 : 1)))
			.then((n) => n.sort((a, b) => (a.indiceDevoc && b.indiceDevoc ? a.indiceDevoc.orden - b.indiceDevoc.orden : 0)));

		// Obtiene las rutas
		const rutas = procesos.obtieneRutas(encabezados);

		// Fin
		return res.json(rutas);
	},
};
