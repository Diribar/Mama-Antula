// Imports
import express from "express";
import API from "./ABM-controlApi.js";
import vista from "./ABM-controlVista.js";

// Middlewares
import soloEdicion from "../../middlewares/usuarios/US-3SoloEdicion.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Obtiene información
router.get("/api/abm-datos-inciales", API.datosIniciales);
router.get("/api/abm-obtiene-encabezados", API.obtieneEncabs);
router.get("/api/abm-obtiene-contenidos", API.obtieneContenidos);

// APIs - Cambios en BD
router.post("/api/abm-guarda-encabezado", descargaImg.none(), API.guardaEncabezado); // se usa multer para que procese el formData
router.delete("/api/abm-elimina-encabezado", API.eliminaEncabezado);
router.post("/api/abm-guarda-contenido", descargaImg.single("archivo"), imgEnReqBody, API.guardaContenido);
router.post("/api/abm-guarda-carrusel", descargaImg.array("archivo"), imgEnReqBody, API.guardaContenido);
router.delete("/api/abm-elimina-contenido", API.eliminaContenido);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
