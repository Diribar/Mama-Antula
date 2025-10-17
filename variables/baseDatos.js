"use strict";

module.exports = {
	lecturasDeBd: async () => {
		// Obtiene las lecturas de BD
		const lecturas = {
			// Niveles
			secciones: baseDatos.obtieneTodosConOrden("secciones", "orden"),
			temas: baseDatos.obtieneTodosConOrden("temas", "orden"),
			pestanas: baseDatos.obtieneTodosConOrden("pestanas", "orden"),

			// Cartas
			// idiomas: baseDatos.obtieneTodosConOrden("idiomas", "orden"),
			// lugares: baseDatos.obtieneTodosConOrden("lugares", "orden"),
			// personajes: baseDatos.obtieneTodosConOrden("personajes", "orden"),

			// Otros
			//novedadesWeb: baseDatos.obtieneTodosConOrden("novedadesWeb", "fecha"),
		};

		// Await
		const valores = await Promise.all(Object.values(lecturas));
		Object.keys(lecturas).forEach((campo, i) => (lecturas[campo] = valores[i]));

		// Fin
		return lecturas;
	},
	datosPartics: () => {
		// Variables
		const respuesta = {
			// 2. Tipos de actuación
			anime_id: tiposActuacion.find((n) => n.codigo == "anime").id,
			documental_id: tiposActuacion.find((n) => n.codigo == "documental").id,
			actuada_id: tiposActuacion.find((n) => n.codigo == "actuada").id,

			// 4. Públicos
			mayores_ids: publicos.filter((n) => n.mayores).map((n) => n.id),
			familia_ids: publicos.filter((n) => n.familia).map((n) => n.id),
			menores_ids: publicos.filter((n) => n.menores).map((n) => n.id),

			// Otros - Productos
			atributosCalific: {feValores, entretiene, calidadTecnica},
			pppOpcsSimples: pppOpcsArray.filter((n) => !n.combo),
			hablaHispana: paises.filter((n) => n.idioma_id == "ES"),
			hablaNoHispana: paises.filter((n) => n.idioma_id != "ES"),
			cnLayouts_ids: cnLayouts.map((n) => n.id),

			// Links
			linkPelicula_id: linksTipos.find((n) => n.pelicula).id,
			linkTrailer_id: linksTipos.find((n) => n.trailer).id,
			provsEmbeded: linksProvs.filter((n) => n.embededAgregar),
			provsValidacAutom_ids: linksProvs.filter((n) => n.validacAutom).map((n) => n.id),

			// Otros
			cnCabeceraDefault: cnRegsCabecera.find((n) => n.id == cnCabeceraDefault_id),
			epocaVarias: epocasOcurrencia.find((n) => n.id == "var"),
			epocasSinVarias: epocasOcurrencia.filter((n) => n.id != "var"),
			motivoInfoErronea: edicsMotivos.find((n) => n.codigo == "infoErronea"),
			motivoVersionActual: edicsMotivos.find((n) => n.codigo == "versionActual"),
			motivoDupl_id: statusMotivos.find((n) => n.codigo == "duplicado").id,
		};

		// Preferencias por producto
		respuesta.pppOpcsObj = {};
		for (const pppOcion of pppOpcsArray)
			respuesta.pppOpcsObj[pppOcion.codigo] = pppOpcsArray.find((n) => n.codigo == pppOcion.codigo);

		// Fin
		return respuesta;
	},
};
