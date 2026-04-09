export default (sequelize, dt) => {
	const alias = "iconosAgrups";
	const columns = {
		nombre: {type: dt.STRING(25)},
		codigo: {type: dt.STRING(20)},
		clase: {type: dt.STRING(20)},
		link: {type: dt.STRING(100)},
		grupo: {type: dt.STRING(20)},
		activo: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "aux_iconos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
