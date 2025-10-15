module.exports = (sequelize, dt) => {
	const alias = "rolesUsuario";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(15)},

		abmUsuarios: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "us_roles",
		timestamps: false,
	};

	const entidad = sequelize.define(alias, columns, config);

	return entidad;
};
