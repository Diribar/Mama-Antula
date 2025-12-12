export default (sequelize, dt) => {
	const alias = "lugaresCartas";
	const columns = {
		nombre: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "cartas_lugares",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
