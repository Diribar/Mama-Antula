const colorMensaje = (DOM, hay, mensaje) => {
	// Cambia el color en la respuesta
	DOM.mensaje.classList[!hay ? "add" : "remove"]("exito");
	DOM.mensaje.classList[hay ? "add" : "remove"]("error");
	DOM.mensaje.classList.remove("invisible");

	// Mensaje
	DOM.mensaje.innerHTML = mensaje;

	// Fin
	return;
};
const postJson = (datos) => ({method: "POST", headers: {"Content-Type": "application/json"}, body: JSON.stringify(datos)});
const postForm = (formData) => ({method: "POST", body: formData});
