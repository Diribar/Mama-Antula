// 🔧 Recursos reutilizables
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");

// Funciones
const procesaArchImg = (file, vistaImagen) =>
	new Promise((resolve) => {
		// Si no tiene extensión de imagen o supera el tamaño maximo permitido, interrumpe la función
		const tamMaxArch = 1024 * 1024; // 1 MB
		if (!file.type.startsWith("image/") || file.size > tamMaxArch) return resolve(file);

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

const conversorJpg = async (file) => {
	// 🟢 1. Crea un objeto Image y carga el archivo desde una URL temporal
	const img = new Image();
	const objectURL = URL.createObjectURL(file);
	img.src = objectURL;
	await img.decode();

	// 🧹 2. Libera la URL temporal (previene fugas de memoria)
	URL.revokeObjectURL(objectURL);

	// 🎨 3. Ajusta el tamaño del canvas solo si cambió
	if (canvas.width !== img.width || canvas.height !== img.height) {
		canvas.width = img.width;
		canvas.height = img.height;
	} else {
		// Limpia si el tamaño es igual (evita restos de imagen anterior)
		ctx.clearRect(0, 0, canvas.width, canvas.height);
	}

	// 🖌️ 4. Dibuja la imagen en el canvas
	ctx.fillStyle = "white"; // sobre fondo blanco
	ctx.fillRect(0, 0, canvas.width, canvas.height);
	ctx.drawImage(img, 0, 0);

	// 🔄 5. Convierte el contenido del canvas en un Blob JPEG (calidad 90%)
	const blob = await new Promise((resolve) => canvas.toBlob(resolve, "image/jpeg", 0.9));

	// 🧾 6. Crea un nuevo archivo con el mismo nombre pero extensión .jpg
	const baseName = file.name.replace(/\.[^/.]+$/, ""); // quita cualquier extensión
	const nuevoNombre = baseName + ".jpg";
	const nuevoFile = new File([blob], nuevoNombre, {type: "image/jpeg"});

	// Fin
	return nuevoFile;
};
