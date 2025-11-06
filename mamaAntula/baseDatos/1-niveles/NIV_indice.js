export default (sequelize, dt) => {
	const alias = "temaIndice";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},

		// Otros
		nombre: {type: dt.STRING(20)},
		fechaDesde: {type: dt.DATE},
		fechaHasta: {type: dt.DATE},
		orden: {type: dt.INTEGER},
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
