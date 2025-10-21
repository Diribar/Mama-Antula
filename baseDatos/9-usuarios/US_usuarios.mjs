export default (sequelize, dt) => {
	const alias = "usuarios";
	const columns = {
		nombre: {type: dt.STRING(30)},
		email: {type: dt.STRING(100)},

		apodo: {type: dt.STRING(30)},
		cliente_id: {type: dt.STRING(11)},
		contrasena: {type: dt.STRING(50)},
		avatar: {type: dt.STRING(100)},
		newsletter: {type: dt.BOOLEAN},

		visitaCreadaEn: {type: dt.DATE},
		fechaUltNaveg: {type: dt.DATE},
		diasNaveg: {type: dt.INTEGER},
		versionWeb: {type: dt.STRING(4)},

		creadoEn: {type: dt.DATE},
		fechaContrasena: {type: dt.DATE},

		rolUsuario_id: {type: dt.INTEGER},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "us_usuarios",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.rolesUs, {as: "rol", foreignKey: "rolUsuario_id"});
		entidad.belongsTo(n.statusRegistrosUs, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
