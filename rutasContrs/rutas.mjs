import express from "express";
import {fileURLToPath, pathToFileURL} from "url";
// import API from "./controlAPI.mjs";
import vista from "./controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/lk-valida", API.valida);

// 🖥️ Vistas
router.get("/", vista.secciones);
router.get("/:params", vista.secciones);

// ✅ Export
export default router;
