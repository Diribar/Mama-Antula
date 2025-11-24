export default (sequelize, dt) => {
	const alias = "contenidos";
	const columns = {
		// Referencias
		encab_id: {type: dt.INTEGER},
		layout_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Otros
		texto: {type: dt.TEXT("long")},
		imagen: {type: dt.STRING(17)},
		imagen2: {type: dt.STRING(17)},
		video: {type: dt.TEXT("medium")},
		leyenda: {type: dt.TEXT("medium")},

		// Libros / Estampas
		titulo: {type: dt.STRING(100)},

		// Libros
		autor: {type: dt.STRING(50)},
		anoLanzam: {type: dt.INTEGER},
		editorial: {type: dt.STRING(50)},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusSugeridoPor_id: {type: dt.INTEGER},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cont_2contenidos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.encabezados, {as: "encab", foreignKey: "encab_id"});
		entidad.belongsTo(n.contLayouts, {as: "layout", foreignKey: "layout_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.usuarios, {as: "statusSugeridoPor", foreignKey: "statusSugeridoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});

		entidad.hasMany(n.carrusel, {as: "carrusel", foreignKey: "contenido_id"});
	};
	return entidad;
};
