import express from "express";
import API from "./ABM-controlApi.mjs";
import vista from "./ABM-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/abm-datos-inciales", API.datosIniciales);

// 🖥️ Vistas
router.get("/actualizar", vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
