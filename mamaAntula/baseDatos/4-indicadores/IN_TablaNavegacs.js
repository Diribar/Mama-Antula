export default (sequelize, dt) => {
	// Guarda todas las navegaciones
	const alias = "navegacs";
	const columns = {
		cliente_id: {type: dt.STRING(11)},
		fechaHora: {type: dt.DATE},
		originalUrl: {type: dt.STRING(100)},
	};
	const config = {
		tableName: "ind_navegacs",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);

	return entidad;
};
