"use strict";
import cron from "node-cron";
import linksVencidos from "./RT-LinksVencidos.js";
import baseDatos from "../funciones/baseDatos.js";

// Exportar
export default {
	// Start-up y Configuración de Rutinas
	startupMasConfiguracion: async function () {
		// Rutinas programadas - compartidas diarias: 0:00hs
		cron.schedule("0 0 * * 1", () => this.rutinasSemanales.consolidado(), {timezone: "Etc/Greenwich"}); // Rutinas semanales (a las 0:00hs)
		cron.schedule("1 0 * * *", () => this.rutinasDiarias.consolidado(), {timezone: "Etc/Greenwich"}); // Rutinas diarias (a las 0:00hs)
		// this.rutinasDiarias.verificaLinksYouTube()

		// Fin
		return;
	},

	// Rutinas diarias
	rutinasDiarias: {
		consolidado: async function () {
			const funciones = Object.keys(this).slice(1);

			// Ejecuta las rutinas
			for (const funcion of funciones) {
				await this[funcion]();
				console.log("Rutina", funcion, "procesada");
			}

			// Fin
			return;
		},
		eliminaRegsPapelera: async () => {
			// Obtiene los encabezados anteriores a la fecha de corte
			const condEncab = {statusRegistro_id: rechazado_id, statusSugeridoEn: {[Op.lt]: new Date(Date.now() - unaSemana)}};
			const encabezados = await baseDatos.obtieneTodosPorCondicion("encabezados", condEncab);

			// Obtiene los contenidos de esos encabezados y los anteriores a la fecha de corte
			const condCont = {[Op.or]: [condEncab, {encab_id: encabezados.map((n) => n.id)}]};
			const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condCont);

			// Elimina los dependientes de los contenidos
			const condCrsl = {contenido_id: contenidos.map((n) => n.id)};
			await baseDatos.eliminaPorCondicion("carrusel", condCrsl);

			// Elimina los contenidos
			await baseDatos.eliminaPorCondicion("contenidos", condCont);

			// Elimina los encabezados
			await baseDatos.eliminaPorCondicion("encabezados", condEncab);

			// Fin
			return;
		},
		feedbackParaRevisores: async () => {
			// Obtiene los contenidos en status creado o rechazar
			const condicion = {statusRegistro_id: {[Op.in]: [creado_id, rechazar_id]}};
			const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);
			if (!contenidos.length) return;

			// Prepara el mail a enviar
			const nombre = "Familia Mama Antula";
			const asunto = "Contenido pendiente de revisión";
			const comentario =
				"Este es un mail automático para informarte que en el sitio web de la Familia Mama Antula, hay contenido pendiente de revisión.<br><br>" +
				"Por favor, ingresá al <a href='" +
				urlHost +
				"/revisar'>panel de revisión</a> para gestionarlo.<br><br>" +
				"Saludos cordiales,<br>" +
				"La Familia Mama Antula.";

			// Envía el mail a los revisores
			const emailsRevisores = await comp.emailsRevisores();
			for (const email of emailsRevisores) await comp.enviaMail({nombre, email, asunto, comentario});

			// Fin
			return;
		},
		eliminaEncabsErroneos: async () => {
			// Obtiene los temas con sus encabezados e indices
			const temas = await baseDatos.obtieneTodos("temasSecciones", ["encabezados", "indicesFecha", "indicesDevoc"]);

			// Recorre los temas
			for (const tema of temas) {
				// Se fija qué temas tienen varios encabezados y no tienen indices
				if (tema.encabezados.length > 1 && !tema.indicesFecha.length && !tema.indicesDevoc.length) {
					// Obtiene el encabezado más antiguo
					const encab = tema.encabezados.sort((a, b) => new Date(a.creadoEn) - new Date(b.creadoEn))[0];

					// Elimina los demás encabezados del tema
					await baseDatos.eliminaPorCondicion("encabezados", {tema_id: tema.id, id: {[Op.ne]: encab.id}});
				}
			}

			// Fin
			return;
		},
		verificaLinksYouTube: async () => {
			// Obtiene los links aprobados a revisar
			const condicion = {statusRegistro_id: aprobado_id, video: {[Op.ne]: null}};
			let contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Primera revisión
			await linksVencidos.revisaLinks(contenidos);

			// Obtiene los links rechazados a revisar
			condicion.statusRegistro_id = creadoAprob_id;
			contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Segunda revisión
			if (contenidos.length) await linksVencidos.revisaLinks(contenidos);

			// Fin
			return;
		},
	},

	// Rutinas semanales
	rutinasSemanales: {
		consolidado: async function () {
			const funciones = Object.keys(this).slice(1);

			// Ejecuta las rutinas
			for (const funcion of funciones) await this[funcion]();

			// Fin
			return;
		},
		elimImgsSinRegEnBd: async function () {
			// Variables
			let archsEnBd;

			const obtieneImgsContenidoCrsl = async () => {
				// Variables
				archsEnBd = [];

				// Obtiene las imágenes de los contenidos y carruseles
				const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {imagen: {[Op.ne]: null}});
				for (const contenido of contenidos) {
					archsEnBd.push(contenido.imagen);
					if (contenido.imagen2) archsEnBd.push(contenido.imagen2);
				}
				await baseDatos.obtieneTodos("carrusel").then((n) => n.map((m) => archsEnBd.push(m.imagen)));

				// Fin
				return;
			};
			const eliminaLasImagenes = function (carpeta) {
				// Obtiene el nombre de todas las imagenes de los archivos de la carpeta
				const archsEnDisco = fs.readdirSync(carpeta);

				// Rutina para borrar archivos cuyo nombre no está en BD
				for (const archEnDisco of archsEnDisco) if (!archsEnBd.includes(archEnDisco)) elimina(carpeta, archEnDisco);

				// Fin
				return;
			};
			const elimina = (ruta, archivo) => {
				// Arma el nombre del archivo
				const rutaNombre = path.join(ruta, archivo);

				// Se fija si encuentra el archivo
				if (rutaNombre && fs.existsSync(rutaNombre)) {
					const queEs = fs.statSync(rutaNombre);
					if (queEs.isFile()) {
						fs.unlinkSync(rutaNombre); // Borra el archivo
						console.log("Archivo '" + rutaNombre + "' borrado"); // Avisa que lo borra
					} else if (queEs.isDirectory()) {
						fs.rmdirSync(rutaNombre); // Borra el directorio
						console.log("Carpeta '" + rutaNombre + "' borrada"); // Avisa que lo borra
					}
				}
				// Mensaje si no lo encuentra
				else console.log("Archivo/Carpeta " + rutaNombre + " no encontrado para borrar");

				// Fin
				return;
			};

			// Elimina las imágenes de las carpetas "Revisar" y "Final"
			await obtieneImgsContenidoCrsl();
			const carpetas = [path.join(carpImgsEditables, "2-Revisar"), path.join(carpImgsEditables, "1-Final")];
			for (const carpeta of carpetas) eliminaLasImagenes(carpeta);

			// Fin
			return;
		},
	},
};
