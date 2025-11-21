export default (sequelize, dt) => {
	const alias = "contLayouts";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
		archVista: {type: dt.STRING(20)},

		usarConTema: {type: dt.STRING(20)},
		noEstandar: {type: dt.BOOLEAN},
		ocultarSiempre: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "cont_layouts",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
