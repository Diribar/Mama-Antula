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
import erroresEncabGuarda from "../../middlewares/2-ABM/errores-2Encab1Guarda.js";
import erroresEncabElimina from "../../middlewares/2-ABM/errores-2Encab2Elimina.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Filtros
router.get("/api/abm-filtros-datos-inciales", API.filtros.datosIniciales);
router.get("/api/abm-filtros-obtiene-encabezados", erroresFiltros, captura, API.filtros.obtieneEncabs);

// APIs - Encabezado
router.post("/api/abm-encabezado-guarda", descargaImg.none(), erroresEncabGuarda, API.encabezado.guarda); // se usa multer para que procese el formData
router.delete("/api/abm-encabezado-elimina", erroresEncabElimina, API.encabezado.elimina);

// APIs - Contenido Actual
router.get("/api/abm-contenido-obtiene", API.contActual.obtiene);
router.put("/api/abm-contenido-baja", API.contActual.baja);
router.put("/api/abm-contenido-sube", API.contActual.sube);
router.delete("/api/abm-contenido-elimina", API.contActual.elimina);

// APIs - Contenido Nuevo
router.post("/api/abm-nuevo-contenido-guarda", descargaImg.single("archivo"), imgEnReqBody, API.guardaNuevo);
router.post("/api/abm-nuevo-carrusel-guarda", descargaImg.array("archivos"), imgEnReqBody, API.guardaNuevo);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
