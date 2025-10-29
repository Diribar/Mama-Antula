import express from "express";
// import API from "./LT-controlApi.mjs";
import vista from "./ABM-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/actualizar", vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
