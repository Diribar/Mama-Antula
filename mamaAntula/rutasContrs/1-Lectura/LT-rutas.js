import express from "express";
import vista from "./LT-controlVista.js";

// Middlewares
import validaRuta from "../../middlewares/1-Lectura/LT-validaRuta.js";
import libera from "../../middlewares/1-Lectura/LT-libera.js";

// 🧩 Router
const router = express.Router();

// 🖥️ Vistas
router.get("/", validaRuta, libera, vista.temas);
router.get("/:urlSeccion", validaRuta, libera); // la middleware redirige
router.get("/:urlSeccion/:urlTema", validaRuta, libera, vista.temas);
router.get("/:urlSeccion/:urlTema/:urlPestana", validaRuta, libera, vista.pestanas);

// ✅ Export
export default router;
