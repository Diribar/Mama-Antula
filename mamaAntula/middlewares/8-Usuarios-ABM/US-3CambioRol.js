"use strict";

export default async (req, res, next) => {
	// Variables
	const {usuario_id: id, nombreCompleto, rol_id: rol_idTexto} = req.body;
	const rol_id = rol_idTexto && Number(rol_idTexto);

	// Valida cada variable - id
	if (!id) return res.json({error: "El usuario no se identifica"});

	// Valida que existe el nombreCompleto o el rol
	if (!nombreCompleto && !rol_id) return res.json({error: "No detectamos qué cambiaste"});

	// Valida cada variable - nombreCompleto
	if (nombreCompleto && nombreCompleto.length > 50)
		return res.json({error: "El nombre completo no puede tener mas de 50 caracteres"});

	// Valida cada variable - rol_id
	if (rol_id && !roles.find((n) => n.id == rol_id)) return res.json({error: "El rol no existe"});

	// Averigua cuántos usuarios hay con rol Revisión y Administrador
	if (rol_id) {
		// Le actualiza el rol al usuario
		const usuarios = await baseDatos.obtieneTodos("usuarios").then((n) => n.filter((m) => m.id > 1));
		const indiceUsuario = usuarios.findIndex((n) => n.id == id);
		usuarios[indiceUsuario].rol_id = Number(rol_id);

		// Averigua la cantidad de usuarios para cada rol
		const revisores = usuarios.filter((n) => rolesRevision_ids.includes(n.rol_id));
		const cambioRoles = usuarios.filter((n) => rolesCambioRoles_ids.includes(n.rol_id));

		// Revisores - deben ser entre 1 y 2 usuarios
		if (revisores.length < 1 && !rolesRevision_ids.includes(rol_id))
			return res.json({error: "El rol 'Revisión' debe tener al menos 1 usuario"});
		if (revisores.length > 2 && rolesRevision_ids.includes(rol_id))
			return res.json({error: "El rol 'Revisión' no debe tener más de 2 usuarios"});

		// Administradores - deben ser entre 1 y 2 usuarios
		if (cambioRoles.length < 1 && !rolesCambioRoles_ids.includes(rol_id))
			return res.json({error: "El rol 'Cambio de Rol' debe tener al menos 1 usuario"});
		if (cambioRoles.length > 2 && rolesCambioRoles_ids.includes(rol_id))
			return res.json({error: "El rol 'Cambio de Rol' no debe tener más de 2 usuarios"});
	}

	// Fin
	return next();
};
