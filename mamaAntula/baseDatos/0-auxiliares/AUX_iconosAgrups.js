export default (sequelize, dt) => {
	const alias = "iconosAgrupados";
	const columns = {
		// Referencias
		orden: {type: dt.INTEGER},

		// Otros
		nombre: {type: dt.STRING(25)},
		codigo: {type: dt.STRING(20)},
		clase: {type: dt.STRING(20)},
		link: {type: dt.STRING(100)},
		grupo: {type: dt.STRING(20)},

		// Permisos
		lectura: {type: dt.BOOLEAN},
		edicion: {type: dt.BOOLEAN},
		revision: {type: dt.BOOLEAN},
		admin: {type: dt.BOOLEAN},
	};
	const config = {
		tableName: "aux_iconos_agrups",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
