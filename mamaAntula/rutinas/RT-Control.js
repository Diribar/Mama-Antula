"use strict";
import cron from "node-cron";
import linksVencidos from "./RT-LinksVencidos.js";
import baseDatos from "../funciones/baseDatos.js";

// Exportar
export default {
	// Start-up y Configuración de Rutinas
	startupMasConfiguracion: async function () {
		// Rutinas programadas - compartidas diarias: 0:00hs
		cron.schedule("* * * * 1", () => this.rutinasSemanales(), {timezone: "Etc/Greenwich"}); // Rutinas diarias (a las 0:00hs)
		//cron.schedule("0 0 * * *", () => this.rutinasDiarias(), {timezone: "Etc/Greenwich"}); // Rutinas diarias (a las 0:00hs)
		// cron.schedule("1 * * * *", () => this.rutinasHorarias(), {timezone: "Etc/Greenwich"}); // Rutinas horarias (a las X:00hs)

		// Fin
		return;
	},
	rutinasSemanales: async function () {
		await this.rutinas.verificaLinksYouTube();
		await this.rutinas.elimImgsSinRegEnBd.consolidado();
	},

	// Rutinas
	rutinas: {
		// Semanales
		verificaLinksYouTube: async () => {
			// Obtiene los links a revisar
			const condicion = {statusRegistro_id: aprobado_id, video: {[Op.ne]: null}};
			let contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Primera revisión
			await linksVencidos.revisaLinks(contenidos);

			// Obtiene los links con el mismo orden que en Revisión
			contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {statusRegistro_id: creadoAprob_id});

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
				const carpetas = [path.join(carpImgsEditables, "1-Final"), path.join(carpImgsEditables, "2-Revisar")];
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
				await baseDatos.obtieneTodos("carrusel").then((n) => n.map((m) => archsEnBd.push(m)));

				// Fin
				return archsEnBd;
			},
			eliminaLasImagenes: ({carpeta, archsEnBd}) => {
				// Obtiene el nombre de todas las imagenes de los archivos de la carpeta
				const archsEnDisco = fs.readdirSync(carpeta);

				// Rutina para borrar archivos cuyo nombre no está en BD
				for (const archEnDisco of archsEnDisco) if (!archsEnBd.includes(archEnDisco)) FN.elimina(carpeta, archEnDisco);

				// Fin
				return;
			},
		},
	},
};
