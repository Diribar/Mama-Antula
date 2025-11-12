import express from "express";
// import API from "./LT-controlApi.mjs";
import vista from "./LT-controlVista.js";

// Middlewares
import validaRuta from "../../middlewares/1-lectura/LT-validaRuta.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/", vista.temas);
router.get("/:urlSeccion", validaRuta); // la middleware redirige
router.get("/:urlSeccion/:urlTema", validaRuta, vista.temas);
router.get("/:urlSeccion/:urlTema/:urlPestana", validaRuta, vista.pestanas);

// ✅ Export
export default router;
