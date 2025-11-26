"use strict";
import procesos from "./REV-procesos.js";
const temaVista = "revisar";

export default {
	revisar: async (req, res) => {
		// Variables
		const tituloPagina = iconosAgrupados.find((n) => n.codigo == temaVista)?.nombre;
		console.log(9,tituloPagina);


		// Obtiene el encabezado a revisar
		const encabsRevisar = await procesos.obtieneEncabsRevisar();
		const encabezado =
			(encabsRevisar.length > 1 && procesos.obtieneEncabRevisar(encabsRevisar)) ||
			(encabsRevisar.length == 1 && encabsRevisar[0]) ||
			{};

		// Completa el encabezado
		encabezado.usuario = await baseDatos.obtienePorId("usuarios", encabezado.statusSugeridoPor_id);
		encabezado.contenidos = await baseDatos
			.obtieneTodosPorCondicion("contenidos", {encab_id: encabezado.id}, ["layout", "carrusel"])
			.then((n) => n.sort((a, b) => a.orden - b.orden));

		// Variables para la vista
		const {seccion, tema, pestana} = encabezado;
		const seccionTema = seccion.nombre + " - " + tema.titulo + (pestana ? " - " + pestana.nombre : "");
		encabezado.imagenUsuario = encabezado.usuario.imagen
			? "/imgsEditables/8-Usuarios/" + encabezado.usuario.imagen
			: "/imgsEstables/Varios/usuarioGenerico.jpg";

		// Fin
		return res.render("CMP-0Estructura", {
			...{tituloPagina, temaVista},
			...{seccionTema, encabezado},
		});
	},
};
