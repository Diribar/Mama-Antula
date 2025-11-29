"use strict";

export default async (req, res, next) => {
	// Variables
	const {actTema_id: tema_id, actPestana_id: pestana_id} = req.cookies;
	const {usuario} = req.session;

	// Obtiene las capturas
	const capturadoPor_id = {[Op.ne]: usuario.id}; // por otros usuarios
	const capturadoEn = {[Op.gt]: new Date(Date.now() - unaHora)}; // hace menos de una hora
	const condicion = {[Op.and]: [{capturadoPor_id}, {capturadoEn}]};
	const capturas = await baseDatos.obtieneTodosPorCondicion("capturas", condicion, "capturadoPor");

	// TEMA - Valida la captura
	if (tema_id) {
		// El tema no esta siendo capturado
		const captura = capturas.find((n) => n.tema_id == tema_id);
		if (!captura) return next();

		// Variables
		const {capturadoPor, capturadoEn} = captura;
		const {nombreCompleto, apodo} = capturadoPor;
		const titulo = temasSecciones.find((n) => n.id == tema_id).titulo;
		const entidad = "El tema ";
		const oa = "o";

		// Fin
		const datos = {entidad, titulo, oa, nombreCompleto, apodo, capturadoEn};
		return res.json(respuesta(datos));
	}

	// PESTAÑA - Valida la captura
	if (pestana_id) {
		// La pestaña no esta siendo capturada
		const captura = capturas.find((n) => n.tema_id == tema_id);
		if (!captura) return next();

		// Variables
		const {capturadoPor, capturadoEn} = captura;
		const {nombreCompleto, apodo} = capturadoPor;
		const titulo = pestanasTemas.find((n) => n.id == pestana_id).titulo;
		const entidad = "La pestaña ";
		const oa = "a";

		// Fin
		const datos = {entidad, titulo, oa, nombreCompleto, apodo, capturadoEn};
		return res.json(respuesta(datos));
	}
};

// Variables
const siNoRegistra =
	", y quedará liberado el <span class='resaltar'>[horario]</span> si él/ella no registra actividad antes de ese horario.<br><br>Hasta entonces, ";
const noAccesible = "<strong><u>no está accesible</u></strong> para ser actualizado por otra persona.";

// Funciones
const tituloHtml = (titulo) => "<b><em>" + titulo + "</em></b>";
const liberadoEn = (capturadoEn) => new Date(capturadoEn).getTime() + unaHora + unMinuto;
const respuesta = ({entidad, titulo, oa, nombreCompleto, apodo, capturadoEn}) => ({
	error:
		entidad +
		tituloHtml(titulo) +
		" está siendo actualizad" +
		oa +
		" por " +
		(nombreCompleto || apodo) +
		siNoRegistra +
		entidad.toLowerCase() +
		noAccesible,
	horario: liberadoEn(capturadoEn),
});
