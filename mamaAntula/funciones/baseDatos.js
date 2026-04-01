"use strict";

export default {
	// Obtiene todos
	obtieneTodos: (entidad, include) => bd[entidad].findAll({include}).then((n) => n.map((m) => m.toJSON())),
	obtieneTodosConOrden: (entidad, campoOrden, desc) =>
		bd[entidad].findAll({order: [[campoOrden, desc ? "DESC" : "ASC"]]}).then((n) => n.map((m) => m.toJSON())),
	obtieneTodosPorCondicion: (entidad, condicion, include) =>
		bd[entidad].findAll({where: condicion, include}).then((n) => n.map((m) => m.toJSON())),
	obtieneTodosPorCondicionConLimite: (entidad, condicion, limite, include) =>
		bd[entidad].findAll({where: condicion, include, limit: limite}).then((n) => n.map((m) => m.toJSON())),
	obtieneCampos: (entidad) => Object.keys(bd[entidad].rawAttributes),

	// Obtiene uno
	obtienePorId: (entidad, id, include) => bd[entidad].findByPk(id, {include}).then((n) => (n ? n.toJSON() : null)),
	obtienePorCondicion: (entidad, condicion, include) =>
		bd[entidad].findOne({where: condicion, include}).then((n) => (n ? n.toJSON() : null)),
	obtienePorCondicionElPrimero: (entidad, condicion, campoOrden) =>
		bd[entidad]
			.findAll({where: condicion, order: [[campoOrden ? campoOrden : "id", "ASC"]]})
			.then((n) => n.map((m) => m.toJSON()))
			.then((n) => (n.length ? n[0] : null)),
	obtienePorCondicionElUltimo: (entidad, condicion, campoOrden) =>
		bd[entidad]
			.findAll({where: condicion, order: [[campoOrden ? campoOrden : "id", "DESC"]]})
			.then((n) => n.map((m) => m.toJSON()))
			.then((n) => (n.length ? n[0] : null)),

	// ABM
	agregaRegistro: (entidad, datos) => bd[entidad].create(datos).then((n) => n.toJSON()),
	agregaRegistroIdCorrel: async (entidad, datos) => {
		// Variables
		const regsId = await bd[entidad]
			.findAll()
			.then((n) => n.map((m) => m.toJSON()))
			.then((n) => n.map((m) => m.id));
		const regsSet = new Set(regsId);
		let nuevoRegistro;

		// Guarda el registro usando el primer 'id' disponible
		let contador = 0;
		while (contador < (regsId.at(-1) || 0) + 100) {
			// Variables
			contador++;

			// Si ya existe un registro con el id del contador, saltea la rutina
			if (regsSet.has(contador)) continue;

			// Intenta crear el registro
			try {
				nuevoRegistro = await bd[entidad].create({id: contador, ...datos}); // lo crea
				break;
			} catch (error) {
				console.log(54, entidad, contador, datos);
				console.error("Error al crear registro:", error);
			}
		}

		// Fin
		nuevoRegistro = nuevoRegistro ? nuevoRegistro.toJSON() : {};
		return nuevoRegistro;
	},
	agregaActualizaPorCondicion: async (entidad, condicion, datos) => {
		// Averigua si existe un registro con esa condición
		const existe = await bd[entidad].findOne({where: condicion}).then((n) => (n ? n.toJSON() : null));

		// Actualiza o crea un registro
		return existe
			? bd[entidad].update(datos, {where: condicion}) // actualiza
			: bd[entidad].create(datos).then((n) => n.toJSON()); // crea
	},
	actualizaTodos: (entidad, datos) => bd[entidad].update(datos, {where: {}}), // es obligatorio que figure un 'where'
	actualizaPorCondicion: (entidad, condicion, datos) => bd[entidad].update(datos, {where: condicion}),
	actualizaPorId: (entidad, id, datos) => bd[entidad].update(datos, {where: {id}}),
	eliminaPorId: (entidad, id) => bd[entidad].destroy({where: {id}}),
	eliminaPorCondicion: (entidad, condicion) => bd[entidad].destroy({where: condicion}),
	variaElValorDeUnCampo: (entidad, id, campo, variacion) => bd[entidad].increment(campo, {where: {id}, by: variacion || 1}),

	// Lectura
	contarCasos: (entidad, condicion) => bd[entidad].count({where: condicion}),
	minValorPorCondicion: (entidad, condicion, campo) => bd[entidad].min(campo, {where: condicion}),
	maxValor: (entidad, campo) => bd[entidad].max(campo),
	maxValorPorCondicion: (entidad, condicion, campo) => bd[entidad].max(campo, {where: condicion}),
};
