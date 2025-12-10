"use strict";

export default {
	// ABM
	contactanos: async (req, res) => {
		// Variables
		const {nombre: remitenteNombre, email: remitenteMail, institucion, mensaje} = req.body;
		const nombre = "Familia Mama Antula";
		let email = "diegoiribarren2015@gmail.com";
		let asunto = "Mensaje recibido desde el formulario de contacto";

		// Cuerpo del mail
		let comentario =
			"Hemos recibido un nuevo mensaje desde el formulario de contacto de Mama Antula:<br><br>" +
			("<b>Nombre:</b> " + remitenteNombre + "<br>") +
			("<b>Mail:</b> " + remitenteMail + "<br>") +
			(institucion ? "<b>Institución:</b> " + institucion + "<br>" : "") +
			("<b>Mensaje:</b><br>" + mensaje.replace(/\n/g, "<br>") + "<br><br>") +
			("Por favor, respondé directamente al remitente a su mail: <b><em>" + remitenteMail + "</em></b>.");

		// Envía el mail a la Flia Mama Antula
		const mailEnviado = await comp.enviaMail({nombre, email, asunto, comentario});

		// Envía copia al remitente
		if (mailEnviado) {
			email = remitenteMail;
			asunto = "Mensaje enviado desde el formulario de contacto";
			comentario =
				("Hola " +remitenteNombre +",<br><br>") +
				"Gracias por comunicarte con el equipo de la Familia Mama Antula. " +
				"Te confirmamos que le hemos enviado tu mensaje.<br><br>" +
				("Tu mensaje fue:<br><em>" + mensaje.replace(/\n/g, "<br>") + "</em><br><br>") +
				"Saludos cordiales,<br>" +
				"La Familia Mama Antula.";
			await comp.enviaMail({nombre, email, asunto, comentario});
		}
		// Genera el mensaje de respuesta
		const error = !mailEnviado ? "No hemos podido enviar el mail" : "";

		// Fin
		return res.json({error});
	},
};
