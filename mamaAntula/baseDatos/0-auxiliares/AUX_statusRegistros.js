export default (sequelize, dt) => {
	const alias = "statusRegistros";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "aux_status_registros",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
