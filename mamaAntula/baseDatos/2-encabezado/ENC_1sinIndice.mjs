export default (sequelize, dt) => {
	const alias = "encabSinIndice";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		pestana_id: {type: dt.INTEGER},

		// Otros
		titulo: {type: dt.STRING(100)}, // se necesita sobre todo para los articulos de pestañas
		subTitulo: {type: dt.STRING(100)},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "encab_sin_indice",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
		entidad.belongsTo(n.pestanasTemas, {as: "pestana", foreignKey: "pestana_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});

		entidad.hasMany(n.edicionesEncab, {as: "ediciones", foreignKey: "sinIndice_id"});
	};
	return entidad;
};
