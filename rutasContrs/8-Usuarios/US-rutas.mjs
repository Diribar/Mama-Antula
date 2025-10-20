import express from "express";
// import API from "./LT-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/temas-pestanas", API.temasPestanas);

// 🖥️ Vistas
router.get("/abm", vista.abm);
router.get("/cambioRol", vista.cambioRol);

// ✅ Export
export default router;
