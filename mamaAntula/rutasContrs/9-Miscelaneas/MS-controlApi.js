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
	busquedaRapida: async (req, res) => {
		// Variables
		const {palabras} = req.body;
		console.log(51, palabras);
		return res.json([]);

		const usuario_id = req.session.usuario ? req.session.usuario.id : 0;
		const autTablEnts = req.session.usuario && req.session.usuario.rol.autTablEnts;
		const camposProds = ["nombreCastellano", "nombreOriginal"];
		const camposRclvs = ["nombre", "nombreAltern"];
		const original = true;
		let datos = [];
		let resultados = [];
		let campos;

		// Armado de la variable 'datos' para productos originales
		campos = camposProds;
		for (const entidad of entProds) datos.push({familia: "producto", entidad, campos, original});

		// Armado de la variable 'datos' para rclvs originales
		for (const entidad of entRclvs) {
			campos = ["personajes", "hechos"].includes(entidad) ? camposRclvs : ["nombre"];
			datos.push({familia: "rclv", entidad, campos, original});
		}

		// Armado de la variable 'datos' para ediciones
		campos = camposProds;
		datos.push({familia: "producto", entidad: "prodEdics", campos, include: entProdsAsocs}); // productos
		campos = camposRclvs;
		datos.push({familia: "rclv", entidad: "rclvEdics", campos, include: entRclvsAsocs}); // rclvs

		// Rutina
		for (const dato of datos) {
			// Obtiene las condiciones
			campos = dato.campos;
			const original = dato.original;
			const condicion = procsFM_PR.busquedaRapida.condicion({
				palabras,
				campos,
				usuario_id,
				original,
				autTablEnts,
				omitirStatus,
			});

			// Obtiene los registros que cumplen las condiciones
			resultados.push(
				dato.original
					? procsFM_PR.busquedaRapida.registros(condicion, dato) // originales
					: procsFM_PR.busquedaRapida.ediciones(condicion, dato) // ediciones
			);
		}
		resultados = await Promise.all(resultados).then((n) => n.flat());

		// Acciones si hay más de un resultado
		if (resultados.length > 1) {
			// Ordena los resultados
			resultados.sort((a, b) => (a.anoEstreno < b.anoEstreno ? -1 : 1)); // tercera prioridad: anoEstreno
			resultados.sort((a, b) => (a.nombre < b.nombre ? -1 : 1)); // segunda prioridad: nombre
			resultados.sort((a, b) => (a.familia < b.familia ? -1 : 1)); // primera prioridad: familia

			// Elimina duplicados
			for (let i = resultados.length - 2; i >= 0; i--) {
				const {entidad: entidad1, id: id1} = resultados[i];
				const {entidad: entidad2, id: id2} = resultados[i + 1];
				if (entidad1 == entidad2 && id1 == id2) resultados.splice(i + 1, 1);
			}
		}

		// Envia la info al FE
		return res.json(resultados);
	},
};
