"use strict";

export default {
	// ABM
	contactanos: async (req, res) => {
		// Variables
		const {nombre: remitenteNombre, email: remitenteMail, institucion, mensaje} = req.body;
		const nombre = "Familia Mama Antula";
		let asunto = "Mensaje recibido desde el formulario de contacto";

		// Cuerpo del mail
		let comentario =
			"Este es un mensaje enviado desde el formulario de contacto de Mama Antula:<br><br>" +
			("<b>Nombre:</b> " + remitenteNombre + "<br>") +
			("<b>Mail:</b> " + remitenteMail + "<br>") +
			(institucion ? "<b>Institución:</b> " + institucion + "<br>" : "") +
			("<b>Mensaje:</b><br>" + mensaje.replace(/\n/g, "<br>") + "<br><br>") +
			("Por favor, respondé directamente al remitente a su mail: <b><em>" + remitenteMail + "</em></b>.");

		// Envía el mail a los miembros de la Familia Mama Antula
		const emails = await baseDatos
			.obtieneTodosPorCondicion("usuarios", {rol_id: rolesRevision_ids})
			.then((n) => n.map((m) => m.email));
		let mailEnviado;
		for (const email of emails) mailEnviado = (await comp.enviaMail({nombre, email, asunto, comentario})) || mailEnviado;

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
};
