"use strict";
import procesos from "./LT-procesos.js";
const temaVista = "seccionesLectura";

export default {
	filtros: async (req, res) => {
		// Variables del front-end
		const datos = req.body;
		const {urlSeccion, urlTema} = req.params;

		// Otras variables
		const tema_id = temasSecciones.find((n) => n.url == urlTema)?.id;
		const condicion = {tema_id};

		// Arma la condición
		if (urlSeccion == "experiencias" && datos.lugarExper_id) condicion.lugarExper_id = datos.lugarExper_id;
		if (urlSeccion == "cartas-y-escritos" && urlTema == "cartas") {
			// Variables
			const {persona1_id, persona2_id, idioma_id, lugarCarta_id} = datos;

			// Condición personajes - ambos
			if (persona1_id && persona2_id) {
				condicion.nombreDesde_id = [persona1_id, persona2_id];
				condicion.nombreHacia_id = [persona1_id, persona2_id];
			}
			// Condición personajes - uno sólo
			else if (persona1_id) condicion[Op.or] = [{nombreDesde_id: persona1_id}, {nombreHacia_id: persona1_id}];
			else if (persona2_id) condicion[Op.or] = [{nombreDesde_id: persona2_id}, {nombreHacia_id: persona2_id}];

			// Condición otros
			if (idioma_id) condicion.idioma_id = idioma_id;
			if (lugarCarta_id) condicion.lugarCarta_id = lugarCarta_id;
		}

		// Obtiene los encabs_id
		const encabs_id = await baseDatos.obtieneTodosPorCondicion("encabezados", condicion).then((n) => n.map((m) => m.id));

		// Fin
		return res.json(encabs_id);
	},
};
