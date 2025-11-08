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

const conversorAjpg = {
	webp: async (file) => {
		// 🟢 1. Crea un objeto Image y carga el archivo WebP desde una URL temporal
		const img = new Image();
		img.src = URL.createObjectURL(file);
		await img.decode();

		// 🧹 2. Libera la URL temporal para evitar fugas de memoria
		URL.revokeObjectURL(img.src);

		// 🎨 3. Crea un canvas del mismo tamaño que la imagen original
		canvas.width = img.width;
		canvas.height = img.height;

		// 🖌️ 4. Dibuja la imagen WebP en el canvas
		ctx.drawImage(img, 0, 0);

		// 🔄 5. Convierte el contenido del canvas en un Blob JPEG (calidad 90%)
		const blob = await new Promise((resolve) => canvas.toBlob(resolve, "image/jpeg", 0.9));

		// 🧾 6. Crea un nuevo archivo con el mismo nombre pero extensión .jpg
		const baseName = file.name.replace(/\.[^/.]+$/, ""); // quita cualquier extensión
		const nuevoNombre = baseName + ".jpg";
		const nuevoFile = new File([blob], nuevoNombre, {type: "image/jpeg"});

		// Fin
		return nuevoFile;
	},
};
