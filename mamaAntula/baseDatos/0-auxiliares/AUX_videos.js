export default (sequelize, dt) => {
	const alias = "videos";
	const columns = {
		// Referencias
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(25)},
		codigo: {type: dt.STRING(20)},
		rol_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "aux_videos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.roles, {as: "rol", foreignKey: "rol_id"});
	};
	return entidad;
};
