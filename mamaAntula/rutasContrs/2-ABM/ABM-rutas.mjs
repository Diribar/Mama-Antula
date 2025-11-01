// Imports
import express from "express";
import API from "./ABM-controlApi.mjs";
import vista from "./ABM-controlVista.mjs";

// Middlewares
import soloEdicion from "../../middlewares/usuarios/US-3SoloEdicion.mjs";
import descargaArch from "../../middlewares/CMP-descargaArch.mjs";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Obtiene información
router.get("/api/abm-datos-inciales", API.datosIniciales);
router.get("/api/abm-obtiene-encabezados", API.obtieneEncabs);
router.get("/api/abm-obtiene-contenidos", API.obtieneContenidos);

// APIs - Cambios en BD
router.post("/api/abm-guarda-encabezado", descargaArch.single("archivo"), API.guardaEncabezado);
router.delete("/api/abm-elimina-encabezado", API.eliminaEncabezado);
router.post("/api/abm-guarda-contenido", API.guardaContenido);
router.delete("/api/abm-elimina-contenido", API.eliminaContenido);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
