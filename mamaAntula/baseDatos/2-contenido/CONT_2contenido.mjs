export default (sequelize, dt) => {
	const alias = "contenidos";
	const columns = {
		// Referencias
		encSinIndice_id: {type: dt.INTEGER},
		encConIndice_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Otros
		texto: {type: dt.TEXT("long")},
		imagen: {type: dt.STRING(17)},
		link: {type: dt.TEXT("medium")},
		resaltado: {type: dt.BOOLEAN},
		dots: {type: dt.BOOLEAN},
		textoImagenVideo: {type: dt.TEXT("medium")},

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
		entidad.belongsTo(n.encSinIndice, {as: "articulo", foreignKey: "encSinIndice_id"});
		entidad.belongsTo(n.encConIndice, {as: "carta", foreignKey: "encConIndice_id"});
		entidad.belongsTo(n.usuarios, {as: "usuario", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
		entidad.hasMany(n.imgsCarrousel, {as: "imgsCarrousel", foreignKey: "contenido_id"});
	};
	return entidad;
};
