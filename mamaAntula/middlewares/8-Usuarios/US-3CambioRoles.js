export default (req, res, next) => {
	// Variables
	const {usuario_id: id, nombreCompleto, rol_id} = req.body;

	// Valida cada variable - id
	if (!id) return res.json({error: "El usuario no se identifica"});

	// Valida que existe el nombreCompleto o el rol
	if (!nombreCompleto && !rol_id) return res.json({error: "No detectamos qué cambiaste"});

	// Valida cada variable - nombreCompleto
	if (nombreCompleto && nombreCompleto.length > 50)
		return res.json({error: "El nombre completo no puede tener mas de 50 caracteres"});

	// Valida cada variable - rol_id
	if (rol_id && !roles.find((n) => n.id == rol_id)) return res.json({error: "El rol no existe"});

	// Fin
	return next();
};
