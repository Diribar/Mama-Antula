import express from "express";
// import API from "./LT-controlApi.mjs";
import vista from "./ABM-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/edicion", vista.edicion);
router.get("/revision", vista.revision);

// ✅ Export
export default router;
