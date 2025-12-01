"use strict";
import cron from "node-cron";
import linksVencidos from "./RT-LinksVencidos";

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
			// Obtiene los links a revisar
			const condicion = {statusRegistro_id: aprobado_id, video: {[Op.ne]: null}};
			let contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", condicion);

			// Primera revisión
			await linksVencidos.revisaLinks(contenidos);

			// Obtiene los links con el mismo orden que en Revisión
			contenidos = await baseDatos.obtieneTodosPorCondicion("contenidos", {statusRegistro_id: creadoAprob_id});

			// Segunda revisión
			await linksVencidos.revisaLinks(contenidos);

			// Fin
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
