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
