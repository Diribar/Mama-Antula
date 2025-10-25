import express from "express";
// import API from "./US-controlApi.mjs";
import vista from "./MS-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
// router.get("/api/login", API.login);
// router.get("/api/logout", API.logout);


// 🖥️ Vistas
router.get("/contactanos", vista.contactanos);
router.get("/estadisticas", vista.estadisticas);

// ✅ Export
export default router;
