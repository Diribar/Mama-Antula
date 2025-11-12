// Imports
import express from "express";
import API from "./ABM-controlApi.js";
import vista from "./ABM-controlVista.js";

// Middlewares
import soloEdicion from "../../middlewares/8-usuarios/US-3SoloEdicion.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";
import captura from "../../middlewares/captura.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Obtiene información
router.get("/api/abm-datos-inciales", API.datosIniciales);
router.get("/api/abm-obtiene-encabezados", API.obtieneEncabs);
router.get("/api/abm-obtiene-contenidos", API.obtieneContenidos);

// APIs - Cambios en BD - Encabezado
router.post("/api/abm-guarda-encabezado", descargaImg.none(), API.encabezado.guarda); // se usa multer para que procese el formData
router.delete("/api/abm-elimina-encabezado", API.encabezado.elimina);

// APIs - Cambios en BD - Contenido Actual
router.put("/api/abm-baja-contenido", API.contActual.baja);
router.put("/api/abm-sube-contenido", API.contActual.sube);
router.delete("/api/abm-elimina-contenido", API.contActual.elimina);

// APIs - Cambios en BD - Contenido Nuevo
router.post("/api/abm-guarda-nuevo-contenido", descargaImg.single("archivo"), imgEnReqBody, API.guardaNuevo);
router.post("/api/abm-guarda-nuevo-carrusel", descargaImg.array("archivos"), imgEnReqBody, API.guardaNuevo);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, captura, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
