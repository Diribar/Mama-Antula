"use strict";

import express from "express";
import vista from "./LT-controlVista.js";

// Middlewares
import validaRuta from "../../middlewares/1-Lectura/LT-validaRuta.js";
import cookiesAct from "../../middlewares/1-Lectura/LT-cookiesActualizar.js";
import libera from "../../middlewares/1-Lectura/LT-libera.js";
const combo = [validaRuta, cookiesAct, libera];

// 🧩 Router
const router = express.Router();

// 🖥️ Vistas
router.get("/", combo, vista.temas);
router.get("/:urlSeccion", combo); // la middleware redirige
router.get("/:urlSeccion/:urlTema", combo, vista.temas);
router.get("/:urlSeccion/:urlTema/:urlPestana", combo, vista.pestanas);

// ✅ Export
export default router;
