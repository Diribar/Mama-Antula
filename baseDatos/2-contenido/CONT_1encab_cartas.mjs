export default (sequelize, dt) => {
	const alias = "idiomas";
	const columns = {
		// Referencias
		nombreDesde_id: {type: dt.INTEGER},
		nombreHasta_id: {type: dt.INTEGER},
		lugar_id: {type: dt.INTEGER},
		idioma_id: {type: dt.INTEGER},
		usuario_id: {type: dt.INTEGER},

		// Otros
		fechaEscrita: {type: dt.DATE},
		creadoEn: {type: dt.DATE},
		statusRegistro_id: {type: dt.INTEGER},
	};
	const config = {
		tableName: "cartas_idiomas",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
