const procesaArchImg = (files) => {
	// Si no hay una imagen, interrumpe la función
	if (!files.length) return;

	// Si no tiene extensión de imagen o supera el tamaño maximo permitido, interrumpe la función
	const file = files[0];
	const maxBytes = 1024000; // 1 MB
	if (!file.type.startsWith("image/") || file.size > maxBytes) return file;

	// Lee el archivo
	const reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = () => {
		// Valida que el contenido sea una imagen (renderizable)
		const image = new Image();
		image.src = reader.result;

		// Acciones si realmente es una imagen
		image.onload = async () => {
			DOM.vistaImagen.src = reader.result; // hace visible la imagen
			return file;
		};

		// Acciones si no es una imagen
		image.onerror = async () => null;
	};
};
