export default (sequelize, dt) => {
	const alias = "carrousel";
	const columns = {
		// Referencias
		contenido_id: {type: dt.INTEGER},
		usuario_id: {type: dt.INTEGER},

		// Otros
		orden: {type: dt.INTEGER},
		imagen: {type: dt.STRING(17)},

		// Control
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cont_3carrousel",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.contenidos, {as: "contenido", foreignKey: "contenido_id"});
		entidad.belongsTo(n.usuarios, {as: "usuario", foreignKey: "usuario_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
