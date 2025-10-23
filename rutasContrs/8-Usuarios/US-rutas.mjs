// Imports
import express from "express";
import API from "./US-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// Middlewares
import soloVisitas from "../../middlewares/permisosUsuario/US-1SoloVisitas.mjs";
import soloUsuarios from "../../middlewares/permisosUsuario/US-2SoloUsuarios.mjs";
import soloAdmin from "../../middlewares/permisosUsuario/US-3SoloAdmin.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/us-login", API.login);
router.get("/api/us-logout", API.logout);
router.get("/api/us-alta-de-mail-u-olvido-de-contrasena", API.altaOlvido);

// 🖥️ Vistas
router.get(rutasUsuario.altaOlvido, soloVisitas, vista.altaOlvido);
router.get(rutasUsuario.edicion, soloUsuarios, vista.edicion);
router.get(rutasUsuario.cambioRoles, soloAdmin, vista.cambioRoles);

// ✅ Export
export default router;
