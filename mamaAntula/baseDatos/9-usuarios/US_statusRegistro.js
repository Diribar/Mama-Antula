export default (sequelize, dt) => {
	const alias = "statusRegistrosUs";
	const columns = {
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "us_status_registros",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.hasMany(n.usuarios, {as: "usuarios", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
