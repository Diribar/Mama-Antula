const procesaArchImg = (files, vistaImagen) => {
	return new Promise((resolve, reject) => {
		// Si no hay una imagen, interrumpe la función
		if (!files.length) return resolve(null);

		// Si no tiene extensión de imagen o supera el tamaño maximo permitido, interrumpe la función
		const file = files[0];
		const maxBytes = 1024000; // 1 MB
		if (!file.type.startsWith("image/") || file.size > maxBytes) return resolve(file);

		// Lee el archivo
		const reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = () => {
			// Valida que el contenido sea una imagen (renderizable)
			const image = new Image();
			image.src = reader.result;

			// Acciones si realmente es una imagen
			image.onload = () => {
				vistaImagen.src = reader.result; // hace visible la imagen
				return resolve(file); // Resuelve la promesa con el archivo
			};

			// Si no es imagen, resuelve con null
			image.onerror = () => resolve(null);
		};

		// Si no se pudo leer el archivo, resuelve con null
		reader.onerror = () => resolve(null);
	});
};
