export default (sequelize, dt) => {
	const alias = "personajes";
	const columns = {
		nombre: {type: dt.STRING(30)},
	};
	const config = {
		tableName: "cartas_personajes",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
