"use strict";

export default async (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;

	const pestsPosibles = pestanasTemas.filter((n) => n.tema_id == tema_id);
	if (pestsPosibles.length) {
		// Problemas con la pestaña y el tema
		if (!pestana_id) return res.json({error: "Debés seleccionar una pestaña"});
		if (!pestsPosibles.find((n) => n.id == pestana_id))
			return res.json({error: "Debés seleccionar una pestaña vinculada con el tema actual"});

		// Problema con la pestaña en la tabla
		const pestanaActual = await baseDatos.obtienePorId("pestanasTemas", pestana_id);
		if (!pestanaActual) return res.json({error: "Debés seleccionar una pestaña válida"});

		// Problemas con la captura
		const {capturadoPor_id, capturadoEn} = pestanaActual;
		const liberadoEn = new Date(capturadoEn) + unaHora * 1;
		if (
			capturadoPor_id &&
			capturadoEn && // está capturado
			capturadoPor_id != req.session.usuario.id && // está capturado por otra persona
			new Date() < liberadoEn // y no se venció el tiempo
		) {
			const usuarioCaptura = await baseDatos.obtienePorId("usuarios", capturadoPor_id);
			const {nombreCompleto} = usuarioCaptura;

			return res.json({
				error:
					"La pestaña está siendo actualizada por " +
					nombreCompleto +
					", y quedará liberada a las " +
					comp.fechaHora.horarioUTC(liberadoEn) +
					" si no registra actividad antes de esa hora.",
			});
		}
	}

	// Fin
	return next();
};
