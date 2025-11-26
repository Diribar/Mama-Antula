// Imports
import express from "express";
import API from "./REV-controlApi.js";
import vista from "./REV-controlVista.js";

// Middlewares de Vista

// Middlewares de API - valida errores

// Middlewares de API - captura

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.put("/api/rev-aprueba-encabezado", API.encabezado.aprueba);
router.put("/api/rev-rechaza-encabezado", API.encabezado.rechaza);

// 🖥️ Vistas
router.get("/", vista.revisar);

// ✅ Export
export default router;
