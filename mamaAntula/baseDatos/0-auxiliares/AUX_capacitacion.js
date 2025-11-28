export default (sequelize, dt) => {
	const alias = "capacitaciones";
	const columns = {
		// Referencias
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(25)},
		rol_id: {type: dt.INTEGER},
		codigo: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "aux_capacitaciones",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.roles, {as: "rol", foreignKey: "rol_id"});
	};
	return entidad;
};
