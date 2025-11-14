// Imports
import express from "express";
import API from "./ABM-controlApi.js";
import vista from "./ABM-controlVista.js";

// Middlewares de Vista
import soloEdicion from "../../middlewares/8-Usuarios/US-Solo3Edicion.js";
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";

// Middlewares de API - valida errores
import validaFiltros from "../../middlewares/2-ABM/ABM-1Filtros.js";
import validaEncabGuarda from "../../middlewares/2-ABM/ABM-2Encab1Guarda.js";
import validaEncabElimina from "../../middlewares/2-ABM/ABM-2Encab2Elimina.js";
import validaContActual from "../../middlewares/2-ABM/ABM-3ContActual.js";

// Middlewares de API - captura
import captura from "../../middlewares/2-ABM/ABM-captura.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Filtros
router.get("/api/abm-filtros-datos-inciales", API.filtros.datosIniciales);
router.get("/api/abm-filtros-obtiene-encabezados", validaFiltros, captura, API.filtros.obtieneEncabs);

// APIs - Encabezado
router.post("/api/abm-encabezado-guarda", descargaImg.none(), validaEncabGuarda, API.encabezado.guarda); // se usa multer para que procese el formData
router.delete("/api/abm-encabezado-elimina", validaEncabElimina, API.encabezado.elimina);

// APIs - Contenido Actual
router.get("/api/abm-contenido-obtiene", API.contActual.obtiene);
router.put("/api/abm-contenido-baja", validaContActual, API.contActual.baja);
router.put("/api/abm-contenido-sube", validaContActual, API.contActual.sube);
router.delete("/api/abm-contenido-elimina", validaContActual, API.contActual.elimina);

// APIs - Contenido Nuevo
router.post("/api/abm-nuevo-contenido-guarda", descargaImg.single("archivo"), imgEnReqBody, API.guardaNuevo);
router.post("/api/abm-nuevo-carrusel-guarda", descargaImg.array("archivos"), imgEnReqBody, API.guardaNuevo);

// 🖥️ Vistas
router.get("/actualizar", soloEdicion, vista.actualizar);
router.get("/revisar", vista.revisar);

// ✅ Export
export default router;
