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


// ✅ Export
export default router;
