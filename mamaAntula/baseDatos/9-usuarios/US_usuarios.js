export default (sequelize, dt) => {
	const alias = "usuarios";
	const columns = {
		nombreCompleto: {type: dt.STRING(50)},
		email: {type: dt.STRING(50)},

		apodo: {type: dt.STRING(30)},
		cliente_id: {type: dt.STRING(11)},
		contrasena: {type: dt.STRING(60)},
		imagen: {type: dt.STRING(100)},
		notificacs: {type: dt.BOOLEAN},

		visitaCreadaEn: {type: dt.DATE},
		fechaUltNaveg: {type: dt.DATE},
		diasNaveg: {type: dt.INTEGER},
		versionWeb: {type: dt.STRING(4)},

		creadoEn: {type: dt.DATE},
		fechaContrasena: {type: dt.DATE},

		rol_id: {type: dt.INTEGER},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "us_usuarios",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.roles, {as: "rol", foreignKey: "rol_id"});
		entidad.belongsTo(n.statusRegistrosUs, {as: "statusRegistro", foreignKey: "statusRegistro_id"});

		entidad.hasMany(n.capturas, {as: "capturas", foreignKey: "capturadoPor_id"});
	};
	return entidad;
};
