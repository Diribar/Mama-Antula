export default (sequelize, dt) => {
	const alias = "encabezados";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		pestana_id: {type: dt.INTEGER},

		// Otros
		numero: {type: dt.INTEGER},
		titulo: {type: dt.STRING(100)},
		subTitulo: {type: dt.STRING(100)},
		fechaEvento: {type: dt.DATE},

		// Referencias
		nombreDesde_id: {type: dt.INTEGER},
		nombreHacia_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		lugar_id: {type: dt.INTEGER},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "encab_1original",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		// Comunes a todos los tipos de encabezado
		entidad.belongsTo(n.temasSecciones, {as: "tema", foreignKey: "tema_id"});
		entidad.belongsTo(n.pestanasTemas, {as: "pestana", foreignKey: "pestana_id"});
		entidad.belongsTo(n.usuarios, {as: "creadoPor", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});

		// Comunes a conIndice
		entidad.belongsTo(n.lugares, {as: "lugar", foreignKey: "lugar_id"});

		// Exclusivo de cartas
		entidad.belongsTo(n.personajes, {as: "nombreDesde", foreignKey: "nombreDesde_id"});
		entidad.belongsTo(n.personajes, {as: "nombreHacia", foreignKey: "nombreHacia_id"});
		entidad.belongsTo(n.idiomas, {as: "idioma", foreignKey: "idioma_id"});

		// Has many
		entidad.hasMany(n.encabEdics, {as: "ediciones", foreignKey: "encab_id"});
	};
	return entidad;
};
