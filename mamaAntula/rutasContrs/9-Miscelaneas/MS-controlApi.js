"use strict";
import procesos from "./MS-procesos.js";

export default {
	// ABM
	contactanos: async (req, res) => {
		// Variables
		const {nombre: remitenteNombre, email: remitenteMail, institucion, mensaje} = req.body;
		const nombre = "Familia Mama Antula";
		let asunto = "Mensaje enviado desde el formulario de contacto";

		// Cuerpo del mail
		let comentario =
			"Este es un mensaje enviado desde el formulario de contacto de Mama Antula:<br><br>" +
			("<b>Nombre:</b> " + remitenteNombre + "<br>") +
			("<b>Mail:</b> " + remitenteMail + "<br>") +
			(institucion ? "<b>Institución:</b> " + institucion + "<br>" : "") +
			("<b>Mensaje:</b><br>" + mensaje.replace(/\n/g, "<br>") + "<br><br>") +
			("Por favor, respondé directamente al remitente a su mail: <b><em>" + remitenteMail + "</em></b>.");

		// Envía el mail a los miembros de la Familia Mama Antula
		const emailsRevisores = await comp.emailsRevisores();
		let mailEnviado;
		for (const email of emailsRevisores)
			mailEnviado = (await comp.enviaMail({nombre, email, asunto, comentario})) || mailEnviado;

		// Genera el mensaje de respuesta
		const error = !mailEnviado ? "No hemos podido enviar el mail" : "";

		// Envía copia al remitente
		if (mailEnviado) {
			const email = remitenteMail;
			asunto = "Mensaje enviado desde el formulario de contacto";
			comentario =
				"Hola " +
				remitenteNombre +
				",<br><br>" +
				"Gracias por comunicarte con nosotros. Te confirmamos que tu mensaje fue enviado al equipo.<br><br>" +
				("Tu mensaje fue:<br><em>" + mensaje.replace(/\n/g, "<br>") + "</em><br><br>") +
				"Saludos cordiales,<br>" +
				"La Familia Mama Antula.";
			await comp.enviaMail({nombre, email, asunto, comentario});
		}

		// Fin
		return res.json({error});
	},
	busquedaRapida: async function (req, res) {
		// Obtiene las palabras ingresadas
		let {palabras} = req.body;
		palabras = palabras.split(" ");

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
			.then((n) =>
				n.sort((a, b) => a.lugarIndice && b.lugarIndice && (a.lugarIndice.orden < b.lugarIndice.orden ? -1 : 1))
			);

		// Obtiene las rutas
		const rutas = procesos.obtieneRutas(encabezados);

		// Fin
		return res.json(rutas);
	},
};
