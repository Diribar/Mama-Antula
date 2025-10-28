import express from "express";
// import API from "./LT-controlApi.mjs";
import vista from "./LT-controlVista.mjs";

// Middlewares
import validaRuta from "../../middlewares/LT-validaRuta.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/", validaRuta, vista.secciones);
router.get("/:seccion", validaRuta, vista.secciones);
router.get("/:seccion/:tema", validaRuta, vista.secciones);
router.get("/:seccion/:tema/:pestana", validaRuta, vista.secciones);

// ✅ Export
export default router;
