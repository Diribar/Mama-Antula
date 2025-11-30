import express from "express";
import vista from "./MS-controlVista.js";

// Middlewares de Vista
import soloActualiz from "../../middlewares/8-Usuarios-Roles/US-Solo3Actualiz.js";
import soloVisitasAct from "../../middlewares/8-Usuarios-Roles/US-Solo1VisitasActualiz.js";

// 🧩 Router
const router = express.Router();

// 🖥️ Vistas
router.get("/contactanos", vista.contactanos);
router.get("/biblioteca", soloActualiz, vista.biblioteca);
router.get("/videos", soloVisitasAct, vista.videos);

// ✅ Export
export default router;
