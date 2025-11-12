"use strict";

export default async (req, res, next) => {
	// Variables
	const {actualizaTema_id: tema_id, actualizaPestana_id: pestana_id} = req.cookies;
	const pestsPosibles = (tema_id && pestanasTemas.filter((n) => n.tema_id == tema_id)) || [];

	// PESTAÑA - Validaciones
	if (pestana_id) {
		// 1. Problema con la pestaña en la tabla
		const pestanaActual = await baseDatos.obtienePorId("pestanasTemas", pestana_id);
		if (!pestanaActual) return res.json({error: "Debés seleccionar una pestaña válida"});

		// 2. Problemas con la captura
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

	// TEMA - Validaciones
	else {
		// 1. Problema con no haber elegido un tema
		if (!tema_id) return res.json({error: "Debés seleccionar un tema"});

		// 2. Problema con no haber elegido una pestaña habiéndolas
		if (pestsPosibles.length && !pestana_id) return res.json({error: "Debés seleccionar una pestaña"});

		// 3. Problema con el tema en la tabla
		const temaActual = await baseDatos.obtienePorId("temasSecciones", tema_id);
		if (!temaActual) return res.json({error: "Debés seleccionar un tema válido"});

		// 4. Problemas con la captura
		const {capturadoPor_id, capturadoEn} = temaActual;
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
					"El tema está siendo actualizado por " +
					nombreCompleto +
					", y quedará liberado a las " +
					comp.fechaHora.horarioUTC(liberadoEn) +
					" si no registra actividad antes de esa hora.",
			});
		}
	}

	// TEMA y PESTAÑA - Validaciones cruzadas
	if (tema_id && pestana_id) {
		if (!pestsPosibles.length) return res.json({error: "El tema actual no tiene pestañas vinculadas"});

		// 2. Problemas con la pestaña y el tema
		if (!pestsPosibles.find((n) => n.id == pestana_id))
			return res.json({error: "Debés seleccionar una pestaña vinculada con el tema actual"});
	}

	// Fin
	return next();
};
