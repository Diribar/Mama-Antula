"use strict";

const revisaAvatar = async ({DOM, v, FN, version, indice}) => {
	// 1. Acciones si se omitió ingresar un archivo
	if (!DOM.inputImagen.value) {
		// Vuelve a la imagen original
		DOM.imgAvatar.src = v.avatarInicial;

		// Oculta el iconoOK
		if (DOM.ocultaOK_imagen) DOM.ocultaOK_imagen.classList.add("ocultaOK_imagen");

		// Actualiza los errores
		v.esImagen = true;
		await FN.actualizaVarios(indice);

		// Fin
		return;
	}

	// 2. De lo contrario, actualiza los errores y el avatar
	let reader = new FileReader();
	reader.readAsDataURL(DOM.inputImagen.files[0]);
	reader.onload = () => {
		let image = new Image();
		image.src = reader.result;

		// Acciones si es realmente una imagen
		image.onload = async () => {
			// Actualiza la imagen del avatar en la vista
			DOM.imgAvatar.src = reader.result;

			// Muestra el iconoOK
			if (DOM.ocultaOK_imagen) DOM.ocultaOK_imagen.classList.remove("ocultaOK_imagen");

			// Actualiza la variable 'avatar' en la versión 'edicN'
			if (DOM.inputAvatarEdicN && DOM.inputAvatarEdicN.value) version.edicN.avatar = DOM.inputAvatarEdicN.files[0].name;

			// Actualiza los errores
			v.esImagen = true;
			await FN.actualizaVarios(indice);

			// Fin
			return;
		};

		// Acciones si no es una imagen
		image.onerror = async () => {
			// Limpia el avatar
			DOM.imgAvatar.src = "/imgsPropio/Avatar/Sin-Avatar.jpg";

			// Actualiza la variable 'avatar' en la versión 'edicN'
			if (DOM.inputAvatarEdicN && DOM.inputAvatarEdicN.value) version.edicN.avatar = "";

			// Actualiza los errores
			v.esImagen = false;
			await FN.actualizaVarios(indice);

			// Limpia el input
			DOM.inputImagen.value = ""; // va después de 'actualiza los errores' para poner en evidencia que el error es el tipo de archivo

			// Fin
			return;
		};
	};
};
