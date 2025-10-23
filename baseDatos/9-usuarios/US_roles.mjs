export default (sequelize, dt) => {
	const alias = "rolesUs";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(15)},

		edicion: {type: dt.BOOLEAN},
		revision: {type: dt.BOOLEAN},
		admin: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "us_roles",
		timestamps: false,
	};

	const entidad = sequelize.define(alias, columns, config);

	return entidad;
};
