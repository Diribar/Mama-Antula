export default (sequelize, dt) => {
	const alias = "encabezados";
	const columns = {
		// Referencias
		tema_id: {type: dt.INTEGER},
		pestana_id: {type: dt.INTEGER},

		// Referencias
		nombreDesde_id: {type: dt.INTEGER},
		nombreHacia_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		lugarCarta_id: {type: dt.INTEGER},
		lugarExper_id: {type: dt.INTEGER},
		indiceDevoc_id: {type: dt.STRING(25)},

		// Otros
		numero: {type: dt.INTEGER},
		titulo: {type: dt.STRING(100)},
		fechaEvento: {type: dt.DATE},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusSugeridoPor_id: {type: dt.INTEGER},
		statusSugeridoEn: {type: dt.DATE},
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
		entidad.belongsTo(n.usuarios, {as: "statusSugeridoPor", foreignKey: "statusSugeridoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});

		// Exclusivo de cartas
		entidad.belongsTo(n.personajes, {as: "nombreDesde", foreignKey: "nombreDesde_id"});
		entidad.belongsTo(n.personajes, {as: "nombreHacia", foreignKey: "nombreHacia_id"});
		entidad.belongsTo(n.idiomas, {as: "idioma", foreignKey: "idioma_id"});

		// Otros
		entidad.belongsTo(n.lugaresCartas, {as: "lugarCarta", foreignKey: "lugarCarta_id"});
		entidad.belongsTo(n.lugaresExpers, {as: "lugarExper", foreignKey: "lugarExper_id"});
		entidad.belongsTo(n.indicesDevoc, {as: "indiceDevoc", foreignKey: "indiceDevoc_id"});

		// Has many
		entidad.hasMany(n.encabEdics, {as: "ediciones", foreignKey: "encab_id"});
		entidad.hasMany(n.contenidos, {as: "contenidos", foreignKey: "encab_id"});
	};
	return entidad;
};
