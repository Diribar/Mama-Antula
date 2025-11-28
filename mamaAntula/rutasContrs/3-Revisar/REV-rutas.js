// Imports
import express from "express";
import API from "./REV-controlApi.js";
import vista from "./REV-controlVista.js";

// Middlewares de Vista
import soloRevisor from "../../middlewares/8-Usuarios-Roles/US-Solo4Revisor.js";

// Middlewares de API - valida errores
import encabStatus from "../../middlewares/2-Revisar/REV-1Status-Encab.js";
import edicion from "../../middlewares/2-Revisar/REV-2Edicion.js";
import contStatus from "../../middlewares/2-Revisar/REV-3Status-Cont.js";

// Middlewares de API - captura

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.put("/api/rev-status-encabezado", encabStatus, API.cambiosStatus.encabezado);
router.put("/api/rev-status-contenido", contStatus, API.cambiosStatus.contenido);
router.put("/api/rev-edicion", edicion, API.edicion);

// 🖥️ Vistas
router.get("/", soloRevisor, vista.revisar);

// ✅ Export
export default router;
