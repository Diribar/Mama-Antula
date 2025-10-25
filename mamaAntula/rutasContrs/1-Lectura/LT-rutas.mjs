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
router.get("/:params", validaRuta, vista.secciones);

// ✅ Export
export default router;
