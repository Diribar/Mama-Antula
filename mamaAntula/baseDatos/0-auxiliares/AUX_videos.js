export default (sequelize, dt) => {
	const alias = "videos";
	const columns = {
		// Referencias
		orden: {type: dt.INTEGER},
		nombre: {type: dt.STRING(25)},
		url: {type: dt.STRING(20)},

		// Permisos
		visita: {type: dt.INTEGER},
		lectura: {type: dt.INTEGER},
		actualizac: {type: dt.INTEGER},
		revision: {type: dt.INTEGER},
		cambioRol: {type: dt.INTEGER},
	};
	const config = {
		tableName: "aux_videos",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	return entidad;
};
