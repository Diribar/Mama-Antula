export default (sequelize, dt) => {
	const alias = "generos";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(15)},
		letraFinal: {type: dt.STRING(2)},
	};
	const config = {
		tableName: "us_generos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
