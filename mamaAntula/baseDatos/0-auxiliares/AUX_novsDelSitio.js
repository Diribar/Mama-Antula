export default (sequelize, dt) => {
	const alias = "novsDelSitio";
	const columns = {
		comentario: {type: dt.STRING(100)},
		fecha: {type: dt.DATE},
		version: {type: dt.STRING(4)},
	};
	const config = {
		tableName: "aux_novs_del_sitio",
		timestamps: false,
	};

	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
