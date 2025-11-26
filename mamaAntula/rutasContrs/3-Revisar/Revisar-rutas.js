// Imports
import express from "express";
import API from "./ABM-controlApi.js";
import vista from "./ABM-controlVista.js";

// Middlewares de Vista

// Middlewares de API - valida errores

// Middlewares de API - captura

// 🧩 Router
const router = express.Router();

// 📡 APIs

// 🖥️ Vistas
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
