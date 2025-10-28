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
router.get("/:urlSeccion", validaRuta, vista.secciones);
router.get("/:urlSeccion/:urlTema", validaRuta, vista.secciones);
router.get("/:urlSeccion/:urlTema/:urlPestana", validaRuta, vista.secciones);

// ✅ Export
export default router;
