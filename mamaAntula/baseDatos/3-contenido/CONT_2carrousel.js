export default (sequelize, dt) => {
	const alias = "carrusel";
	const columns = {
		contenido_id: {type: dt.INTEGER},
		imagen: {type: dt.STRING(17)},
	};
	const config = {
		tableName: "cont_3carrusel",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.contenidos, {as: "contenido", foreignKey: "contenido_id"});
	};
	return entidad;
};
