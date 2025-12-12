export default (sequelize, dt) => {
	const alias = "indicesDevoc";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},

		// Nombre y código
		nombre: {type: dt.STRING(15)},
		orden: {type: dt.INTEGER},
	};
	const config = {
		tableName: "nivel9_indices_devoc",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
	};
	return entidad;
};
