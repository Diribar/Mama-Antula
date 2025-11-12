// Imports
import express from "express";
import API from "./ABM-controlApi.js";
import vista from "./ABM-controlVista.js";

// Middlewares de Vista
import soloEdicion from "../../middlewares/8-usuarios/US-3SoloEdicion.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";

// Middlewares de API
import captura from "../../middlewares/2-ABM/captura.js";
import erroresFiltros from "../../middlewares/2-ABM/errores-1Filtros.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Filtros
router.get("/api/abm-filtros-datos-inciales", API.datosIniciales);
router.get("/api/abm-filtros-obtiene-encabezados", erroresFiltros, captura, API.obtieneEncabs);

// APIs - Encabezado
router.post("/api/abm-encabezado-guarda", descargaImg.none(), API.encabezado.guarda); // se usa multer para que procese el formData
router.delete("/api/abm-encabezado-elimina", API.encabezado.elimina);

// APIs - Contenido Actual
router.get("/api/abm-obtiene-contenidos", API.obtieneContenidos);
router.put("/api/abm-baja-contenido", API.contActual.baja);
router.put("/api/abm-sube-contenido", API.contActual.sube);
router.delete("/api/abm-elimina-contenido", API.contActual.elimina);

// APIs - Contenido Nuevo
router.post("/api/abm-guarda-nuevo-contenido", descargaImg.single("archivo"), imgEnReqBody, API.guardaNuevo);
router.post("/api/abm-guarda-nuevo-carrusel", descargaImg.array("archivos"), imgEnReqBody, API.guardaNuevo);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
