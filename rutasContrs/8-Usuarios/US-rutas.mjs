import express from "express";
import API from "./US-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/login", API.login);
router.get("/api/logout", API.logout);


// 🖥️ Vistas
router.get(rutasUsuario.altaOlvido, vista.altaOlvido);
router.get(rutasUsuario.edicion, vista.edicion);
router.get("/cambio-de-roles", vista.cambioRoles);

// ✅ Export
export default router;
