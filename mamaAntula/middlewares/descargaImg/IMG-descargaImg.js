"use strict";

// Imports
import multer from "multer";

// Guarda la imagen
export default multer({storage: multer.memoryStorage()});
