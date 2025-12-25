import express from "express";
import API from "./MS-controlApi.js";
import vista from "./MS-controlVista.js";

// Middlewares
import validarContactanos from "../../middlewares/9-Miscelaneas/MS-Contactanos.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import soloActualiz from "../../middlewares/8-Usuarios-Roles/US-Solo3Actualiz.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.post("/busqueda-rapida/api/busca-en-bd", API.busquedaRapida);
router.post("/contactanos/api/enviar", descargaImg.none(), validarContactanos, API.contactanos);

// 🖥️ Vistas
router.get("/contactanos", vista.contactanos);
router.get("/videos", vista.videos);
router.get("/biblioteca", soloActualiz, vista.biblioteca);

// ✅ Export
export default router;
