"use strict";

// Definir variables
import nodemailer from "nodemailer";

// Exportar
export default {
	fechaHora: {
		// En uso
		anoMesDia: (fecha) => new Date(fecha).toISOString().slice(0, 10),
		ahora: () => new Date(new Date().toUTCString()), // <-- para convertir en horario 'UTC'

		// Sin uso
		// nuevoHorario: (delay, horario) => FN.nuevoHorario(delay, horario),
		// diaMesUTC: (fecha) => FN.diaMesUTC(fecha),
		// diaSemUTC: (fecha) => {
		// 	const numDiaSem = new Date(fecha).getUTCDay();
		// 	const diaSem = diasSem[numDiaSem];
		// 	return diaSem;
		// },
		// diaMesAnoUTC: function (fecha) {
		// 	// Variables
		// 	fecha = new Date(fecha);
		// 	const diaMes = this.diaMesUTC(fecha);
		// 	const ano = fecha.getUTCFullYear().toString().slice(-2);
		// 	const diaMesAno = diaMes + "/" + ano;

		// 	// Fin
		// 	return diaMesAno;
		// },
		// horarioUTC: function (fecha) {
		// 	const horario = fecha ? new Date(fecha) : this.ahora();
		// 	const hora = horario.getUTCHours();
		// 	const minutos = String(horario.getUTCMinutes()).padStart(2, "0");
		// 	const horaResp = hora + ":" + minutos + "hs (UTC)";
		// 	return horaResp;
		// },
		// fechaDelAno: (fecha) => {
		// 	let datos = {};
		// 	if (fecha.fechaDelAno_id && fecha.fechaDelAno_id <= 366) {
		// 		let fechaDelAno = fechasDelAno.find((n) => n.id == fecha.fechaDelAno_id);
		// 		datos.dia = fechaDelAno.dia;
		// 		datos.mes_id = fechaDelAno.mes_id;
		// 	}
		// 	// Fin
		// 	return datos;
		// },
	},
	obtieneUsuarioPorMail: (email) => {
		const include = ["rol", "statusRegistro", "genero"];
		return baseDatos.obtienePorCondicion("usuarios", {email}, include);
	},
	omitirMiddlewsTransv: (req) => {
		// Si es un url irrelevante
		if (["/favicon.ico"].includes(req.originalUrl)) return true;
		if (req.originalUrl.includes("/api/")) return true;
		if (req.originalUrl == "/.well-known/appspecific/com.chrome.devtools.json") return true;
		if (req.originalUrl.startsWith("/xmlrpc.php")) return true;
		if (["/imgsEstables/", "/imgsEditables/", "/9-Imagenes/"].some((n) => req.originalUrl.startsWith(n))) return true;

		// Si se desconoce el origen
		if (!req.headers["user-agent"]) return true;

		// Si es una aplicación conocida que no es de navegación, pero que muestra datos del url visitado
		if (requestsTriviales.some((n) => req.headers["user-agent"].startsWith(n))) return true;

		// Fin
		return false;
	},
};
