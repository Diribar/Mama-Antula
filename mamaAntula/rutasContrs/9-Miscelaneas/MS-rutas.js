import express from "express";
import vista from "./MS-controlVista.js";

// Middlewares de Vista
import soloActualiz from "../../middlewares/8-Usuarios-Roles/US-Solo3Actualiz.js";

// 🧩 Router
const router = express.Router();

// 🖥️ Vistas
router.get("/contactanos", vista.contactanos);
router.get("/biblioteca", vista.biblioteca);
router.get("/capacitacion", soloActualiz, vista.capacitacion);

// ✅ Export
export default router;
