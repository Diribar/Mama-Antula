export default (sequelize, dt) => {
	const alias = "visitas";
	const columns = {
		// Datos compartidos con usuario - necesarios en 'session'
		cliente_id: {type: dt.STRING(11)}, // para la vinculación

		visitaCreadaEn: {type: dt.DATE}, // para la estadística
		fechaUltNaveg: {type: dt.STRING(10)}, // para el contador de 'clientes x día', default 'actual'
		diasNaveg: {type: dt.INTEGER}, // para la estadística

		versionWeb: {type: dt.STRING(4)}, // para las novsPeliculas
		originalUrl: {type: dt.STRING(200)},
	};
	const config = {
		tableName: "ind_visitas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
