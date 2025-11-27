export default (sequelize, dt) => {
	const alias = "pestanasTemas";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Nombres
		titulo: {type: dt.STRING(30)},
		codigo: {type: dt.STRING(20)},
		url: {type: dt.STRING(30)},
	};
	const config = {
		tableName: "nivel3_pestanas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
	};
	return entidad;
};
