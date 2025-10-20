import express from "express";
import API from "./US-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/login", API.login);

// 🖥️ Vistas
router.get("/abm", vista.abm);
router.get("/cambioRol", vista.cambioRol);

// ✅ Export
export default router;
