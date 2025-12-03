"use strict";
import cron from "node-cron";
import linksVencidos from "./RT-LinksVencidos.js";
import baseDatos from "../funciones/baseDatos.js";

// Exportar
export default {
	// Start-up y Configuración de Rutinas
	startupMasConfiguracion: async function () {
		// Rutinas programadas - compartidas diarias: 0:00hs
		cron.schedule("0 0 * * 1", () => this.rutinasSemanales(), {timezone: "Etc/Greenwich"}); // Rutinas semanales (a las 0:00hs)
		cron.schedule("1 0 * * *", () => this.rutinasDiarias(), {timezone: "Etc/Greenwich"}); // Rutinas diarias (a las 0:00hs)
		// cron.schedule("2 * * * *", () => this.rutinasHorarias(), {timezone: "Etc/Greenwich"}); // Rutinas horarias (a las X:00hs)

		// Fin
		return;
	},

	rutinasDiarias: async function () {
		await this.rutinas.eliminaRegsPapelera();

		// Fin
		return;
	},
	rutinasSemanales: async function () {
		await this.rutinas.verificaLinksYouTube();
		await this.rutinas.elimImgsSinRegEnBd.consolidado();

		// Fin
		return;
	},

	// Rutinas
	rutinas: {
		// Diarias
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

		// Semanales
		verificaLinksYouTube: async () => {
			// Obtiene los links a revisar
			const condicion = {statusRegistro_id: aprobado_id, video: {[Op.ne]: null}};
			let contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Primera revisión
			await linksVencidos.revisaLinks(contenidos);

			// Obtiene los links
			condicion.statusRegistro_id = rechazar_id;
			contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Segunda revisión
			if (contenidos.length) await linksVencidos.revisaLinks(contenidos);

			// Fin
			return;
		},
		elimImgsSinRegEnBd: {
			consolidado: async function () {
				// Variables
				let archsEnBd;

				// Elimina las imágenes de las carpetas "Revisar" y "Final"
				archsEnBd = await this.obtieneImgsContenidoCrsl();
				const carpetas = [path.join(carpImgsEditables, "2-Revisar"), path.join(carpImgsEditables, "1-Final")];
				for (const carpeta of carpetas) this.eliminaLasImagenes({carpeta, archsEnBd});

				// Fin
				return;
			},
			obtieneImgsContenidoCrsl: async () => {
				// Variables
				const archsEnBd = [];

				// Obtiene las imágenes de los contenidos y carruseles
				const contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {imagen: {[Op.ne]: null}});
				for (const contenido of contenidos) {
					archsEnBd.push(contenido.imagen);
					if (contenido.imagen2) archsEnBd.push(contenido.imagen2);
				}
				await baseDatos.obtieneTodos("carrusel").then((n) => n.map((m) => archsEnBd.push(m.imagen)));

				// Fin
				return archsEnBd;
			},
			eliminaLasImagenes: function ({carpeta, archsEnBd}) {
				// Obtiene el nombre de todas las imagenes de los archivos de la carpeta
				const archsEnDisco = fs.readdirSync(carpeta);

				// Rutina para borrar archivos cuyo nombre no está en BD
				for (const archEnDisco of archsEnDisco) if (!archsEnBd.includes(archEnDisco)) this.elimina(carpeta, archEnDisco);

				// Fin
				return;
			},
			elimina: (ruta, archivo) => {
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
			},
		},
	},
};
