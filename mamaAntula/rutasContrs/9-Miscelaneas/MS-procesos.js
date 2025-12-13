"use strict";

export default {
	encabezados: async function ({palabras, statusRegistro_id}) {
		// Obtiene la condición
		const condicion = this.condiciones.encabezado({palabras, statusRegistro_id});

		// Obtiene los registros que cumplen la condición
		const encabs_id = await baseDatos.obtieneTodosPorCondicion("encabezados", condicion).then((n) => n.map((m) => m.id));

		// Envia la info al FE
		return encabs_id;
	},
	contenidos: async function ({palabras, statusRegistro_id}) {
		// Obtiene la condición
		const campos = ["texto", "leyenda", "titulo", "autor", "editorial"];
		const condicion = this.condiciones.contenido({palabras, campos, statusRegistro_id});

		// Obtiene los encabs_id
		const encabs_id = await baseDatos
			.obtieneTodosPorCondicionConLimite("contenidos", condicion, 15)
			.then((n) => n.map((m) => m.encab_id))
			.then((n) => [...new Set(n)]); // elimina duplicados

		// Envia la info al FE
		return encabs_id;
	},
	condiciones: {
		encabezado: ({palabras, statusRegistro_id}) => {
			// Variables
			const acumuladoPalabrasEnCampo = [];

			// Todas las palabras deben estar en 'campo'
			for (const palabra of palabras) {
				const condicionPalabraEnCampo = {
					titulo: {[Op.or]: [{[Op.like]: palabra + "%"}, {[Op.like]: "% " + palabra + "%"}]},
				};
				acumuladoPalabrasEnCampo.push(condicionPalabraEnCampo);
			}

			// Exige que cada palabra del conjunto esté presente en el campo
			const consolidadoCampo = {[Op.and]: acumuladoPalabrasEnCampo};

			// Fin
			return {...consolidadoCampo, statusRegistro_id};
		},
		contenido: ({palabras, campos, statusRegistro_id}) => {
			// Variables
			const consolidadoCampos = [];

			// Consolidado de que en cada campo se cumplan todas las palabras
			for (const campo of campos) {
				// Variables
				const acumuladoPalabrasEnCampo = [];

				// Todas las palabras deben estar en 'campo'
				for (const palabra of palabras) {
					const condicionPalabraEnCampo = {
						[campo]: {[Op.or]: [{[Op.like]: palabra + "%"}, {[Op.like]: "% " + palabra + "%"}]}, // En el comienzo del texto o de una palabra
					};
					acumuladoPalabrasEnCampo.push(condicionPalabraEnCampo);
				}

				// Exige que cada palabra del conjunto esté presente en el campo
				const consolidadoCampo = {[Op.and]: acumuladoPalabrasEnCampo};

				// Consolida las condiciones por campo
				consolidadoCampos.push(consolidadoCampo);
			}

			// Todas las palabras deben estar en alguno de los campos
			const condicPalabras = {[Op.or]: consolidadoCampos};

			// Fin
			return {...condicPalabras, statusRegistro_id};
		},
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
			encabezado.anchor = this.anchorLectura(encabezado);

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
		const conIndice = temaActual.indicesFecha.length || temaActual.indicesDevoc.length;
		if (conIndice) anchorLectura += "/?id=" + encabezado.id;

		// Fin
		return anchorLectura;
	},
};
