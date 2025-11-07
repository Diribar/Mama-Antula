export default (sequelize, dt) => {
	const alias = "contenidos";
	const columns = {
		// Referencias
		carta_id: {type: dt.INTEGER},
		encab_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Otros
		texto: {type: dt.TEXT("long")},
		imagen: {type: dt.STRING(17)},
		video: {type: dt.TEXT("medium")},
		leyenda: {type: dt.TEXT("medium")},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cont_2contenidos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.encabCartas, {as: "carta", foreignKey: "carta_id"});
		entidad.belongsTo(n.encabResto, {as: "encab", foreignKey: "encab_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
		entidad.hasMany(n.imgsCarrusel, {as: "imgsCarrusel", foreignKey: "contenido_id"});
	};
	return entidad;
};
