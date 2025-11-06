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
	};
	const config = {
		tableName: "nivel2_temas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.secciones, {as: "seccion", foreignKey: "seccion_id"});

		entidad.hasMany(n.pestanasTemas, {as: "pestanas", foreignKey: "tema_id"});
		entidad.hasMany(n.temaIndice, {as: "indices", foreignKey: "tema_id"});
	};
	return entidad;
};
