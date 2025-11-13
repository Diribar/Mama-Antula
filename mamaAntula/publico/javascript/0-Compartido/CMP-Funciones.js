// Variables
const mesesAbrev = ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"];

// Funciones con formularios
const postJson = (datos) => ({method: "POST", headers: {"Content-Type": "application/json"}, body: JSON.stringify(datos)});
const putJson = (datos) => ({method: "PUT", headers: {"Content-Type": "application/json"}, body: JSON.stringify(datos)});
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
const cartelDeError = (mensaje) =>
	Swal.fire({
		title: "Atención",
		html: mensaje, // Permite HTML
		icon: "warning",
		confirmButtonText: "Aceptar",
		confirmButtonColor: "rgb(79,98,40)", // verdeOscuro
		background: "rgb(242,242,242)", // grisClaro
	});
const cartelPregunta = ({mensaje, cancelButtonText, confirmButtonText}) =>
	Swal.fire({
		// General
		...{background: "rgb(242,242,242)", title: "Atención", icon: "warning", html: mensaje}, // grisClaro

		// Botón cancel
		...{showCancelButton: true, reverseButtons: true},
		...{cancelButtonText, cancelButtonColor: "firebrick"}, // rojoOscuro

		// Botón confirm
		...{confirmButtonText, confirmButtonColor: "rgb(79,98,40)"}, // verdeOscuro
	}).then(async (n) => n.isConfirmed);

// Funciones de uso general
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
const inicialMayus = (texto) => texto.slice(0, 1).toUpperCase() + texto.slice(1);
