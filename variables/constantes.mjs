"use strict";
// Variables
const unaHora = 60 * 60 * 1000;
const unDia = unaHora * 24;
const unaSemana = unDia * 7;
const unMes = unDia * 30;
const unAno = unDia * 365;

export default {
	logoInstitucional: "/imgsEstables/Varios/Institucional.jpg",
	...{unaHora, unDia, unaSemana, unMes, unAno},
};
