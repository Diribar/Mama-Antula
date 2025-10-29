export default (sequelize, dt) => {
	const alias = "contenidos";
	const columns = {
		// Referencias
		sinIndice_id: {type: dt.INTEGER},
		experiencia_id: {type: dt.INTEGER},
		carta_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Otros
		texto: {type: dt.TEXT("long")},
		imagen: {type: dt.STRING(17)},
		link: {type: dt.TEXT("medium")},
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
		entidad.belongsTo(n.encabSinIndice, {as: "articulo", foreignKey: "sinIndice_id"});
		entidad.belongsTo(n.encabExps, {as: "experiencia", foreignKey: "experiencia_id"});
		entidad.belongsTo(n.encabCartas, {as: "carta", foreignKey: "carta_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
		entidad.hasMany(n.imgsCarrousel, {as: "imgsCarrousel", foreignKey: "contenido_id"});
	};
	return entidad;
};
