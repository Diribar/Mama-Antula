const fnUsuariosComp = {
	colorMensaje: (DOM, hay, mensaje) => {
		// Cambia el color en la respuesta
		DOM.mensaje.classList.remove("invisible");
		DOM.mensaje.classList[!hay ? "add" : "remove"]("exito");
		DOM.mensaje.classList[hay ? "add" : "remove"]("error");

		// Mensaje
		if (mensaje) setTimeout(() => (DOM.mensaje.innerHTML = mensaje), 500);

		// Fin
		return;
	},
};
