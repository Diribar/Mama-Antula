export default (req, res, next) => {
	// Variables
	const {nombre, email, institucion, mensaje} = req.body;
	mensajes = [];

	// Validaciones básicas
	if (!nombre || !email || !mensaje) return res.json({error: "Por favor completá todos los campos obligatorios."});

	// Valida nombre
	const errorNombre = comp.validacs.longitud(nombre, 3, 50);
	if (errorNombre) mensajes.push(errorNombre.replace("contenido", "nombre"));

	// Valida email
	const errorEmail = comp.validacs.formatoMail(email);
	if (errorEmail) mensajes.push(errorEmail);

	// Valida institución
	if (institucion) {
		const errorInstitucion = comp.validacs.longitud(institucion, 3, 100);
		if (errorInstitucion) mensajes.push(errorInstitucion.replace("El contenido", "El nombre de la institución"));
	}

	// Valida mensaje
	const errorMensaje = comp.validacs.longitud(mensaje, 10, 1000);
	if (errorMensaje) mensajes.push(errorMensaje.replace("contenido", "mensaje"));

	// Consolida los errores
	const error = preparaLaRespuesta(mensajes);
	if (error) return res.json({error});

	// Fin
	return next();
};

// Variables
let mensajes;

// Funciones
const preparaLaRespuesta = (mensajes) => {
	// Variables
	let error;

	// Un sólo mensaje
	if (mensajes.length == 1) error = mensajes[0];

	// Más de un mensaje
	if (mensajes.length > 1) {
		const ulMensajes = mensajes.map((n) => "<li>" + n + "</li>");
		error = "Necesitamos que soluciones lo siguiente:<ul>" + ulMensajes.join("") + "</ul>";
	}

	// Fin
	return error;
};
