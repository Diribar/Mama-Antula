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
router.get("/", vista.landingPage);
router.get("/:urlSeccion", validaRuta, vista.redirige); // la middleware redirige
router.get("/cartas-y-escritos/cartas", vista.conIndice);
router.get("/experiencias/:urlTema", validaRuta, vista.conIndice);
router.get("/experiencias/:urlTema/:urlPestana", validaRuta, vista.expers.pestanas);
router.get("/:urlSeccion/:urlTema", validaRuta, vista.temas);
router.get("/:urlSeccion/:urlTema/:urlPestana", validaRuta, vista.pestanas);

// ✅ Export
export default router;
