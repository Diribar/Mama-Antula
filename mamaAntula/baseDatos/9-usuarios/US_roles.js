export default (sequelize, dt) => {
	const alias = "roles";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(15)},

		actualizac: {type: dt.BOOLEAN},
		revision: {type: dt.BOOLEAN},
		cambioRol: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "us_roles",
		timestamps: false,
	};

	const entidad = sequelize.define(alias, columns, config);

	return entidad;
};
