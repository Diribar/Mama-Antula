// Imports
import express from "express";
import API from "./US-controlApi.js";
import vista from "./US-controlVista.js";

// Middlewares - Validación de ABM
import validaAltaOlvido from "../../middlewares/8-Usuarios-ABM/US-1AltaOlvido.js";
import validaEdicion from "../../middlewares/8-Usuarios-ABM/US-2Edicion.js";
import validaCambioRol from "../../middlewares/8-Usuarios-ABM/US-3CambioRol.js";
import validaLogin from "../../middlewares/8-Usuarios-ABM/US-Login.js";

// Middlewares - Validación de Roles
import soloVisitas from "../../middlewares/8-Usuarios-Roles/US-Solo1Visitas.js";
import soloUsuarios from "../../middlewares/8-Usuarios-Roles/US-Solo2Usuarios.js";
import soloAdmin from "../../middlewares/8-Usuarios-Roles/US-Solo5Admin.js";

// Middlewares - Descarga imagenes
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - ABM
router.post("/api/us-alta-olvido-contrasena", validaAltaOlvido, API.altaOlvido);
router.put("/api/us-edicion-de-usuario-campo", validaEdicion); // se responde con la API
router.put("/api/us-edicion-de-usuario-elimina-imagen", API.edicion.eliminaImagen);
router.put("/api/us-edicion-de-usuario-guarda", descargaImg.single("archivo"), imgEnReqBody, validaEdicion, API.edicion.guarda);
router.put("/api/us-cambio-de-roles", validaCambioRol, API.cambiaRoles);

// APIs - Login
router.post("/api/us-login", validaLogin, API.login);
router.get("/api/us-logout", API.logout);

// 🖥️ Vistas
router.get(rutasUsuario.altaOlvido, soloVisitas, vista.altaOlvido);
router.get(rutasUsuario.edicion, soloUsuarios, vista.edicion);
router.get(rutasUsuario.cambioRoles, soloAdmin, vista.cambioRoles);

// ✅ Export
export default router;
