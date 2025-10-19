import express from "express";
import {fileURLToPath, pathToFileURL} from "url";
import API from "./controlAPI.mjs";
import vista from "./controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/", vista.secciones);
router.get("/:params", vista.secciones);
// router.get("/:params1/:params2", vista.secciones);
// router.get("/:params1/:params2/:params3", vista.secciones);

// ✅ Export
export default router;
