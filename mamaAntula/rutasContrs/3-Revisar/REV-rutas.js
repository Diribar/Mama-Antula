// Imports
import express from "express";
import API from "./REV-controlApi.js";
import vista from "./REV-controlVista.js";

// Middlewares de Vista
import soloRevisor from "../../middlewares/8-Usuarios-Roles/US-Solo4Revisor.js";

// Middlewares de API - valida errores

// Middlewares de API - captura

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/rev-datos-inciales", API.encabezado.datosIniciales);
router.put("/api/rev-encabezado-cambios-status", API.encabezado.cambiosStatus);

// 🖥️ Vistas
router.get("/", soloRevisor, vista.revisar);

// ✅ Export
export default router;
