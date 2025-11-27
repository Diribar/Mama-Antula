export default (sequelize, dt) => {
	const alias = "lugares";
	const columns = {
		nombre: {type: dt.STRING(20)},
		cartas: {type: dt.BOOLEAN},
		expers: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "aux_lugares",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
