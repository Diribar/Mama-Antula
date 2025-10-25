// Imports
import express from "express";
import API from "./US-controlApi.mjs";
import vista from "./US-controlVista.mjs";

// Middlewares
import soloVisitas from "../../middlewares/permisosUsuario/US-1SoloVisitas.mjs";
import soloUsuarios from "../../middlewares/permisosUsuario/US-2SoloUsuarios.mjs";
import soloAdmin from "../../middlewares/permisosUsuario/US-3SoloAdmin.mjs";
import descarga from "../../middlewares/transversales/CMP-descargaArch.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs
router.get("/api/us-envia-contrasena-por-mail", API.altaOlvido);
router.post("/api/us-realiza-login", API.login);
router.get("/api/us-realiza-logout", API.logout);
router.post("/api/us-valida-campo-edicion", API.edicion.validaCampo);
router.post("/api/us-guarda-edicion-en-usuario", descarga.single("imagen"), API.edicion.revisaGuarda);
router.post("/api/us-cambio-roles", API.cambioRoles);

// 🖥️ Vistas
router.get(rutasUsuario.altaOlvido, soloVisitas, vista.altaOlvido);
router.get(rutasUsuario.edicion, soloUsuarios, vista.edicion);
router.get(rutasUsuario.cambioRoles, soloAdmin, vista.cambioRoles);

// ✅ Export
export default router;
