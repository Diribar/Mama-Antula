"use strict";
// Variables
const procsFM_PRL = require("../rutasContrs/2.0-Familias/FM-Procs1-PRL");
const apiKey = process.env.API_KEY_GOOGLE;
const motivoVideoNoDisp_id = 31;

module.exports = {
	porProv: async function ({links, prov}) {
		// Variables - portales de videos
		const YT = prov == "youTube";

		// Variables - generales
		const inicio = Date.now();
		const cantLinks = links.length;
		const espera = [];
		let cantLinksOk = 0;
		let cantLinksNo = 0;
		let browser, page, anterior;

		// Rutina
		let contador = 0;
		for (const link of links) {
			// Obtiene el código necesario para validar
			const codigo = link.url.split("v=")[1];

			// Obtiene el resultado de la validación
			const respuesta = this.porLinkYT(codigo).then(async (res) => {
				if (res.linkOk) cantLinksOk++;
				else cantLinksNo++;
				// if (res.sinAccesoAlSitio) return "break";
				await this.porLinkTerm(link, res.linkOk);
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
				const ahora = Date.now();
				console.log(
					prov.toUpperCase(), // portal
					Math.round((contador / links.length) * 100) + "%", // avance
					Math.round((ahora - (anterior || inicio)) / 5) + "ms", // velocidad
					"✅ " + cantLinksOk,
					"- ❌ " + (contador - cantLinksOk),
					"- " + Math.round((cantLinksOk / contador) * 100) + "%"
				);
				anterior = ahora;
			}

			// Si se alcanzó el límite de links fallidos, interrumpe la secuencia
			if (cantLinksNo >= 5) {
				console.log("Se alcanzó el límite de links fallidos");
				break;
			}
		}
		await Promise.all(espera);
		if (OK) browser.close(); // no hace falta el 'await', ya que no se vuelve a abrir

		// Estadísticas
		const fin = Date.now();
		const duracion = fin - inicio;
		const promedio = Math.round(duracion / cantLinks);
		const cantNoVigentes = cantLinks - cantLinksOk;
		const porcVigentes = Math.round((cantLinksOk / cantLinks) * 100);
		const plural = cantNoVigentes != 1 ? "s" : "";
		console.log(
			prov.toUpperCase() + ":",
			promedio + "ms en promedio -",
			cantNoVigentes + " link" + plural + " no vigente" + plural + " -",
			"precisión " + porcVigentes + "%\n"
		);

		// Fin
		return;
	},
	porLinkYT: async (videoId) => {
		// Variables
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
	porLinkTerm: async (link, vigente) => {
		// Actualiza en la BD
		if (!link.anoEstreno) {
			const prodAsoc = comp.obtieneDesdeCampo_id.prodAsoc(link);
			baseDatos
				.obtienePorId("links", link.id, entProdsAsocs)
				.then((n) => n[prodAsoc] && n[prodAsoc].anoEstreno)
				.then((anoEstreno) => anoEstreno && baseDatos.actualizaPorId("links", link.id, {anoEstreno}));
		}

		// CONSECUENCIAS - Actualiza el registro del link
		const statusRegistro_id = vigente ? aprobado_id : inactivar_id;
		const datosLink = {
			statusSugeridoPor_id: usAutom_id,
			statusSugeridoEn: new Date(),
			statusRegistro_id,
			motivo_id: vigente ? null : motivoVideoNoDisp_id,
			fechaVencim: null,
		};
		await baseDatos.actualizaPorId("links", link.id, datosLink);

		// CONSECUENCIAS - Actualiza los productos en los campos de 'links' y la variable de links vencidos
		await procsFM_PRL.accsEnDependsPorCambioDeStatus("links", {...link, statusRegistro_id});

		// Fin
		return;
	},
};
