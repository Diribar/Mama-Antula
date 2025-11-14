export default (req, res, next) => {
	// Variables
	const {usuario_id: id, nombreCompleto, rol_id} = req.body;

	// Valida cada variable - id
	if (!id) return res.json({error: "El usuario no se identifica"});

	// Valida cada variable - nombreCompleto
	if (!nombreCompleto) return res.json({error: "El nombre completo no se identifica"});

	// Valida cada variable - rol_id
	if (!rol_id) return res.json({error: "El rol no se identifica"});

	return next();
};
