export default (sequelize, dt) => {
	const alias = "edicionesEncab";
	const columns = {
		// Referencias
		carta_id: {type: dt.INTEGER},
		experiencia_id: {type: dt.INTEGER},
		sinIndice_id: {type: dt.INTEGER},

		// Experiencias y Sin índice
		titulo: {type: dt.STRING(100)},
		subTitulo: {type: dt.STRING(100)},

		// Exclusivo cartas
		numero: {type: dt.INTEGER},
		nombreDesde_id: {type: dt.INTEGER},
		nombreHacia_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		imagen: {type: dt.STRING(17)},

		// Cartas y Experiencias
		lugar_id: {type: dt.INTEGER},
		fechaEvento: {type: dt.DATE},

		// Control
		editadoPor_id: {type: dt.INTEGER},
		editadoEn: {type: dt.DATE},
	};
	const config = {
		tableName: "edic_1encab",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.encabCartas, {as: "carta", foreignKey: "carta_id"});
		entidad.belongsTo(n.encabExpers, {as: "experiencia", foreignKey: "experiencia_id"});
		entidad.belongsTo(n.encabSinIndice, {as: "sinIndice", foreignKey: "sinIndice_id"});

		entidad.belongsTo(n.personajes, {as: "nombreDesde", foreignKey: "nombreDesde_id"});
		entidad.belongsTo(n.personajes, {as: "nombreHacia", foreignKey: "nombreHacia_id"});
		entidad.belongsTo(n.lugares, {as: "lugar", foreignKey: "lugar_id"});
		entidad.belongsTo(n.idiomas, {as: "idioma", foreignKey: "idioma_id"});
		entidad.belongsTo(n.usuarios, {as: "editadoPor", foreignKey: "editadoPor_id"});
	};
	return entidad;
};
