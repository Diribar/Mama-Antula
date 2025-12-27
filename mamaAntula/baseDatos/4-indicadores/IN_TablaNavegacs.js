export default (sequelize, dt) => {
	// Guarda todas las navegaciones
	const alias = "navegacs";
	const columns = {
		// Datos compartidos con usuario - necesarios en 'session'
		cliente_id: {type: dt.STRING(11)}, // para la vinculación
		fechaHora: {type: dt.DATE}, // para la estadística
		originalUrl: {type: dt.STRING(100)},
	};
	const config = {
		tableName: "ind_navegacs",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);

	return entidad;
};
