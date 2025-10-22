import express from "express";
import API from "./US-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/us-login", API.login);
router.get("/api/us-logout", API.logout);
router.get("/api/us-alta-de-mail-u-olvido-de-contrasena", API.altaOlvido);

// 🖥️ Vistas
router.get(rutasUsuario.altaOlvido, vista.altaOlvido);
router.get(rutasUsuario.edicion, vista.edicion);
router.get("/cambio-de-roles", vista.cambioRoles);

// ✅ Export
export default router;
