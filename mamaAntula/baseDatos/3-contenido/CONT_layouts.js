export default (sequelize, dt) => {
	const alias = "contLayouts";
	const columns = {
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
		archVistaAbm: {type: dt.STRING(20)},
		archVistaLt: {type: dt.STRING(20)},

		// Otros
		particular: {type: dt.BOOLEAN},
		usarConTema: {type: dt.STRING(20)},
		ocultarPestana: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "cont_layouts",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
