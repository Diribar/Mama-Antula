import express from "express";
// import API from "./US-controlApi.mjs";
import vista from "./MS-controlVista.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/login", API.login);
// router.get("/api/logout", API.logout);


// 🖥️ Vistas
router.get("/contactanos", vista.contactanos);
router.get("/prueba1", vista.prueba1);
router.get("/prueba2", vista.prueba2);


// ✅ Export
export default router;
