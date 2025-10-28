export default (sequelize, dt) => {
	const alias = "encabCartas";
	const columns = {
		// Referencias
		numero: {type: dt.INTEGER},
		nombreDesde_id: {type: dt.INTEGER},
		nombreHacia_id: {type: dt.INTEGER},
		lugar_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		fechaEvento: {type: dt.DATE},

		// Control
		creadoPor_id: {type: dt.INTEGER},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cont_1enc_ci_cartas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.personajes, {as: "nombreDesde", foreignKey: "nombreDesde_id"});
		entidad.belongsTo(n.personajes, {as: "nombreHacia", foreignKey: "nombreHacia_id"});
		entidad.belongsTo(n.lugares, {as: "lugar", foreignKey: "lugar_id"});
		entidad.belongsTo(n.idiomas, {as: "idioma", foreignKey: "idioma_id"});
		entidad.belongsTo(n.usuarios, {as: "usuario", foreignKey: "creadoPor_id"});
		entidad.belongsTo(n.statusRegistros, {as: "statusRegistro", foreignKey: "statusRegistro_id"});
	};
	return entidad;
};
