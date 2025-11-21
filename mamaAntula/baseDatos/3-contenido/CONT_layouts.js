export default (sequelize, dt) => {
	const alias = "layouts";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
		ocultarSiempre: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "cont_layouts",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
