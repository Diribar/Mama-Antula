export default (sequelize, dt) => {
	const alias = "temasSecciones";
	const columns = {
		// Referencias
		seccion_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Nombres
		titulo: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
		url: {type: dt.STRING(30)},

		// Otros
		inactivo: {type: dt.BOOLEAN},
		capturadoPor_id: {type: dt.INTEGER},
		capturadoEn: {type: dt.DATE},
	};
	const config = {
		tableName: "nivel2_temas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.secciones, {as: "seccion", foreignKey: "seccion_id"});
		entidad.belongsTo(n.usuarios, {as: "capturadoPor", foreignKey: "capturadoPor_id"});

		entidad.hasMany(n.pestanasTemas, {as: "pestanas", foreignKey: "tema_id"});
		entidad.hasMany(n.indiceTemas, {as: "indices", foreignKey: "tema_id"});
	};
	return entidad;
};
