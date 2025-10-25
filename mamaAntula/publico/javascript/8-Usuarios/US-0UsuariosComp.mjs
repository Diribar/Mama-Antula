const fnUsuariosComp = {
	colorMensaje: () => {
		// Cambia el color en la respuesta
		DOM.mensaje.classList[!v.errores.hay ? "add" : "remove"]("exito");
		DOM.mensaje.classList[v.errores.hay ? "add" : "remove"]("error");
		DOM.mensaje.classList.remove("invisible");

		// Fin
		return;
	},
};
