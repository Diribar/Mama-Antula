export default (sequelize, dt) => {
	const alias = "indiceTemas";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},

		// Otros
		nombre: {type: dt.STRING(15)},
		codigo: {type: dt.STRING(15)},
		fechaDesde: {type: dt.DATE},
		fechaHasta: {type: dt.DATE},
	};
	const config = {
		tableName: "nivel_indices",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
	};
	return entidad;
};
