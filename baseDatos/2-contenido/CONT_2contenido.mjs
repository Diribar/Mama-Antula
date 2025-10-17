export default (sequelize, dt) => {
	const alias = "contenidos";
	const columns = {
		// Referencias
		articulo_id: {type: dt.INTEGER},
		carta_id: {type: dt.INTEGER},
		usuario_id: {type: dt.INTEGER},
		orden: {type: dt.INTEGER},

		// Otros
		texto: {type: dt.TEXT("long")},
		imagen: {type: dt.STRING(17)},
		link: {type: dt.TEXT("medium")},
		resaltado: {type: dt.BOOLEAN},
		dots: {type: dt.BOOLEAN},
		textoImagenVideo: {type: dt.TEXT("medium")},

		// Control
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cont_2contenidos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.articulos, {as: "articulo", foreignKey: "articulo_id"});
		entidad.belongsTo(n.cartas, {as: "carta", foreignKey: "carta_id"});
		entidad.belongsTo(n.usuarios, {as: "usuario", foreignKey: "usuario_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
