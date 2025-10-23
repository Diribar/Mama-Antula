export default  (sequelize, dt) => {
	const alias = "paises";
	const columns = {
		id: {type: dt.STRING(2), primaryKey: true},
		nombre: {type: dt.STRING(100)},
		continente: {type: dt.STRING(20)},
	};
	const config = {
		tableName: "aux_paises",
		timestamps: false,
	};
	const entidad = sequelize.define(alias, columns, config);
	entidad.associate = (n) => {
		entidad.hasMany(n.usuarios, {as: "usuarios", foreignKey: "pais_id"});
	};
	return entidad;
};
