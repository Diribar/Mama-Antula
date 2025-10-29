export default (sequelize, dt) => {
	const alias = "encabExps";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		pestana_id: {type: dt.INTEGER},

		// Otros
		titulo: {type: dt.STRING(100)},
		subTitulo: {type: dt.STRING(100)},
		lugar_id: {type: dt.INTEGER},
		fechaEvento: {type: dt.DATE},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "encab_expers",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.lugares, {as: "lugar", foreignKey: "lugar_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
