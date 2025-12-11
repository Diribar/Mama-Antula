export default (sequelize, dt) => {
	const alias = "encabEdics";
	const columns = {
		// Referencias
		encab_id: {type: dt.INTEGER},

		// Referencias
		nombreDesde_id: {type: dt.INTEGER},
		nombreHacia_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		lugar_id: {type: dt.INTEGER},
		lugarIndice_id: {type: dt.STRING(25)},

		// Otros
		numero: {type: dt.INTEGER},
		titulo: {type: dt.STRING(100)},
		fechaEvento: {type: dt.DATE},

		// Control
		editadoPor_id: {type: dt.INTEGER},
		editadoEn: {type: dt.DATE},
	};
	const config = {
		tableName: "encab_2edicion",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.encabezados, {as: "encab", foreignKey: "encab_id"});
		entidad.belongsTo(n.usuarios, {as: "editadoPor", foreignKey: "editadoPor_id"});

		// Exclusivo de cartas
		entidad.belongsTo(n.personajes, {as: "nombreDesde", foreignKey: "nombreDesde_id"});
		entidad.belongsTo(n.personajes, {as: "nombreHacia", foreignKey: "nombreHacia_id"});
		entidad.belongsTo(n.idiomas, {as: "idioma", foreignKey: "idioma_id"});

		// Otros
		entidad.belongsTo(n.lugaresCartas, {as: "lugarCarta", foreignKey: "lugar_id"});
		entidad.belongsTo(n.lugaresExpers, {as: "lugarExper", foreignKey: "lugar_id"});
		entidad.belongsTo(n.indicesLugar, {as: "lugarIndice", foreignKey: "lugarIndice_id"});

	};
	return entidad;
};
