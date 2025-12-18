"use strict";

export default async (req, res, next) => {
	// Variables
	const {actTema_id: tema_id, actPestana_id: pestana_id} = req.cookies;
	const {usuario} = req.session;

	// Obtiene las capturas
	const capturadoPor_id = {[Op.ne]: usuario.id}; // por otros usuarios
	let capturadoEn = {[Op.gt]: new Date(Date.now() - unaHora)}; // hace menos de una hora
	const condicion = {[Op.and]: [{capturadoPor_id}, {capturadoEn}]};
	const capturas = await baseDatos.obtieneTodosPorCondicion("capturas", condicion, "capturadoPor");

	// El tema o pestaña no esta siendo capturado
	const captura = capturas.find((n) => (tema_id && n.tema_id == tema_id) || (pestana_id && n.pestana_id == pestana_id));
	if (!captura) return next();

	// Más variables
	const {nombreCompleto, apodo} = captura.capturadoPor;
	({capturadoEn} = captura);
	let titulo, entidad, oa;

	// Variables de tema
	if (tema_id) {
		// Variables
		titulo = temasSecciones.find((n) => n.id == tema_id).titulo;
		entidad = "El tema ";
		oa = "o";
	}

	// Variables de pestaña
	if (pestana_id) {
		titulo = pestanasTemas.find((n) => n.id == pestana_id).titulo;
		entidad = "La pestaña ";
		oa = "a";
	}

	// Consolida la información
	const datos = {entidad, titulo, oa, nombreCompleto, apodo, capturadoEn};

	// Fin
	return res.json(respuesta(datos));
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
