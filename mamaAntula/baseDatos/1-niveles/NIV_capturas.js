export default (sequelize, dt) => {
	const alias = "capturas";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		pestana_id: {type: dt.INTEGER},

		// Otros
		capturadoPor_id: {type: dt.INTEGER},
		capturadoEn: {type: dt.DATE},
	};
	const config = {
		tableName: "nivel8_capturas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
		entidad.belongsTo(n.pestanasTemas, {as: "pestana", foreignKey: "pestana_id"});
		entidad.belongsTo(n.usuarios, {as: "capturadoPor", foreignKey: "capturadoPor_id"});
	};
	return entidad;
};
