"use strict";
import cron from "node-cron";

// Exportar
export default {
	// Start-up y Configuración de Rutinas
	startupMasConfiguracion: async function () {
		// Rutinas programadas - compartidas diarias: 0:00hs
		cron.schedule("0 0 * * *", () => this.rutinasDiarias(), {timezone: "Etc/Greenwich"}); // Rutinas diarias (a las 0:00hs)
		cron.schedule("1 * * * *", () => this.rutinasHorarias(), {timezone: "Etc/Greenwich"}); // Rutinas horarias (a las X:00hs)

		// Fin
		return;
	},

	rutinasDiarias: async function () {
		await this.rutinas.verificaLinksYouTube();
	},

	// Rutinas
	rutinas: {
		// Diarias
		verificaLinksYouTube: async () => {
			// Variables
			const distYT = "youtube.com";

			// Obtiene los links a revisar
			const condicion = {statusRegistro_id: aprobado_id, video: {[Op.ne]: null}};
			let links = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Primera revisión
			await linksVencidos.porProv(YT);

			// Obtiene los links con el mismo orden que en Revisión
			links = await baseDatos
				.obtieneTodosPorCondicion("links", {statusRegistro_id: inactivar_id, prodAprob: true}, entProdsAsocs)
				.then((n) => n.sort((a, b) => (a.capitulo_id && !b.capitulo_id ? -1 : !a.capitulo_id && b.capitulo_id ? 1 : 0))) // agrupados por capítulos y no capítulos
				.then((n) => n.sort((a, b) => (a.capitulo_id && b.capitulo_id ? a.capitulo_id - b.capitulo_id : 0))) // ordenados por capítulos
				.then((n) => n.sort((a, b) => (a.capitulo_id && b.capitulo_id ? a.grupoCol_id - b.grupoCol_id : 0))); // ordenados por colección

			// Segunda revisión
			console.log("Segunda revisión");
			YT.links = links.filter((n) => n.url.startsWith(distYT));
			await linksVencidos.porProv(YT);
			okRu.links = links.filter((n) => n.url.startsWith(distOkRu));
			await linksVencidos.porProv(okRu);
			DM.links = links.filter((n) => n.url.startsWith(distDM));
			// await linksVencidos.porProv(DM);

			// Actualiza la cantidad de links por semana
			procsFM_PRL.actualizaCantLinksPorSem();

			// Fin
			console.log("Terminado!");
			return;
		},
		idCorrelativo: async () => {
			// Variables
			const tablas = [
				...["edicsHistorial", "statusHistorial"],
				...["prodEdics", "rclvEdics", "linkEdics"],
				...["capturas"],
				...["calRegistros", "misConsultas", "consRegsPrefs", "pppRegistros"],
				...["capsSinLink", "novsPeliculas"],
			];

			// Actualiza los valores de ID
			for (const tabla of tablas) {
				// Variables
				const registros = await baseDatos.obtieneTodos(tabla);
				let id = 1;

				// Actualiza los IDs - es crítico que sea un 'for', porque el 'forEach' no respeta el 'await'
				for (const registro of registros) {
					if (registro.id != id) await baseDatos.actualizaPorId(tabla, registro.id, {id}); // tiene que ser 'await' para no duplicar ids
					id++;
				}

				// Actualiza el próximo valor de ID
				const texto = bdNombre + "." + bd[tabla].tableName;
				await sequelize.query("ALTER TABLE " + texto + " AUTO_INCREMENT = " + id + ";");
			}

			// Fin
			return;
		},
	},
};
