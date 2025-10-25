"use strict";
// Imports
import multer from "multer";

// Guarda la imagen
export default multer({
	storage: multer.diskStorage({
		destination: (req, file, cb) => cb(null, carpProvisorio),
		filename: (req, file, cb) => cb(null, path.basename(file.originalname)), // Date.now() + path.extname(file.originalname)
	}),
	fileFilter: (req, file, cb) => {
		const tamArchivo = Number(req.headers["content-length"]);
		console.log(13,tamArchivo <= tamMaxArch);
		return cb(null, tamArchivo <= tamMaxArch);
	},
});
