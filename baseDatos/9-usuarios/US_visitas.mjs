export default (sequelize, dt) => {
	const alias = "visitas";
	const columns = {
		// Datos compartidos con usuario - necesarios en 'session'
		cliente_id: {type: dt.STRING(11)}, // para la vinculación

		visitaCreadaEn: {type: dt.DATE}, // para la estadística
		fechaUltNaveg: {type: dt.DATE}, // para el contador de 'clientes x día', default 'actual'
		diasNaveg: {type: dt.INTEGER}, // para la estadística

		versionWeb: {type: dt.STRING(4)}, // para las novsPeliculas
		rolUsuario_id: {type: dt.INTEGER}, // para las novsPeliculas, default '1'
	};
	const config = {
		tableName: "us_visitas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.belongsTo(n.rolesUsuario, {as: "rol", foreignKey: "rolUsuario_id"});
	};
	return entidad;
};
