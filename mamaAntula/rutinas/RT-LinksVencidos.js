"use strict";
// Variables
const apiKey = process.env.API_KEY_GOOGLE;

export default {
	revisaLinks: async function (contenidos) {
		// Variables - generales
		const cantLinks = contenidos.length;
		let contador = 0;
		let cantLinksOk = 0;
		let cantLinksNo = 0;
		const espera = [];

		// Rutina
		for (const contenido of contenidos) {
			// Obtiene el resultado de la validación
			const respuesta = this.revisaLink(contenido).then(async (res) => {
				// Contador
				if (res.linkOk) cantLinksOk++;
				else cantLinksNo++;

				// Actualiza el contenido
				await this.actualizaStatusEnBd(contenido, res.linkOk);
			});
			espera.push(respuesta);

			// Progreso
			contador++;
			if (!(contador % 5)) {
				// Completa los procesos
				await Promise.all(espera);
				if (espera.includes("break")) break;
				espera.length = 0;

				// Progreso
				console.log(
					Math.round((contador / contenidos.length) * 100) + "%", // avance
					"✅ " + cantLinksOk,
					"- ❌ " + (contador - cantLinksOk),
					"- " + Math.round((cantLinksOk / contador) * 100) + "%"
				);
			}

			// Si se alcanzó el límite de links fallidos, interrumpe la secuencia
			if (cantLinksNo >= 5) {
				console.log("Se alcanzó el límite de links fallidos");
				break;
			}
		}
		await Promise.all(espera);

		// Estadísticas
		const cantNoVigentes = cantLinks - cantLinksOk;
		const plural = cantNoVigentes != 1 ? "s" : "";
		const porcVigentes = Math.round((cantLinksOk / cantLinks) * 100);
		console.log(cantNoVigentes + " video" + plural + " no vigente" + plural + " -", "precisión " + porcVigentes + "%\n");

		// Fin
		return;
	},
	revisaLink: async (contenido) => {
		// Variables
		const {video: videoId} = contenido;
		const url = `https://www.googleapis.com/youtube/v3/videos?part=status&id=${videoId}&key=${apiKey}`;

		// Validaciones
		try {
			// Lectura del link
			const response = await fetch(url);
			if (!response.ok) {
				console.log("Sin acceso al sitio YT - !response.ok - " + videoId);
				return {sinAccesoAlSitio: true};
			}

			// Verifica si es una lectura con el formato esperado
			const data = await response.json();
			const items = data.items;
			if (!items.length) return {linkOk: false}; // video no disponible

			// Verifica el status
			const status = items[0].status;
			const linkOk = status.uploadStatus == "processed" && status.privacyStatus != "private";
			if (!linkOk) console.log(status.uploadStatus, status.privacyStatus);

			// Fin
			return {linkOk};
		} catch (error) {
			console.log("Sin acceso al sitio - timeout - " + videoId);
			return {sinAccesoAlSitio: true};
		}
	},
	actualizaStatusEnBd: async (contenido, vigente) => {
		// Asigna el status vigente
		const statusRegistro_id = vigente ? aprobado_id : creadoAprob_id;

		// Si corresponde, actualiza el registro del contenido
		if (contenido.statusRegistro_id != statusRegistro_id)
			await baseDatos.actualizaPorId("contenidos", contenido.id, {statusRegistro_id});

		// Fin
		return;
	},
};
