export default (sequelize, dt) => {
	const alias = "indicesLugar";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},

		// Nombre y código
		nombre: {type: dt.STRING(15)},
		codigo: {type: dt.STRING(15)},
	};
	const config = {
		tableName: "nivel9_indices_lugar",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
	};
	return entidad;
};
