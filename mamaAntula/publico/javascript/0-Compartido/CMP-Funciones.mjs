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
const deleteJson = (datos) => ({method: "DELETE", headers: {"Content-Type": "application/json"}, body: JSON.stringify(datos)});
const postForm = (formData) => ({method: "POST", body: formData});
const cookie = (metodo) => {
	// Variables
	const cookies = document.cookie.split("; "); // separa las cookies individuales
	const respuesta = {};

	// Recorre las cookies
	for (const cookie of cookies) {
		const [key, value] = cookie.split("="); // separa nombre y valor
		respuesta[key] = value;
	}

	// Fin
	return respuesta[metodo];
};
