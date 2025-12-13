export default (sequelize, dt) => {
	const alias = "lugaresExpers";
	const columns = {
		nombre: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "cont_lugares",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
