"use strict";

export default {
	encabezados: async function ({palabras, statusRegistro_id}) {
		// Obtiene la condición
		const condicion = {titulo: {[Op.like]: "%" + palabras + "%"}, statusRegistro_id};

		// Obtiene los registros que cumplen la condición
		const encabs_id = await baseDatos.obtieneTodosPorCondicion("encabezados", condicion).then((n) => n.map((m) => m.id));

		// Envia la info al FE
		return encabs_id;
	},
	contenidos: async function ({palabras, statusRegistro_id}) {
		// Obtiene la condición
		const campos = ["texto", "leyenda", "titulo", "subtitulo", "autor", "editorial"];
		const condicion = this.condicion({palabras, campos, statusRegistro_id});

		// Obtiene los encabs_id
		const encabs_id = await baseDatos
			.obtieneTodosPorCondicion("contenidos", condicion)
			.then((n) => n.map((m) => m.encab_id))
			.then((n) => [...new Set(n)]); // elimina duplicados

		// Envia la info al FE
		return encabs_id;
	},
	condicion: ({palabras, campos, statusRegistro_id}) => {
		// Variables
		const consolidadoCampos = [];

		// Consolidado de que en cada campo se cumplan todas las palabras
		for (const campo of campos) {
			// Todas las palabras deben estar en 'campo'
			const condicionPalabrasEnCampo = {[campo]: {[Op.like]: "%" + palabras + "%"}};

			// Consolida la condición por campo
			consolidadoCampos.push(condicionPalabrasEnCampo);
		}

		// Todas las palabras deben estar en alguno de los campos
		const condicPalabras = {[Op.or]: consolidadoCampos};

		// Fin
		return {...condicPalabras, statusRegistro_id};
	},
	obtieneRutas: function (encabezados) {
		// Variables
		const rutas = {};

		// Agrega el tema y la pestaña
		for (let encabezado of encabezados) {
			// Obtiene la ruta
			encabezado = comp.agregaTemaPestana(encabezado);
			const {seccion, tema, pestana} = encabezado;
			const ruta = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.titulo : "");

			// Completa el encabezado
			encabezado = comp.tituloElab(encabezado);
			encabezado.href = this.anchorLectura(encabezado);

			// Agrega a la ruta
			if (rutas[ruta]) rutas[ruta].encabezados.push(encabezado);
			else {
				// Crea el orden
				const orden = seccion.orden + "-" + tema.orden + (pestana ? "-" + pestana.orden : "");

				// Crea la ruta
				rutas[ruta] = {orden, encabezados: [encabezado]};
			}
		}

		// Ordena las rutas
		const entries = Object.entries(rutas);
		entries.sort((a, b) => (a[1].orden < b[1].orden ? -1 : 1));
		const ordered = Object.fromEntries(entries);

		// Fin
		return ordered;
	},
	anchorLectura: (encabezado) => {
		// Variables
		const {seccion, tema, pestana} = encabezado;

		// Le agrega la sección
		let anchorLectura = "/" + seccion.url + "/" + tema.url;

		// Le agrega la pestaña
		if (pestana) anchorLectura += "/" + pestana.url;

		// Le agrega el encabezado
		const temaActual = temasSecciones.find((n) => n.id == tema.id);
		const esConIndice = temaActual.indicesFecha.length || temaActual.indicesDevoc.length;
		if (esConIndice) anchorLectura += "/?id=" + encabezado.id;

		// Fin
		return anchorLectura;
	},

	// Contactanos
	comentarios: {
		revisores: ({remitenteNombre, remitenteMail, institucion, mensaje}) =>
			"Este es un mensaje enviado desde el formulario de <em>Contactanos</em>:<br><br>" +
			("Nombre: <b>" + remitenteNombre + "</b><br>") +
			(institucion ? "Institución: " + institucion + "<br>" : "") +
			("<b>Mensaje:</b> " + mensaje.replace(/\n/g, "<br>") + "<br>") +
			("Mail: " + remitenteMail),
		remitente: ({remitenteNombre, mensaje}) =>
			"Hola " +
			remitenteNombre +
			",<br><br>" +
			"Gracias por comunicarte con nosotros. Te confirmamos que tu mensaje fue enviado al equipo.<br><br>" +
			("Tu mensaje fue:<br><em>" + mensaje.replace(/\n/g, "<br>") + "</em><br><br>") +
			"Saludos cordiales,<br>" +
			"La Familia Mama Antula.",
	},
};
