export default (sequelize, dt) => {
	const alias = "lugares";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "aux_lugares",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
