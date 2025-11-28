// Imports
import express from "express";
import API from "./REV-controlApi.js";
import vista from "./REV-controlVista.js";

// Middlewares de Vista
import soloRevisor from "../../middlewares/8-Usuarios-Roles/US-Solo4Revisor.js";

// Middlewares de API - valida errores
import encabStatus from "../../middlewares/2-Revisar/REV-Encab-Status.js";
import encabEdicion from "../../middlewares/2-Revisar/REV-Encab-Edicion.js";

// Middlewares de API - captura

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.put("/api/rev-encabezado-cambios-status", encabStatus, API.encabezado.cambiosStatus);
router.put("/api/rev-contenido-cambios-status", API.cambiosStatus);
router.put("/api/rev-encabezado-edicion", encabEdicion, API.encabezado.edicion);

// 🖥️ Vistas
router.get("/", soloRevisor, vista.revisar);

// ✅ Export
export default router;
