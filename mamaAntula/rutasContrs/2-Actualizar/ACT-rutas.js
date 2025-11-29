// Imports
import express from "express";
import API from "./ACT-controlApi.js";
import vista from "./ACT-controlVista.js";

// Middlewares de Vista
import soloActualiz from "../../middlewares/8-Usuarios-Roles/US-Solo3Actualiz.js";
import queryEnCookies from "../../middlewares/2-Actualizar/ACT-queryEnCookies.js";

// Middlewares de API - valida errores
import descargaImg from "../../middlewares/descargaImg/IMG-descargaImg.js";
import imgEnReqBody from "../../middlewares/descargaImg/IMG-imgEnReqBody.js";
import validaFiltros from "../../middlewares/2-Actualizar/ACT-1Filtros.js";
import validaEncabGuarda from "../../middlewares/2-Actualizar/ACT-2Encab1Guarda.js";
import validaEncabElimina from "../../middlewares/2-Actualizar/ACT-2Encab2Elimina.js";
import validaContActual from "../../middlewares/2-Actualizar/ACT-3ContActual.js";
import validaContNuevo from "../../middlewares/2-Actualizar/ACT-4ContNuevo.js";

// Middlewares de API - captura
import captura from "../../middlewares/2-Actualizar/ACT-Captura.js";

// 🧩 Router
const router = express.Router();

// 📡 APIs - Filtros
router.get("/api/act-filtros-datos-inciales", API.datosIniciales);

// APIs - Encabezado
router.get("/api/act-filtros-obtiene-encabezados", validaFiltros, captura, API.encabezado.obtiene);
router.post("/api/act-encabezado-guarda", descargaImg.none(), validaEncabGuarda, API.encabezado.guarda); // se usa multer para que procese el formData
router.delete("/api/act-encabezado-elimina", validaEncabElimina, API.encabezado.elimina);

// APIs - Contenido Actual - CRUD
router.get("/api/act-contenido-actual-obtiene", API.contActual.obtiene);
router.put("/api/act-contenido-actual-baja", validaContActual, API.contActual.baja);
router.put("/api/act-contenido-actual-sube", validaContActual, API.contActual.sube);
router.delete("/api/act-contenido-actual-elimina", validaContActual, API.contActual.elimina);

// APIs - Contenido Nuevo
router.post("/api/act-nuevo-contenido-guarda", descargaImg.single("archivo"), imgEnReqBody, validaContNuevo, API.guardaContNuevo);
router.post("/api/act-nuevo-carrusel-guarda", descargaImg.array("archivos"), imgEnReqBody, validaContNuevo, API.guardaContNuevo);

// 🖥️ Vistas
router.get("/", soloActualiz, queryEnCookies, vista.actualizar);

// ✅ Export
export default router;
