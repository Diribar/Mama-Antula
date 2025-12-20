"use strict";

import express from "express";
import API from "./LT-controlApi.js";
import vista from "./LT-controlVista.js";

// Middlewares
import validaRuta from "../../middlewares/1-Lectura/LT-validaRuta.js";
import actualizaCookies from "../../middlewares/1-Lectura/LT-actualizaCookies.js";
import libera from "../../middlewares/1-Lectura/LT-liberaTemaPestana.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
const combo = [validaRuta, actualizaCookies, libera];

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.post("/:urlSeccion/:urlTema/api/lt-filtros", descargaImg.none(), API.filtros);

// 🖥️ Vistas
router.get("/", combo, vista.temas);
router.get("/:urlSeccion", combo); // la middleware redirige
router.get("/:urlSeccion/:urlTema", combo, vista.temas);
router.get("/:urlSeccion/:urlTema/:urlPestana", combo, vista.pestanas);

// ✅ Export
export default router;
