export default (sequelize, dt) => {
	const alias = "secciones";
	const columns = {
		// Referencias
		orden: {type: dt.INTEGER},

		// Nombres
		nombre: {type: dt.STRING(20)},
		codigo: {type: dt.STRING(20)},
		link: {type: dt.STRING(30)},
	};
	const config = {
		tableName: "nivel1_secciones",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
