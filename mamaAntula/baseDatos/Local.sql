-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ma_bd
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ma_bd`
--

/*!40000 DROP DATABASE IF EXISTS `ma_bd`*/;
DROP DATABASE IF EXISTS `ma_bd`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ma_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ma_bd`;

--
-- Table structure for table `aux_iconos_agrups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_iconos_agrups` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `clase` varchar(20) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_iconos_agrups`
--

LOCK TABLES `aux_iconos_agrups` WRITE;
/*!40000 ALTER TABLE `aux_iconos_agrups` DISABLE KEYS */;
INSERT INTO `aux_iconos_agrups` VALUES (1,1,'Facebook',NULL,'fa-facebook','https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561');
INSERT INTO `aux_iconos_agrups` VALUES (2,2,'Instagram',NULL,'fa-instagram','https://www.instagram.com/beatificacionantula/');
INSERT INTO `aux_iconos_agrups` VALUES (3,3,'Twitter',NULL,'fa-twitter','https://twitter.com/beatificaciona1');
INSERT INTO `aux_iconos_agrups` VALUES (4,4,'TikTok',NULL,'fa-tiktok','https://www.tiktok.com/@mamaantula.com');
INSERT INTO `aux_iconos_agrups` VALUES (5,1,'Lectura','lectura','fa-link',NULL);
INSERT INTO `aux_iconos_agrups` VALUES (6,2,'Actualizar articulos','actualizar','fa-square-plus','/articulos/actualizar');
INSERT INTO `aux_iconos_agrups` VALUES (7,3,'Revisar articulos','revisar','fa-book','/articulos/revisar');
INSERT INTO `aux_iconos_agrups` VALUES (8,4,'Cambio de roles','cambioRoles','fa-user','/usuarios/cambio-de-roles');
/*!40000 ALTER TABLE `aux_iconos_agrups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_lugares`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_lugares` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_lugares`
--

LOCK TABLES `aux_lugares` WRITE;
/*!40000 ALTER TABLE `aux_lugares` DISABLE KEYS */;
INSERT INTO `aux_lugares` VALUES (1,'Córdoba');
INSERT INTO `aux_lugares` VALUES (2,'CABA');
INSERT INTO `aux_lugares` VALUES (3,'CABA, Basílica La Piedad');
INSERT INTO `aux_lugares` VALUES (4,'CABA, Basílica del Socorro');
INSERT INTO `aux_lugares` VALUES (5,'CABA, Santa Casa');
INSERT INTO `aux_lugares` VALUES (6,'Silípica, Stgo. del Estero');
INSERT INTO `aux_lugares` VALUES (7,'Ciudad del Vaticano, Europa');
INSERT INTO `aux_lugares` VALUES (8,'Santiago del Estero');
/*!40000 ALTER TABLE `aux_lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_novs_del_sitio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_novs_del_sitio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comentario` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT utc_date(),
  `version` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_novs_del_sitio`
--

LOCK TABLES `aux_novs_del_sitio` WRITE;
/*!40000 ALTER TABLE `aux_novs_del_sitio` DISABLE KEYS */;
INSERT INTO `aux_novs_del_sitio` VALUES (1,'Subida a internet del primer borrador','2025-10-21','1.00');
INSERT INTO `aux_novs_del_sitio` VALUES (2,'Subida a internet del segundo borrador','2025-11-18','1.01');
/*!40000 ALTER TABLE `aux_novs_del_sitio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_paises`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_paises` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `continente` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_paises`
--

LOCK TABLES `aux_paises` WRITE;
/*!40000 ALTER TABLE `aux_paises` DISABLE KEYS */;
INSERT INTO `aux_paises` VALUES ('AD','Andorra','Europa');
INSERT INTO `aux_paises` VALUES ('AE','Emiratos Árabes Unidos','Asia');
INSERT INTO `aux_paises` VALUES ('AF','Afganistán','Asia');
INSERT INTO `aux_paises` VALUES ('AG','Antigua y Barbuda','América');
INSERT INTO `aux_paises` VALUES ('AI','Anguila','América');
INSERT INTO `aux_paises` VALUES ('AL','Albania','Europa');
INSERT INTO `aux_paises` VALUES ('AM','Armenia','Asia');
INSERT INTO `aux_paises` VALUES ('AO','Angola','Africa');
INSERT INTO `aux_paises` VALUES ('AQ','Antártida','Polar');
INSERT INTO `aux_paises` VALUES ('AR','Argentina','América');
INSERT INTO `aux_paises` VALUES ('AS','Samoa Americana','Oceanía');
INSERT INTO `aux_paises` VALUES ('AT','Austria','Europa');
INSERT INTO `aux_paises` VALUES ('AU','Australia','Oceanía');
INSERT INTO `aux_paises` VALUES ('AW','Aruba','América');
INSERT INTO `aux_paises` VALUES ('AX','Aland','Europa');
INSERT INTO `aux_paises` VALUES ('AZ','Azerbaiyán','Asia');
INSERT INTO `aux_paises` VALUES ('BA','Bosnia y Herzegovina','Europa');
INSERT INTO `aux_paises` VALUES ('BB','Barbados','América');
INSERT INTO `aux_paises` VALUES ('BD','Bangladés','Asia');
INSERT INTO `aux_paises` VALUES ('BE','Bélgica','Europa');
INSERT INTO `aux_paises` VALUES ('BF','Burkina Faso','Africa');
INSERT INTO `aux_paises` VALUES ('BG','Bulgaria','Europa');
INSERT INTO `aux_paises` VALUES ('BH','Baréin','Asia');
INSERT INTO `aux_paises` VALUES ('BI','Burundi','Africa');
INSERT INTO `aux_paises` VALUES ('BJ','Benín','Africa');
INSERT INTO `aux_paises` VALUES ('BL','San Bartolomé','América');
INSERT INTO `aux_paises` VALUES ('BM','Bermudas','América');
INSERT INTO `aux_paises` VALUES ('BN','Brunéi','Asia');
INSERT INTO `aux_paises` VALUES ('BO','Bolivia','América');
INSERT INTO `aux_paises` VALUES ('BQ','Bonaire, San Eustaquio y Saba','América');
INSERT INTO `aux_paises` VALUES ('BR','Brasil','América');
INSERT INTO `aux_paises` VALUES ('BS','Bahamas','América');
INSERT INTO `aux_paises` VALUES ('BT','Bután','Asia');
INSERT INTO `aux_paises` VALUES ('BV','Isla Bouvet','Polar');
INSERT INTO `aux_paises` VALUES ('BW','Botswana','Africa');
INSERT INTO `aux_paises` VALUES ('BY','Bielorrusia','Europa');
INSERT INTO `aux_paises` VALUES ('BZ','Belice','América');
INSERT INTO `aux_paises` VALUES ('CA','Canadá','América');
INSERT INTO `aux_paises` VALUES ('CC','Islas Cocos','Oceanía');
INSERT INTO `aux_paises` VALUES ('CD','Congo','Africa');
INSERT INTO `aux_paises` VALUES ('CF','República Centroafricana','Africa');
INSERT INTO `aux_paises` VALUES ('CG','República del Congo','Africa');
INSERT INTO `aux_paises` VALUES ('CH','Suiza','Europa');
INSERT INTO `aux_paises` VALUES ('CI','Costa de Marfil','Africa');
INSERT INTO `aux_paises` VALUES ('CK','Islas Cook','Oceanía');
INSERT INTO `aux_paises` VALUES ('CL','Chile','América');
INSERT INTO `aux_paises` VALUES ('CM','Camerún','Africa');
INSERT INTO `aux_paises` VALUES ('CN','China','Asia');
INSERT INTO `aux_paises` VALUES ('CO','Colombia','América');
INSERT INTO `aux_paises` VALUES ('CR','Costa Rica','América');
INSERT INTO `aux_paises` VALUES ('CU','Cuba','América');
INSERT INTO `aux_paises` VALUES ('CV','Cabo Verde','Africa');
INSERT INTO `aux_paises` VALUES ('CW','Curazao','América');
INSERT INTO `aux_paises` VALUES ('CX','Isla de Navidad','Oceanía');
INSERT INTO `aux_paises` VALUES ('CY','Chipre','Europa');
INSERT INTO `aux_paises` VALUES ('CZ','República Checa','Europa');
INSERT INTO `aux_paises` VALUES ('DE','Alemania','Europa');
INSERT INTO `aux_paises` VALUES ('DJ','Yibuti','Africa');
INSERT INTO `aux_paises` VALUES ('DK','Dinamarca','Europa');
INSERT INTO `aux_paises` VALUES ('DM','Dominica','América');
INSERT INTO `aux_paises` VALUES ('DO','República Dominicana','América');
INSERT INTO `aux_paises` VALUES ('DZ','Argelia','Africa');
INSERT INTO `aux_paises` VALUES ('EC','Ecuador','América');
INSERT INTO `aux_paises` VALUES ('EE','Estonia','Europa');
INSERT INTO `aux_paises` VALUES ('EG','Egipto','Africa');
INSERT INTO `aux_paises` VALUES ('EH','República Árabe Saharaui','Africa');
INSERT INTO `aux_paises` VALUES ('ER','Eritrea','Africa');
INSERT INTO `aux_paises` VALUES ('ES','España','Europa');
INSERT INTO `aux_paises` VALUES ('ET','Etiopía','Africa');
INSERT INTO `aux_paises` VALUES ('FI','Finlandia','Europa');
INSERT INTO `aux_paises` VALUES ('FJ','Fiyi','Oceanía');
INSERT INTO `aux_paises` VALUES ('FK','Islas Malvinas','América');
INSERT INTO `aux_paises` VALUES ('FM','Micronesia','Oceanía');
INSERT INTO `aux_paises` VALUES ('FO','Islas Feroe','Europa');
INSERT INTO `aux_paises` VALUES ('FR','Francia','Europa');
INSERT INTO `aux_paises` VALUES ('GA','Gabón','Africa');
INSERT INTO `aux_paises` VALUES ('GB','Reino Unido','Europa');
INSERT INTO `aux_paises` VALUES ('GD','Granada','América');
INSERT INTO `aux_paises` VALUES ('GE','Georgia','Asia');
INSERT INTO `aux_paises` VALUES ('GF','Guayana Francesa','América');
INSERT INTO `aux_paises` VALUES ('GG','Guernsey','Europa');
INSERT INTO `aux_paises` VALUES ('GH','Ghana','Africa');
INSERT INTO `aux_paises` VALUES ('GI','Gibraltar','Europa');
INSERT INTO `aux_paises` VALUES ('GL','Groenlandia','América');
INSERT INTO `aux_paises` VALUES ('GM','Gambia','Africa');
INSERT INTO `aux_paises` VALUES ('GN','Guinea','Africa');
INSERT INTO `aux_paises` VALUES ('GP','Guadalupe','América');
INSERT INTO `aux_paises` VALUES ('GQ','Guinea Ecuatorial','Africa');
INSERT INTO `aux_paises` VALUES ('GR','Grecia','Europa');
INSERT INTO `aux_paises` VALUES ('GS','Islas Georgias del Sur','América');
INSERT INTO `aux_paises` VALUES ('GT','Guatemala','América');
INSERT INTO `aux_paises` VALUES ('GU','Guam','Oceanía');
INSERT INTO `aux_paises` VALUES ('GW','Guinea-Bisáu','Africa');
INSERT INTO `aux_paises` VALUES ('GY','Guyana','América');
INSERT INTO `aux_paises` VALUES ('HK','Hong Kong','Asia');
INSERT INTO `aux_paises` VALUES ('HM','Islas Heard y McDonald','Oceanía');
INSERT INTO `aux_paises` VALUES ('HN','Honduras','América');
INSERT INTO `aux_paises` VALUES ('HR','Croacia','Europa');
INSERT INTO `aux_paises` VALUES ('HT','Haití','América');
INSERT INTO `aux_paises` VALUES ('HU','Hungría','Europa');
INSERT INTO `aux_paises` VALUES ('ID','Indonesia','Asia');
INSERT INTO `aux_paises` VALUES ('IE','Irlanda','Europa');
INSERT INTO `aux_paises` VALUES ('IL','Israel','Asia');
INSERT INTO `aux_paises` VALUES ('IM','Isla de Man','Europa');
INSERT INTO `aux_paises` VALUES ('IN','India','Asia');
INSERT INTO `aux_paises` VALUES ('IO','Territorio Británico Índico','Africa');
INSERT INTO `aux_paises` VALUES ('IQ','Irak','Asia');
INSERT INTO `aux_paises` VALUES ('IR','Irán','Asia');
INSERT INTO `aux_paises` VALUES ('IS','Islandia','Europa');
INSERT INTO `aux_paises` VALUES ('IT','Italia','Europa');
INSERT INTO `aux_paises` VALUES ('JE','Jersey','Europa');
INSERT INTO `aux_paises` VALUES ('JM','Jamaica','América');
INSERT INTO `aux_paises` VALUES ('JO','Jordania','Asia');
INSERT INTO `aux_paises` VALUES ('JP','Japón','Asia');
INSERT INTO `aux_paises` VALUES ('KE','Kenia','Africa');
INSERT INTO `aux_paises` VALUES ('KG','Kirguistán','Asia');
INSERT INTO `aux_paises` VALUES ('KH','Camboya','Asia');
INSERT INTO `aux_paises` VALUES ('KI','Kiribati','Oceanía');
INSERT INTO `aux_paises` VALUES ('KM','Comoras','Africa');
INSERT INTO `aux_paises` VALUES ('KN','San Cristóbal y Nieves','América');
INSERT INTO `aux_paises` VALUES ('KP','Corea del Norte','Asia');
INSERT INTO `aux_paises` VALUES ('KR','Corea del Sur','Asia');
INSERT INTO `aux_paises` VALUES ('KW','Kuwait','Asia');
INSERT INTO `aux_paises` VALUES ('KY','Islas Caimán','América');
INSERT INTO `aux_paises` VALUES ('KZ','Kazajistán','Asia');
INSERT INTO `aux_paises` VALUES ('LA','Laos','Asia');
INSERT INTO `aux_paises` VALUES ('LB','Líbano','Asia');
INSERT INTO `aux_paises` VALUES ('LC','Santa Lucía','América');
INSERT INTO `aux_paises` VALUES ('LI','Liechtenstein','Europa');
INSERT INTO `aux_paises` VALUES ('LK','Sri Lanka','Asia');
INSERT INTO `aux_paises` VALUES ('LR','Liberia','Africa');
INSERT INTO `aux_paises` VALUES ('LS','Lesoto','Africa');
INSERT INTO `aux_paises` VALUES ('LT','Lituania','Europa');
INSERT INTO `aux_paises` VALUES ('LU','Luxemburgo','Europa');
INSERT INTO `aux_paises` VALUES ('LV','Letonia','Europa');
INSERT INTO `aux_paises` VALUES ('LY','Libia','Africa');
INSERT INTO `aux_paises` VALUES ('MA','Marruecos','Africa');
INSERT INTO `aux_paises` VALUES ('MC','Mónaco','Europa');
INSERT INTO `aux_paises` VALUES ('MD','Moldavia','Europa');
INSERT INTO `aux_paises` VALUES ('ME','Montenegro','Europa');
INSERT INTO `aux_paises` VALUES ('MF','San Martín','América');
INSERT INTO `aux_paises` VALUES ('MG','Madagascar','Africa');
INSERT INTO `aux_paises` VALUES ('MH','Islas Marshall','Oceanía');
INSERT INTO `aux_paises` VALUES ('MK','Macedonia del Norte','Europa');
INSERT INTO `aux_paises` VALUES ('ML','Malí','Africa');
INSERT INTO `aux_paises` VALUES ('MM','Myanmar','Asia');
INSERT INTO `aux_paises` VALUES ('MN','Mongolia','Asia');
INSERT INTO `aux_paises` VALUES ('MO','Macao','Asia');
INSERT INTO `aux_paises` VALUES ('MP','Islas Marianas del Norte','Oceanía');
INSERT INTO `aux_paises` VALUES ('MQ','Martinica','América');
INSERT INTO `aux_paises` VALUES ('MR','Mauritania','Africa');
INSERT INTO `aux_paises` VALUES ('MS','Montserrat','América');
INSERT INTO `aux_paises` VALUES ('MT','Malta','Europa');
INSERT INTO `aux_paises` VALUES ('MU','Mauricio','Africa');
INSERT INTO `aux_paises` VALUES ('MV','Maldivas','Asia');
INSERT INTO `aux_paises` VALUES ('MW','Malaui','Africa');
INSERT INTO `aux_paises` VALUES ('MX','México','América');
INSERT INTO `aux_paises` VALUES ('MY','Malasia','Asia');
INSERT INTO `aux_paises` VALUES ('MZ','Mozambique','Africa');
INSERT INTO `aux_paises` VALUES ('NA','Namibia','Africa');
INSERT INTO `aux_paises` VALUES ('NC','Nueva Caledonia','Oceanía');
INSERT INTO `aux_paises` VALUES ('NE','Níger','Africa');
INSERT INTO `aux_paises` VALUES ('NF','Isla Norfolk','Oceanía');
INSERT INTO `aux_paises` VALUES ('NG','Nigeria','Africa');
INSERT INTO `aux_paises` VALUES ('NI','Nicaragua','América');
INSERT INTO `aux_paises` VALUES ('NL','Países Bajos','Europa');
INSERT INTO `aux_paises` VALUES ('NN','Desconocido','Ninguno');
INSERT INTO `aux_paises` VALUES ('NO','Noruega','Europa');
INSERT INTO `aux_paises` VALUES ('NP','Nepal','Asia');
INSERT INTO `aux_paises` VALUES ('NR','Nauru','Oceanía');
INSERT INTO `aux_paises` VALUES ('NU','Niue','Oceanía');
INSERT INTO `aux_paises` VALUES ('NZ','Nueva Zelanda','Oceanía');
INSERT INTO `aux_paises` VALUES ('OM','Omán','Asia');
INSERT INTO `aux_paises` VALUES ('PA','Panamá','América');
INSERT INTO `aux_paises` VALUES ('PE','Perú','América');
INSERT INTO `aux_paises` VALUES ('PF','Polinesia Francesa','Oceanía');
INSERT INTO `aux_paises` VALUES ('PG','Papúa Nueva Guinea','Oceanía');
INSERT INTO `aux_paises` VALUES ('PH','Filipinas','Asia');
INSERT INTO `aux_paises` VALUES ('PK','Pakistán','Asia');
INSERT INTO `aux_paises` VALUES ('PL','Polonia','Europa');
INSERT INTO `aux_paises` VALUES ('PM','San Pedro y Miquelón','América');
INSERT INTO `aux_paises` VALUES ('PN','Islas Pitcairn','Oceanía');
INSERT INTO `aux_paises` VALUES ('PR','Puerto Rico','América');
INSERT INTO `aux_paises` VALUES ('PS','Palestina','Asia');
INSERT INTO `aux_paises` VALUES ('PT','Portugal','Europa');
INSERT INTO `aux_paises` VALUES ('PW','Palaos','Oceanía');
INSERT INTO `aux_paises` VALUES ('PY','Paraguay','América');
INSERT INTO `aux_paises` VALUES ('QA','Catar','Asia');
INSERT INTO `aux_paises` VALUES ('RE','Reunión','Africa');
INSERT INTO `aux_paises` VALUES ('RO','Rumania','Europa');
INSERT INTO `aux_paises` VALUES ('RS','Serbia','Europa');
INSERT INTO `aux_paises` VALUES ('RU','Rusia','Europa');
INSERT INTO `aux_paises` VALUES ('RW','Ruanda','Africa');
INSERT INTO `aux_paises` VALUES ('SA','Arabia Saudita','Asia');
INSERT INTO `aux_paises` VALUES ('SB','Islas Salomón','Oceanía');
INSERT INTO `aux_paises` VALUES ('SC','Seychelles','Africa');
INSERT INTO `aux_paises` VALUES ('SD','Sudán','Africa');
INSERT INTO `aux_paises` VALUES ('SE','Suecia','Europa');
INSERT INTO `aux_paises` VALUES ('SG','Singapur','Asia');
INSERT INTO `aux_paises` VALUES ('SH','Santa Elena','Africa');
INSERT INTO `aux_paises` VALUES ('SI','Eslovenia','Europa');
INSERT INTO `aux_paises` VALUES ('SJ','Svalbard y Jan Mayen','Europa');
INSERT INTO `aux_paises` VALUES ('SK','Eslovaquia','Europa');
INSERT INTO `aux_paises` VALUES ('SL','Sierra Leona','Africa');
INSERT INTO `aux_paises` VALUES ('SM','San Marino','Europa');
INSERT INTO `aux_paises` VALUES ('SN','Senegal','Africa');
INSERT INTO `aux_paises` VALUES ('SO','Somalia','Africa');
INSERT INTO `aux_paises` VALUES ('SR','Surinam','América');
INSERT INTO `aux_paises` VALUES ('SS','Sudán del Sur','Africa');
INSERT INTO `aux_paises` VALUES ('ST','Santo Tomé y Príncipe','Africa');
INSERT INTO `aux_paises` VALUES ('SV','El Salvador','América');
INSERT INTO `aux_paises` VALUES ('SX','San Martín','América');
INSERT INTO `aux_paises` VALUES ('SY','Siria','Asia');
INSERT INTO `aux_paises` VALUES ('SZ','Suazilandia','Africa');
INSERT INTO `aux_paises` VALUES ('TC','Islas Turcas y Caicos','América');
INSERT INTO `aux_paises` VALUES ('TD','Chad','Africa');
INSERT INTO `aux_paises` VALUES ('TF','Tierras Antárticas Francesas','Africa');
INSERT INTO `aux_paises` VALUES ('TG','Togo','Africa');
INSERT INTO `aux_paises` VALUES ('TH','Tailandia','Asia');
INSERT INTO `aux_paises` VALUES ('TJ','Tayikistán','Asia');
INSERT INTO `aux_paises` VALUES ('TK','Tokelau','Oceanía');
INSERT INTO `aux_paises` VALUES ('TL','Timor Oriental','Asia');
INSERT INTO `aux_paises` VALUES ('TM','Turkmenistán','Asia');
INSERT INTO `aux_paises` VALUES ('TN','Túnez','Africa');
INSERT INTO `aux_paises` VALUES ('TO','Tonga','Oceanía');
INSERT INTO `aux_paises` VALUES ('TR','Turquía','Asia');
INSERT INTO `aux_paises` VALUES ('TT','Trinidad y Tobago','América');
INSERT INTO `aux_paises` VALUES ('TV','Tuvalu','Oceanía');
INSERT INTO `aux_paises` VALUES ('TW','Taiwán','Asia');
INSERT INTO `aux_paises` VALUES ('TZ','Tanzania','Africa');
INSERT INTO `aux_paises` VALUES ('UA','Ucrania','Europa');
INSERT INTO `aux_paises` VALUES ('UG','Uganda','Africa');
INSERT INTO `aux_paises` VALUES ('UM','Islas Menores de EE.UU.','América');
INSERT INTO `aux_paises` VALUES ('US','Estados Unidos','América');
INSERT INTO `aux_paises` VALUES ('UY','Uruguay','América');
INSERT INTO `aux_paises` VALUES ('UZ','Uzbekistán','Asia');
INSERT INTO `aux_paises` VALUES ('VA','Ciudad del Vaticano','Europa');
INSERT INTO `aux_paises` VALUES ('VC','San Vicente y las Granadinas','América');
INSERT INTO `aux_paises` VALUES ('VE','Venezuela','América');
INSERT INTO `aux_paises` VALUES ('VG','Islas Vírgenes Británicas','América');
INSERT INTO `aux_paises` VALUES ('VI','Islas Vírgenes de EE.UU.','América');
INSERT INTO `aux_paises` VALUES ('VN','Vietnam','Asia');
INSERT INTO `aux_paises` VALUES ('VU','Vanuatu','Oceanía');
INSERT INTO `aux_paises` VALUES ('WF','Wallis y Futuna','Oceanía');
INSERT INTO `aux_paises` VALUES ('WS','Samoa','Oceanía');
INSERT INTO `aux_paises` VALUES ('XK','República de Kosovo','Europa');
INSERT INTO `aux_paises` VALUES ('YE','Yemen','Asia');
INSERT INTO `aux_paises` VALUES ('YT','Mayotte','Africa');
INSERT INTO `aux_paises` VALUES ('ZA','Sudáfrica','Africa');
INSERT INTO `aux_paises` VALUES ('ZM','Zambia','Africa');
INSERT INTO `aux_paises` VALUES ('ZW','Zimbabue','Africa');
/*!40000 ALTER TABLE `aux_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_status_registros`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_status_registros` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_status_registros`
--

LOCK TABLES `aux_status_registros` WRITE;
/*!40000 ALTER TABLE `aux_status_registros` DISABLE KEYS */;
INSERT INTO `aux_status_registros` VALUES (1,1,'Creado','creado');
INSERT INTO `aux_status_registros` VALUES (3,3,'Aprobado','aprobado');
INSERT INTO `aux_status_registros` VALUES (4,4,'Inactivar','inactivar');
INSERT INTO `aux_status_registros` VALUES (6,6,'Inactivo','inactivo');
/*!40000 ALTER TABLE `aux_status_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas_idiomas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_idiomas` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_idiomas`
--

LOCK TABLES `cartas_idiomas` WRITE;
/*!40000 ALTER TABLE `cartas_idiomas` DISABLE KEYS */;
INSERT INTO `cartas_idiomas` VALUES (1,1,'castellano');
INSERT INTO `cartas_idiomas` VALUES (2,2,'frances');
/*!40000 ALTER TABLE `cartas_idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas_personajes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_personajes` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_personajes`
--

LOCK TABLES `cartas_personajes` WRITE;
/*!40000 ALTER TABLE `cartas_personajes` DISABLE KEYS */;
INSERT INTO `cartas_personajes` VALUES (1,1,'Mama Antula');
INSERT INTO `cartas_personajes` VALUES (2,2,'P. Gaspar Juárez');
INSERT INTO `cartas_personajes` VALUES (3,3,'Ambrosio Funes');
/*!40000 ALTER TABLE `cartas_personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_2contenidos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_2contenidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encab_id` int(10) unsigned DEFAULT NULL,
  `orden` tinyint(1) unsigned DEFAULT 1,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `encabezadoexperiencia` (`encab_id`),
  CONSTRAINT `encabezadoexperiencia` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_2contenidos`
--

LOCK TABLES `cont_2contenidos` WRITE;
/*!40000 ALTER TABLE `cont_2contenidos` DISABLE KEYS */;
INSERT INTO `cont_2contenidos` VALUES (1,8,1,'<p><strong>María Antonia de Paz y Figueroa</strong> nació en Santiago del Estero en 1730. A los 15 años empezó a acompañar a los Jesuitas como <em>Beata de la Compañía de Jesús</em>en la tarea de evangelización de los pueblos originarios santiagueños, enseñándoles la Palabra de Dios, a leer y a escribir, y a perfeccionar técnicas de ganadería y agricultura. Mama Antula hablaba quichua. Y fueron los indígenas quienes la bautizaron <strong><em>Mama Antula</em>.</strong> Cuando los jesuitas fueron expulsados de América en 1767, en una experiencia de epifanía en la celda capilla de San Francisco Solano y a la edad de 38 años, Mama Antula recibió la misión de su vida: continuar <strong>con la práctica de los Ejercicios Espirituales que realizaban los jesuitas</strong>, para la salvación de las almas.</p><p>Fue entonces cuando empezó su misión en salida y eligió su nombre de Iglesia: <strong>María Antonia de San José.</strong></p><p>Por entonces las mujeres estaban confinadas a casarse o elegir los votos religiosos, no leían ni escribían y mucho menos salían al mundo sin la compañía de un hombre y libradas a la providencia divina. <strong>Mama Antula desafió las convenciones de su tiempo</strong> y peregrinó por todo el actual territorio del NOA argentino -por entonces formábamos parte del virreinato del Perú-, organizando los Ejercicios Espirituales a pesar de estar prohibidos por el Rey Carlos III, pero consiguiendo que los Obispos locales autorizaran su tarea. Llegó a Buenos Aires caminando más de 5 mil kilómetros, donde realizó su obra cúlmine -en los inicios del virreinato del Río de la Plata-: La construcción de <strong>la Santa Casa</strong>, un lugar levantado enteramente con donaciones, y donde exclusivamente se realizan los Ejercicios Espirituales de San Ignacio de Loyola. Fue inaugurada en 1795 y allí murió Mama Antula en 1799, y desde entonces sigue funciones hasta el día de hoy. Allí ricos y pobres compartían mesa y rezaban juntos, y se estima que 70 mil personas realizaron los Ejercicios Espirituales allí, compartiendo el pan y aprendiendo los valores que precedieron y formaron la gesta de mayo y a la creación del Estado Argentino.</p><p>La primera santa de la argentina es laica, valiente, considerada la primera escritora del Río de la Plata (se pueden <a href=\"/cartas-y-escritos/cartas\" target=\"_blank\">leer aquí sus famosas cartas</a>); una mujer fuerte que nos enseña la santidad cotidiana y a confiar en la providencia con una fe inquebrantable. Es la patrona de las empresarias argentinas, y a ella se le reza pidiéndole perseverancia en las dificultades y la aceptación de la voluntad de Dios. Su fiesta litúrgica es el 7 de marzo.</p>','1760660122981.jpg',NULL,'Peregrinaje que realizó santa Mama Antula',1,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (2,2,3,NULL,NULL,'FEMEkVui6w4','En el encuentro, el Arq. Jorge Bayá Casal compartió su experiencia recorriendo el camino de Mama Antula desde Santiago del Estero hasta Buenos Aires, e hizo cantar a los presentes la zamba compuesta por él mismo: «Mama Antula a través del camino real».',1,'2025-11-04 18:56:14',1);
INSERT INTO `cont_2contenidos` VALUES (3,3,1,'<p>Ya el miércoles 6 a la tardecita fue renombrada la estación Independencia del Subte E como <strong>«Independencia – Santa Mama Antula»</strong></p><p>Por la tarde, se realizó el Acto de cierre de la muestra&nbsp;<strong><em>«El estandarte de la mujer fuerte. Homenaje a Mama Antula»</em></strong>&nbsp;en la vitrina del Senado de la Nación de la Estación Congreso del Subte A con la presencia de&nbsp;<strong>Xil Buffone</strong>&nbsp;-creadora de las reproducciones exhibidas-, el director de Cultura del Senado&nbsp;<strong>Daniel Abate,</strong>&nbsp;el párroco de la Basílica de la Piedad&nbsp;<strong>Raúl Laurencena&nbsp;</strong>junto a su comunidad, el Sr.&nbsp;<strong>Damián Abregú</strong>&nbsp;en representación de la Familia Antuliana, junto a&nbsp;<strong>Teresa González Fernández, el prof. Aldo Marcos de Castro Paz y el Sr. José Torres Argañaraz,</strong>&nbsp;venido especialmente de Santiago del Estero a presenciar las celebraciones en Buenos Aires.</p>','1760660122989.jpg',NULL,NULL,1,'2025-11-04 20:01:50',1);
INSERT INTO `cont_2contenidos` VALUES (4,23,0,'<p>Llegó el día tan esperado: después de más de 200 años el nombre de María Antonia de San José fue inscripto en el Libro de los Santos. Las celebraciones en Buenos Aires, Santiago del Estero, Salta y localidades del gran Buenos Aires comenzaron con vigilias nocturnas.</p>',NULL,NULL,NULL,1,'2025-11-08 21:05:08',1);
INSERT INTO `cont_2contenidos` VALUES (5,32,1,'<blockquote>Los Ejercicios Espirituales que organiza La Beata son cada vez más multitudinarios. En esta carta describe cómo aumenta la concurrencia en una casa donde organiza los retiros, frente a la Iglesia de San Miguel (de la ciudad de Buenos Aires), donde no cesa de ocurrir el milagro de la multiplicación de los panes para darles de comer a todos.</blockquote>',NULL,NULL,NULL,1,'2025-11-10 20:03:30',1);
INSERT INTO `cont_2contenidos` VALUES (6,31,4,'<p><em>Cf. Blanco III: ASR 1-5 (en castellano); G 17; B 25-28. Otras versiones: Blanco V: ASR 7-11 (en italiano); G 17 / Más breves: Blanco IV: ASR 66- 69 (Lettera 2a al medesimo soggetto); G 16; P 187 (en francés); Blanco VI: P 187-190 (en francés): C. P., 376-379. Cf. también variantes: Blanco IX (fechada el 16/10/1780): ACSBA (original); G 18; Blanco XI: ACSBA (original); G 32. Pax Christi</em></p>',NULL,NULL,NULL,1,'2025-11-10 20:00:34',1);
INSERT INTO `cont_2contenidos` VALUES (7,6,2,'<p>En su primera fiesta litúrgica como santa después de la canonización, el 7 de marzo, Buenos Aires se vistió de fiesta en calles, capillas, Iglesias y hasta hubo una breve peregrinación de estudiantes del colegio Echeverry Boneo desde el colegio en Juncal y Azcuénaga hasta el Sepulcro de Mama Antula en la Basílica de La Piedad para realizar un glorioso momento de adoración. Luego la peregrinación siguió hasta la Santa Casa.</p><p>En la Basílica de La Piedad se realizó una <a href=\"https://www.facebook.com/canonizacionmamaantula/videos/342126738201398\" target=\"_blank\">Misa presidida por el obispo emérito de Mendoza Mons. Eduardo Taussig</a>, en presencia de descendientes colaterales y devotos que no cesaron de desfilar ante el Sepulcro Histórico Nacional donde descansa Mama Antula, pidiendo gracias y agradeciendo dones.</p><p>Luego de la Misa se desplegó una placa por el reconocimiento de Mama Antula como Doctora Honoris Causa por la Universidad de Santiago del Estero en presencia de la propulsora de la idea, la periodista&nbsp;<strong>Cintia Suárez.</strong></p>','1760660122988.jpg',NULL,NULL,1,'2025-11-04 19:58:35',1);
INSERT INTO `cont_2contenidos` VALUES (8,9,3,'<p>Somos devotos de <strong>la primera santa de la Argentina: María Antonia de San José,&nbsp;<em>Mama Antula.</em></strong>&nbsp;Somos descendientes colaterales de María Antonia de Paz y Figueroa (Santiago del Estero, 1730-1799) y miembros de la gran familia de almas que realizan y difunden los Ejercicios Espirituales de San Ignacio de Loyola.</p><p>Admiramos su valentía femenina y la fuerza de su evangelización, que logró que ricos y pobres compartieran mesa y oración en miles de tandas de Ejercicios Espirituales en la Santa Casa, en un preclaro ejercicio de fraternidad humana en tiempos en los que no existía la libertad de vientres.</p><p>Difundimos su vida y obra, que abrió un camino espiritual en los albores de la patria protegiendo a los niños y vistiendo de dignidad el rol de las mujeres durante la época colonial, dándoles voz y voto en la salvación de sus almas.</p><p>Estamos en todo el territorio argentino. Somos de Santiago del Estero (foto), Tucumán, Buenos Aires, Santa Fe, Salta, Jujuy, Mendoza. Hay fervientes devotos en varios países de Latinoamérica como México, Brasil, Costa Rica, Filipinas y Perú.</p><p>Nuestro objetivo es la difusión de la obra de Santa Mama Antula, llegando hasta donde no es conocida para darla a conocer; colaboramos con la confección de pinturas, vitreaux, esculturas, imágenes, estampas y material didáctico para difundir su obra en parroquias, escuelas, Universidades y barrios populares.</p><p>Colaboramos con el sostenimiento del Sepulcro Histórico Nacional de la Basílica de La Piedad, donde descansan las reliquias de La Beata.</p><p>Participamos y difundimos la realización de las tandas de Ejercicios Espirituales gratuitos en la Santa Casa, que se vienen realizando desde hace más de 200 años, cada primeros sábados de mes.</p><p>Y todos los días 7 mes celebramos Misa en la Piedad en memoria de Mama Antula. Luego rezamos en su sepulcro encomendándole nuestros ruegos y oraciones a nuestra milagrosa santa argentina.</p>','1760660122987.jpg',NULL,'2017- Procesión del 7 de marzo en ciudad de Buenos Aires, en el primer aniversario de la beatificación de MA.\r\n\r\n',1,'2025-11-05 15:32:24',1);
INSERT INTO `cont_2contenidos` VALUES (9,13,2,'<p>Buenos Aires, 6 de marzo de 1779.-</p><p><em>Blanco, pp 362-366</em></p><p>En el Nombre de Dios todopoderoso y con su Santa Gracia, Amén. Sepan todos cuanto esta carta de mi testamento y última voluntad vieren, cómo yo, María Antonia de San José, Beata profesa, natural de Santiago del Estero, Obispado de Córdoba del Tucumán, hallándome enferma en cama, pero en mi sano juicio, memoria y entendimiento natural, creyendo y confesando como firmemente creo y confieso en el inefable Misterio de la Santísima Trinidad; Padre, Hijo y Espíritu Santo, tres Personas realmente distintas y un solo Dios verdadero, y todos los demás misterios, Sacramentos y Dogmas que reconoce, cree y confiesa Nuestra Santa Madre Iglesia Católica. Apostólica Romana, en cuya verdadera fe y creencia he vivido y vivo y protesto vivir y morir como católica, fiel cristiana que soy, invocando por principal intercesora y protectora a la serenísima<strong> reina de los Ángeles, María Santísima; a su Santísimo esposo el Señor San José, al Santísimo Ángel de mi guarda, al de mi Nombre, al gran Patriarca San Ignacio, a los Bienaventurados San Francisco Javier, San Francisco de Borja, San Luis Gonzaga, San Estanislao y San Cayetano,</strong>&nbsp;a fin de que impetren a Nuestro Señor Jesucristo que por los infinitos méritos de preciosísima vida, pasión y muerte, me perdone todas mis culpas, y misericordiosamente conduzca mi pobrecita alma a la Bienaventuranza eterna, para la cual fuimos todos criados; teniendo a la vista la muerte, tan necesario a toda criatura como incierta su hora, con maduro acuerdo, en descargo de mi conciencia, y para evitar cualquier trastorno y confusión que pudiera originarse después de mis días, ordeno mi testamento y última voluntad, en la manera y forma siguiente:</p><ol><li>Primeramente encomiendo mi alma a Dios Nuestro Señor, pues la creó de la nada y la redimió con su preciosísima Sangre, y mi cuerpo a la tierra de que fue formado; el cuál amortajado (p.363) con el propio traje que públicamente visto de Beata profesa,<strong>&nbsp;mando sea enterrado en el campo santo de la Iglesia Parroquial de Nuestra Señora de la Piedad,</strong>&nbsp;de esta ciudad, con entierro menor, rezado, y pido encarecidamente por amor de Dios a los señores curas respectivos, ejerciten esta obra de caridad, con el cadáver de una indigna pecadora, en atención a mi notoria pobreza. A consecuencia, pido que desde esta Casa de Ejercicios, donde me hallo enferma, y donde es regular fallezca, se conduzca mi cadáver en una hora silenciosa, por cuatro peones de los que actualmente están trabajando en la obra. Así lo declaro para que conste.</li><li>Declaro que conducida de un ardiente deseo a la mayor honra y gloria de Dios, puesta en las manos de la Providencia, avivando mi confianza y consultando el mejor medio de evitar los pecados, que se cometen contra la Majestad Soberana, desde que puse el pie en esta Ciudad, me he dedicado constantemente a sostener una casa de Penitencia, en donde se han dado al público y a personas de ambos sexos, los ejercicios espirituales que formalizó el Glorioso Patriarca San Ignacio de Loyola, y aprobó auténticamente la Iglesia; que con la ideal de llevar adelante este piadoso establecimiento, cuya ventajosa utilidad ha hecho constante la experiencia, me propuse fabricar la casa que actualmente sirve para este fin, y que pido a Dios sea duradero; que esto se ha conseguido, aunque no con la perfección que corresponde, por medio de las limosnas que la piedad de los fieles, o más bien los designios de mi gran Dios, se ha dignado poner en mis manos; que me consta que la intención sería de los contribuyentes no ha sido otra, que la que se den Ejercicios todo el año, sin más intervalos, que los que dictare la prudencia, y la necesidad; como auxiliada de Dios, lo ha practicado mi debilidad. A consecuencia encargo por la Sangre de mi Redentor, sean admitidos, como lo dictan las leyes de la caridad, y preferidos, si es posible, los pobrecitos del campo, en quienes he advertido siempre la más urgente necesidad de este auxilio.</li><li>Declaro que con concepto a la intención de los bienhechores de quienes tal vez se podrán presentar documentos en forma; con concepto igualmente al radical y práctico conocimiento que en tan dilatado tiempo he adquirido: y finalmente en atención a las serias combinaciones y particular estudio que he hecho en una materia tan delicada, en la que Dios, por sus altos fines, se dignó elegir mi pequeñez para instrumento; jamás podría dejar con tranquilidad mi conciencia, sino declarara, como declaro, en la parte que puedo y debo por nula, subversiva e intrusa, cualquier mudanza o destino (p.364) extraño, que tal vez algunas intenciones humanas o de aparente utilidad, intentasen sugerir en lo sucesivo sobre este establecimiento, que con las licencias necesarias, cuyos instrumentos deben existir en los respectivos oficios públicos donde se archivaron, sin poder hacer por ahora mención de cuáles son , he fabricado para Casa de Ejercicios, debiéndose ésta mirar con el recomendable aspecto de un recurso de la virtud, y de un asilo seguro, en donde se presenten a la consideración del cristiano los desengaños de esta vida mortal por una práctica constante de los referidos Ejercicios Espirituales.</li><li>Hallándome próxima a ir a dar cuenta a Dios, recomiendo su subsistencia con toda la ternura de mi corazón a todos los señores Jueces y magistrados de quienes espero la protejan con su autoridad; a la piedad del público la sostengan con las efusiones de su caridad; y a mis Albaceas ordeno la conserven y aumenten con celosa integridad como tan conducente al servicio de Dios, y a los intereses eternos del pecador. Así lo declaro para que conste.</li><li><strong>Declaro que del gobierno económico se ha de hacer cargo precisamente una mujer.</strong>&nbsp;En cláusula distinta se hará su nombramiento. Su principal objeto se dirigirá a la vigilancia exacta de los santos ejercicios en lo económico al interés espiritual y temporal de las demás mujeres que, estén a su cargo, a cuyo fin, y con respecto a la necesidad del servicio, he fabricado con distinción habitaciones separadas de lo principal que ha de servir para los ejercicios. La experiencia y el conocimiento me han sugerido esta determinación, cuya observancia pido no se altere, y en la parte que puedo lo mando como fundadora e institutriz de esta obra de piedad.</li><li>Encargo se mantengan en la casa , y sean tratadas con cariño, benignidad y amor, todas las que actualmente se hallan en ella, principalmente las que con conocida juiciosidad han desempañando sus deberes respectivos en el servicio; en éstas, su misma utilidad, y en otras unos motivos de caridad, me obligan a esta piadosa recomendación, como me han obligado siempre a tratarlas como a hijas de mi corazón, en el que las conservo hasta los últimos momentos de mi vida, esperando de su generosa gratitud, me encomienden a Dios incesantemente y rueguen por mi alma; yo lo haré por ellas, así, como espero de la infinita piedad, merezco lograr Bienaventuranza eterna.</li><li>Declaro que el finado, Ilustrísimo y Excelentísimo Señor Don Fray Sebastián Malvar y Pinto; Caballero gran cruz de Carlos III, dignísimo Obispo de esta Diócesis, y Arzobispo después (365) de Santiago de Galicia, tuvo a bien en ejercicios de su liberalidad, hacer una donación, en forma, cuyo instrumento existe en autos de la cantidad de 18 mil pesos a beneficio de esta casa, de la cual sólo tengo recibidos 1130 $ cuya distribución consta de los cuadernos de las cuentas, y creyendo de deberlas dar de lo restante el Señor Magistral de esta santa Iglesia Catedral, Doctor don Carlos José Monteros, encargado para la reintegración de esta piadosa donación , de cuyo puntual cumplimiento no he separado mi atención, aplicando puntuales diligencias, ya judiciales, ya extrajudiciales sin efecto verdaderamente; prevengo no se omitan en lo sucesivo las que correspondan. Así lo declaro para que conste.</li><li>Declaro que hay en la casa tres esclavos viejos e inútiles, llamados Simón, Domingo Ignacio y María quienes se mantendrán en ella; igualmente existe un&nbsp;<strong>negra moro llamado Pascual, a quien por su fidelidad, su buen servicio, y lo mucho que me ha ayudado, debo concederle la la libertad sin reparo,&nbsp;</strong>como se la concedo, respecto, a que debo presumir que la voluntad de los donantes quedó resignada a la mía, en una y otra circunstancia de equidad y de prudencia. Pero esto deberá entenderse con la precisa condición y calidad de que durante su vida, venga a servir en las datas de ejercicios, en aquellos ministerios, que acostumbra. siendo esta condición tan solemne y estrecha que sin su cumplimiento no tendrá efecto la libertad.</li><li>Declaro que de todos los bienes así muebles como raíces, papeles y cuanto hay en casa, se tome un prolijo inventario judicial, bajo el cual se deberá hacer cargo la persona nombrada con responsabilidad formal para ante quien corresponda, no siendo de mi inspección determinarlo; así lo declaro.</li><li><strong>Declaro que habiendo vivido de la Providencia meramente, no tengo bienes sobre que recaiga institución de heredero,</strong>&nbsp;sin embargo por un efecto de solemnidad legal nombro por tales a las benditas almas del Purgatorio, en cuyo sufragio y beneficio deberá invertirse cualquier derecho que pudiera corresponderme, como de algual (sic, por alguna) limosna se dará a las mandas forzosas y acostumbradas a real cada una; así lo declaro para que conste.</li><li>Declaro que la casa se halla gravada en algunas dependencias pasivas, cuyos acreedores y cantidades constan de mis apuntes; declárolo así para que conste.</li><li>&nbsp;<strong>Declaro y nombro por mi sucesora a Doña Margarita Melgarejo,</strong>&nbsp;quien cuidará principalmente de solicitar un director, y capellanes, que corran con el gobierno y dirección espiritual de los (366) ejercitantes, y en la parte que puedo prevengo, que en lo sucesivo se transmita esta elección en los mismos términos, rogando a todas las que quedan por la paz, tranquilidad, y religiosa unión; y principalmente por el celo en el servicio de Dios, y cumplimiento exacto de los santos fines, que las condujeron a esta Casa, cuyas puertas debe sellar el recato, la moderación, y el silencio. Dios derrame sobre todas ellas sus bendiciones,<strong>&nbsp;y yo como buena madre, y con mi mayor ternura les dispenso la mía, y me despido de todas hasta la eternidad</strong>.</li><li>Y para cumplir todo lo que contiene este testamento cerrado, nombro por mis testamentarias, y albaceas, a las Señora Doña María Cabrera, Doña Florentina Gómez, Doña Mercedes Guillota, y Doña María Josefa Pérez, a cada una in solidum, y les confiero amplio poder para todos los efectos de este nombramiento, durándoles el año legal, o el más tiempo que necesitasen, pues les prorrogo, y por el presente revoco y anulo todos los testamentos, que antes de ahora hubiere formalizado, disposiciones, o codicilos, de palabra o escrito, o en otra forma, y sólo quiero se estime y tenga éste por mi última deliberada voluntad, en la vía y forma que mejor haya lugar en Derecho.</li></ol><p>Así lo otorgo y ruego firme por mí el Señor Doctor Don Felipe Antonio Martínez de Iriarte, que se halla presente, en esta muy notable y muy leal Ciudad de la Santísima Trinidad Puerto de Santa María de Buenos Aires, en 6 días del mes de marzo de este año de 1779.- A ruego de la otorgante y por su imposibilidad.-Doctor Felipe Antonio de Iriarte.</p>',NULL,NULL,NULL,1,'2025-11-06 11:17:53',1);
INSERT INTO `cont_2contenidos` VALUES (10,4,1,'<ul><li>2 de julio de 2010: El Santo Padre Benedicto XVI autorizó a la Congregación vaticana para las Causas de los Santos a promulgar el decreto por el que se reconoce que<strong> la Sierva de Dios María Antonia de Paz y Figueroa (María Antonia de San José) practicó las virtudes cristianas en grado heroico y la proclamó Venerable</strong>.</li><li>25 de junio de 2015: la Junta Médica de la Congregación para las Causas de los Santos dio su&nbsp;<strong>voto positivo al presunto milagro</strong>&nbsp;ocurrido por intercesión de la venerable María Antonia de Paz y Figueroa.</li><li>12 de noviembre de 2015: La Comisión de Teólogos de la Congregación para las Causas de los Santos emitió un&nbsp;<strong>dictamen unánime y positivo sobre la causa de beatificación</strong>&nbsp;de María Antonia de Paz y Figueroa, también conocida como Mama Antula.</li><li>9 de febrero de 2016: la reunión plenaria de Obispos y Cardenales de la Congregación de la Causa de los Santos en Roma&nbsp;<strong>aprobó por unanimidad todo el proceso de la Causa de Canonización de Mama Antula.</strong></li><li>El 27 de agosto de 2016 fue&nbsp;<strong>beatificada</strong>&nbsp;en su tierra Natal, Santiago del Estero.</li><li>El 24 de octubre de 2023 el Papa Francisco aprobó el segundo milagro que permitó su<strong>&nbsp;canonización</strong>.</li><li>El 11 de febrero de 2024&nbsp;<strong>Santa María Antonia de San José</strong>&nbsp;-Mama Antula- es canonizada en el Vaticano por el Papa Francisco.</li></ul>','1762622261953.jpg',NULL,NULL,1,'2025-11-06 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (11,1,1,NULL,'1760660122986.jpg',NULL,'Descendientes colaterales y devotos de Mama Antula en la Misa en la Basílica de La Piedad: Aldo Marcos de Castro Paz, Susana Saguier Elía, Dolores Costa Paz y sus hijas, Damián Abregú, Jorge Bayá Casal, Sebastián Gorostiaga y las hermanas Mariana y Victoria Bayá Casal',1,'2025-10-28 22:45:56',1);
INSERT INTO `cont_2contenidos` VALUES (12,2,2,'<p>Con una conferencia magistral en el salón parroquial de la Basílica del Socorro brindada por el profesor Aldo Marcos de Castro Paz -historiador y descendiente colateral de María Antonia de San José- se cerró la semana de celebraciones de la primera fiesta litúrgica de Santa Mama Antula, después de 7 años de celebrar, cada 7 de marzo a «la Beata»</p><p>La conferencia se realizó en el marco del Día Internacional de la Mujer. Justamente Mama Antula fue llamada «Mujer Fuerte» en vida por su excepcional obra en pleno siglo XVIII, gestionando ejercicios ignacianos y autorizaciones con Obispos, Virreyes, militares y administradores del cabildo de Buenos Aires en épocas en las que las mujeres estaban confinadas a las tareas domésticas o la vida religiosa en monasterios de clausura.</p>',NULL,NULL,NULL,1,'2025-11-12 19:56:29',1);
INSERT INTO `cont_2contenidos` VALUES (13,24,3,NULL,NULL,NULL,NULL,1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_2contenidos` VALUES (14,7,6,NULL,'1762637132905.jpg',NULL,'Adoración al Manuelito de Mama Antula luego de la Misa, y bendiciones. Fieles y devotos rezando por la paz.',1,'2025-11-08 21:25:32',1);
INSERT INTO `cont_2contenidos` VALUES (15,7,5,NULL,'1762637021230.jpg',NULL,'Procesión de reliquias de Mama Antula y veneración al Manuelito, luego de la Misa en la Basílica de la Piedad.',1,'2025-11-08 21:23:41',1);
INSERT INTO `cont_2contenidos` VALUES (16,23,0,NULL,'1762635928444.jpg',NULL,'En Buenos Aires, a las 5 de la mañana, se reunieron en el Colegio de La Piedad más de 100 personas que compartieron en pantalla gigante la transmisión en directo de la Canonización en la capilla Papal de la Basílica de San Pedro en el Vaticano.',1,'2025-11-08 21:05:28',1);
INSERT INTO `cont_2contenidos` VALUES (17,7,0,'<p>El Domingo 11 a las 10 de la mañana, Mons. Gustavo Carrara presidió la Misa en acción de gracias por su santificación en la Basílica de La Piedad, donde se encuentra el Sepulcro de Mama Antula, que ya desde las 8 de la mañana rebosaba de fieles que hicieron cola para tomar gracia en su mausoleo.</p>',NULL,NULL,NULL,1,'2025-11-08 21:09:24',1);
INSERT INTO `cont_2contenidos` VALUES (18,7,4,NULL,'1762636986650.jpg',NULL,'Mons. Mollaghan, Mons. Carrara, Mons. Baliña y el P. Raúl Canali, en la procesión con las reliquias de Mama Antula en la Misa de acción de gracias en Buenos Aires',1,'2025-11-08 21:23:06',1);
INSERT INTO `cont_2contenidos` VALUES (19,13,1,NULL,'1762640150924.jpg',NULL,NULL,1,'2025-11-08 22:15:50',1);
INSERT INTO `cont_2contenidos` VALUES (20,13,3,NULL,'1762640245999.jpg',NULL,'Firma María Antonia de San José, Beata',1,'2025-11-08 22:17:26',1);
INSERT INTO `cont_2contenidos` VALUES (21,17,1,'<p><strong>María Antonia de San José, la Beata de los Ejercicios, primera santa argentina</strong></p><p>Por la Dra. Alicia Fraschina</p>',NULL,NULL,NULL,1,'2025-11-11 10:12:47',1);
INSERT INTO `cont_2contenidos` VALUES (22,15,4,NULL,'1762640635083.jpg',NULL,'Retrato de Mama Antula pintado por José de Salas, «el madrileño», que conoció a la beata. El retrato fue colocado en la Misa exequial en la que el Padre Perdriel pronunció la Oración Fúnebre. Cuando murió Mama Antula el 7 de marzo de 1779 se cumplió su voluntad: fue enterrada muy sencillamente, sin ataúd ni funerales, en el camposanto de la antigua Iglesia de La Piedad.',1,'2025-11-08 22:23:55',1);
INSERT INTO `cont_2contenidos` VALUES (23,15,1,'<blockquote>Pronunciada por el R. P. Fray Julián Perdriel, prior del Convento de Predicadores de Buenos Aires, en las solemnes exequias que se celebraron en la Iglesia de Santo Domingo por el alma de la Señora Beata María Antonia de la Paz, el día 12 de julio de 1799.</blockquote>',NULL,NULL,NULL,1,'2025-11-11 04:07:57',1);
INSERT INTO `cont_2contenidos` VALUES (24,15,5,NULL,'1762640858832.jpg',NULL,'Sepulcro Histórico Nacional de Mama Antula, donde descansan sus restos, Basíllica de La Piedad.',1,'2025-11-08 22:27:38',1);
INSERT INTO `cont_2contenidos` VALUES (25,15,3,'<p>«Al fin, cristianos, la muerte cruel no satisfecha con haber ya tantas veces arrancando del seno de nuestras familias cuanto en ellas teníamos más amable, padres, hijos, esposos, amigos, caras prendas, pedazos del corazón, como para echar el resto de su insaciable voracidad, se entró inhumana en esta capital el día siete de marzo y, de un solo golpe, nos arrebató con violencia aquella mujer fuerte, que por cerca de veinte años, la edificó con su vida ejemplar, y la santificó por su extraordinario celo; aquella mujer sierva del Señor, sierva devota, <strong>sierva fiel y prudente, declarada mortal enemiga del vicio y de sus sombras; amante firme de la virtud y propagadora incansable de la devoción: aquella mujer fecunda en pensamientos de santidad; diestra y humilde al comunicarlos; intrépida y confiada en Dios para ejecutarlos; constante a todas las pruebas en la necesidad de sostenerlos; aquella mujer superior a su sexo, émula y aun vencedora del varonil, rara y singular;</strong>&nbsp;cuyo corazón se inflamaba cada momento en deseos de nuestra santificación. Sí, la muerte cruel, insensible a nuestra pena, sacó de la tierra de los vivientes aquella mujer…</p><p>Más, ¿para qué anda huyendo de nombrarla, si por último ha de sufrir el ánimo este torrente de amargura? Salgamos de una vez del paso:&nbsp;<strong>vino la muerte inexorable y acabó con la respetable vida de la Señora María Antonia de la Paz o, por llamarla con los nombres que la impuso su devoción y edificante exterior, murió la Señora Beata María Antonia de San José.</strong>&nbsp;Sácala Dios de en medio de nosotros, y quién sabe si porque no éramos dignos de ella y en grave castigo de nuestros pecados, ya no la vemos andar por esas calles, los pies descalzos, cubiertos de polvo y todo fatigado el aliento, conduciendo un cuerpo extenuado con rigurosas abstinencias, y mortificado con ásperos cilicios, toda ocupada en las solicitudes del amor de sus prójimos. Ya no admiramos aquel semblante modesto sin hipocresía, gracioso sin disipación, afable sin bajeza y sin interés. Ya no hieren nuestros oídos aquellos suspiros de lo íntimo de su angustiado espíritu, nuncios y desahogo a un tiempo mismo de su caridad. Su cuerpo yace sepultado como los demás entre la tierra de la parroquia de la Piedad; y su alma, su buena alma, partió al destino que Dios justo y misericordioso haya querido darle. ¡Oh, pesadumbre la que ha venido a recargar nuestro ánimo! ¡Oh, pérdida la que hemos hecho! Vosotros conocéis bien que más es para llorada que para encarecida, y yo añado que de los míos.</p><p>Porque, ¿quién podrá mejor medir el tamaño de esta pérdida irreparable, que vosotros mismos, regulándolo por el precio de los beneficios recibidos por su mediación? Así es que cada uno de nosotros, inspirado de la gratitud, formó su panegírico interrumpido de sollozos y de lágrimas en el momento de su muerte y le repetiréis todas las veces que venga vuestra memoria la de cuánto debéis a la Señora Beata María Antonia de San José.</p>','1762640927832.jpg',NULL,'Celda 8 de la Santa Casa, donde murió Mama Antula: «En esta celda vivió la Venerable Sierva de Dios María Antonia de San José. En ella murió el 7 de marzo de 1799 a las 3 de la tarde».',1,'2025-11-08 22:28:47',1);
INSERT INTO `cont_2contenidos` VALUES (26,12,1,'<p>Dios omnipotente y misericordioso,<br>que en Santa María Antonia de San José,<br>incansable peregrina de los ejercicios espirituales,<br>diste a tu Iglesia un modelo de entrega para<br>anunciar el Evangelio: concédenos, por su intercesión,<br>meditar constantemente el misterio de tu Hijo,<br>para salir al encuentro de los pobres y desamparados.</p><p>Por nuestro Señor Jesucristo, tu Hijo,<br>que vive y reina contigo en la unidad<br>del Espíritu Santo, y es Dios,<br>por los siglos de los siglos.</p><p>Amén</p>','1762828354951.jpg',NULL,NULL,1,'2025-11-11 02:32:34',1);
INSERT INTO `cont_2contenidos` VALUES (27,33,1,'<p>A la luz de la historia Argentina las cartas escritas por Mama Antula han resultado un tesoro nacional, no solo por la fe que transmiten sino por el contenido histórico que contienen. La Beata es considerada la primera escritora del Río de la Plata -lo sería de la Argentina pero a su muerte (en 1779) la Argentina aún no existía como Estado moderno-. Las cartas que enviaba, recibía y que fueron escritas en su tiempo en torno a su excepcional figura eran esperadas con expectativa en Europa y traducidas a diversos idiomas para ser a su vez reenviadas por todo el viejo continente. Mama Antula escribía en español pero al haberse perdido los originales, muchas de sus cartas están reproducidas aquí en otros idiomas. Esas cartas de La Beata -adjuntas a la <em>Positio</em> de su canonización y reproducidas en esta página- pueden ser consideradas como la literatura epistolar originaria más importante -sino la más antigua- de la Argentina. En sus relatos están presentes hechos históricos de la vida del Virreinato del Río de La Plata y reflejan la vida cotidiana de la incipiente aldea ribereña que era Buenos Aires. Cada una de sus cartas resulta un texto coloreado, y juntas forman el todo de ese paisaje «vitreaux» que era el clima previo a la independencia Argentina.</p><p><em>«Hasta la fecha, estamos frente a la mayor epistológrafa del período hispánico del Plata»</em>sostiene don Pedro Luis Barcia, ex presidente de la Academia Argentina de Letras. <em>«Ninguna escritora ni escritor nacido en el Plata alcanzó la difusión mundial que alcanzaron las epístolas de María Antonia, traducidas a las más importantes lenguas modernas -francés, italiano, inglés y alemán- sino al latín, para mayor universalidad de su difusión. Esta situación no puede exhibirla ningún escritor argentino, no ya del período hispánico, sino hasta entrado el siglo XX».</em></p><p>La Beata se escribía con su confesor, el <strong>Padre Gaspar Juárez</strong> –santiagueño como ella, exiliado en Europa luego de la expulsión de los Jesuitas de América-. Dice el sacerdote jesuita e historiador Guillermo Furlong en el libro de Ana María Cabrera: <em>«Le cabe al Padre Juárez la altísima gloria de haber sido</em><strong><em>mentor</em></strong><em>de aquella mujer santiagueña que rivaliza con la santa avileña (</em>N de R: Santa Teresa de Ávila<em>) en cuanto a sus virtudes, y a la que supera en lo andariega, y a la que está a la par en el admirable don persuasivo con que doblegó las frentes más reacias y brujuleó las voluntades más obstinadas. Sin duda alguna, María Antonia de la Paz y Figueroa es una de las figuras femeninas más extraordinarias en la historia universal, y fue Gaspar Juárez quien templó esa alma y contribuyó a la que fue: una Teresa de Jesús de subido tono criollo”. </em></p><p>Se escribía la Beata también con el <strong>fraile Julián Perdriel</strong>-sacerdote dominico que fue su confesor a la hora de su muerte- y con <strong>Ambrosio Funes</strong> -hermano del célebre Deán Funes-, secretario de Mama Antula y actor junto a su hermano de la revolución de Mayo de 1810.</p><p><em>«La prosa de La Beata es de tono familiar, espontánea, fresca, decantada y fluida. No registra repeticiones ni tropiezos, tan frecuentes en el género epistolar de imperitos</em>-comenta don Pedro Luis Barcia. <em>Llama la atención su decir llano, fácil y sin afectación. Nunca se mete en «bachillerías», como decía burlándose de ese intento Teresa la avilense».</em></p><p>Barcia, al igual que el P. Furlong, también compara la tarea y estilo de Mama Antula con el de Santa Teresa de Ávila y con aquello de que Dios anda entre los pucheros: <em>«También en el caso de María Antonia se alternan los momentos de recogimiento con los trajines de la cocina y previsiones de lo pequeño y cotidiano».</em></p><p>Gracias al paciente trabajo de transcripción de estas cartas, realizado por devotos de Mama Antula -que han sido clasificadas e identificadas por la Dra. Silvia Mónica Correale (postuladora de la causa de canonización), Mons. Guillermo Karcher (colaborador), Mons. José Luis Gutiérrez (relator)- las reproducimos con breves epígrafes que intentan ofrecer el horizonte histórico al momento de ser escritas, para su mayor comprensión y disfrute.</p><p>Los textuales de Pedro Luis Barcia, Presidente de la Academia Argentina de Letras, son extractos de su ponencia en las Jornadas de Literatura Colonial del Cono Sur realizadas en Buenos Aires el 29 y 30 de noviembre de 2001 por el Centro de estudios Iberoamericanos de la Universidad Católica Argentina.</p>','1762820888907.jpg',NULL,'Ilustración de Máximo de Castro Paz.',1,'2025-11-10 17:06:44',1);
INSERT INTO `cont_2contenidos` VALUES (28,32,3,'<p><em>Blanco VII: ACSBA (original, en castellano); ASR 19-21 (en castellano); G 24; B 30-32. Otras versiones: Blanco VIII: G 18; ASR 11-16 (Lettera continuazione) y ASR 69-72 (Lettera 3a al medesimo soggetto). Cf. también Blanco X: ACSBA (original); G 24 / Blanco XXIV: P 201-203 (en francés): C. P., 290-292. Pax Christi</em></p>',NULL,NULL,NULL,1,'2025-11-10 19:51:14',1);
INSERT INTO `cont_2contenidos` VALUES (29,5,1,NULL,'1762871415624.jpg','1762871428082.jpg',NULL,1,'2025-11-11 14:30:15',1);
INSERT INTO `cont_2contenidos` VALUES (30,31,2,'<blockquote>En 1780 Buenos Aires formaba parte del Virreinato del Perú. En esta carta Mama Antula comenta que el Obispo de Cuzco -Juan Manuel Moscoso- la ha autorizado a abrir oratorios en casas en la provincia de Córdoba del Tucumán. En esta época recién se inicia su tarea evangelizadora en Buenos Aires, para la que solicita colaboraciones y donde dice haber dado 4 tandas de Ejercicios Espirituales, mientras que en Tucumán ya ha ofrecido 60 retiros a la fecha de esta carta</blockquote>',NULL,NULL,NULL,1,'2025-11-10 19:58:30',1);
INSERT INTO `cont_2contenidos` VALUES (31,31,3,'<p>Buenos Aires, 7 de agosto de 1780.</p><p>La gracia del Espíritu Santo ilumine su alma eternamente, mi carísimo Don Gaspar en Jesucristo. He quedado muy reconocida a los singulares favores y privilegios que Vuestra Merced me ha alcanzado de Su Santidad y en las gracias que me confieren, trascendentales a toda mi descendencia, y en las que se me franquean <strong>concediéndome altar portátil para la protección de mis peregrinaciones.</strong> El Señor se sirva remunerarle en la vida futura estos beneficios; cuya posesión excitara cada día la frecuencia de mis recomendaciones al Altísimo, porque le de feliz despacho a todas las pretensiones que le convengan. A más de esto, procuraré interesar en el mismo logro de sus deseos a muchos y a todos, si fuese posible, de los que participan de tan utilísima concesión, y cuando tanta abundancia de deprecaciones no se obtenga, la Divina Providencia suplirá nuestros defectos en su obsequio, por habernos proveído por sus propios esfuerzos de tantos tesoros que redundarán en honra y gloria de Su Divina Majestad.</p><p>La vehemencia irresistible de este principio y el anhelo de heredar el espíritu de quien estableció (entre otros prodigios de la gracia) los Ejercicios Espirituales, con el proyecto de reformar las costumbres de todo el mundo y cristiandad principalmente, me han constituido en la profesión de esta parte de su Instituto.</p><p>Toda la provincia de Tucumán sus ciudades y jurisdicciones quedan exhortadas, habituadas y dispuestas a continuación, después de haberlos recibido en distintas ocasiones mediante a que Su Divina Majestad se sirvió adornar a sus vecinos de una docilidad y amor para recibirlos, por mis reconvenciones (es verdad) menos que por su celestial inspiración. Tan piadosamente dispuestos encontré los corazones de sus moradores, que sin extrañarlos (como que se hallaban insinuados y nutridos de ellos tan de antemano), ni repugnarlos, obedecieron la voz de su pobrecilla sierva, resolviendo tomarlos en mi presencia y reiterarlos en mi ausencia.</p><p>Hoy me hallo en esta ciudad fomentando la propagación de la misma empresa, y aunque hace once meses a que estoy demorada por defecto de licencias del Ilmo. actual (cuando más he merecido promesas sin efecto), con todo <strong>mi fe no varía y se sostiene en quien la da.</strong> Se me proponen varios impedimentos: el mundo está un poco alterado; los superiores no muy flexibles; los vecinos vacilando sobre mi misión; otros la reputan de fatua; en suma, cooperaron a ello rumores frívolos; empero, la providencia del Señor hará llanos los caminos, que a primera vista parecen insuperables. Todo lo puedo en el que me conforta.<strong> En esta atención espero firmemente recoger en breve la abundante mies que ofrece el país. </strong>Y si Su Divina Majestad rodea las cosas de tal conformidad, que sea indispensable diseminarlos en todas las provincias del Virreinato y de todo el Orbe, será preciso suministrarlos y anunciarlos en todos sus climas.</p><p>Meditando cuánto merece ser amada la Bondad infinita de mi Dios, juzgo muy corto recinto la estrechez de este mundo y de millares que hubiera, para ofrecerlos con los posibles, todos cubiertos de inocencia y penitencia a su honor y gloria. Ya que no lo puedo servir con obras de esta naturaleza, lo deseo.</p><p>Y así concluida mi carrera en América, pienso trasladarme a esos Reinos de Europa. Semejante determinación quizá la verifique dentro de poco tiempo. No obstante, pídale Vuestra Merced el dictamen correspondiente a mi confesor, que quiero experimentarlo. ¡Oh, mi Dios, y quien os viera ya amado de todas sus criaturas tanto cuanto sois de amable, o a lo menos fuese nuestra caridad igual al grado de maldad con que se envuelven nuestras ofensas para contigo!</p><p><strong>Vuestras Mercedes que han sido alimentados con el suave néctar de la tierra madre, la Compañía de Jesús, establecida sobre su honra y gloria, con que santificó a su fundador Ignacio, deben atender con sus ruegos y lágrimas incesantes la propia empresa, hasta que la veamos extendida con los mayores y más rápidos progresos. </strong>Así lo pido y espero conseguir.</p><p>Algunos han reputado, según he dicho, mis pretensiones por locas o por ridículas. No me embaraza este desorden, porque el mundo, siempre fatuo y siempre adverso al Evangelio, debe explicarse con oposición a todo lo que le es contrario. Todas sus objeciones se desvanecen sucesivamente y no sirven de otra cosa que de añadir trofeos y realces a mi misión. Bien me intima Jesucristo: Los perseguirá el mundo, pero alentaos; yo he vencido al mundo. A veces me parecen tan necesarias sus contradicciones, que sin ellas quizás desconfiaría de la conveniencia de mis obras; y no puedo menos que conocer que son la señal característica de las proezas que toman fuerza y origen del mismo Jesucristo; he Vuestra Merced aquí el fundamento por que siempre aguardo la resurrección de su orden. Algunas reliquias yacen sumergidas y esparcidas por el Orbe, y no será mucho que, agradando a Dios, su reunión forme de los últimos residuos el mismo cuerpo, la misma religión.</p><p>Otro asunto he meditado concerniente a su profesión y es que se administre a este pueblo un asalto o misión de aquellas que acostumbraban, y me parece que también lo conseguiré. <strong>Su Excelencia (el Virrey) y el Obispo se hallan requeridos para su ejecución</strong>. El cielo bendecirá sus permisiones. Si el éxito no corresponde a mis deseos, atribúyalo a mis pecados y rueguen a Dios los oculte del rostro de su Padre.</p><p>La víspera de la Asunción le mandé decir a mi San Estanislao una misa cantada en su iglesia y propio altar, en su honor y reconocimiento de haber docilizado los ánimos y dándome proporción de seguir en breve con mis designios. Le vistieron de peregrino y estaba para ojeado.</p><p><strong>Volviendo al asunto primario, digo que Vuestras Mercedes, como prácticos, me consigan cuantas gracias, cuantas preeminencias y privilegios me son conducentes a hacer más cómoda, interesada y atractiva mi misión, mediante las distancias dilatadas, caminos fragosos, países desiertos, pueblos desproveídos y otros mil inconvenientes que hay que experimentar.</strong> Con eso la abundancia de concesiones suavizará y hará amables todos sus obstáculos. A esto agregaré algunos arbitrios que me dicte la Divina Providencia, a quien únicamente debo todo lo que se invierte en las citadas obras piadosas. A más de lo cual, yo quiero operar con mayor libertad y darle otra reputación a mi empresa, para atraer almas a Dios hasta de los sentidos, y así Vuestras Mercedes discurran si es preciso en este intento, que yo les remita certificaciones y letras auténticas de la prosperidad que Dios me ha conferido en sus Ejercicios.</p><p><strong>Del Sr. Moscoso, actual Obispo de Cuzco, tengo una patente, en que, a más de concederme amplia facultad de distribuirlos en toda la Provincia de Tucumán indistintamente a pueblos, personas, lugares y tiempos, me permite abrir oratorios en casas particulares. </strong>Los demás canónigos y superiores de todas aquellas comarcas me ofrecen espontáneamente la misma exhibición, que, como hasta aquí me ha sido inútil, no me he querido aprovechar de ella, la cual en lo sucesivo puede graduarse por un prudente auxilio para lo que se ejecute. Hay tiempo de adquirir dichos documentos que remitiré con oportunidad.</p><p>El principio de la honra y gloria de Dios no me permiten separarme de los medios que la fomentan; por esto suplico a Vuestras Mercedes encarecidamente cooperen conmigo a su dilatación; yo que he corrido los países referidos y que tengo noticias de todo este Reino, informo a Vuestras Mercedes de <strong>la notable falta de pasto espiritual</strong> que echamos menos y lloramos por estas partes, y principalmente en cuanto a misiones y Ejercicios. Cuando yo a mis solas, dentro del silencio de mí misma, reflexiono (considero) este punto, soy oprimida de aflicción, me lamento y suspiro incesantemente por el remedio que exigen tales necesidades, y no encuentro otro arbitrio de ser dichosa, sino el agitar aquel del cual dimana la precaución contra estos males.</p><p>La administración de bienes espirituales que Dios prepara por mis manos, sin embargo de la indignidad con que admito semejantes beneficios y de la divina misericordia con que para ellos se distingue, me hacen inferir que Su Divina Majestad tal vez me conceda terminar mi carrera en la práctica de algún proyecto que produzca utilidades permanentes; cuyo establecimiento es indispensable robe las atenciones de Vuestras Mercedes, aunque las hayan anticipado penetrando mis designios. Los que actualmente forman toda mi ocupación pueden servir de previas disposiciones para aquellos; por lo que espero que Vuestras Mercedes hagan de éstos el uso más conveniente en elevar sus ideas hasta donde Su Divina Majestad fuese servido.</p><p>A mi confesor muchas expresiones de caridad, y así a él, como a Vuestras Mercedes, ruego no se olviden de mí, cual yo siempre le pido a Dios me los haga unos santos y guarde su vida muchos años.</p><p>Buenos Aires, 7 de agosto de 1780. B.L.M. de Vm. su aficionada y humilde sierva María Antonia de S. José.</p><p>P. D. La Casa de Ejercicios de esta ciudad, sin embargo de las órdenes de Su Majestad, se halla ocupada con ciertos huérfanos, lo que da motivo para denominarla hoy Casa de la Cuna. Nada de esto me impedirá franquear mis Ejercicios, porque <strong>habiendo oratorio en una casa capaz se remedia todo.</strong> No obstante, quisiera ver las cosas en su lugar. Sin salir de este régimen, <strong>he dado en la provincia del Tucumán 60 Ejercicios; aquí 4,</strong> y Dios quiera que pasen al número primero; yo quisiera darlos en todo el mundo; por lo que deseo una licencia para que nadie me ciña, sujete, ni detenga a lugar determinado.</p>','1762804771094.jpg',NULL,'En tiempos de Mama Antula disponer de un altar portátil permitía transportarlos fácilmente para celebrar Misa en diferentes lugares y facilitar la evangelización. Foto: Altar portátil (comienzos siglo xx) Museo de Arte Religioso Juan de Tejeda (Córdoba, Argentina).',1,'2025-11-10 19:59:31',1);
INSERT INTO `cont_2contenidos` VALUES (32,30,3,'<blockquote>Por la inmediata traducción de las cartas de Mama Antula a diferentes idiomas apenas recibidas en Europa, muchas de ellas han sobrevivido solo en sus versiones en lenguas extranjeras. Tal es el caso de esta en francés escrita por Mama Antula desde Córdoba -donde está dando los Ejercicios Espirituales en tandas de 200 a 300 personas-, antes de iniciar su tarea evangelizadora en Buenos Aires. Comenta su esperanza profética de que la Compañía de Jesús será restituida; que cada 19 de mes hace dar una Misa en honor a San José y sus peripecias atravesando desiertos y al cruzar ríos caminando descalza durante cientos de kilómetros por la zona hoy denominada Noroeste Argentino.</blockquote>',NULL,NULL,NULL,1,'2025-11-10 20:01:32',1);
INSERT INTO `cont_2contenidos` VALUES (33,30,4,'<p>J’ai toujours été dans cette opinion et j’y suis encore, que la <strong>Compagnie de Jésus sera un jour rétablie; </strong>et pour obtenir cette grâce plus eff i cacement du Seigneur, si désirée de nous tous, je fais <strong>célébrer solennellement une Messe tous les 19 des mois en l ’ honneur de St. Joseph</strong> et je n ’ ai pas manqué partout où je me suis trouvée d epuis le départ de la Compagnie de ces contrées, comme les Exercices de St. Ignace n ’ ont point été interrompus depuis ce temps dans notre Patrie, à l ’ exception de trois années que j ’ ai été absente occupée à les établir dans la Province. Mon Evêque, N. S. Jean Emmanuel de Moscoso que je trouvai à Jujuy, m ’ accorda avec bonté tout ce qui pouvait faciliter les Exercices Spirituels; jusqu ’ à me permettre une chapelle privée perso n nelle et de faire faire les Exercices dans quelque lieux ce fut commode pour cela da ns tout son Diocèse: autant qu ’ on a pu, on les a donnés dans les Maisons qu ’ avaient les Jésuites. Dans cette ville de Corduba on les a donné pendant quatorze semaines et à chaque semaine il y avait plus de 200 personnes et quelqu e fois 300, sans que grâces à Dieu il y eut jamais de confusion ni qu ’ on eût rien souffert ou pour les habitations, ou pour les vivres, quoique toutes les dépenses n ’ ayant d ’ autre fond que les a u mônes. La Providence y a si bien pourvu que dans le même temps on pouvait aider encore le s pauvres et les prisonniers. Les fruits retirés de ces Saints Exercices ont été si constants qu ’ on y voit visiblement la main de Dieu, et le concours si grand que sans y appeler personne, on se trouvait dans le cas de ne pouvoir pas accepter tout le monde , et de les remettre à une autre fois. Au milieu de la grande consolation que j ’ éprouve à la vue du grand bien qui se fait aux âmes, je ne puis vous cacher les peines que je souffre.</p><p>La plus grande est que où la moisson est si abondante, les ouvriers sont si rares; encore si le petit nombre qu’on a voulait se donner tout de bon à la besogne. Que sert de semer beaucoup, si on a personne pour cultiver le terrain, et faire la moisson. C’est de là que vient la diminution des Sacrements; jusqu’au point que plusieurs ne peuvent satisfaire au devoir pascal. Les paroisses sont vastes, sans grand nombre de chrétiens et presque toutes se trouvent dispersées ça et là et loin de leur curé de 10 à 20 lieues.</p><p>L’aide qu’avaient les curés, était qu’avant Pâques les Missionnaires Jésuites parcouraient ces paroisses, instruisant, prêchant et confessant, ainsi la besogne du curé à Pâques, lui pesait moins.</p><p>On parle là des Missions du Paraguay conduites autrefois par les Jésuites qui avant leur destruction étaient au nombre de 55, composées de plusieurs nations Indiennes, dont plusieurs étaient Catéchumènes. Les plus nombreuses étaient celles des Granirs et des Chichites, on y comptait environ 125 mille âmes.</p><p>Je fus établie Régulatrice des Exercices Spirituels, et pour que le fruit en soit plus grand, elles sont sous la protection de Notre Dame des Douleurs et des Saints de la Compagnie dont je fais célébrer lés Fêtes avec solennité.</p><p>Plusieurs personnes me sollicitent très fort de me transporter à Buenos: Je ne saurais me résoudre à rien jusqu’à ce que je voie clairement que c’est la volonté de Dieu. Et pour vous dire le tout en confiance, je ne fais pas un pas sans que le Seigneur me le commande et me conduise sensiblement comme par la main.</p><p>Comment cela arrive-t-il? Misérable que je suis. Je ne le sais pas. Cependant la chose est ainsi. De plus, si vous voulez que je vous instruise des soins tout amoureux de la Providence sur moi quelque indigne que j’en suis, sachez que dans mes pénibles voyages, dans des Pays si mauvais, </p><p>dans les déserts, obligée de passer de<strong>s fleuves, des torrents, j’ai toujours marché pieds nus, sans qu’il me soit rien arrivée de fâcheux: au contraire</strong></p><p> quelquefois que je me suis trouvée assez mal comme cela est arrivé à Catamarca où je fus désespérée des médecins, en me recommandant à la Sainte Vierge, sans autre remède je me levai du lit et continuai mon voyage jusqu’à Rioja. Une autre fois que je me rompis une côte par une chute, une autre que je m’étais donnée une entorse au pied, je me sentis par un tact invisible, guérie.</p><p>Salués tous nos chers frères et en particulier mon ancien Confesseur. Que tous m’aident de leurs prières sans quoi je ne puis rien. Votre Soeur Marie Antoinette de St. Joseph.</p><p> Corduba, dans le Tucuman, le 6 janvier 1778.</p>','1762804934411.jpg',NULL,'Ícono de Mama Antula, por Luis Quiróz',1,'2025-11-10 20:02:14',1);
INSERT INTO `cont_2contenidos` VALUES (34,30,5,'<p><em>Cf. Blanco II: AL (en francés); G 16; P 184-186 (en francés): C. P., 273-275. Una versión existe también en ASR 62-66 (en italiano). No se conoce el original en castellano.</em></p>',NULL,NULL,NULL,1,'2025-11-10 20:02:35',1);
INSERT INTO `cont_2contenidos` VALUES (35,32,2,'<p>Buenos Aires, 9 de octubre de 1780.</p><p>La gracia del Espíritu Santo sea con Vuestra Merced, mi Don Gaspar.</p><p>Esta carta es continuación de la que le acompaña.</p><p>La una dará a Vuestra Merced instrucción completa de los motivos y sucesos de mi esperanza, dirigida a suministrar en esta ciudad los Ejercicios de Nuestro Padre San Ignacio; la otra le impondrá de su consecución.</p><p>Aquélla es testimonio de mis aflicciones, por la supresión del aumento de la gloria y honra del Señor, que precisamente resultarían de ellos mismos. Ésta es un diseño e incentivo del gozo que me causa la actual práctica de contribuirlos. En suma, la primera suscitó (si me es permitido hablar así) los efectos de la terrible justicia del Señor; la segunda la produjeron los que dimanan de la inmensa, suave y amabilísima misericordia del Altísimo, de quien profirió el Profeta: “Señor, toda la tierra está inundada de tus misericordias”.</p><p>En efecto, han tomado las cosas de un instante a otro tal semblante, que cuando no se pensaba comúnmente sino en la repulsa de esta obra del cielo, se dispuso de un modo improviso su admisión, la cual ha provenido de las amplias facultades y permisos que me ha franqueado el Excmo. de esta Diócesis, siendo él mismo que antes más la resistía por fines que sin duda graduó por convenientes.</p><p>Luego que le obtuve, solicité casa distinta de la que se debía destinar, por hallarse ésta ocupada con ciertos huérfanos, como abajo expondré. Pero como son de Dios todas las que poseen los hombres, un pobrecito de éstos me ha cedido la suya para todo el tiempo que quiera, cuyas protestas (sin embargo de la tibieza con que parece la ofreció a los principios), las reitera inducido de gozo al fin de cada uno de dichos Ejercicios; y aunque es bastante estrecha nos facilita hasta hoy la extensión suficiente a adecuar los actuales designios del Señor.</p><p><strong>Su capacidad admite poco más de 100 personas con mucha incomodidad; </strong>como en los primeros y segundos Ejercicios concurrió poca gente, se dieron con regular desahogo. <strong>En los terceros empezamos a sentir su estrechez, porque llenaron toda la casa</strong>. Y últimamente en los cuartos, que estamos siguiendo, nos han oprimido con exceso y tanto que es preciso privarles la introducción de catres y cujas, para que así se den lugar unas a otras, tiradas en el suelo sobre esteras, chuces y colchones. Si el número de ellas se va recrudeciendo sucesivamente (como lo voy experimentando y promete el país), <strong>es necesario que Su Divina Majestad y mi Señora de los Dolores me oigan, a fin de que me provean de habitación correspondiente a la multitud de almas que anhelan nutrirse con el maná que adquieren mediante las sabias cristianas reglas que nos prescribió Ignacio</strong>; tan abundante en el espíritu que agita a las mujeres de este país. La referida casa que hoy sirve, está colocada calle de por medio frente a frente de la iglesia de San Miguel, adonde pasamos todos los días, mañana y tarde, a oír la Misa y pláticas del presentado Fr. Diego Toro, que las dispone y vierte con celestial emoción propia de su bello espíritu.</p><p>El alimento, aunque no hay fincas visibles,<strong> lo da Dios muy sobrante, excesivo y sazonado</strong>, con que logro complacer a todas las que los participan, quienes a más de esta dicha que logro no recusan mezclarse (hablo de las señoras principales ) con las pobrecitas domésticas, negras y pardas que admito con ellas. Ya se hace indispensable valerme de estos humildes arbitrios, para no malograr ni perder el fruto que ofrece el mismo Jesucristo, que jamás fue aceptador de personas.</p><p>Bien parece que carecían estas gentes de que mi misión fuese autorizada con algunas distinciones de hombres, y hasta en esto Dios les ha dado el gusto a unas, y a otras mucho en qué entender. A este intento han observado que los Excmos., que actualmente se hallan aquí, a saber: el de la misma ciudad y el Carmelita español de nuestra provincia (que llegó en el convoy poco más ha de un mes, mientras daba mis primeros Ejercicios), han asistido repetidas veces a las pláticas, que las han aplaudido con tanta complacencia, como lo restante de las distribuciones interiores que seguimos. El primero concurría casi solo, pero el segundo ha venido varias veces con lo más de su familia. Concluida su asistencia, sin duda en demostración del aprecio de tal obra, nos concedió indulgencias a todas las personas que participasen de ella, ejercitantes y no ejercitantes.</p><p>Ya he expresado cuántos favores me tributa el Excmo. de aquí; se me ha ofrecido a cuanto yo disponga de sus facultades y persona en lo posible. El nuestro es un sujeto de muchísimas circunstancias: es santo y es sabio con cuantas prendas pueden apetecerse capaces de equivocarle con los Padres primitivos. Los designios que lleva para efectuados en nuestra provincia, son los más adecuados a un verdadero pastor y, si no fuera por demorarme, yo le hiciera aquí un elogio de ellos. Baste por ahora decirle que me ha propuesto regrese a su diócesis, a fin de que juntos corramos su provincia, yo sin variar de profesión y él en calidad de confesor, pastor y misionero. ¿Puede darse mayor felicidad? Tales son los estímulos que a Vuestras Mercedes les presento, por los cuales vendrán en conocimiento del amor que mutuamente nos une en Jesucristo, a quien es debida toda preferencia, no a mí. “No a nosotros, Señor, no a nosotros, sino a Vuestro Nombre se debe tributar todo honor y toda gloria”. Si alguna cosa tenemos, es confusión.</p><p>A más de esto, después de haberse informado de mis asuntos y de habernos tratado (bien que no como deseábamos), me ha intimado el precepto, como superior tan legítimo, de que le escriba cuanto ocurra, y de que vuelva según el espíritu de sus órdenes futuras. Él sale mañana para Córdoba. Yo estoy muy contenta con este hombre raro, y confío en mi Dios, que me lo ha traído para cosas grandes. Así se lo expresó, según me cuentan, un alma justa, al tiempo de morir en España; y sus obras bien lo indican.</p><p>Prestándole la obediencia que debo no podré tan fácilmente transmigrarme a esos reinos. Si bien que yo en todo he de seguir la interior voz de mi Señor y Dios; también las inspiraciones de nuestra Señora de los Dolores. En adelante le referiré a Vuestra Merced las cosas conforme ocurran y me parezca. Entretanto ruegue a Dios con mis hermanos, se haga en mí cuanto fuere mayor honra, gloria y beneplácito del Altísimo.</p><p>La Casa de Ejercicios, ya he dicho, que se halla ocupada por ciertos huérfanos. Llegará ocasión que vuelva a su primitivo destino, si viene. Dios lo hará todo.</p><p>“Su diestra es omnipotente” y en tanto participamos de su fuerza en cuanto confiamos menos en los auxilios humanos. Cualquiera que sólo ponga la mira en tales socorros caducos suministrados por manos de hombres perderá todas sus empresas, confundirá su fe, se perderá eternamente, y así será “maldito el hombre que confiare absolutamente en otro hombre”.</p><p>Esta luz es bastante para afianzar en nuestras almas toda esperanza aun sobre aquellas cosas más destituidas de restauración. La esperanza que Dios aprecia es la que merece corona; quiero decir, la sólida, la firme, la perseverante.</p><p>Y así, ánimo, queridos, ánimo y fortaleza. La omnipotencia del brazo del Altísimo no descaece ni cede a nadie; y si algún vigor debe sostener nuestros corazones, su diestra le da, le señala y le conserva. El miserable poder y disposiciones de los hombres alucinan nuestros sentidos; pero el torrente de su fuerza destruye a aquéllas y protege hasta el fin a los inocentes, humildes, abatidos.</p><p>Poco ha nos han llenado de gozo las noticias del paisano Canónigo Juárez, quien habiendo verificado su introducción al Chaco en compañía del Coronel Comandante Don Francisco Gavino de Arias, vecino de Salta, ha convertido o reducido a la paz sola, o también a la religión, a tres numerosas naciones y prosiguen con la solicitud de alianza con otra más o con otras varias.</p><p>Ignoramos la prolija individualidad de su expedición. Procuren Vuestras Mercedes encomendar a Dios todas estas cosas, que yo no me olvido de las suyas.</p>','1762805136287.jpg',NULL,'Acuarela de José Torres Argañaráz (2020)',1,'2025-11-10 20:05:36',1);
INSERT INTO `cont_2contenidos` VALUES (36,5,2,'Del Arzobispado de Buenos Aires','1762872082903.jpg','1762872098223.jpg',NULL,1,'2025-11-11 14:41:22',1);
INSERT INTO `cont_2contenidos` VALUES (37,25,4,'<p><a href=\"https://www.google.com/maps/d/u/8/viewer?mid=1I24ck3_l92w-4RpLlUbygrFnW4K4_DBn&amp;ll=-33.034478022251385%2C-60.96347780000002&amp;z=5\" target=\"_blank\">En Argentina</a></p><ul><li>Templete Mama Antula -villa Silípica, Santiago del Estero-</li><li><a href=\"http://mamaantula.com/2021/11/30/mama-antula-es-un-tesoro-de-nuestro-pais/\" target=\"_blank\">Basílica de San Ponciano -La Plata-</a></li><li><a href=\"http://mamaantula.com/2021/06/29/mama-antula-en-la-catedral-de-moron/\" target=\"_blank\">Catedral de Morón</a></li><li>Santuario Nueva Pompeya -Mar del Plata-</li><li>Catedral Nuestra Señora del Carmen -Santiago del Estero-</li><li>Catedral de Santa Fe</li><li>Pquia. San Cayetano, Río Cuarto -Córdoba-</li><li><a href=\"http://mamaantula.com/2021/02/18/hogar-de-cristo-mama-antula/\" target=\"_blank\">Hogar de Cristo Mama Antula</a> -Isidro Casanova-</li><li>Santuario Nuestra Señora delos Milagros -Santa Fe-</li><li>Parroquia Santo Domingo de Guzmán -San Isidro-</li><li>Santuario Mama Antula -Santiago del Estero-</li><li>Catedral de Añatuya -pquia. Virgen del Valle, Sgo. del Estero-</li><li>Casa de Espiritualidad Mama Antula, Berisso, Buenos Aires</li><li>Santuario Mama Antula, Villa Silípica, Sgo. del Estero</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li>Colegio Hogar San Mauricio, González Catán, Buenos Aires</li><li>Parque Unidad Nacional, Merlo, Buenos Aires</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li><a href=\"https://goo.gl/maps/gGqSLBnNiw9iKYzP7\" target=\"_blank\">Basílica La Consolata, Sampacho, Córdoba</a></li><li><a href=\"https://goo.gl/maps/wKw8Ecu8cUGH1JWHA\" target=\"_blank\">Casa de Ejercicios Madre María Antonia de Paz y Figueroa, La Candelaria, Salta</a></li><li>Catedral de Salta</li><li>Catedral del Santísimo Salvador, San Salvador de Jujuy</li></ul>','1762830036884.jpg',NULL,'Mapa de la Argentina',1,'2025-11-11 03:00:36',1);
INSERT INTO `cont_2contenidos` VALUES (38,25,1,'<p><a href=\"/contactanos\" target=\"_blank\">Envianos un mensaje</a> si querés que incluyamos el retablo, imagen o devoción de tu comunidad.</p>',NULL,NULL,NULL,1,'2025-11-11 02:51:07',1);
INSERT INTO `cont_2contenidos` VALUES (39,25,5,'<p><a href=\"https://bit.ly/DevocionesMamaAntula\" target=\"_blank\">En CABA</a></p><ul><li><a href=\"http://mamaantula.com/2021/12/01/actividades-en-la-santa-casa-2/\" target=\"_blank\">Santa Casa de Ejercicios Espirituales</a>, CABA</li><li>Sepulcro Histórico Nacional Mama Antula, Basílica de La Piedad, CABA</li><li>Catedral Metropolitana de la Ciudad de Buenos Aires, CABA</li><li><a href=\"http://mamaantula.com/2021/02/07/mama-antula-y-san-cayetano/\" target=\"_blank\">Santuario San Cayetano de Liniers</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/02/24/por-los-que-sufren/\" target=\"_blank\">La Esperanza de Puerto Madero</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/08/08/mama-antula-en-su-parroquia/\" target=\"_blank\">Parroquia de La Concepción</a>, CABA</li><li>Plaza Santiago del Estero -CABA-</li><li><a href=\"http://mamaantula.com/2021/12/30/la-mayolica-de-mama-antula/\" target=\"_blank\">Estación Sáenz Peña, Subte A -CABA-</a></li><li><a href=\"http://mamaantula.com/2021/12/29/mama-antula-en-alpi/\" target=\"_blank\">ALPI Asociación Civil</a>, CABA</li><li>Iglesia Ntra. Sra. de Montserrat, CABA</li><li>Cripta de la Iglesia Ortodoxa San Martín de Tours, CABA</li></ul>','1762830105475.jpg',NULL,'Mapa de CABA',1,'2025-11-11 03:01:45',1);
INSERT INTO `cont_2contenidos` VALUES (40,26,1,'<p><strong>Fiesta de santos y santas</strong></p><p>Bajo el lema «Los santos, faros que iluminan caminos» celebramos el día de todos los santos contemplando una imagen que muestra a Mama Antula como catequista y rodeada de su mundo y de los santos y santas de su mayor devoción.</p><p>La ilustración -de Dolores Avendaño- resume el mundo y la actitud de Mama Antula, la primera santa argentina: <strong>para encontrar a Dios hay que abajarse.</strong> Porque Dios está en los más pequeños, frágiles, pobres y vulnerables.</p><p>En la ilustración, a la izquierda, aparece a lo lejos la <strong>Basílica de Luján,</strong> por donde entró Mama Antula a Buenos Aires, después de haber caminado evangelizando por Santiago del Estero, Jujuy, Salta, Tucumán, La Rioja, Catamarca y Córdoba.</p><p>Están acompañándola los santos y santas a quienes les profesaba especial devoción:<strong> San Cayetano </strong>-con el Niño Dios en Brazos-,<strong> la Virgen de los Dolores</strong> y <strong>San José</strong>.</p><p>La naturaleza a pleno revela en cierta forma algo del Pesebre -están todos sus actores- y su Santiago del Estero natal está presente en el <strong>cactus.</strong> No faltan las <strong>mujeres </strong>-que la ayudaron en su misión- y <strong>la familia.</strong></p><p>Como telón de fondo, la obra cúlmine de Mama Antula: <a href=\"https://mamaantula.com/santa-casa-de-ee/\" target=\"_blank\">La Santa Casa de Ejercicios Espirituales.</a></p>','1762830673474.jpg',NULL,'Mama Antula, rodeada de los santos de su devoción. Ilustración de Dolores Avendaño.',1,'2025-11-11 03:11:13',1);
INSERT INTO `cont_2contenidos` VALUES (41,27,3,NULL,NULL,'IaH5YJQGTBg',NULL,1,'2025-11-11 03:27:23',1);
INSERT INTO `cont_2contenidos` VALUES (42,27,2,'<p><strong>Doña Jovita a Mamá Antula</strong></p><p>Doña Jovita -interpretada por José Luis Serrano- es una abuela del interior de la Argentina, humilde, que exhuda la sabiduría de los años y las adversidades de la vida. En esta genial payada describe aspectos de la vida y obra de Mama Antula, predecesora del Cura Brochero en la difusión de los Ejercicios Espirituales.</p>',NULL,NULL,NULL,1,'2025-11-11 03:15:21',1);
INSERT INTO `cont_2contenidos` VALUES (43,29,1,'<p><strong>Llamado a la santidad</strong></p><p>Video biográfico de Mama Antula, que intercala escenas reales de adolescentes en la escuela con un gran trabajo interpretativo al momento de encarnar los principales momentos y prodigios de la primera santa argentina. Realizado por estudiantes del Colegio de la Providencia (Bella Vista, Bs. As)</p>',NULL,NULL,NULL,1,'2025-11-11 03:28:40',1);
INSERT INTO `cont_2contenidos` VALUES (44,29,2,NULL,NULL,'StqZFOuH23Q',NULL,1,'2025-11-11 03:29:13',1);
INSERT INTO `cont_2contenidos` VALUES (45,26,2,'<p><strong>Mama Antula catequista</strong></p><p>En el 1700, nuestra beata de la Compañía de Jesús enseñaba la Palabra de Dios a los niños de las comunidades originarias de Santiago del Estero. En 2010 el Cardenal Bergoglio pidió a los catequistas de Buenos Aires que rezaran ante el sepulcro de Mama Antula. Y en 2021, ya siendo Papa Francisco, declaró el Ministerio Laical del catequista, que se celebra cada 21 de agosto.</p><p>Recordamos un fragmento de la carta a los catequistas que el Cardenal Jorge Bergoglio -hoy Papa Francisco- escribió en el Día del catequista de 2010:</p><blockquote>«..¡No te canses de sembrar! Y en este año del Bicentenario,<strong> me animo a proponerte que te acerques como peregrino a la Parroquia de Nuestra Señora de la Piedad. Y ante la tumba de la Madre Antula, pedile para vos, para mí y para cada uno de los catequistas de esta bendita ciudad, su grandeza y su fortaleza.</strong> Suplicale la gracia de poder acompañar y cuidar la fe de nuestro pueblo fiel como ella lo supo hacer tres siglos atrás, en circunstancias también difíciles como las actuales. Será una manera de <em>“anticipar la aurora, y construir la esperanza”.</em>Que Jesús te bendiga y la Virgen Santa te cuide. Afectuosamente. «</blockquote><p>Card. Jorge Mario Bergoglio SJ, arzobispo de Buenos Aires. Buenos Aires, 21 de agosto de 2010</p>','1762831981080.jpg',NULL,NULL,1,'2025-11-11 03:33:01',1);
INSERT INTO `cont_2contenidos` VALUES (46,26,3,'<p>Mama Antula, célebre por la enorme obra evangelizadora que realizó en el territorio del virreinato del Perú y del río de la Plata, dio sus primeros pasos como <strong>catequista de los indios de Santiago del Estero</strong>.</p><p>Hablaba en quechua y compartía la vida con las comunidades originarias con estrecha colaboración con las reducciones jesuitas. Por entonces catequizar no solo implicaba la tarea de dar a conocer la buena noticia de Jesús, sino también la educación integral para la vida digna: cocinar, bordar, plantar y cosechar además de leer y escribir.</p>','1762832061382.jpg',NULL,'Esta pintura de Mama Antula catequizando a caballo por los caminos de Santiago fue realizada por Marcela Torena, de la familia antuliana. Está sentada al estilo amazona, de costado, evangelizando a las familias quechuas de Santiago del Estero.',1,'2025-11-11 03:34:21',1);
INSERT INTO `cont_2contenidos` VALUES (47,28,1,'<p><strong>Consagración de los niños a San José</strong></p><blockquote>María Antonia de Paz y Figueroa tenía una especial predilección por el Padre de Jesús, por lo que eligió como nombre religioso María Antonia de San José. Oración para consagrar la vida de nuestras niñas y niños a San José y rogar su protección de Padre de la Iglesia y de las familias del mundo entero.</blockquote>',NULL,NULL,NULL,1,'2025-11-11 03:38:04',1);
INSERT INTO `cont_2contenidos` VALUES (48,28,3,'<p>San José es el patrono de la Compañía de Jesús. De ahí la veneración de María Antonia, que eligió llamarse “María Antonia de San José” un 18 de marzo de 1745, hace 277 años, según la tradición oral. Lo veneró toda su vida y todos los 19 de cada mes mandaba a rezarle Misa, rezando especialmente por la restitución de la Compañía de Jesús en América, como nos cuenta en sus cartas:</p><blockquote>«para mí cuento el interponer por <strong>medianero al señor San José obligándome a mandarle cantar misa en todos los días 19 del mes, </strong>como así mismo aplicando todo el trabajo que impendo en el ministerio de los Ejercicios» </blockquote><p>-María Antonia de San José, <a href=\"https://mamaantula.com/2020/10/06/carta-10-de-la-sierva-de-dios-al-p-juarez-buenos-aires-5-de-septiembre-de-1782/\" target=\"_blank\">carta 10 al Padre Gaspar Juárez</a></p><blockquote>«Prosigo en hacer cantar misa al Señor San José cada 19 del mes, como comencé desde que salieron Vds. de acá y esto sin faltar jamás. Y cuando por hacerse los Ejercicios no puedo en mi oratorio, la hago cantar en la Merced. Y de Córdoba y de todas las demás partes donde he estado me escriben que hacen esta diligencia, principalmente en mi tierra, donde me han estado corriendo estas misas que se cantan en la iglesia de la Compañía y de la Merced.</blockquote><blockquote>Tal vez pareciéndome que se me tardan los asuntos para honra y gloria de Dios, esto es, la restitución de la Compañía, empiezo a decir al Señor San José que me pague lo que me debe, pues me debe mucho (esto es, lo que yo gasto en estas misas por el Santo, a fin de que me alcance de Dios aquella gracia) y después caigo en la cuenta que más debo yo a él; pero como puede mucho, siempre quedo con el consuelo que me lo ha de hacer; esto es, aquello que sabe Vd.»</blockquote><p>María Antonia de San José, <a href=\"https://mamaantula.com/2020/11/13/carta-29-de-la-sierva-de-dios-al-p-juarez-buenos-aires-22-de-agosto-de-1785/\" target=\"_blank\">carta 29 al Padre Gaspar Juárez</a></p>','1762832481505.jpg',NULL,'Reliquia de Mama Antula junto a la imagen de San José, previa a su entronización en el altar de la Iglesia de la Concepción de la Av. Independencia.',1,'2025-11-11 03:41:21',1);
INSERT INTO `cont_2contenidos` VALUES (49,26,4,'<p><strong>El Manuelito</strong></p><p>Mama Antula llevaba del cuello esta imagen de un Niño Dios abrazado a la Cruz. La gente lo consideraba milagroso, le rezaban con fervor. Se encuentra en la Santa Casa de Ejercicios Espirituales que fundó Mama Antula. Es un Museo histórico que podés visitar cada primer Domingo de cada mes.</p>','1762832622543.jpg',NULL,'Reliquia de la Santa Casa',1,'2025-11-11 03:43:42',1);
INSERT INTO `cont_2contenidos` VALUES (50,17,2,NULL,NULL,'CJtrkX7DA4I',NULL,1,'2025-11-11 10:13:43',1);
INSERT INTO `cont_2contenidos` VALUES (51,9,4,NULL,'1762856103461.jpg',NULL,'Audiencia Privada de la Familia antuliana con el Papa Francisco, feb/2024',1,'2025-11-11 10:15:03',1);
INSERT INTO `cont_2contenidos` VALUES (52,8,2,NULL,'1762856287372.jpg',NULL,NULL,1,'2025-11-11 10:18:07',1);
INSERT INTO `cont_2contenidos` VALUES (53,10,NULL,'Nuestra Mama Antula : Caminante del Espíritu','1762860316771.jpg','2014 - San Pablo','Víctor Manuel Fernández',1,'2025-11-11 11:25:16',1);
INSERT INTO `cont_2contenidos` VALUES (54,10,NULL,'El estandarte de la mujer fuerte de nuestros días: Mama Antula','1762860370304.jpg','1791 - Sociedad Hijas del Divino Salvador','Autor Anónimo',1,'2025-11-11 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (55,10,NULL,'Mama Antula : la vida de la mujer que fundó la espiritualidad en la Argentina','1762860423562.jpg','2017 - Sudamericana','Ana María Cabrera',1,'2025-11-11 11:27:03',1);
INSERT INTO `cont_2contenidos` VALUES (56,10,NULL,'Crónicas de la beatificación','1762860452351.jpg','2017','Jorge Baya Casal Oyuela',1,'2025-11-11 11:27:32',1);
INSERT INTO `cont_2contenidos` VALUES (57,10,NULL,'El Retrato Documental de María Antonia de Paz y Figueroa, la Beata Santiagueña','1762860479713.jpg','2017','Aldo Marcos de Castro Paz',1,'2025-11-11 11:27:59',1);
INSERT INTO `cont_2contenidos` VALUES (58,10,NULL,'El estandarte de la mujer fuerte de nuestros días: Mama Antula','1762868916091.jpg','1791 - Descarga','Autor Anónimo',1,'2025-11-11 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (59,5,3,'De la Santa Casa de Ejercicios Espirituales, Independencia 1190, CABA\r\n\r\n','1762872150449.jpg','1762872160637.jpg',NULL,1,'2025-11-11 14:42:30',1);
INSERT INTO `cont_2contenidos` VALUES (60,5,4,'Oración a María Antonia de San José','1762872209467.jpg','1762872218165.jpg',NULL,1,'2025-11-11 14:43:29',1);
INSERT INTO `cont_2contenidos` VALUES (61,28,2,'<p>Glorioso San José,<br>a vos Dios te encomendó<br>el cuidado de su Hijo unigénito<br>en medio de los muchos<br>peligros de este mundo.</p><p>Acudimos a vos<br>y te pedimos que<br>tomes bajo tu protección especial<br>a los niños que Dios nos ha dado.</p><p>A través del santo bautismo<br>se convirtieron en hijos de Dios<br>y en miembros de su Santa Iglesia.</p><p>Los consagramos hoy a vos,<br>para que a través de esta consagración<br>puedan convertirse en tus hijos de crianza.</p><p>Guardálos,<br>guiá sus pasos en la vida,<br>formá sus corazones<br>según los corazones<br>de Jesús y María.</p><p>San José,<br>que sentiste la tribulación<br>y la preocupación de un padre<br>cuando el niño Jesús se perdió,<br>protegé a nuestros queridos hijos<br>por el tiempo y la eternidad.</p><p>Que seas su padre y consejero.<br>Que ellos, como Jesús,<br>crezcan tanto en edad<br>como en sabiduría<br>y gracia ante Dios<br>y los hombres.</p><p>Preserválos de la corrupción del mundo<br>y danos la gracia<br>de estar unidos con ellos<br>en el cielo para siempre.</p>','1762832284430.jpg',NULL,NULL,1,'2025-11-11 15:43:36',1);
INSERT INTO `cont_2contenidos` VALUES (64,22,10,NULL,'1763516489622.jpg',NULL,'Virgen viajera de Loreto, o Pura y Limpia Concepción del Buen Viaje, tallada por los Padres Jesuitas',1,'2025-11-19 01:41:29',1);
INSERT INTO `cont_2contenidos` VALUES (65,22,4,'<blockquote>Te presentamos la imagen de Mama Antula de este antiguo templo dedicado a la Virgen del Buen Viaje, frente a la cual La Beata rezó de paso en su camino de Santiago a Buenos Aires.</blockquote>',NULL,NULL,NULL,1,'2025-11-19 01:30:49',1);
INSERT INTO `cont_2contenidos` VALUES (66,22,7,'<p>En su peregrinar a pie desde Santiago del Estero hasta Buenos Aires Mama Antula pasó por la posta Morón: bajando por el camino Real los que venían del norte hacia Buenos Aires paraban en la posta de Luján y en la posta de Morón, últimas paradas obligadas en aquellos tiempos coloniales de largos y polvorientos viajes en mula y carretas. Viaje que Mama Antula realizó caminando descalza.</p><p>Manuel Belgrano se detuvo también en este sitio histórico, en 1812, rumbo al encuentro con el Ejército del Norte. Y el papa Juan Pablo II también rezó por aquí en una de sus visitas a la Argentina.</p><p>Desde la época de la colonia hasta el día de hoy (gran parada de las actuales peregrinaciones a Luján que salen del Santuario de San Cayetano de Liniers) miles de caminantes se detienen un momento en la Catedral de Morón a pedirle a la Virgen un «Buen Viaje». Poco antes de arribar a Buenos Aires Mama Antula seguramente se postró a rezar ante Ella encomendándole su singular empresa.</p><p>Rumbo a Buenos Aires, luego de parar en la posta de Luján, Mama Antula paró en la capillita de la posta Morón, donde desde 1776 los Padres de la Compañía de Jesús habían instalado una imagen de la Virgen Viajera de Loreto o Virgen de la Pura y Limpia Concepción del Buen Viaje, tallada por ellos mismos. Tiempo más tarde la imagen de esta virgencita fue trasladada de esa capillita originaria a la actual Catedral de Morón (1885), ubicada a pocas cuadras de la capilla.</p>','1763516134577.jpg',NULL,NULL,1,'2025-11-19 01:35:34',1);
INSERT INTO `cont_2contenidos` VALUES (67,22,6,NULL,NULL,NULL,'Mama Antula abrazada al libro de los Ejercicios Espirituales de San Ignacio, con su estandarte, rostro enjuto y mirada aguda, en un retablo a la izquierda del altar mayor de la Catedral de Morón (en la pared este). En esta representación lleva también un morral, y está descalza, caminando',1,'2025-11-19 01:33:15',1);
/*!40000 ALTER TABLE `cont_2contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_3carrusel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_3carrusel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenido_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `imagen` varchar(17) NOT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `arrouselContenido` (`contenido_id`),
  CONSTRAINT `arrouselContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_3carrusel`
--

LOCK TABLES `cont_3carrusel` WRITE;
/*!40000 ALTER TABLE `cont_3carrusel` DISABLE KEYS */;
INSERT INTO `cont_3carrusel` VALUES (2,13,2,'1762630631369.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (3,13,3,'1762630631370.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (4,13,4,'1762630631371.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (5,13,5,'1762630631372.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (6,13,6,'1762630631373.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (9,67,1,'1763515995301.jpg',1,'2025-11-19 01:33:15',1);
INSERT INTO `cont_3carrusel` VALUES (10,67,2,'1763515995302.jpg',1,'2025-11-19 01:33:15',1);
INSERT INTO `cont_3carrusel` VALUES (11,67,3,'1763515995303.jpg',1,'2025-11-19 01:33:15',1);
/*!40000 ALTER TABLE `cont_3carrusel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_ediciones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_ediciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenido_id` int(10) unsigned DEFAULT NULL,
  `orden` tinyint(1) unsigned DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `editadoPor_id` int(10) unsigned NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `encabezadoCarta` (`contenido_id`) USING BTREE,
  CONSTRAINT `edicionesContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_ediciones`
--

LOCK TABLES `cont_ediciones` WRITE;
/*!40000 ALTER TABLE `cont_ediciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cont_ediciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encab_1original`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encab_1original` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned DEFAULT NULL,
  `pestana_id` int(10) unsigned DEFAULT NULL,
  `numero` tinyint(3) unsigned DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `nombreDesde_id` tinyint(1) unsigned DEFAULT NULL,
  `nombreHacia_id` tinyint(1) unsigned DEFAULT NULL,
  `idioma_id` tinyint(1) unsigned DEFAULT NULL,
  `lugar_id` tinyint(1) unsigned DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `codigoLugar` varchar(25) DEFAULT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`) USING BTREE,
  KEY `cartasEncabezado_usuario` (`creadoPor_id`) USING BTREE,
  KEY `encab_codigoLugar` (`codigoLugar`),
  CONSTRAINT `cartasEncabezado_lugar_copy` FOREIGN KEY (`lugar_id`) REFERENCES `aux_lugares` (`id`),
  CONSTRAINT `cartasEncabezado_statusRegistro_copy` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`),
  CONSTRAINT `cartasEncabezado_usuario_copy` FOREIGN KEY (`creadoPor_id`) REFERENCES `us_usuarios` (`id`),
  CONSTRAINT `encab_codigoLugar` FOREIGN KEY (`codigoLugar`) REFERENCES `nivel9_indices_lugar` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encab_1original`
--

LOCK TABLES `encab_1original` WRITE;
/*!40000 ALTER TABLE `encab_1original` DISABLE KEYS */;
INSERT INTO `encab_1original` VALUES (1,5,NULL,NULL,'Santa Mama Antula: primera fiesta litúrgica','Primera celebración del 7 de marzo en Buenos Aires después de la canonización de la primera santa argentina.',NULL,NULL,NULL,3,'2024-03-07',NULL,1,'2025-10-28 22:42:00',1);
INSERT INTO `encab_1original` VALUES (2,5,NULL,NULL,'Conferencia de Aldo Marcos de Castro Paz','',NULL,NULL,NULL,4,'2024-03-08',NULL,1,'2025-10-28 22:50:33',1);
INSERT INTO `encab_1original` VALUES (3,5,NULL,NULL,'Actividades en el Subte','Nuevo nombre para la estación Independencia',NULL,NULL,NULL,2,'2024-03-07',NULL,1,'2025-11-03 16:20:34',1);
INSERT INTO `encab_1original` VALUES (4,7,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 11:26:01',1);
INSERT INTO `encab_1original` VALUES (5,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 02:28:29',1);
INSERT INTO `encab_1original` VALUES (6,5,NULL,NULL,'Primera fiesta litúrgica como santa','',NULL,NULL,NULL,3,'2024-03-07',NULL,1,'2025-11-03 17:21:55',1);
INSERT INTO `encab_1original` VALUES (7,6,NULL,NULL,'Misa en acción de gracias por la canonización de Mama Antula','',NULL,NULL,NULL,3,'2024-02-11',NULL,1,'2025-11-06 23:17:08',1);
INSERT INTO `encab_1original` VALUES (8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-17 16:55:50',1);
INSERT INTO `encab_1original` VALUES (9,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-30 15:51:05',1);
INSERT INTO `encab_1original` VALUES (10,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-31 19:10:17',1);
INSERT INTO `encab_1original` VALUES (11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-05 14:12:04',1);
INSERT INTO `encab_1original` VALUES (12,NULL,5,NULL,'Oración a Mama Antula',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:24:47',1);
INSERT INTO `encab_1original` VALUES (13,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 11:14:15',1);
INSERT INTO `encab_1original` VALUES (14,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:34',1);
INSERT INTO `encab_1original` VALUES (15,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:39',1);
INSERT INTO `encab_1original` VALUES (16,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:48',1);
INSERT INTO `encab_1original` VALUES (17,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 10:12:03',1);
INSERT INTO `encab_1original` VALUES (18,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 18:58:18',1);
INSERT INTO `encab_1original` VALUES (19,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:25:30',1);
INSERT INTO `encab_1original` VALUES (20,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:25:44',1);
INSERT INTO `encab_1original` VALUES (21,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-12 19:44:37',1);
INSERT INTO `encab_1original` VALUES (22,17,NULL,NULL,'Catedral de Morón','El luga',NULL,NULL,NULL,NULL,NULL,'2caba',1,'2025-11-06 23:26:07',1);
INSERT INTO `encab_1original` VALUES (23,6,NULL,NULL,'Proyección de la ceremonia de canonización en pantalla gigante','',NULL,NULL,NULL,2,'2024-02-11',NULL,1,'2025-11-08 21:03:45',1);
INSERT INTO `encab_1original` VALUES (24,6,NULL,NULL,'Misa en el Vaticano','',NULL,NULL,NULL,7,'2024-02-11',NULL,1,'2025-11-08 21:26:37',1);
INSERT INTO `encab_1original` VALUES (25,17,NULL,NULL,'Introducción',NULL,NULL,NULL,NULL,NULL,NULL,'1introduccion',1,'2025-11-11 02:46:42',1);
INSERT INTO `encab_1original` VALUES (26,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:08:54',1);
INSERT INTO `encab_1original` VALUES (27,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:13:33',1);
INSERT INTO `encab_1original` VALUES (28,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:36:21',1);
INSERT INTO `encab_1original` VALUES (29,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:13:33',1);
INSERT INTO `encab_1original` VALUES (30,10,NULL,1,NULL,NULL,1,2,2,1,'1778-01-06',NULL,1,'2025-10-17 16:56:11',1);
INSERT INTO `encab_1original` VALUES (31,10,NULL,2,NULL,NULL,1,2,1,2,'1780-08-07',NULL,1,'2025-10-17 16:56:11',1);
INSERT INTO `encab_1original` VALUES (32,10,NULL,3,NULL,NULL,1,2,1,2,'1780-10-09',NULL,1,'2025-11-10 18:04:13',1);
INSERT INTO `encab_1original` VALUES (33,10,NULL,0,'Introducción',NULL,NULL,NULL,NULL,NULL,'1730-01-01',NULL,1,'2025-11-10 16:02:13',1);
INSERT INTO `encab_1original` VALUES (34,4,NULL,NULL,'Beatificación de Mama Antula','',NULL,NULL,NULL,6,'2016-04-27',NULL,1,'2025-11-18 23:39:54',1);
/*!40000 ALTER TABLE `encab_1original` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encab_2edicion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encab_2edicion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encab_id` int(10) unsigned DEFAULT NULL,
  `sinIndice_id` int(10) unsigned DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `numero` tinyint(3) unsigned DEFAULT NULL,
  `nombreDesde_id` tinyint(1) unsigned DEFAULT NULL,
  `nombreHacia_id` tinyint(1) unsigned DEFAULT NULL,
  `idioma_id` tinyint(1) unsigned DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `lugar_id` tinyint(1) unsigned DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `editadoPor_id` int(10) unsigned NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_desdePersonaje` (`nombreDesde_id`) USING BTREE,
  KEY `cartasEncabezado_haciaPersonaje` (`nombreHacia_id`) USING BTREE,
  KEY `cartasEncabezado_idioma` (`idioma_id`) USING BTREE,
  KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  KEY `cartasEncabezado_usuario` (`editadoPor_id`) USING BTREE,
  KEY `edic_exper` (`encab_id`),
  KEY `edic_sinindice` (`sinIndice_id`),
  CONSTRAINT `edic_editadopor` FOREIGN KEY (`editadoPor_id`) REFERENCES `us_usuarios` (`id`),
  CONSTRAINT `edic_exper` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encab_2edicion`
--

LOCK TABLES `encab_2edicion` WRITE;
/*!40000 ALTER TABLE `encab_2edicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `encab_2edicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel1_secciones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel1_secciones` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `conIndice` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel1_secciones`
--

LOCK TABLES `nivel1_secciones` WRITE;
/*!40000 ALTER TABLE `nivel1_secciones` DISABLE KEYS */;
INSERT INTO `nivel1_secciones` VALUES (1,1,'Inicio','inicio','inicio',NULL);
INSERT INTO `nivel1_secciones` VALUES (2,2,'Experiencias','experiencias','experiencias',1);
INSERT INTO `nivel1_secciones` VALUES (3,3,'Cartas y Escritos','cartasEscritos','cartas-y-escritos',NULL);
INSERT INTO `nivel1_secciones` VALUES (4,4,'Libros y Videos','librosVideos','libros-y-videos',NULL);
INSERT INTO `nivel1_secciones` VALUES (5,5,'Devoción','devocion','devocion',NULL);
INSERT INTO `nivel1_secciones` VALUES (6,6,'Institucionales','institucionales','institucionales',NULL);
/*!40000 ALTER TABLE `nivel1_secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel2_temas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel2_temas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seccion_id` tinyint(1) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `inactivo` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `capturadoPor_id` int(10) unsigned DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel2_1` (`seccion_id`),
  KEY `temas_capturadoPor` (`capturadoPor_id`),
  CONSTRAINT `nivel2_1` FOREIGN KEY (`seccion_id`) REFERENCES `nivel1_secciones` (`id`),
  CONSTRAINT `temas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel2_temas`
--

LOCK TABLES `nivel2_temas` WRITE;
/*!40000 ALTER TABLE `nivel2_temas` DISABLE KEYS */;
INSERT INTO `nivel2_temas` VALUES (1,1,1,'Novedades','novedades','novedades',1,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (2,1,2,'Quién es Mama Antula','quienEsMamaAntula','quien-es-mama-antula',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (3,1,3,'Quiénes somos','quienesSomos','quienes-somos',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (4,2,3,'Antes de la canonización','antesCanon','antes-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (5,2,1,'Después de la canonización','despuesCanon','despues-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (6,2,2,'Crónicas de la canonización','cronicasCanon','cronicas-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (7,2,5,'Cronología de su causa','cronologia','cronologia-de-su-causa',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (8,4,2,'Videos','videos','videos',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (9,3,4,'Testamento','testamento','testamento',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (10,3,2,'Cartas','cartas','cartas',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (11,3,3,'Frases destacadas','frasesDestacadas','frases-destacadas',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (12,3,5,'Oración fúnebre','oracionFunebre','oracion-funebre',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (13,4,1,'Libros','libros','libros',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (15,5,1,'Oraciones','oraciones','oraciones',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (17,5,3,'Lugares de devoción','lugaresDevocion','lugares-de-devocion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (18,5,2,'Imágenes','imagenes','imagenes',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (19,6,1,'Santa Casa','santaCasa','santa-casa',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (20,6,2,'Iglesia de La Piedad','iglesiaLaPiedad','iglesia-de-la-piedad',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (21,6,3,'Santiago del Estero','santiagoEstero','santiago-del-estero',0,NULL,NULL);
/*!40000 ALTER TABLE `nivel2_temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel3_pestanas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel3_pestanas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subTitulo` mediumtext DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `capturadoPor_id` int(10) unsigned DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel3_2` (`tema_id`),
  KEY `pestanas_capturadoPor` (`capturadoPor_id`),
  CONSTRAINT `nivel3_2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`),
  CONSTRAINT `pestanas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel3_pestanas`
--

LOCK TABLES `nivel3_pestanas` WRITE;
/*!40000 ALTER TABLE `nivel3_pestanas` DISABLE KEYS */;
INSERT INTO `nivel3_pestanas` VALUES (1,15,2,'Oración a San José',NULL,'oracionSj','oracion-a-san-jose',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (2,19,1,'Retiros Ignacianos',NULL,'retiros','retiros-ignacianos',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (3,19,2,'Otras Actividades',NULL,'otrasActividades','otras-actividades',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (4,19,3,'Historia',NULL,'historia','historia',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (5,15,1,'Oración a Mama Antula',NULL,'oracionMa','oracion-a-mama-antula',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (6,15,3,'Estampas',NULL,'estampas','estampas',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (7,8,1,'Biográficos',NULL,'biograficos','biograficos',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (8,8,2,'Conferencias',NULL,'conferencias','conferencias',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (9,8,3,'Varios',NULL,'varios','varios',NULL,NULL);
/*!40000 ALTER TABLE `nivel3_pestanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel9_indices_fecha`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel9_indices_fecha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indice_tema` (`tema_id`),
  CONSTRAINT `indice_tema` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel9_indices_fecha`
--

LOCK TABLES `nivel9_indices_fecha` WRITE;
/*!40000 ALTER TABLE `nivel9_indices_fecha` DISABLE KEYS */;
INSERT INTO `nivel9_indices_fecha` VALUES (1,10,'1778',NULL,'1778-01-01','1778-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (2,10,'1780 - 1784',NULL,'1780-01-01','1784-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (3,10,'1785 - 1789',NULL,'1785-01-01','1789-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (4,10,'1790 - 1794',NULL,'1790-01-01','1794-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (5,10,'1795 - 1799',NULL,'1795-01-01','1799-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (6,10,'1800 - 1816',NULL,'1800-01-01','1816-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (7,5,'2024',NULL,'2024-02-12','2024-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (8,5,'2025',NULL,'2025-01-01','2025-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (9,6,'Dom 11/feb',NULL,'2024-02-11','2024-02-11');
INSERT INTO `nivel9_indices_fecha` VALUES (10,6,'Sáb 10/feb',NULL,'2024-02-10','2024-02-10');
INSERT INTO `nivel9_indices_fecha` VALUES (11,6,'Vie 9/feb',NULL,'2024-02-09','2024-02-09');
INSERT INTO `nivel9_indices_fecha` VALUES (12,6,'Jue 8/feb',NULL,'2024-02-08','2024-02-08');
INSERT INTO `nivel9_indices_fecha` VALUES (13,6,'Mié 7/feb',NULL,'2024-02-07','2024-02-07');
INSERT INTO `nivel9_indices_fecha` VALUES (14,6,'Mar 6/feb',NULL,'2024-02-06','2024-02-06');
INSERT INTO `nivel9_indices_fecha` VALUES (15,6,'Lun 5/feb',NULL,'2024-02-05','2024-02-05');
INSERT INTO `nivel9_indices_fecha` VALUES (16,6,'Dom 4/feb',NULL,'2024-02-04','2024-02-04');
INSERT INTO `nivel9_indices_fecha` VALUES (17,6,'Sáb 3/feb',NULL,'2024-02-03','2024-02-03');
INSERT INTO `nivel9_indices_fecha` VALUES (18,10,'Introducción','introduccion','1730-01-01','1730-01-01');
INSERT INTO `nivel9_indices_fecha` VALUES (19,4,'2016',NULL,'2016-01-01','2016-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (20,4,'2017 - 2023',NULL,'2017-01-01','2023-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (21,4,'2000 - 2015',NULL,'2000-01-01','2015-12-31');
/*!40000 ALTER TABLE `nivel9_indices_fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel9_indices_lugar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel9_indices_lugar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indices_codigoLugar` (`codigo`),
  KEY `indice_tema` (`tema_id`) USING BTREE,
  CONSTRAINT `indice_tema_copy` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel9_indices_lugar`
--

LOCK TABLES `nivel9_indices_lugar` WRITE;
/*!40000 ALTER TABLE `nivel9_indices_lugar` DISABLE KEYS */;
INSERT INTO `nivel9_indices_lugar` VALUES (1,17,'Introducción','1introduccion');
INSERT INTO `nivel9_indices_lugar` VALUES (2,17,'CABA','2caba');
INSERT INTO `nivel9_indices_lugar` VALUES (3,17,'GBA','3gba');
INSERT INTO `nivel9_indices_lugar` VALUES (4,17,'Prov. Buenos Aires','4buenosAires');
INSERT INTO `nivel9_indices_lugar` VALUES (5,17,'Prov. Córdoba','6cordoba');
INSERT INTO `nivel9_indices_lugar` VALUES (6,17,'Prov. Santa Fe','santaFe');
INSERT INTO `nivel9_indices_lugar` VALUES (7,17,'Prov. Santiago del Estero','5santiagoDelEstero');
INSERT INTO `nivel9_indices_lugar` VALUES (8,17,'Prov. Salta','salta');
INSERT INTO `nivel9_indices_lugar` VALUES (9,17,'Prov. Jujuy','jujuy');
/*!40000 ALTER TABLE `nivel9_indices_lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('yFCEmG4wOobxUpQfvNvm0c03MmX14CnR',1763646685,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-19T20:43:39.845Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":1,\"cliente_id\":\"U0000000001\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-10-16\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":5,\"orden\":5,\"nombre\":\"Completo\",\"codigo\":\"completo\",\"actualizac\":true,\"revision\":true,\"cambioRoles\":true}},\"usuario\":{\"id\":1,\"nombreCompleto\":\"Diego Iribarren\",\"email\":\"diegoiribarren2015@gmail.com\",\"apodo\":\"Diego\",\"cliente_id\":\"U0000000001\",\"contrasena\":\"$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO\",\"pais_id\":null,\"imagen\":\"1761491982343.jpg\",\"notificacs\":false,\"visitaCreadaEn\":\"2025-10-16T23:29:07.000Z\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"versionWeb\":\"1.00\",\"creadoEn\":\"2025-10-16T23:29:07.000Z\",\"fechaContrasena\":\"2025-10-16T23:29:07.000Z\",\"rol_id\":5,\"statusRegistro_id\":3,\"rol\":{\"id\":5,\"orden\":5,\"nombre\":\"Completo\",\"codigo\":\"completo\",\"actualizac\":true,\"revision\":true,\"cambioRoles\":true},\"statusRegistro\":{\"id\":3,\"orden\":3,\"nombre\":\"Con apodo\",\"codigo\":\"conApodo\"}}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `actualizac` tinyint(1) DEFAULT 0,
  `revision` tinyint(1) DEFAULT 0,
  `cambioRoles` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_roles`
--

LOCK TABLES `us_roles` WRITE;
/*!40000 ALTER TABLE `us_roles` DISABLE KEYS */;
INSERT INTO `us_roles` VALUES (1,1,'Sólo lectura','lectura',0,0,0);
INSERT INTO `us_roles` VALUES (2,2,'Actualización','actualizac',1,0,0);
INSERT INTO `us_roles` VALUES (3,3,'Revisión','revision',1,1,0);
INSERT INTO `us_roles` VALUES (4,4,'Cambio de roles','cambioRoles',1,0,1);
INSERT INTO `us_roles` VALUES (5,5,'Completo','completo',1,1,1);
/*!40000 ALTER TABLE `us_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_status_registros`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_status_registros` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_status_registros`
--

LOCK TABLES `us_status_registros` WRITE;
/*!40000 ALTER TABLE `us_status_registros` DISABLE KEYS */;
INSERT INTO `us_status_registros` VALUES (1,1,'Mail a validar','mailPendValidar');
INSERT INTO `us_status_registros` VALUES (2,2,'Mail validado','mailValidado');
INSERT INTO `us_status_registros` VALUES (3,3,'Con apodo','conApodo');
/*!40000 ALTER TABLE `us_status_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_usuarios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `apodo` varchar(30) DEFAULT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `pais_id` varchar(2) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `notificacs` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime DEFAULT NULL,
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) unsigned NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rol_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `visita_id` (`cliente_id`),
  KEY `rol_usuario_id` (`rol_id`) USING BTREE,
  KEY `status_registro_id` (`statusRegistro_id`) USING BTREE,
  KEY `us_usuarios_pais` (`pais_id`),
  CONSTRAINT `us_usuarios_pais` FOREIGN KEY (`pais_id`) REFERENCES `aux_paises` (`id`),
  CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rol_id`) REFERENCES `us_roles` (`id`),
  CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_usuarios`
--

LOCK TABLES `us_usuarios` WRITE;
/*!40000 ALTER TABLE `us_usuarios` DISABLE KEYS */;
INSERT INTO `us_usuarios` VALUES (1,'Diego Iribarren','diegoiribarren2015@gmail.com','Diego','U0000000001','$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO',NULL,'1761491982343.jpg',0,'2025-10-16 23:29:07','2025-10-21',1,'1.00','2025-10-16 23:29:07','2025-10-16 23:29:07',5,3);
/*!40000 ALTER TABLE `us_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_visitas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_visitas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` varchar(11) DEFAULT NULL,
  `visitaCreadaEn` datetime DEFAULT utc_timestamp(),
  `fechaUltNaveg` date DEFAULT utc_date(),
  `diasNaveg` smallint(5) unsigned DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `rol_id` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cliente_id` (`cliente_id`),
  KEY `rolUsuario_id` (`rol_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_visitas`
--

LOCK TABLES `us_visitas` WRITE;
/*!40000 ALTER TABLE `us_visitas` DISABLE KEYS */;
INSERT INTO `us_visitas` VALUES (1,'V0000000001','2025-10-21 13:39:18','2025-10-21',0,'1.00',1);
INSERT INTO `us_visitas` VALUES (2,'V0000000002','2025-11-04 14:23:48','2025-11-04',0,'1.00',1);
INSERT INTO `us_visitas` VALUES (3,'V0000000003','2025-11-14 14:33:31','2025-11-14',1,'1.00',1);
/*!40000 ALTER TABLE `us_visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ma_bd'
--

--
-- Current Database: `ma_bd`
--

/*!40000 DROP DATABASE IF EXISTS `ma_bd`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ma_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ma_bd`;

--
-- Table structure for table `aux_iconos_agrups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_iconos_agrups` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `clase` varchar(20) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_iconos_agrups`
--

LOCK TABLES `aux_iconos_agrups` WRITE;
/*!40000 ALTER TABLE `aux_iconos_agrups` DISABLE KEYS */;
INSERT INTO `aux_iconos_agrups` VALUES (1,1,'Facebook',NULL,'fa-facebook','https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561');
INSERT INTO `aux_iconos_agrups` VALUES (2,2,'Instagram',NULL,'fa-instagram','https://www.instagram.com/beatificacionantula/');
INSERT INTO `aux_iconos_agrups` VALUES (3,3,'Twitter',NULL,'fa-twitter','https://twitter.com/beatificaciona1');
INSERT INTO `aux_iconos_agrups` VALUES (4,4,'TikTok',NULL,'fa-tiktok','https://www.tiktok.com/@mamaantula.com');
INSERT INTO `aux_iconos_agrups` VALUES (5,1,'Lectura','lectura','fa-link',NULL);
INSERT INTO `aux_iconos_agrups` VALUES (6,2,'Actualizar articulos','actualizar','fa-square-plus','/articulos/actualizar');
INSERT INTO `aux_iconos_agrups` VALUES (7,3,'Revisar articulos','revisar','fa-book','/articulos/revisar');
INSERT INTO `aux_iconos_agrups` VALUES (8,4,'Cambio de roles','cambioRoles','fa-user','/usuarios/cambio-de-roles');
/*!40000 ALTER TABLE `aux_iconos_agrups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_lugares`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_lugares` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_lugares`
--

LOCK TABLES `aux_lugares` WRITE;
/*!40000 ALTER TABLE `aux_lugares` DISABLE KEYS */;
INSERT INTO `aux_lugares` VALUES (1,'Córdoba');
INSERT INTO `aux_lugares` VALUES (2,'CABA');
INSERT INTO `aux_lugares` VALUES (3,'CABA, Basílica La Piedad');
INSERT INTO `aux_lugares` VALUES (4,'CABA, Basílica del Socorro');
INSERT INTO `aux_lugares` VALUES (5,'CABA, Santa Casa');
INSERT INTO `aux_lugares` VALUES (6,'Silípica, Stgo. del Estero');
INSERT INTO `aux_lugares` VALUES (7,'Ciudad del Vaticano, Europa');
INSERT INTO `aux_lugares` VALUES (8,'Santiago del Estero');
/*!40000 ALTER TABLE `aux_lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_novs_del_sitio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_novs_del_sitio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comentario` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT utc_date(),
  `version` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_novs_del_sitio`
--

LOCK TABLES `aux_novs_del_sitio` WRITE;
/*!40000 ALTER TABLE `aux_novs_del_sitio` DISABLE KEYS */;
INSERT INTO `aux_novs_del_sitio` VALUES (1,'Subida a internet del primer borrador','2025-10-21','1.00');
INSERT INTO `aux_novs_del_sitio` VALUES (2,'Subida a internet del segundo borrador','2025-11-18','1.01');
/*!40000 ALTER TABLE `aux_novs_del_sitio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_paises`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_paises` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `continente` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_paises`
--

LOCK TABLES `aux_paises` WRITE;
/*!40000 ALTER TABLE `aux_paises` DISABLE KEYS */;
INSERT INTO `aux_paises` VALUES ('AD','Andorra','Europa');
INSERT INTO `aux_paises` VALUES ('AE','Emiratos Árabes Unidos','Asia');
INSERT INTO `aux_paises` VALUES ('AF','Afganistán','Asia');
INSERT INTO `aux_paises` VALUES ('AG','Antigua y Barbuda','América');
INSERT INTO `aux_paises` VALUES ('AI','Anguila','América');
INSERT INTO `aux_paises` VALUES ('AL','Albania','Europa');
INSERT INTO `aux_paises` VALUES ('AM','Armenia','Asia');
INSERT INTO `aux_paises` VALUES ('AO','Angola','Africa');
INSERT INTO `aux_paises` VALUES ('AQ','Antártida','Polar');
INSERT INTO `aux_paises` VALUES ('AR','Argentina','América');
INSERT INTO `aux_paises` VALUES ('AS','Samoa Americana','Oceanía');
INSERT INTO `aux_paises` VALUES ('AT','Austria','Europa');
INSERT INTO `aux_paises` VALUES ('AU','Australia','Oceanía');
INSERT INTO `aux_paises` VALUES ('AW','Aruba','América');
INSERT INTO `aux_paises` VALUES ('AX','Aland','Europa');
INSERT INTO `aux_paises` VALUES ('AZ','Azerbaiyán','Asia');
INSERT INTO `aux_paises` VALUES ('BA','Bosnia y Herzegovina','Europa');
INSERT INTO `aux_paises` VALUES ('BB','Barbados','América');
INSERT INTO `aux_paises` VALUES ('BD','Bangladés','Asia');
INSERT INTO `aux_paises` VALUES ('BE','Bélgica','Europa');
INSERT INTO `aux_paises` VALUES ('BF','Burkina Faso','Africa');
INSERT INTO `aux_paises` VALUES ('BG','Bulgaria','Europa');
INSERT INTO `aux_paises` VALUES ('BH','Baréin','Asia');
INSERT INTO `aux_paises` VALUES ('BI','Burundi','Africa');
INSERT INTO `aux_paises` VALUES ('BJ','Benín','Africa');
INSERT INTO `aux_paises` VALUES ('BL','San Bartolomé','América');
INSERT INTO `aux_paises` VALUES ('BM','Bermudas','América');
INSERT INTO `aux_paises` VALUES ('BN','Brunéi','Asia');
INSERT INTO `aux_paises` VALUES ('BO','Bolivia','América');
INSERT INTO `aux_paises` VALUES ('BQ','Bonaire, San Eustaquio y Saba','América');
INSERT INTO `aux_paises` VALUES ('BR','Brasil','América');
INSERT INTO `aux_paises` VALUES ('BS','Bahamas','América');
INSERT INTO `aux_paises` VALUES ('BT','Bután','Asia');
INSERT INTO `aux_paises` VALUES ('BV','Isla Bouvet','Polar');
INSERT INTO `aux_paises` VALUES ('BW','Botswana','Africa');
INSERT INTO `aux_paises` VALUES ('BY','Bielorrusia','Europa');
INSERT INTO `aux_paises` VALUES ('BZ','Belice','América');
INSERT INTO `aux_paises` VALUES ('CA','Canadá','América');
INSERT INTO `aux_paises` VALUES ('CC','Islas Cocos','Oceanía');
INSERT INTO `aux_paises` VALUES ('CD','Congo','Africa');
INSERT INTO `aux_paises` VALUES ('CF','República Centroafricana','Africa');
INSERT INTO `aux_paises` VALUES ('CG','República del Congo','Africa');
INSERT INTO `aux_paises` VALUES ('CH','Suiza','Europa');
INSERT INTO `aux_paises` VALUES ('CI','Costa de Marfil','Africa');
INSERT INTO `aux_paises` VALUES ('CK','Islas Cook','Oceanía');
INSERT INTO `aux_paises` VALUES ('CL','Chile','América');
INSERT INTO `aux_paises` VALUES ('CM','Camerún','Africa');
INSERT INTO `aux_paises` VALUES ('CN','China','Asia');
INSERT INTO `aux_paises` VALUES ('CO','Colombia','América');
INSERT INTO `aux_paises` VALUES ('CR','Costa Rica','América');
INSERT INTO `aux_paises` VALUES ('CU','Cuba','América');
INSERT INTO `aux_paises` VALUES ('CV','Cabo Verde','Africa');
INSERT INTO `aux_paises` VALUES ('CW','Curazao','América');
INSERT INTO `aux_paises` VALUES ('CX','Isla de Navidad','Oceanía');
INSERT INTO `aux_paises` VALUES ('CY','Chipre','Europa');
INSERT INTO `aux_paises` VALUES ('CZ','República Checa','Europa');
INSERT INTO `aux_paises` VALUES ('DE','Alemania','Europa');
INSERT INTO `aux_paises` VALUES ('DJ','Yibuti','Africa');
INSERT INTO `aux_paises` VALUES ('DK','Dinamarca','Europa');
INSERT INTO `aux_paises` VALUES ('DM','Dominica','América');
INSERT INTO `aux_paises` VALUES ('DO','República Dominicana','América');
INSERT INTO `aux_paises` VALUES ('DZ','Argelia','Africa');
INSERT INTO `aux_paises` VALUES ('EC','Ecuador','América');
INSERT INTO `aux_paises` VALUES ('EE','Estonia','Europa');
INSERT INTO `aux_paises` VALUES ('EG','Egipto','Africa');
INSERT INTO `aux_paises` VALUES ('EH','República Árabe Saharaui','Africa');
INSERT INTO `aux_paises` VALUES ('ER','Eritrea','Africa');
INSERT INTO `aux_paises` VALUES ('ES','España','Europa');
INSERT INTO `aux_paises` VALUES ('ET','Etiopía','Africa');
INSERT INTO `aux_paises` VALUES ('FI','Finlandia','Europa');
INSERT INTO `aux_paises` VALUES ('FJ','Fiyi','Oceanía');
INSERT INTO `aux_paises` VALUES ('FK','Islas Malvinas','América');
INSERT INTO `aux_paises` VALUES ('FM','Micronesia','Oceanía');
INSERT INTO `aux_paises` VALUES ('FO','Islas Feroe','Europa');
INSERT INTO `aux_paises` VALUES ('FR','Francia','Europa');
INSERT INTO `aux_paises` VALUES ('GA','Gabón','Africa');
INSERT INTO `aux_paises` VALUES ('GB','Reino Unido','Europa');
INSERT INTO `aux_paises` VALUES ('GD','Granada','América');
INSERT INTO `aux_paises` VALUES ('GE','Georgia','Asia');
INSERT INTO `aux_paises` VALUES ('GF','Guayana Francesa','América');
INSERT INTO `aux_paises` VALUES ('GG','Guernsey','Europa');
INSERT INTO `aux_paises` VALUES ('GH','Ghana','Africa');
INSERT INTO `aux_paises` VALUES ('GI','Gibraltar','Europa');
INSERT INTO `aux_paises` VALUES ('GL','Groenlandia','América');
INSERT INTO `aux_paises` VALUES ('GM','Gambia','Africa');
INSERT INTO `aux_paises` VALUES ('GN','Guinea','Africa');
INSERT INTO `aux_paises` VALUES ('GP','Guadalupe','América');
INSERT INTO `aux_paises` VALUES ('GQ','Guinea Ecuatorial','Africa');
INSERT INTO `aux_paises` VALUES ('GR','Grecia','Europa');
INSERT INTO `aux_paises` VALUES ('GS','Islas Georgias del Sur','América');
INSERT INTO `aux_paises` VALUES ('GT','Guatemala','América');
INSERT INTO `aux_paises` VALUES ('GU','Guam','Oceanía');
INSERT INTO `aux_paises` VALUES ('GW','Guinea-Bisáu','Africa');
INSERT INTO `aux_paises` VALUES ('GY','Guyana','América');
INSERT INTO `aux_paises` VALUES ('HK','Hong Kong','Asia');
INSERT INTO `aux_paises` VALUES ('HM','Islas Heard y McDonald','Oceanía');
INSERT INTO `aux_paises` VALUES ('HN','Honduras','América');
INSERT INTO `aux_paises` VALUES ('HR','Croacia','Europa');
INSERT INTO `aux_paises` VALUES ('HT','Haití','América');
INSERT INTO `aux_paises` VALUES ('HU','Hungría','Europa');
INSERT INTO `aux_paises` VALUES ('ID','Indonesia','Asia');
INSERT INTO `aux_paises` VALUES ('IE','Irlanda','Europa');
INSERT INTO `aux_paises` VALUES ('IL','Israel','Asia');
INSERT INTO `aux_paises` VALUES ('IM','Isla de Man','Europa');
INSERT INTO `aux_paises` VALUES ('IN','India','Asia');
INSERT INTO `aux_paises` VALUES ('IO','Territorio Británico Índico','Africa');
INSERT INTO `aux_paises` VALUES ('IQ','Irak','Asia');
INSERT INTO `aux_paises` VALUES ('IR','Irán','Asia');
INSERT INTO `aux_paises` VALUES ('IS','Islandia','Europa');
INSERT INTO `aux_paises` VALUES ('IT','Italia','Europa');
INSERT INTO `aux_paises` VALUES ('JE','Jersey','Europa');
INSERT INTO `aux_paises` VALUES ('JM','Jamaica','América');
INSERT INTO `aux_paises` VALUES ('JO','Jordania','Asia');
INSERT INTO `aux_paises` VALUES ('JP','Japón','Asia');
INSERT INTO `aux_paises` VALUES ('KE','Kenia','Africa');
INSERT INTO `aux_paises` VALUES ('KG','Kirguistán','Asia');
INSERT INTO `aux_paises` VALUES ('KH','Camboya','Asia');
INSERT INTO `aux_paises` VALUES ('KI','Kiribati','Oceanía');
INSERT INTO `aux_paises` VALUES ('KM','Comoras','Africa');
INSERT INTO `aux_paises` VALUES ('KN','San Cristóbal y Nieves','América');
INSERT INTO `aux_paises` VALUES ('KP','Corea del Norte','Asia');
INSERT INTO `aux_paises` VALUES ('KR','Corea del Sur','Asia');
INSERT INTO `aux_paises` VALUES ('KW','Kuwait','Asia');
INSERT INTO `aux_paises` VALUES ('KY','Islas Caimán','América');
INSERT INTO `aux_paises` VALUES ('KZ','Kazajistán','Asia');
INSERT INTO `aux_paises` VALUES ('LA','Laos','Asia');
INSERT INTO `aux_paises` VALUES ('LB','Líbano','Asia');
INSERT INTO `aux_paises` VALUES ('LC','Santa Lucía','América');
INSERT INTO `aux_paises` VALUES ('LI','Liechtenstein','Europa');
INSERT INTO `aux_paises` VALUES ('LK','Sri Lanka','Asia');
INSERT INTO `aux_paises` VALUES ('LR','Liberia','Africa');
INSERT INTO `aux_paises` VALUES ('LS','Lesoto','Africa');
INSERT INTO `aux_paises` VALUES ('LT','Lituania','Europa');
INSERT INTO `aux_paises` VALUES ('LU','Luxemburgo','Europa');
INSERT INTO `aux_paises` VALUES ('LV','Letonia','Europa');
INSERT INTO `aux_paises` VALUES ('LY','Libia','Africa');
INSERT INTO `aux_paises` VALUES ('MA','Marruecos','Africa');
INSERT INTO `aux_paises` VALUES ('MC','Mónaco','Europa');
INSERT INTO `aux_paises` VALUES ('MD','Moldavia','Europa');
INSERT INTO `aux_paises` VALUES ('ME','Montenegro','Europa');
INSERT INTO `aux_paises` VALUES ('MF','San Martín','América');
INSERT INTO `aux_paises` VALUES ('MG','Madagascar','Africa');
INSERT INTO `aux_paises` VALUES ('MH','Islas Marshall','Oceanía');
INSERT INTO `aux_paises` VALUES ('MK','Macedonia del Norte','Europa');
INSERT INTO `aux_paises` VALUES ('ML','Malí','Africa');
INSERT INTO `aux_paises` VALUES ('MM','Myanmar','Asia');
INSERT INTO `aux_paises` VALUES ('MN','Mongolia','Asia');
INSERT INTO `aux_paises` VALUES ('MO','Macao','Asia');
INSERT INTO `aux_paises` VALUES ('MP','Islas Marianas del Norte','Oceanía');
INSERT INTO `aux_paises` VALUES ('MQ','Martinica','América');
INSERT INTO `aux_paises` VALUES ('MR','Mauritania','Africa');
INSERT INTO `aux_paises` VALUES ('MS','Montserrat','América');
INSERT INTO `aux_paises` VALUES ('MT','Malta','Europa');
INSERT INTO `aux_paises` VALUES ('MU','Mauricio','Africa');
INSERT INTO `aux_paises` VALUES ('MV','Maldivas','Asia');
INSERT INTO `aux_paises` VALUES ('MW','Malaui','Africa');
INSERT INTO `aux_paises` VALUES ('MX','México','América');
INSERT INTO `aux_paises` VALUES ('MY','Malasia','Asia');
INSERT INTO `aux_paises` VALUES ('MZ','Mozambique','Africa');
INSERT INTO `aux_paises` VALUES ('NA','Namibia','Africa');
INSERT INTO `aux_paises` VALUES ('NC','Nueva Caledonia','Oceanía');
INSERT INTO `aux_paises` VALUES ('NE','Níger','Africa');
INSERT INTO `aux_paises` VALUES ('NF','Isla Norfolk','Oceanía');
INSERT INTO `aux_paises` VALUES ('NG','Nigeria','Africa');
INSERT INTO `aux_paises` VALUES ('NI','Nicaragua','América');
INSERT INTO `aux_paises` VALUES ('NL','Países Bajos','Europa');
INSERT INTO `aux_paises` VALUES ('NN','Desconocido','Ninguno');
INSERT INTO `aux_paises` VALUES ('NO','Noruega','Europa');
INSERT INTO `aux_paises` VALUES ('NP','Nepal','Asia');
INSERT INTO `aux_paises` VALUES ('NR','Nauru','Oceanía');
INSERT INTO `aux_paises` VALUES ('NU','Niue','Oceanía');
INSERT INTO `aux_paises` VALUES ('NZ','Nueva Zelanda','Oceanía');
INSERT INTO `aux_paises` VALUES ('OM','Omán','Asia');
INSERT INTO `aux_paises` VALUES ('PA','Panamá','América');
INSERT INTO `aux_paises` VALUES ('PE','Perú','América');
INSERT INTO `aux_paises` VALUES ('PF','Polinesia Francesa','Oceanía');
INSERT INTO `aux_paises` VALUES ('PG','Papúa Nueva Guinea','Oceanía');
INSERT INTO `aux_paises` VALUES ('PH','Filipinas','Asia');
INSERT INTO `aux_paises` VALUES ('PK','Pakistán','Asia');
INSERT INTO `aux_paises` VALUES ('PL','Polonia','Europa');
INSERT INTO `aux_paises` VALUES ('PM','San Pedro y Miquelón','América');
INSERT INTO `aux_paises` VALUES ('PN','Islas Pitcairn','Oceanía');
INSERT INTO `aux_paises` VALUES ('PR','Puerto Rico','América');
INSERT INTO `aux_paises` VALUES ('PS','Palestina','Asia');
INSERT INTO `aux_paises` VALUES ('PT','Portugal','Europa');
INSERT INTO `aux_paises` VALUES ('PW','Palaos','Oceanía');
INSERT INTO `aux_paises` VALUES ('PY','Paraguay','América');
INSERT INTO `aux_paises` VALUES ('QA','Catar','Asia');
INSERT INTO `aux_paises` VALUES ('RE','Reunión','Africa');
INSERT INTO `aux_paises` VALUES ('RO','Rumania','Europa');
INSERT INTO `aux_paises` VALUES ('RS','Serbia','Europa');
INSERT INTO `aux_paises` VALUES ('RU','Rusia','Europa');
INSERT INTO `aux_paises` VALUES ('RW','Ruanda','Africa');
INSERT INTO `aux_paises` VALUES ('SA','Arabia Saudita','Asia');
INSERT INTO `aux_paises` VALUES ('SB','Islas Salomón','Oceanía');
INSERT INTO `aux_paises` VALUES ('SC','Seychelles','Africa');
INSERT INTO `aux_paises` VALUES ('SD','Sudán','Africa');
INSERT INTO `aux_paises` VALUES ('SE','Suecia','Europa');
INSERT INTO `aux_paises` VALUES ('SG','Singapur','Asia');
INSERT INTO `aux_paises` VALUES ('SH','Santa Elena','Africa');
INSERT INTO `aux_paises` VALUES ('SI','Eslovenia','Europa');
INSERT INTO `aux_paises` VALUES ('SJ','Svalbard y Jan Mayen','Europa');
INSERT INTO `aux_paises` VALUES ('SK','Eslovaquia','Europa');
INSERT INTO `aux_paises` VALUES ('SL','Sierra Leona','Africa');
INSERT INTO `aux_paises` VALUES ('SM','San Marino','Europa');
INSERT INTO `aux_paises` VALUES ('SN','Senegal','Africa');
INSERT INTO `aux_paises` VALUES ('SO','Somalia','Africa');
INSERT INTO `aux_paises` VALUES ('SR','Surinam','América');
INSERT INTO `aux_paises` VALUES ('SS','Sudán del Sur','Africa');
INSERT INTO `aux_paises` VALUES ('ST','Santo Tomé y Príncipe','Africa');
INSERT INTO `aux_paises` VALUES ('SV','El Salvador','América');
INSERT INTO `aux_paises` VALUES ('SX','San Martín','América');
INSERT INTO `aux_paises` VALUES ('SY','Siria','Asia');
INSERT INTO `aux_paises` VALUES ('SZ','Suazilandia','Africa');
INSERT INTO `aux_paises` VALUES ('TC','Islas Turcas y Caicos','América');
INSERT INTO `aux_paises` VALUES ('TD','Chad','Africa');
INSERT INTO `aux_paises` VALUES ('TF','Tierras Antárticas Francesas','Africa');
INSERT INTO `aux_paises` VALUES ('TG','Togo','Africa');
INSERT INTO `aux_paises` VALUES ('TH','Tailandia','Asia');
INSERT INTO `aux_paises` VALUES ('TJ','Tayikistán','Asia');
INSERT INTO `aux_paises` VALUES ('TK','Tokelau','Oceanía');
INSERT INTO `aux_paises` VALUES ('TL','Timor Oriental','Asia');
INSERT INTO `aux_paises` VALUES ('TM','Turkmenistán','Asia');
INSERT INTO `aux_paises` VALUES ('TN','Túnez','Africa');
INSERT INTO `aux_paises` VALUES ('TO','Tonga','Oceanía');
INSERT INTO `aux_paises` VALUES ('TR','Turquía','Asia');
INSERT INTO `aux_paises` VALUES ('TT','Trinidad y Tobago','América');
INSERT INTO `aux_paises` VALUES ('TV','Tuvalu','Oceanía');
INSERT INTO `aux_paises` VALUES ('TW','Taiwán','Asia');
INSERT INTO `aux_paises` VALUES ('TZ','Tanzania','Africa');
INSERT INTO `aux_paises` VALUES ('UA','Ucrania','Europa');
INSERT INTO `aux_paises` VALUES ('UG','Uganda','Africa');
INSERT INTO `aux_paises` VALUES ('UM','Islas Menores de EE.UU.','América');
INSERT INTO `aux_paises` VALUES ('US','Estados Unidos','América');
INSERT INTO `aux_paises` VALUES ('UY','Uruguay','América');
INSERT INTO `aux_paises` VALUES ('UZ','Uzbekistán','Asia');
INSERT INTO `aux_paises` VALUES ('VA','Ciudad del Vaticano','Europa');
INSERT INTO `aux_paises` VALUES ('VC','San Vicente y las Granadinas','América');
INSERT INTO `aux_paises` VALUES ('VE','Venezuela','América');
INSERT INTO `aux_paises` VALUES ('VG','Islas Vírgenes Británicas','América');
INSERT INTO `aux_paises` VALUES ('VI','Islas Vírgenes de EE.UU.','América');
INSERT INTO `aux_paises` VALUES ('VN','Vietnam','Asia');
INSERT INTO `aux_paises` VALUES ('VU','Vanuatu','Oceanía');
INSERT INTO `aux_paises` VALUES ('WF','Wallis y Futuna','Oceanía');
INSERT INTO `aux_paises` VALUES ('WS','Samoa','Oceanía');
INSERT INTO `aux_paises` VALUES ('XK','República de Kosovo','Europa');
INSERT INTO `aux_paises` VALUES ('YE','Yemen','Asia');
INSERT INTO `aux_paises` VALUES ('YT','Mayotte','Africa');
INSERT INTO `aux_paises` VALUES ('ZA','Sudáfrica','Africa');
INSERT INTO `aux_paises` VALUES ('ZM','Zambia','Africa');
INSERT INTO `aux_paises` VALUES ('ZW','Zimbabue','Africa');
/*!40000 ALTER TABLE `aux_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_status_registros`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_status_registros` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_status_registros`
--

LOCK TABLES `aux_status_registros` WRITE;
/*!40000 ALTER TABLE `aux_status_registros` DISABLE KEYS */;
INSERT INTO `aux_status_registros` VALUES (1,1,'Creado','creado');
INSERT INTO `aux_status_registros` VALUES (3,3,'Aprobado','aprobado');
INSERT INTO `aux_status_registros` VALUES (4,4,'Inactivar','inactivar');
INSERT INTO `aux_status_registros` VALUES (6,6,'Inactivo','inactivo');
/*!40000 ALTER TABLE `aux_status_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas_idiomas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_idiomas` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_idiomas`
--

LOCK TABLES `cartas_idiomas` WRITE;
/*!40000 ALTER TABLE `cartas_idiomas` DISABLE KEYS */;
INSERT INTO `cartas_idiomas` VALUES (1,1,'castellano');
INSERT INTO `cartas_idiomas` VALUES (2,2,'frances');
/*!40000 ALTER TABLE `cartas_idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas_personajes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_personajes` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_personajes`
--

LOCK TABLES `cartas_personajes` WRITE;
/*!40000 ALTER TABLE `cartas_personajes` DISABLE KEYS */;
INSERT INTO `cartas_personajes` VALUES (1,1,'Mama Antula');
INSERT INTO `cartas_personajes` VALUES (2,2,'P. Gaspar Juárez');
INSERT INTO `cartas_personajes` VALUES (3,3,'Ambrosio Funes');
/*!40000 ALTER TABLE `cartas_personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_2contenidos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_2contenidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encab_id` int(10) unsigned DEFAULT NULL,
  `orden` tinyint(1) unsigned DEFAULT 1,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `encabezadoexperiencia` (`encab_id`),
  CONSTRAINT `encabezadoexperiencia` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_2contenidos`
--

LOCK TABLES `cont_2contenidos` WRITE;
/*!40000 ALTER TABLE `cont_2contenidos` DISABLE KEYS */;
INSERT INTO `cont_2contenidos` VALUES (1,8,1,'<p><strong>María Antonia de Paz y Figueroa</strong> nació en Santiago del Estero en 1730. A los 15 años empezó a acompañar a los Jesuitas como <em>Beata de la Compañía de Jesús</em>en la tarea de evangelización de los pueblos originarios santiagueños, enseñándoles la Palabra de Dios, a leer y a escribir, y a perfeccionar técnicas de ganadería y agricultura. Mama Antula hablaba quichua. Y fueron los indígenas quienes la bautizaron <strong><em>Mama Antula</em>.</strong> Cuando los jesuitas fueron expulsados de América en 1767, en una experiencia de epifanía en la celda capilla de San Francisco Solano y a la edad de 38 años, Mama Antula recibió la misión de su vida: continuar <strong>con la práctica de los Ejercicios Espirituales que realizaban los jesuitas</strong>, para la salvación de las almas.</p><p>Fue entonces cuando empezó su misión en salida y eligió su nombre de Iglesia: <strong>María Antonia de San José.</strong></p><p>Por entonces las mujeres estaban confinadas a casarse o elegir los votos religiosos, no leían ni escribían y mucho menos salían al mundo sin la compañía de un hombre y libradas a la providencia divina. <strong>Mama Antula desafió las convenciones de su tiempo</strong> y peregrinó por todo el actual territorio del NOA argentino -por entonces formábamos parte del virreinato del Perú-, organizando los Ejercicios Espirituales a pesar de estar prohibidos por el Rey Carlos III, pero consiguiendo que los Obispos locales autorizaran su tarea. Llegó a Buenos Aires caminando más de 5 mil kilómetros, donde realizó su obra cúlmine -en los inicios del virreinato del Río de la Plata-: La construcción de <strong>la Santa Casa</strong>, un lugar levantado enteramente con donaciones, y donde exclusivamente se realizan los Ejercicios Espirituales de San Ignacio de Loyola. Fue inaugurada en 1795 y allí murió Mama Antula en 1799, y desde entonces sigue funciones hasta el día de hoy. Allí ricos y pobres compartían mesa y rezaban juntos, y se estima que 70 mil personas realizaron los Ejercicios Espirituales allí, compartiendo el pan y aprendiendo los valores que precedieron y formaron la gesta de mayo y a la creación del Estado Argentino.</p><p>La primera santa de la argentina es laica, valiente, considerada la primera escritora del Río de la Plata (se pueden <a href=\"/cartas-y-escritos/cartas\" target=\"_blank\">leer aquí sus famosas cartas</a>); una mujer fuerte que nos enseña la santidad cotidiana y a confiar en la providencia con una fe inquebrantable. Es la patrona de las empresarias argentinas, y a ella se le reza pidiéndole perseverancia en las dificultades y la aceptación de la voluntad de Dios. Su fiesta litúrgica es el 7 de marzo.</p>','1760660122981.jpg',NULL,'Peregrinaje que realizó santa Mama Antula',1,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (2,2,3,NULL,NULL,'FEMEkVui6w4','En el encuentro, el Arq. Jorge Bayá Casal compartió su experiencia recorriendo el camino de Mama Antula desde Santiago del Estero hasta Buenos Aires, e hizo cantar a los presentes la zamba compuesta por él mismo: «Mama Antula a través del camino real».',1,'2025-11-04 18:56:14',1);
INSERT INTO `cont_2contenidos` VALUES (3,3,1,'<p>Ya el miércoles 6 a la tardecita fue renombrada la estación Independencia del Subte E como <strong>«Independencia – Santa Mama Antula»</strong></p><p>Por la tarde, se realizó el Acto de cierre de la muestra&nbsp;<strong><em>«El estandarte de la mujer fuerte. Homenaje a Mama Antula»</em></strong>&nbsp;en la vitrina del Senado de la Nación de la Estación Congreso del Subte A con la presencia de&nbsp;<strong>Xil Buffone</strong>&nbsp;-creadora de las reproducciones exhibidas-, el director de Cultura del Senado&nbsp;<strong>Daniel Abate,</strong>&nbsp;el párroco de la Basílica de la Piedad&nbsp;<strong>Raúl Laurencena&nbsp;</strong>junto a su comunidad, el Sr.&nbsp;<strong>Damián Abregú</strong>&nbsp;en representación de la Familia Antuliana, junto a&nbsp;<strong>Teresa González Fernández, el prof. Aldo Marcos de Castro Paz y el Sr. José Torres Argañaraz,</strong>&nbsp;venido especialmente de Santiago del Estero a presenciar las celebraciones en Buenos Aires.</p>','1760660122989.jpg',NULL,NULL,1,'2025-11-04 20:01:50',1);
INSERT INTO `cont_2contenidos` VALUES (4,23,0,'<p>Llegó el día tan esperado: después de más de 200 años el nombre de María Antonia de San José fue inscripto en el Libro de los Santos. Las celebraciones en Buenos Aires, Santiago del Estero, Salta y localidades del gran Buenos Aires comenzaron con vigilias nocturnas.</p>',NULL,NULL,NULL,1,'2025-11-08 21:05:08',1);
INSERT INTO `cont_2contenidos` VALUES (5,32,1,'<blockquote>Los Ejercicios Espirituales que organiza La Beata son cada vez más multitudinarios. En esta carta describe cómo aumenta la concurrencia en una casa donde organiza los retiros, frente a la Iglesia de San Miguel (de la ciudad de Buenos Aires), donde no cesa de ocurrir el milagro de la multiplicación de los panes para darles de comer a todos.</blockquote>',NULL,NULL,NULL,1,'2025-11-10 20:03:30',1);
INSERT INTO `cont_2contenidos` VALUES (6,31,4,'<p><em>Cf. Blanco III: ASR 1-5 (en castellano); G 17; B 25-28. Otras versiones: Blanco V: ASR 7-11 (en italiano); G 17 / Más breves: Blanco IV: ASR 66- 69 (Lettera 2a al medesimo soggetto); G 16; P 187 (en francés); Blanco VI: P 187-190 (en francés): C. P., 376-379. Cf. también variantes: Blanco IX (fechada el 16/10/1780): ACSBA (original); G 18; Blanco XI: ACSBA (original); G 32. Pax Christi</em></p>',NULL,NULL,NULL,1,'2025-11-10 20:00:34',1);
INSERT INTO `cont_2contenidos` VALUES (7,6,2,'<p>En su primera fiesta litúrgica como santa después de la canonización, el 7 de marzo, Buenos Aires se vistió de fiesta en calles, capillas, Iglesias y hasta hubo una breve peregrinación de estudiantes del colegio Echeverry Boneo desde el colegio en Juncal y Azcuénaga hasta el Sepulcro de Mama Antula en la Basílica de La Piedad para realizar un glorioso momento de adoración. Luego la peregrinación siguió hasta la Santa Casa.</p><p>En la Basílica de La Piedad se realizó una <a href=\"https://www.facebook.com/canonizacionmamaantula/videos/342126738201398\" target=\"_blank\">Misa presidida por el obispo emérito de Mendoza Mons. Eduardo Taussig</a>, en presencia de descendientes colaterales y devotos que no cesaron de desfilar ante el Sepulcro Histórico Nacional donde descansa Mama Antula, pidiendo gracias y agradeciendo dones.</p><p>Luego de la Misa se desplegó una placa por el reconocimiento de Mama Antula como Doctora Honoris Causa por la Universidad de Santiago del Estero en presencia de la propulsora de la idea, la periodista&nbsp;<strong>Cintia Suárez.</strong></p>','1760660122988.jpg',NULL,NULL,1,'2025-11-04 19:58:35',1);
INSERT INTO `cont_2contenidos` VALUES (8,9,3,'<p>Somos devotos de <strong>la primera santa de la Argentina: María Antonia de San José,&nbsp;<em>Mama Antula.</em></strong>&nbsp;Somos descendientes colaterales de María Antonia de Paz y Figueroa (Santiago del Estero, 1730-1799) y miembros de la gran familia de almas que realizan y difunden los Ejercicios Espirituales de San Ignacio de Loyola.</p><p>Admiramos su valentía femenina y la fuerza de su evangelización, que logró que ricos y pobres compartieran mesa y oración en miles de tandas de Ejercicios Espirituales en la Santa Casa, en un preclaro ejercicio de fraternidad humana en tiempos en los que no existía la libertad de vientres.</p><p>Difundimos su vida y obra, que abrió un camino espiritual en los albores de la patria protegiendo a los niños y vistiendo de dignidad el rol de las mujeres durante la época colonial, dándoles voz y voto en la salvación de sus almas.</p><p>Estamos en todo el territorio argentino. Somos de Santiago del Estero (foto), Tucumán, Buenos Aires, Santa Fe, Salta, Jujuy, Mendoza. Hay fervientes devotos en varios países de Latinoamérica como México, Brasil, Costa Rica, Filipinas y Perú.</p><p>Nuestro objetivo es la difusión de la obra de Santa Mama Antula, llegando hasta donde no es conocida para darla a conocer; colaboramos con la confección de pinturas, vitreaux, esculturas, imágenes, estampas y material didáctico para difundir su obra en parroquias, escuelas, Universidades y barrios populares.</p><p>Colaboramos con el sostenimiento del Sepulcro Histórico Nacional de la Basílica de La Piedad, donde descansan las reliquias de La Beata.</p><p>Participamos y difundimos la realización de las tandas de Ejercicios Espirituales gratuitos en la Santa Casa, que se vienen realizando desde hace más de 200 años, cada primeros sábados de mes.</p><p>Y todos los días 7 mes celebramos Misa en la Piedad en memoria de Mama Antula. Luego rezamos en su sepulcro encomendándole nuestros ruegos y oraciones a nuestra milagrosa santa argentina.</p>','1760660122987.jpg',NULL,'2017- Procesión del 7 de marzo en ciudad de Buenos Aires, en el primer aniversario de la beatificación de MA.\r\n\r\n',1,'2025-11-05 15:32:24',1);
INSERT INTO `cont_2contenidos` VALUES (9,13,2,'<p>Buenos Aires, 6 de marzo de 1779.-</p><p><em>Blanco, pp 362-366</em></p><p>En el Nombre de Dios todopoderoso y con su Santa Gracia, Amén. Sepan todos cuanto esta carta de mi testamento y última voluntad vieren, cómo yo, María Antonia de San José, Beata profesa, natural de Santiago del Estero, Obispado de Córdoba del Tucumán, hallándome enferma en cama, pero en mi sano juicio, memoria y entendimiento natural, creyendo y confesando como firmemente creo y confieso en el inefable Misterio de la Santísima Trinidad; Padre, Hijo y Espíritu Santo, tres Personas realmente distintas y un solo Dios verdadero, y todos los demás misterios, Sacramentos y Dogmas que reconoce, cree y confiesa Nuestra Santa Madre Iglesia Católica. Apostólica Romana, en cuya verdadera fe y creencia he vivido y vivo y protesto vivir y morir como católica, fiel cristiana que soy, invocando por principal intercesora y protectora a la serenísima<strong> reina de los Ángeles, María Santísima; a su Santísimo esposo el Señor San José, al Santísimo Ángel de mi guarda, al de mi Nombre, al gran Patriarca San Ignacio, a los Bienaventurados San Francisco Javier, San Francisco de Borja, San Luis Gonzaga, San Estanislao y San Cayetano,</strong>&nbsp;a fin de que impetren a Nuestro Señor Jesucristo que por los infinitos méritos de preciosísima vida, pasión y muerte, me perdone todas mis culpas, y misericordiosamente conduzca mi pobrecita alma a la Bienaventuranza eterna, para la cual fuimos todos criados; teniendo a la vista la muerte, tan necesario a toda criatura como incierta su hora, con maduro acuerdo, en descargo de mi conciencia, y para evitar cualquier trastorno y confusión que pudiera originarse después de mis días, ordeno mi testamento y última voluntad, en la manera y forma siguiente:</p><ol><li>Primeramente encomiendo mi alma a Dios Nuestro Señor, pues la creó de la nada y la redimió con su preciosísima Sangre, y mi cuerpo a la tierra de que fue formado; el cuál amortajado (p.363) con el propio traje que públicamente visto de Beata profesa,<strong>&nbsp;mando sea enterrado en el campo santo de la Iglesia Parroquial de Nuestra Señora de la Piedad,</strong>&nbsp;de esta ciudad, con entierro menor, rezado, y pido encarecidamente por amor de Dios a los señores curas respectivos, ejerciten esta obra de caridad, con el cadáver de una indigna pecadora, en atención a mi notoria pobreza. A consecuencia, pido que desde esta Casa de Ejercicios, donde me hallo enferma, y donde es regular fallezca, se conduzca mi cadáver en una hora silenciosa, por cuatro peones de los que actualmente están trabajando en la obra. Así lo declaro para que conste.</li><li>Declaro que conducida de un ardiente deseo a la mayor honra y gloria de Dios, puesta en las manos de la Providencia, avivando mi confianza y consultando el mejor medio de evitar los pecados, que se cometen contra la Majestad Soberana, desde que puse el pie en esta Ciudad, me he dedicado constantemente a sostener una casa de Penitencia, en donde se han dado al público y a personas de ambos sexos, los ejercicios espirituales que formalizó el Glorioso Patriarca San Ignacio de Loyola, y aprobó auténticamente la Iglesia; que con la ideal de llevar adelante este piadoso establecimiento, cuya ventajosa utilidad ha hecho constante la experiencia, me propuse fabricar la casa que actualmente sirve para este fin, y que pido a Dios sea duradero; que esto se ha conseguido, aunque no con la perfección que corresponde, por medio de las limosnas que la piedad de los fieles, o más bien los designios de mi gran Dios, se ha dignado poner en mis manos; que me consta que la intención sería de los contribuyentes no ha sido otra, que la que se den Ejercicios todo el año, sin más intervalos, que los que dictare la prudencia, y la necesidad; como auxiliada de Dios, lo ha practicado mi debilidad. A consecuencia encargo por la Sangre de mi Redentor, sean admitidos, como lo dictan las leyes de la caridad, y preferidos, si es posible, los pobrecitos del campo, en quienes he advertido siempre la más urgente necesidad de este auxilio.</li><li>Declaro que con concepto a la intención de los bienhechores de quienes tal vez se podrán presentar documentos en forma; con concepto igualmente al radical y práctico conocimiento que en tan dilatado tiempo he adquirido: y finalmente en atención a las serias combinaciones y particular estudio que he hecho en una materia tan delicada, en la que Dios, por sus altos fines, se dignó elegir mi pequeñez para instrumento; jamás podría dejar con tranquilidad mi conciencia, sino declarara, como declaro, en la parte que puedo y debo por nula, subversiva e intrusa, cualquier mudanza o destino (p.364) extraño, que tal vez algunas intenciones humanas o de aparente utilidad, intentasen sugerir en lo sucesivo sobre este establecimiento, que con las licencias necesarias, cuyos instrumentos deben existir en los respectivos oficios públicos donde se archivaron, sin poder hacer por ahora mención de cuáles son , he fabricado para Casa de Ejercicios, debiéndose ésta mirar con el recomendable aspecto de un recurso de la virtud, y de un asilo seguro, en donde se presenten a la consideración del cristiano los desengaños de esta vida mortal por una práctica constante de los referidos Ejercicios Espirituales.</li><li>Hallándome próxima a ir a dar cuenta a Dios, recomiendo su subsistencia con toda la ternura de mi corazón a todos los señores Jueces y magistrados de quienes espero la protejan con su autoridad; a la piedad del público la sostengan con las efusiones de su caridad; y a mis Albaceas ordeno la conserven y aumenten con celosa integridad como tan conducente al servicio de Dios, y a los intereses eternos del pecador. Así lo declaro para que conste.</li><li><strong>Declaro que del gobierno económico se ha de hacer cargo precisamente una mujer.</strong>&nbsp;En cláusula distinta se hará su nombramiento. Su principal objeto se dirigirá a la vigilancia exacta de los santos ejercicios en lo económico al interés espiritual y temporal de las demás mujeres que, estén a su cargo, a cuyo fin, y con respecto a la necesidad del servicio, he fabricado con distinción habitaciones separadas de lo principal que ha de servir para los ejercicios. La experiencia y el conocimiento me han sugerido esta determinación, cuya observancia pido no se altere, y en la parte que puedo lo mando como fundadora e institutriz de esta obra de piedad.</li><li>Encargo se mantengan en la casa , y sean tratadas con cariño, benignidad y amor, todas las que actualmente se hallan en ella, principalmente las que con conocida juiciosidad han desempañando sus deberes respectivos en el servicio; en éstas, su misma utilidad, y en otras unos motivos de caridad, me obligan a esta piadosa recomendación, como me han obligado siempre a tratarlas como a hijas de mi corazón, en el que las conservo hasta los últimos momentos de mi vida, esperando de su generosa gratitud, me encomienden a Dios incesantemente y rueguen por mi alma; yo lo haré por ellas, así, como espero de la infinita piedad, merezco lograr Bienaventuranza eterna.</li><li>Declaro que el finado, Ilustrísimo y Excelentísimo Señor Don Fray Sebastián Malvar y Pinto; Caballero gran cruz de Carlos III, dignísimo Obispo de esta Diócesis, y Arzobispo después (365) de Santiago de Galicia, tuvo a bien en ejercicios de su liberalidad, hacer una donación, en forma, cuyo instrumento existe en autos de la cantidad de 18 mil pesos a beneficio de esta casa, de la cual sólo tengo recibidos 1130 $ cuya distribución consta de los cuadernos de las cuentas, y creyendo de deberlas dar de lo restante el Señor Magistral de esta santa Iglesia Catedral, Doctor don Carlos José Monteros, encargado para la reintegración de esta piadosa donación , de cuyo puntual cumplimiento no he separado mi atención, aplicando puntuales diligencias, ya judiciales, ya extrajudiciales sin efecto verdaderamente; prevengo no se omitan en lo sucesivo las que correspondan. Así lo declaro para que conste.</li><li>Declaro que hay en la casa tres esclavos viejos e inútiles, llamados Simón, Domingo Ignacio y María quienes se mantendrán en ella; igualmente existe un&nbsp;<strong>negra moro llamado Pascual, a quien por su fidelidad, su buen servicio, y lo mucho que me ha ayudado, debo concederle la la libertad sin reparo,&nbsp;</strong>como se la concedo, respecto, a que debo presumir que la voluntad de los donantes quedó resignada a la mía, en una y otra circunstancia de equidad y de prudencia. Pero esto deberá entenderse con la precisa condición y calidad de que durante su vida, venga a servir en las datas de ejercicios, en aquellos ministerios, que acostumbra. siendo esta condición tan solemne y estrecha que sin su cumplimiento no tendrá efecto la libertad.</li><li>Declaro que de todos los bienes así muebles como raíces, papeles y cuanto hay en casa, se tome un prolijo inventario judicial, bajo el cual se deberá hacer cargo la persona nombrada con responsabilidad formal para ante quien corresponda, no siendo de mi inspección determinarlo; así lo declaro.</li><li><strong>Declaro que habiendo vivido de la Providencia meramente, no tengo bienes sobre que recaiga institución de heredero,</strong>&nbsp;sin embargo por un efecto de solemnidad legal nombro por tales a las benditas almas del Purgatorio, en cuyo sufragio y beneficio deberá invertirse cualquier derecho que pudiera corresponderme, como de algual (sic, por alguna) limosna se dará a las mandas forzosas y acostumbradas a real cada una; así lo declaro para que conste.</li><li>Declaro que la casa se halla gravada en algunas dependencias pasivas, cuyos acreedores y cantidades constan de mis apuntes; declárolo así para que conste.</li><li>&nbsp;<strong>Declaro y nombro por mi sucesora a Doña Margarita Melgarejo,</strong>&nbsp;quien cuidará principalmente de solicitar un director, y capellanes, que corran con el gobierno y dirección espiritual de los (366) ejercitantes, y en la parte que puedo prevengo, que en lo sucesivo se transmita esta elección en los mismos términos, rogando a todas las que quedan por la paz, tranquilidad, y religiosa unión; y principalmente por el celo en el servicio de Dios, y cumplimiento exacto de los santos fines, que las condujeron a esta Casa, cuyas puertas debe sellar el recato, la moderación, y el silencio. Dios derrame sobre todas ellas sus bendiciones,<strong>&nbsp;y yo como buena madre, y con mi mayor ternura les dispenso la mía, y me despido de todas hasta la eternidad</strong>.</li><li>Y para cumplir todo lo que contiene este testamento cerrado, nombro por mis testamentarias, y albaceas, a las Señora Doña María Cabrera, Doña Florentina Gómez, Doña Mercedes Guillota, y Doña María Josefa Pérez, a cada una in solidum, y les confiero amplio poder para todos los efectos de este nombramiento, durándoles el año legal, o el más tiempo que necesitasen, pues les prorrogo, y por el presente revoco y anulo todos los testamentos, que antes de ahora hubiere formalizado, disposiciones, o codicilos, de palabra o escrito, o en otra forma, y sólo quiero se estime y tenga éste por mi última deliberada voluntad, en la vía y forma que mejor haya lugar en Derecho.</li></ol><p>Así lo otorgo y ruego firme por mí el Señor Doctor Don Felipe Antonio Martínez de Iriarte, que se halla presente, en esta muy notable y muy leal Ciudad de la Santísima Trinidad Puerto de Santa María de Buenos Aires, en 6 días del mes de marzo de este año de 1779.- A ruego de la otorgante y por su imposibilidad.-Doctor Felipe Antonio de Iriarte.</p>',NULL,NULL,NULL,1,'2025-11-06 11:17:53',1);
INSERT INTO `cont_2contenidos` VALUES (10,4,1,'<ul><li>2 de julio de 2010: El Santo Padre Benedicto XVI autorizó a la Congregación vaticana para las Causas de los Santos a promulgar el decreto por el que se reconoce que<strong> la Sierva de Dios María Antonia de Paz y Figueroa (María Antonia de San José) practicó las virtudes cristianas en grado heroico y la proclamó Venerable</strong>.</li><li>25 de junio de 2015: la Junta Médica de la Congregación para las Causas de los Santos dio su&nbsp;<strong>voto positivo al presunto milagro</strong>&nbsp;ocurrido por intercesión de la venerable María Antonia de Paz y Figueroa.</li><li>12 de noviembre de 2015: La Comisión de Teólogos de la Congregación para las Causas de los Santos emitió un&nbsp;<strong>dictamen unánime y positivo sobre la causa de beatificación</strong>&nbsp;de María Antonia de Paz y Figueroa, también conocida como Mama Antula.</li><li>9 de febrero de 2016: la reunión plenaria de Obispos y Cardenales de la Congregación de la Causa de los Santos en Roma&nbsp;<strong>aprobó por unanimidad todo el proceso de la Causa de Canonización de Mama Antula.</strong></li><li>El 27 de agosto de 2016 fue&nbsp;<strong>beatificada</strong>&nbsp;en su tierra Natal, Santiago del Estero.</li><li>El 24 de octubre de 2023 el Papa Francisco aprobó el segundo milagro que permitó su<strong>&nbsp;canonización</strong>.</li><li>El 11 de febrero de 2024&nbsp;<strong>Santa María Antonia de San José</strong>&nbsp;-Mama Antula- es canonizada en el Vaticano por el Papa Francisco.</li></ul>','1762622261953.jpg',NULL,NULL,1,'2025-11-06 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (11,1,1,NULL,'1760660122986.jpg',NULL,'Descendientes colaterales y devotos de Mama Antula en la Misa en la Basílica de La Piedad: Aldo Marcos de Castro Paz, Susana Saguier Elía, Dolores Costa Paz y sus hijas, Damián Abregú, Jorge Bayá Casal, Sebastián Gorostiaga y las hermanas Mariana y Victoria Bayá Casal',1,'2025-10-28 22:45:56',1);
INSERT INTO `cont_2contenidos` VALUES (12,2,2,'<p>Con una conferencia magistral en el salón parroquial de la Basílica del Socorro brindada por el profesor Aldo Marcos de Castro Paz -historiador y descendiente colateral de María Antonia de San José- se cerró la semana de celebraciones de la primera fiesta litúrgica de Santa Mama Antula, después de 7 años de celebrar, cada 7 de marzo a «la Beata»</p><p>La conferencia se realizó en el marco del Día Internacional de la Mujer. Justamente Mama Antula fue llamada «Mujer Fuerte» en vida por su excepcional obra en pleno siglo XVIII, gestionando ejercicios ignacianos y autorizaciones con Obispos, Virreyes, militares y administradores del cabildo de Buenos Aires en épocas en las que las mujeres estaban confinadas a las tareas domésticas o la vida religiosa en monasterios de clausura.</p>',NULL,NULL,NULL,1,'2025-11-12 19:56:29',1);
INSERT INTO `cont_2contenidos` VALUES (13,24,3,NULL,NULL,NULL,NULL,1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_2contenidos` VALUES (14,7,6,NULL,'1762637132905.jpg',NULL,'Adoración al Manuelito de Mama Antula luego de la Misa, y bendiciones. Fieles y devotos rezando por la paz.',1,'2025-11-08 21:25:32',1);
INSERT INTO `cont_2contenidos` VALUES (15,7,5,NULL,'1762637021230.jpg',NULL,'Procesión de reliquias de Mama Antula y veneración al Manuelito, luego de la Misa en la Basílica de la Piedad.',1,'2025-11-08 21:23:41',1);
INSERT INTO `cont_2contenidos` VALUES (16,23,0,NULL,'1762635928444.jpg',NULL,'En Buenos Aires, a las 5 de la mañana, se reunieron en el Colegio de La Piedad más de 100 personas que compartieron en pantalla gigante la transmisión en directo de la Canonización en la capilla Papal de la Basílica de San Pedro en el Vaticano.',1,'2025-11-08 21:05:28',1);
INSERT INTO `cont_2contenidos` VALUES (17,7,0,'<p>El Domingo 11 a las 10 de la mañana, Mons. Gustavo Carrara presidió la Misa en acción de gracias por su santificación en la Basílica de La Piedad, donde se encuentra el Sepulcro de Mama Antula, que ya desde las 8 de la mañana rebosaba de fieles que hicieron cola para tomar gracia en su mausoleo.</p>',NULL,NULL,NULL,1,'2025-11-08 21:09:24',1);
INSERT INTO `cont_2contenidos` VALUES (18,7,4,NULL,'1762636986650.jpg',NULL,'Mons. Mollaghan, Mons. Carrara, Mons. Baliña y el P. Raúl Canali, en la procesión con las reliquias de Mama Antula en la Misa de acción de gracias en Buenos Aires',1,'2025-11-08 21:23:06',1);
INSERT INTO `cont_2contenidos` VALUES (19,13,1,NULL,'1762640150924.jpg',NULL,NULL,1,'2025-11-08 22:15:50',1);
INSERT INTO `cont_2contenidos` VALUES (20,13,3,NULL,'1762640245999.jpg',NULL,'Firma María Antonia de San José, Beata',1,'2025-11-08 22:17:26',1);
INSERT INTO `cont_2contenidos` VALUES (21,17,1,'<p><strong>María Antonia de San José, la Beata de los Ejercicios, primera santa argentina</strong></p><p>Por la Dra. Alicia Fraschina</p>',NULL,NULL,NULL,1,'2025-11-11 10:12:47',1);
INSERT INTO `cont_2contenidos` VALUES (22,15,4,NULL,'1762640635083.jpg',NULL,'Retrato de Mama Antula pintado por José de Salas, «el madrileño», que conoció a la beata. El retrato fue colocado en la Misa exequial en la que el Padre Perdriel pronunció la Oración Fúnebre. Cuando murió Mama Antula el 7 de marzo de 1779 se cumplió su voluntad: fue enterrada muy sencillamente, sin ataúd ni funerales, en el camposanto de la antigua Iglesia de La Piedad.',1,'2025-11-08 22:23:55',1);
INSERT INTO `cont_2contenidos` VALUES (23,15,1,'<blockquote>Pronunciada por el R. P. Fray Julián Perdriel, prior del Convento de Predicadores de Buenos Aires, en las solemnes exequias que se celebraron en la Iglesia de Santo Domingo por el alma de la Señora Beata María Antonia de la Paz, el día 12 de julio de 1799.</blockquote>',NULL,NULL,NULL,1,'2025-11-11 04:07:57',1);
INSERT INTO `cont_2contenidos` VALUES (24,15,5,NULL,'1762640858832.jpg',NULL,'Sepulcro Histórico Nacional de Mama Antula, donde descansan sus restos, Basíllica de La Piedad.',1,'2025-11-08 22:27:38',1);
INSERT INTO `cont_2contenidos` VALUES (25,15,3,'<p>«Al fin, cristianos, la muerte cruel no satisfecha con haber ya tantas veces arrancando del seno de nuestras familias cuanto en ellas teníamos más amable, padres, hijos, esposos, amigos, caras prendas, pedazos del corazón, como para echar el resto de su insaciable voracidad, se entró inhumana en esta capital el día siete de marzo y, de un solo golpe, nos arrebató con violencia aquella mujer fuerte, que por cerca de veinte años, la edificó con su vida ejemplar, y la santificó por su extraordinario celo; aquella mujer sierva del Señor, sierva devota, <strong>sierva fiel y prudente, declarada mortal enemiga del vicio y de sus sombras; amante firme de la virtud y propagadora incansable de la devoción: aquella mujer fecunda en pensamientos de santidad; diestra y humilde al comunicarlos; intrépida y confiada en Dios para ejecutarlos; constante a todas las pruebas en la necesidad de sostenerlos; aquella mujer superior a su sexo, émula y aun vencedora del varonil, rara y singular;</strong>&nbsp;cuyo corazón se inflamaba cada momento en deseos de nuestra santificación. Sí, la muerte cruel, insensible a nuestra pena, sacó de la tierra de los vivientes aquella mujer…</p><p>Más, ¿para qué anda huyendo de nombrarla, si por último ha de sufrir el ánimo este torrente de amargura? Salgamos de una vez del paso:&nbsp;<strong>vino la muerte inexorable y acabó con la respetable vida de la Señora María Antonia de la Paz o, por llamarla con los nombres que la impuso su devoción y edificante exterior, murió la Señora Beata María Antonia de San José.</strong>&nbsp;Sácala Dios de en medio de nosotros, y quién sabe si porque no éramos dignos de ella y en grave castigo de nuestros pecados, ya no la vemos andar por esas calles, los pies descalzos, cubiertos de polvo y todo fatigado el aliento, conduciendo un cuerpo extenuado con rigurosas abstinencias, y mortificado con ásperos cilicios, toda ocupada en las solicitudes del amor de sus prójimos. Ya no admiramos aquel semblante modesto sin hipocresía, gracioso sin disipación, afable sin bajeza y sin interés. Ya no hieren nuestros oídos aquellos suspiros de lo íntimo de su angustiado espíritu, nuncios y desahogo a un tiempo mismo de su caridad. Su cuerpo yace sepultado como los demás entre la tierra de la parroquia de la Piedad; y su alma, su buena alma, partió al destino que Dios justo y misericordioso haya querido darle. ¡Oh, pesadumbre la que ha venido a recargar nuestro ánimo! ¡Oh, pérdida la que hemos hecho! Vosotros conocéis bien que más es para llorada que para encarecida, y yo añado que de los míos.</p><p>Porque, ¿quién podrá mejor medir el tamaño de esta pérdida irreparable, que vosotros mismos, regulándolo por el precio de los beneficios recibidos por su mediación? Así es que cada uno de nosotros, inspirado de la gratitud, formó su panegírico interrumpido de sollozos y de lágrimas en el momento de su muerte y le repetiréis todas las veces que venga vuestra memoria la de cuánto debéis a la Señora Beata María Antonia de San José.</p>','1762640927832.jpg',NULL,'Celda 8 de la Santa Casa, donde murió Mama Antula: «En esta celda vivió la Venerable Sierva de Dios María Antonia de San José. En ella murió el 7 de marzo de 1799 a las 3 de la tarde».',1,'2025-11-08 22:28:47',1);
INSERT INTO `cont_2contenidos` VALUES (26,12,1,'<p>Dios omnipotente y misericordioso,<br>que en Santa María Antonia de San José,<br>incansable peregrina de los ejercicios espirituales,<br>diste a tu Iglesia un modelo de entrega para<br>anunciar el Evangelio: concédenos, por su intercesión,<br>meditar constantemente el misterio de tu Hijo,<br>para salir al encuentro de los pobres y desamparados.</p><p>Por nuestro Señor Jesucristo, tu Hijo,<br>que vive y reina contigo en la unidad<br>del Espíritu Santo, y es Dios,<br>por los siglos de los siglos.</p><p>Amén</p>','1762828354951.jpg',NULL,NULL,1,'2025-11-11 02:32:34',1);
INSERT INTO `cont_2contenidos` VALUES (27,33,1,'<p>A la luz de la historia Argentina las cartas escritas por Mama Antula han resultado un tesoro nacional, no solo por la fe que transmiten sino por el contenido histórico que contienen. La Beata es considerada la primera escritora del Río de la Plata -lo sería de la Argentina pero a su muerte (en 1779) la Argentina aún no existía como Estado moderno-. Las cartas que enviaba, recibía y que fueron escritas en su tiempo en torno a su excepcional figura eran esperadas con expectativa en Europa y traducidas a diversos idiomas para ser a su vez reenviadas por todo el viejo continente. Mama Antula escribía en español pero al haberse perdido los originales, muchas de sus cartas están reproducidas aquí en otros idiomas. Esas cartas de La Beata -adjuntas a la <em>Positio</em> de su canonización y reproducidas en esta página- pueden ser consideradas como la literatura epistolar originaria más importante -sino la más antigua- de la Argentina. En sus relatos están presentes hechos históricos de la vida del Virreinato del Río de La Plata y reflejan la vida cotidiana de la incipiente aldea ribereña que era Buenos Aires. Cada una de sus cartas resulta un texto coloreado, y juntas forman el todo de ese paisaje «vitreaux» que era el clima previo a la independencia Argentina.</p><p><em>«Hasta la fecha, estamos frente a la mayor epistológrafa del período hispánico del Plata»</em>sostiene don Pedro Luis Barcia, ex presidente de la Academia Argentina de Letras. <em>«Ninguna escritora ni escritor nacido en el Plata alcanzó la difusión mundial que alcanzaron las epístolas de María Antonia, traducidas a las más importantes lenguas modernas -francés, italiano, inglés y alemán- sino al latín, para mayor universalidad de su difusión. Esta situación no puede exhibirla ningún escritor argentino, no ya del período hispánico, sino hasta entrado el siglo XX».</em></p><p>La Beata se escribía con su confesor, el <strong>Padre Gaspar Juárez</strong> –santiagueño como ella, exiliado en Europa luego de la expulsión de los Jesuitas de América-. Dice el sacerdote jesuita e historiador Guillermo Furlong en el libro de Ana María Cabrera: <em>«Le cabe al Padre Juárez la altísima gloria de haber sido</em><strong><em>mentor</em></strong><em>de aquella mujer santiagueña que rivaliza con la santa avileña (</em>N de R: Santa Teresa de Ávila<em>) en cuanto a sus virtudes, y a la que supera en lo andariega, y a la que está a la par en el admirable don persuasivo con que doblegó las frentes más reacias y brujuleó las voluntades más obstinadas. Sin duda alguna, María Antonia de la Paz y Figueroa es una de las figuras femeninas más extraordinarias en la historia universal, y fue Gaspar Juárez quien templó esa alma y contribuyó a la que fue: una Teresa de Jesús de subido tono criollo”. </em></p><p>Se escribía la Beata también con el <strong>fraile Julián Perdriel</strong>-sacerdote dominico que fue su confesor a la hora de su muerte- y con <strong>Ambrosio Funes</strong> -hermano del célebre Deán Funes-, secretario de Mama Antula y actor junto a su hermano de la revolución de Mayo de 1810.</p><p><em>«La prosa de La Beata es de tono familiar, espontánea, fresca, decantada y fluida. No registra repeticiones ni tropiezos, tan frecuentes en el género epistolar de imperitos</em>-comenta don Pedro Luis Barcia. <em>Llama la atención su decir llano, fácil y sin afectación. Nunca se mete en «bachillerías», como decía burlándose de ese intento Teresa la avilense».</em></p><p>Barcia, al igual que el P. Furlong, también compara la tarea y estilo de Mama Antula con el de Santa Teresa de Ávila y con aquello de que Dios anda entre los pucheros: <em>«También en el caso de María Antonia se alternan los momentos de recogimiento con los trajines de la cocina y previsiones de lo pequeño y cotidiano».</em></p><p>Gracias al paciente trabajo de transcripción de estas cartas, realizado por devotos de Mama Antula -que han sido clasificadas e identificadas por la Dra. Silvia Mónica Correale (postuladora de la causa de canonización), Mons. Guillermo Karcher (colaborador), Mons. José Luis Gutiérrez (relator)- las reproducimos con breves epígrafes que intentan ofrecer el horizonte histórico al momento de ser escritas, para su mayor comprensión y disfrute.</p><p>Los textuales de Pedro Luis Barcia, Presidente de la Academia Argentina de Letras, son extractos de su ponencia en las Jornadas de Literatura Colonial del Cono Sur realizadas en Buenos Aires el 29 y 30 de noviembre de 2001 por el Centro de estudios Iberoamericanos de la Universidad Católica Argentina.</p>','1762820888907.jpg',NULL,'Ilustración de Máximo de Castro Paz.',1,'2025-11-10 17:06:44',1);
INSERT INTO `cont_2contenidos` VALUES (28,32,3,'<p><em>Blanco VII: ACSBA (original, en castellano); ASR 19-21 (en castellano); G 24; B 30-32. Otras versiones: Blanco VIII: G 18; ASR 11-16 (Lettera continuazione) y ASR 69-72 (Lettera 3a al medesimo soggetto). Cf. también Blanco X: ACSBA (original); G 24 / Blanco XXIV: P 201-203 (en francés): C. P., 290-292. Pax Christi</em></p>',NULL,NULL,NULL,1,'2025-11-10 19:51:14',1);
INSERT INTO `cont_2contenidos` VALUES (29,5,1,NULL,'1762871415624.jpg','1762871428082.jpg',NULL,1,'2025-11-11 14:30:15',1);
INSERT INTO `cont_2contenidos` VALUES (30,31,2,'<blockquote>En 1780 Buenos Aires formaba parte del Virreinato del Perú. En esta carta Mama Antula comenta que el Obispo de Cuzco -Juan Manuel Moscoso- la ha autorizado a abrir oratorios en casas en la provincia de Córdoba del Tucumán. En esta época recién se inicia su tarea evangelizadora en Buenos Aires, para la que solicita colaboraciones y donde dice haber dado 4 tandas de Ejercicios Espirituales, mientras que en Tucumán ya ha ofrecido 60 retiros a la fecha de esta carta</blockquote>',NULL,NULL,NULL,1,'2025-11-10 19:58:30',1);
INSERT INTO `cont_2contenidos` VALUES (31,31,3,'<p>Buenos Aires, 7 de agosto de 1780.</p><p>La gracia del Espíritu Santo ilumine su alma eternamente, mi carísimo Don Gaspar en Jesucristo. He quedado muy reconocida a los singulares favores y privilegios que Vuestra Merced me ha alcanzado de Su Santidad y en las gracias que me confieren, trascendentales a toda mi descendencia, y en las que se me franquean <strong>concediéndome altar portátil para la protección de mis peregrinaciones.</strong> El Señor se sirva remunerarle en la vida futura estos beneficios; cuya posesión excitara cada día la frecuencia de mis recomendaciones al Altísimo, porque le de feliz despacho a todas las pretensiones que le convengan. A más de esto, procuraré interesar en el mismo logro de sus deseos a muchos y a todos, si fuese posible, de los que participan de tan utilísima concesión, y cuando tanta abundancia de deprecaciones no se obtenga, la Divina Providencia suplirá nuestros defectos en su obsequio, por habernos proveído por sus propios esfuerzos de tantos tesoros que redundarán en honra y gloria de Su Divina Majestad.</p><p>La vehemencia irresistible de este principio y el anhelo de heredar el espíritu de quien estableció (entre otros prodigios de la gracia) los Ejercicios Espirituales, con el proyecto de reformar las costumbres de todo el mundo y cristiandad principalmente, me han constituido en la profesión de esta parte de su Instituto.</p><p>Toda la provincia de Tucumán sus ciudades y jurisdicciones quedan exhortadas, habituadas y dispuestas a continuación, después de haberlos recibido en distintas ocasiones mediante a que Su Divina Majestad se sirvió adornar a sus vecinos de una docilidad y amor para recibirlos, por mis reconvenciones (es verdad) menos que por su celestial inspiración. Tan piadosamente dispuestos encontré los corazones de sus moradores, que sin extrañarlos (como que se hallaban insinuados y nutridos de ellos tan de antemano), ni repugnarlos, obedecieron la voz de su pobrecilla sierva, resolviendo tomarlos en mi presencia y reiterarlos en mi ausencia.</p><p>Hoy me hallo en esta ciudad fomentando la propagación de la misma empresa, y aunque hace once meses a que estoy demorada por defecto de licencias del Ilmo. actual (cuando más he merecido promesas sin efecto), con todo <strong>mi fe no varía y se sostiene en quien la da.</strong> Se me proponen varios impedimentos: el mundo está un poco alterado; los superiores no muy flexibles; los vecinos vacilando sobre mi misión; otros la reputan de fatua; en suma, cooperaron a ello rumores frívolos; empero, la providencia del Señor hará llanos los caminos, que a primera vista parecen insuperables. Todo lo puedo en el que me conforta.<strong> En esta atención espero firmemente recoger en breve la abundante mies que ofrece el país. </strong>Y si Su Divina Majestad rodea las cosas de tal conformidad, que sea indispensable diseminarlos en todas las provincias del Virreinato y de todo el Orbe, será preciso suministrarlos y anunciarlos en todos sus climas.</p><p>Meditando cuánto merece ser amada la Bondad infinita de mi Dios, juzgo muy corto recinto la estrechez de este mundo y de millares que hubiera, para ofrecerlos con los posibles, todos cubiertos de inocencia y penitencia a su honor y gloria. Ya que no lo puedo servir con obras de esta naturaleza, lo deseo.</p><p>Y así concluida mi carrera en América, pienso trasladarme a esos Reinos de Europa. Semejante determinación quizá la verifique dentro de poco tiempo. No obstante, pídale Vuestra Merced el dictamen correspondiente a mi confesor, que quiero experimentarlo. ¡Oh, mi Dios, y quien os viera ya amado de todas sus criaturas tanto cuanto sois de amable, o a lo menos fuese nuestra caridad igual al grado de maldad con que se envuelven nuestras ofensas para contigo!</p><p><strong>Vuestras Mercedes que han sido alimentados con el suave néctar de la tierra madre, la Compañía de Jesús, establecida sobre su honra y gloria, con que santificó a su fundador Ignacio, deben atender con sus ruegos y lágrimas incesantes la propia empresa, hasta que la veamos extendida con los mayores y más rápidos progresos. </strong>Así lo pido y espero conseguir.</p><p>Algunos han reputado, según he dicho, mis pretensiones por locas o por ridículas. No me embaraza este desorden, porque el mundo, siempre fatuo y siempre adverso al Evangelio, debe explicarse con oposición a todo lo que le es contrario. Todas sus objeciones se desvanecen sucesivamente y no sirven de otra cosa que de añadir trofeos y realces a mi misión. Bien me intima Jesucristo: Los perseguirá el mundo, pero alentaos; yo he vencido al mundo. A veces me parecen tan necesarias sus contradicciones, que sin ellas quizás desconfiaría de la conveniencia de mis obras; y no puedo menos que conocer que son la señal característica de las proezas que toman fuerza y origen del mismo Jesucristo; he Vuestra Merced aquí el fundamento por que siempre aguardo la resurrección de su orden. Algunas reliquias yacen sumergidas y esparcidas por el Orbe, y no será mucho que, agradando a Dios, su reunión forme de los últimos residuos el mismo cuerpo, la misma religión.</p><p>Otro asunto he meditado concerniente a su profesión y es que se administre a este pueblo un asalto o misión de aquellas que acostumbraban, y me parece que también lo conseguiré. <strong>Su Excelencia (el Virrey) y el Obispo se hallan requeridos para su ejecución</strong>. El cielo bendecirá sus permisiones. Si el éxito no corresponde a mis deseos, atribúyalo a mis pecados y rueguen a Dios los oculte del rostro de su Padre.</p><p>La víspera de la Asunción le mandé decir a mi San Estanislao una misa cantada en su iglesia y propio altar, en su honor y reconocimiento de haber docilizado los ánimos y dándome proporción de seguir en breve con mis designios. Le vistieron de peregrino y estaba para ojeado.</p><p><strong>Volviendo al asunto primario, digo que Vuestras Mercedes, como prácticos, me consigan cuantas gracias, cuantas preeminencias y privilegios me son conducentes a hacer más cómoda, interesada y atractiva mi misión, mediante las distancias dilatadas, caminos fragosos, países desiertos, pueblos desproveídos y otros mil inconvenientes que hay que experimentar.</strong> Con eso la abundancia de concesiones suavizará y hará amables todos sus obstáculos. A esto agregaré algunos arbitrios que me dicte la Divina Providencia, a quien únicamente debo todo lo que se invierte en las citadas obras piadosas. A más de lo cual, yo quiero operar con mayor libertad y darle otra reputación a mi empresa, para atraer almas a Dios hasta de los sentidos, y así Vuestras Mercedes discurran si es preciso en este intento, que yo les remita certificaciones y letras auténticas de la prosperidad que Dios me ha conferido en sus Ejercicios.</p><p><strong>Del Sr. Moscoso, actual Obispo de Cuzco, tengo una patente, en que, a más de concederme amplia facultad de distribuirlos en toda la Provincia de Tucumán indistintamente a pueblos, personas, lugares y tiempos, me permite abrir oratorios en casas particulares. </strong>Los demás canónigos y superiores de todas aquellas comarcas me ofrecen espontáneamente la misma exhibición, que, como hasta aquí me ha sido inútil, no me he querido aprovechar de ella, la cual en lo sucesivo puede graduarse por un prudente auxilio para lo que se ejecute. Hay tiempo de adquirir dichos documentos que remitiré con oportunidad.</p><p>El principio de la honra y gloria de Dios no me permiten separarme de los medios que la fomentan; por esto suplico a Vuestras Mercedes encarecidamente cooperen conmigo a su dilatación; yo que he corrido los países referidos y que tengo noticias de todo este Reino, informo a Vuestras Mercedes de <strong>la notable falta de pasto espiritual</strong> que echamos menos y lloramos por estas partes, y principalmente en cuanto a misiones y Ejercicios. Cuando yo a mis solas, dentro del silencio de mí misma, reflexiono (considero) este punto, soy oprimida de aflicción, me lamento y suspiro incesantemente por el remedio que exigen tales necesidades, y no encuentro otro arbitrio de ser dichosa, sino el agitar aquel del cual dimana la precaución contra estos males.</p><p>La administración de bienes espirituales que Dios prepara por mis manos, sin embargo de la indignidad con que admito semejantes beneficios y de la divina misericordia con que para ellos se distingue, me hacen inferir que Su Divina Majestad tal vez me conceda terminar mi carrera en la práctica de algún proyecto que produzca utilidades permanentes; cuyo establecimiento es indispensable robe las atenciones de Vuestras Mercedes, aunque las hayan anticipado penetrando mis designios. Los que actualmente forman toda mi ocupación pueden servir de previas disposiciones para aquellos; por lo que espero que Vuestras Mercedes hagan de éstos el uso más conveniente en elevar sus ideas hasta donde Su Divina Majestad fuese servido.</p><p>A mi confesor muchas expresiones de caridad, y así a él, como a Vuestras Mercedes, ruego no se olviden de mí, cual yo siempre le pido a Dios me los haga unos santos y guarde su vida muchos años.</p><p>Buenos Aires, 7 de agosto de 1780. B.L.M. de Vm. su aficionada y humilde sierva María Antonia de S. José.</p><p>P. D. La Casa de Ejercicios de esta ciudad, sin embargo de las órdenes de Su Majestad, se halla ocupada con ciertos huérfanos, lo que da motivo para denominarla hoy Casa de la Cuna. Nada de esto me impedirá franquear mis Ejercicios, porque <strong>habiendo oratorio en una casa capaz se remedia todo.</strong> No obstante, quisiera ver las cosas en su lugar. Sin salir de este régimen, <strong>he dado en la provincia del Tucumán 60 Ejercicios; aquí 4,</strong> y Dios quiera que pasen al número primero; yo quisiera darlos en todo el mundo; por lo que deseo una licencia para que nadie me ciña, sujete, ni detenga a lugar determinado.</p>','1762804771094.jpg',NULL,'En tiempos de Mama Antula disponer de un altar portátil permitía transportarlos fácilmente para celebrar Misa en diferentes lugares y facilitar la evangelización. Foto: Altar portátil (comienzos siglo xx) Museo de Arte Religioso Juan de Tejeda (Córdoba, Argentina).',1,'2025-11-10 19:59:31',1);
INSERT INTO `cont_2contenidos` VALUES (32,30,3,'<blockquote>Por la inmediata traducción de las cartas de Mama Antula a diferentes idiomas apenas recibidas en Europa, muchas de ellas han sobrevivido solo en sus versiones en lenguas extranjeras. Tal es el caso de esta en francés escrita por Mama Antula desde Córdoba -donde está dando los Ejercicios Espirituales en tandas de 200 a 300 personas-, antes de iniciar su tarea evangelizadora en Buenos Aires. Comenta su esperanza profética de que la Compañía de Jesús será restituida; que cada 19 de mes hace dar una Misa en honor a San José y sus peripecias atravesando desiertos y al cruzar ríos caminando descalza durante cientos de kilómetros por la zona hoy denominada Noroeste Argentino.</blockquote>',NULL,NULL,NULL,1,'2025-11-10 20:01:32',1);
INSERT INTO `cont_2contenidos` VALUES (33,30,4,'<p>J’ai toujours été dans cette opinion et j’y suis encore, que la <strong>Compagnie de Jésus sera un jour rétablie; </strong>et pour obtenir cette grâce plus eff i cacement du Seigneur, si désirée de nous tous, je fais <strong>célébrer solennellement une Messe tous les 19 des mois en l ’ honneur de St. Joseph</strong> et je n ’ ai pas manqué partout où je me suis trouvée d epuis le départ de la Compagnie de ces contrées, comme les Exercices de St. Ignace n ’ ont point été interrompus depuis ce temps dans notre Patrie, à l ’ exception de trois années que j ’ ai été absente occupée à les établir dans la Province. Mon Evêque, N. S. Jean Emmanuel de Moscoso que je trouvai à Jujuy, m ’ accorda avec bonté tout ce qui pouvait faciliter les Exercices Spirituels; jusqu ’ à me permettre une chapelle privée perso n nelle et de faire faire les Exercices dans quelque lieux ce fut commode pour cela da ns tout son Diocèse: autant qu ’ on a pu, on les a donnés dans les Maisons qu ’ avaient les Jésuites. Dans cette ville de Corduba on les a donné pendant quatorze semaines et à chaque semaine il y avait plus de 200 personnes et quelqu e fois 300, sans que grâces à Dieu il y eut jamais de confusion ni qu ’ on eût rien souffert ou pour les habitations, ou pour les vivres, quoique toutes les dépenses n ’ ayant d ’ autre fond que les a u mônes. La Providence y a si bien pourvu que dans le même temps on pouvait aider encore le s pauvres et les prisonniers. Les fruits retirés de ces Saints Exercices ont été si constants qu ’ on y voit visiblement la main de Dieu, et le concours si grand que sans y appeler personne, on se trouvait dans le cas de ne pouvoir pas accepter tout le monde , et de les remettre à une autre fois. Au milieu de la grande consolation que j ’ éprouve à la vue du grand bien qui se fait aux âmes, je ne puis vous cacher les peines que je souffre.</p><p>La plus grande est que où la moisson est si abondante, les ouvriers sont si rares; encore si le petit nombre qu’on a voulait se donner tout de bon à la besogne. Que sert de semer beaucoup, si on a personne pour cultiver le terrain, et faire la moisson. C’est de là que vient la diminution des Sacrements; jusqu’au point que plusieurs ne peuvent satisfaire au devoir pascal. Les paroisses sont vastes, sans grand nombre de chrétiens et presque toutes se trouvent dispersées ça et là et loin de leur curé de 10 à 20 lieues.</p><p>L’aide qu’avaient les curés, était qu’avant Pâques les Missionnaires Jésuites parcouraient ces paroisses, instruisant, prêchant et confessant, ainsi la besogne du curé à Pâques, lui pesait moins.</p><p>On parle là des Missions du Paraguay conduites autrefois par les Jésuites qui avant leur destruction étaient au nombre de 55, composées de plusieurs nations Indiennes, dont plusieurs étaient Catéchumènes. Les plus nombreuses étaient celles des Granirs et des Chichites, on y comptait environ 125 mille âmes.</p><p>Je fus établie Régulatrice des Exercices Spirituels, et pour que le fruit en soit plus grand, elles sont sous la protection de Notre Dame des Douleurs et des Saints de la Compagnie dont je fais célébrer lés Fêtes avec solennité.</p><p>Plusieurs personnes me sollicitent très fort de me transporter à Buenos: Je ne saurais me résoudre à rien jusqu’à ce que je voie clairement que c’est la volonté de Dieu. Et pour vous dire le tout en confiance, je ne fais pas un pas sans que le Seigneur me le commande et me conduise sensiblement comme par la main.</p><p>Comment cela arrive-t-il? Misérable que je suis. Je ne le sais pas. Cependant la chose est ainsi. De plus, si vous voulez que je vous instruise des soins tout amoureux de la Providence sur moi quelque indigne que j’en suis, sachez que dans mes pénibles voyages, dans des Pays si mauvais, </p><p>dans les déserts, obligée de passer de<strong>s fleuves, des torrents, j’ai toujours marché pieds nus, sans qu’il me soit rien arrivée de fâcheux: au contraire</strong></p><p> quelquefois que je me suis trouvée assez mal comme cela est arrivé à Catamarca où je fus désespérée des médecins, en me recommandant à la Sainte Vierge, sans autre remède je me levai du lit et continuai mon voyage jusqu’à Rioja. Une autre fois que je me rompis une côte par une chute, une autre que je m’étais donnée une entorse au pied, je me sentis par un tact invisible, guérie.</p><p>Salués tous nos chers frères et en particulier mon ancien Confesseur. Que tous m’aident de leurs prières sans quoi je ne puis rien. Votre Soeur Marie Antoinette de St. Joseph.</p><p> Corduba, dans le Tucuman, le 6 janvier 1778.</p>','1762804934411.jpg',NULL,'Ícono de Mama Antula, por Luis Quiróz',1,'2025-11-10 20:02:14',1);
INSERT INTO `cont_2contenidos` VALUES (34,30,5,'<p><em>Cf. Blanco II: AL (en francés); G 16; P 184-186 (en francés): C. P., 273-275. Una versión existe también en ASR 62-66 (en italiano). No se conoce el original en castellano.</em></p>',NULL,NULL,NULL,1,'2025-11-10 20:02:35',1);
INSERT INTO `cont_2contenidos` VALUES (35,32,2,'<p>Buenos Aires, 9 de octubre de 1780.</p><p>La gracia del Espíritu Santo sea con Vuestra Merced, mi Don Gaspar.</p><p>Esta carta es continuación de la que le acompaña.</p><p>La una dará a Vuestra Merced instrucción completa de los motivos y sucesos de mi esperanza, dirigida a suministrar en esta ciudad los Ejercicios de Nuestro Padre San Ignacio; la otra le impondrá de su consecución.</p><p>Aquélla es testimonio de mis aflicciones, por la supresión del aumento de la gloria y honra del Señor, que precisamente resultarían de ellos mismos. Ésta es un diseño e incentivo del gozo que me causa la actual práctica de contribuirlos. En suma, la primera suscitó (si me es permitido hablar así) los efectos de la terrible justicia del Señor; la segunda la produjeron los que dimanan de la inmensa, suave y amabilísima misericordia del Altísimo, de quien profirió el Profeta: “Señor, toda la tierra está inundada de tus misericordias”.</p><p>En efecto, han tomado las cosas de un instante a otro tal semblante, que cuando no se pensaba comúnmente sino en la repulsa de esta obra del cielo, se dispuso de un modo improviso su admisión, la cual ha provenido de las amplias facultades y permisos que me ha franqueado el Excmo. de esta Diócesis, siendo él mismo que antes más la resistía por fines que sin duda graduó por convenientes.</p><p>Luego que le obtuve, solicité casa distinta de la que se debía destinar, por hallarse ésta ocupada con ciertos huérfanos, como abajo expondré. Pero como son de Dios todas las que poseen los hombres, un pobrecito de éstos me ha cedido la suya para todo el tiempo que quiera, cuyas protestas (sin embargo de la tibieza con que parece la ofreció a los principios), las reitera inducido de gozo al fin de cada uno de dichos Ejercicios; y aunque es bastante estrecha nos facilita hasta hoy la extensión suficiente a adecuar los actuales designios del Señor.</p><p><strong>Su capacidad admite poco más de 100 personas con mucha incomodidad; </strong>como en los primeros y segundos Ejercicios concurrió poca gente, se dieron con regular desahogo. <strong>En los terceros empezamos a sentir su estrechez, porque llenaron toda la casa</strong>. Y últimamente en los cuartos, que estamos siguiendo, nos han oprimido con exceso y tanto que es preciso privarles la introducción de catres y cujas, para que así se den lugar unas a otras, tiradas en el suelo sobre esteras, chuces y colchones. Si el número de ellas se va recrudeciendo sucesivamente (como lo voy experimentando y promete el país), <strong>es necesario que Su Divina Majestad y mi Señora de los Dolores me oigan, a fin de que me provean de habitación correspondiente a la multitud de almas que anhelan nutrirse con el maná que adquieren mediante las sabias cristianas reglas que nos prescribió Ignacio</strong>; tan abundante en el espíritu que agita a las mujeres de este país. La referida casa que hoy sirve, está colocada calle de por medio frente a frente de la iglesia de San Miguel, adonde pasamos todos los días, mañana y tarde, a oír la Misa y pláticas del presentado Fr. Diego Toro, que las dispone y vierte con celestial emoción propia de su bello espíritu.</p><p>El alimento, aunque no hay fincas visibles,<strong> lo da Dios muy sobrante, excesivo y sazonado</strong>, con que logro complacer a todas las que los participan, quienes a más de esta dicha que logro no recusan mezclarse (hablo de las señoras principales ) con las pobrecitas domésticas, negras y pardas que admito con ellas. Ya se hace indispensable valerme de estos humildes arbitrios, para no malograr ni perder el fruto que ofrece el mismo Jesucristo, que jamás fue aceptador de personas.</p><p>Bien parece que carecían estas gentes de que mi misión fuese autorizada con algunas distinciones de hombres, y hasta en esto Dios les ha dado el gusto a unas, y a otras mucho en qué entender. A este intento han observado que los Excmos., que actualmente se hallan aquí, a saber: el de la misma ciudad y el Carmelita español de nuestra provincia (que llegó en el convoy poco más ha de un mes, mientras daba mis primeros Ejercicios), han asistido repetidas veces a las pláticas, que las han aplaudido con tanta complacencia, como lo restante de las distribuciones interiores que seguimos. El primero concurría casi solo, pero el segundo ha venido varias veces con lo más de su familia. Concluida su asistencia, sin duda en demostración del aprecio de tal obra, nos concedió indulgencias a todas las personas que participasen de ella, ejercitantes y no ejercitantes.</p><p>Ya he expresado cuántos favores me tributa el Excmo. de aquí; se me ha ofrecido a cuanto yo disponga de sus facultades y persona en lo posible. El nuestro es un sujeto de muchísimas circunstancias: es santo y es sabio con cuantas prendas pueden apetecerse capaces de equivocarle con los Padres primitivos. Los designios que lleva para efectuados en nuestra provincia, son los más adecuados a un verdadero pastor y, si no fuera por demorarme, yo le hiciera aquí un elogio de ellos. Baste por ahora decirle que me ha propuesto regrese a su diócesis, a fin de que juntos corramos su provincia, yo sin variar de profesión y él en calidad de confesor, pastor y misionero. ¿Puede darse mayor felicidad? Tales son los estímulos que a Vuestras Mercedes les presento, por los cuales vendrán en conocimiento del amor que mutuamente nos une en Jesucristo, a quien es debida toda preferencia, no a mí. “No a nosotros, Señor, no a nosotros, sino a Vuestro Nombre se debe tributar todo honor y toda gloria”. Si alguna cosa tenemos, es confusión.</p><p>A más de esto, después de haberse informado de mis asuntos y de habernos tratado (bien que no como deseábamos), me ha intimado el precepto, como superior tan legítimo, de que le escriba cuanto ocurra, y de que vuelva según el espíritu de sus órdenes futuras. Él sale mañana para Córdoba. Yo estoy muy contenta con este hombre raro, y confío en mi Dios, que me lo ha traído para cosas grandes. Así se lo expresó, según me cuentan, un alma justa, al tiempo de morir en España; y sus obras bien lo indican.</p><p>Prestándole la obediencia que debo no podré tan fácilmente transmigrarme a esos reinos. Si bien que yo en todo he de seguir la interior voz de mi Señor y Dios; también las inspiraciones de nuestra Señora de los Dolores. En adelante le referiré a Vuestra Merced las cosas conforme ocurran y me parezca. Entretanto ruegue a Dios con mis hermanos, se haga en mí cuanto fuere mayor honra, gloria y beneplácito del Altísimo.</p><p>La Casa de Ejercicios, ya he dicho, que se halla ocupada por ciertos huérfanos. Llegará ocasión que vuelva a su primitivo destino, si viene. Dios lo hará todo.</p><p>“Su diestra es omnipotente” y en tanto participamos de su fuerza en cuanto confiamos menos en los auxilios humanos. Cualquiera que sólo ponga la mira en tales socorros caducos suministrados por manos de hombres perderá todas sus empresas, confundirá su fe, se perderá eternamente, y así será “maldito el hombre que confiare absolutamente en otro hombre”.</p><p>Esta luz es bastante para afianzar en nuestras almas toda esperanza aun sobre aquellas cosas más destituidas de restauración. La esperanza que Dios aprecia es la que merece corona; quiero decir, la sólida, la firme, la perseverante.</p><p>Y así, ánimo, queridos, ánimo y fortaleza. La omnipotencia del brazo del Altísimo no descaece ni cede a nadie; y si algún vigor debe sostener nuestros corazones, su diestra le da, le señala y le conserva. El miserable poder y disposiciones de los hombres alucinan nuestros sentidos; pero el torrente de su fuerza destruye a aquéllas y protege hasta el fin a los inocentes, humildes, abatidos.</p><p>Poco ha nos han llenado de gozo las noticias del paisano Canónigo Juárez, quien habiendo verificado su introducción al Chaco en compañía del Coronel Comandante Don Francisco Gavino de Arias, vecino de Salta, ha convertido o reducido a la paz sola, o también a la religión, a tres numerosas naciones y prosiguen con la solicitud de alianza con otra más o con otras varias.</p><p>Ignoramos la prolija individualidad de su expedición. Procuren Vuestras Mercedes encomendar a Dios todas estas cosas, que yo no me olvido de las suyas.</p>','1762805136287.jpg',NULL,'Acuarela de José Torres Argañaráz (2020)',1,'2025-11-10 20:05:36',1);
INSERT INTO `cont_2contenidos` VALUES (36,5,2,'Del Arzobispado de Buenos Aires','1762872082903.jpg','1762872098223.jpg',NULL,1,'2025-11-11 14:41:22',1);
INSERT INTO `cont_2contenidos` VALUES (37,25,4,'<p><a href=\"https://www.google.com/maps/d/u/8/viewer?mid=1I24ck3_l92w-4RpLlUbygrFnW4K4_DBn&amp;ll=-33.034478022251385%2C-60.96347780000002&amp;z=5\" target=\"_blank\">En Argentina</a></p><ul><li>Templete Mama Antula -villa Silípica, Santiago del Estero-</li><li><a href=\"http://mamaantula.com/2021/11/30/mama-antula-es-un-tesoro-de-nuestro-pais/\" target=\"_blank\">Basílica de San Ponciano -La Plata-</a></li><li><a href=\"http://mamaantula.com/2021/06/29/mama-antula-en-la-catedral-de-moron/\" target=\"_blank\">Catedral de Morón</a></li><li>Santuario Nueva Pompeya -Mar del Plata-</li><li>Catedral Nuestra Señora del Carmen -Santiago del Estero-</li><li>Catedral de Santa Fe</li><li>Pquia. San Cayetano, Río Cuarto -Córdoba-</li><li><a href=\"http://mamaantula.com/2021/02/18/hogar-de-cristo-mama-antula/\" target=\"_blank\">Hogar de Cristo Mama Antula</a> -Isidro Casanova-</li><li>Santuario Nuestra Señora delos Milagros -Santa Fe-</li><li>Parroquia Santo Domingo de Guzmán -San Isidro-</li><li>Santuario Mama Antula -Santiago del Estero-</li><li>Catedral de Añatuya -pquia. Virgen del Valle, Sgo. del Estero-</li><li>Casa de Espiritualidad Mama Antula, Berisso, Buenos Aires</li><li>Santuario Mama Antula, Villa Silípica, Sgo. del Estero</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li>Colegio Hogar San Mauricio, González Catán, Buenos Aires</li><li>Parque Unidad Nacional, Merlo, Buenos Aires</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li><a href=\"https://goo.gl/maps/gGqSLBnNiw9iKYzP7\" target=\"_blank\">Basílica La Consolata, Sampacho, Córdoba</a></li><li><a href=\"https://goo.gl/maps/wKw8Ecu8cUGH1JWHA\" target=\"_blank\">Casa de Ejercicios Madre María Antonia de Paz y Figueroa, La Candelaria, Salta</a></li><li>Catedral de Salta</li><li>Catedral del Santísimo Salvador, San Salvador de Jujuy</li></ul>','1762830036884.jpg',NULL,'Mapa de la Argentina',1,'2025-11-11 03:00:36',1);
INSERT INTO `cont_2contenidos` VALUES (38,25,1,'<p><a href=\"/contactanos\" target=\"_blank\">Envianos un mensaje</a> si querés que incluyamos el retablo, imagen o devoción de tu comunidad.</p>',NULL,NULL,NULL,1,'2025-11-11 02:51:07',1);
INSERT INTO `cont_2contenidos` VALUES (39,25,5,'<p><a href=\"https://bit.ly/DevocionesMamaAntula\" target=\"_blank\">En CABA</a></p><ul><li><a href=\"http://mamaantula.com/2021/12/01/actividades-en-la-santa-casa-2/\" target=\"_blank\">Santa Casa de Ejercicios Espirituales</a>, CABA</li><li>Sepulcro Histórico Nacional Mama Antula, Basílica de La Piedad, CABA</li><li>Catedral Metropolitana de la Ciudad de Buenos Aires, CABA</li><li><a href=\"http://mamaantula.com/2021/02/07/mama-antula-y-san-cayetano/\" target=\"_blank\">Santuario San Cayetano de Liniers</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/02/24/por-los-que-sufren/\" target=\"_blank\">La Esperanza de Puerto Madero</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/08/08/mama-antula-en-su-parroquia/\" target=\"_blank\">Parroquia de La Concepción</a>, CABA</li><li>Plaza Santiago del Estero -CABA-</li><li><a href=\"http://mamaantula.com/2021/12/30/la-mayolica-de-mama-antula/\" target=\"_blank\">Estación Sáenz Peña, Subte A -CABA-</a></li><li><a href=\"http://mamaantula.com/2021/12/29/mama-antula-en-alpi/\" target=\"_blank\">ALPI Asociación Civil</a>, CABA</li><li>Iglesia Ntra. Sra. de Montserrat, CABA</li><li>Cripta de la Iglesia Ortodoxa San Martín de Tours, CABA</li></ul>','1762830105475.jpg',NULL,'Mapa de CABA',1,'2025-11-11 03:01:45',1);
INSERT INTO `cont_2contenidos` VALUES (40,26,1,'<p><strong>Fiesta de santos y santas</strong></p><p>Bajo el lema «Los santos, faros que iluminan caminos» celebramos el día de todos los santos contemplando una imagen que muestra a Mama Antula como catequista y rodeada de su mundo y de los santos y santas de su mayor devoción.</p><p>La ilustración -de Dolores Avendaño- resume el mundo y la actitud de Mama Antula, la primera santa argentina: <strong>para encontrar a Dios hay que abajarse.</strong> Porque Dios está en los más pequeños, frágiles, pobres y vulnerables.</p><p>En la ilustración, a la izquierda, aparece a lo lejos la <strong>Basílica de Luján,</strong> por donde entró Mama Antula a Buenos Aires, después de haber caminado evangelizando por Santiago del Estero, Jujuy, Salta, Tucumán, La Rioja, Catamarca y Córdoba.</p><p>Están acompañándola los santos y santas a quienes les profesaba especial devoción:<strong> San Cayetano </strong>-con el Niño Dios en Brazos-,<strong> la Virgen de los Dolores</strong> y <strong>San José</strong>.</p><p>La naturaleza a pleno revela en cierta forma algo del Pesebre -están todos sus actores- y su Santiago del Estero natal está presente en el <strong>cactus.</strong> No faltan las <strong>mujeres </strong>-que la ayudaron en su misión- y <strong>la familia.</strong></p><p>Como telón de fondo, la obra cúlmine de Mama Antula: <a href=\"https://mamaantula.com/santa-casa-de-ee/\" target=\"_blank\">La Santa Casa de Ejercicios Espirituales.</a></p>','1762830673474.jpg',NULL,'Mama Antula, rodeada de los santos de su devoción. Ilustración de Dolores Avendaño.',1,'2025-11-11 03:11:13',1);
INSERT INTO `cont_2contenidos` VALUES (41,27,3,NULL,NULL,'IaH5YJQGTBg',NULL,1,'2025-11-11 03:27:23',1);
INSERT INTO `cont_2contenidos` VALUES (42,27,2,'<p><strong>Doña Jovita a Mamá Antula</strong></p><p>Doña Jovita -interpretada por José Luis Serrano- es una abuela del interior de la Argentina, humilde, que exhuda la sabiduría de los años y las adversidades de la vida. En esta genial payada describe aspectos de la vida y obra de Mama Antula, predecesora del Cura Brochero en la difusión de los Ejercicios Espirituales.</p>',NULL,NULL,NULL,1,'2025-11-11 03:15:21',1);
INSERT INTO `cont_2contenidos` VALUES (43,29,1,'<p><strong>Llamado a la santidad</strong></p><p>Video biográfico de Mama Antula, que intercala escenas reales de adolescentes en la escuela con un gran trabajo interpretativo al momento de encarnar los principales momentos y prodigios de la primera santa argentina. Realizado por estudiantes del Colegio de la Providencia (Bella Vista, Bs. As)</p>',NULL,NULL,NULL,1,'2025-11-11 03:28:40',1);
INSERT INTO `cont_2contenidos` VALUES (44,29,2,NULL,NULL,'StqZFOuH23Q',NULL,1,'2025-11-11 03:29:13',1);
INSERT INTO `cont_2contenidos` VALUES (45,26,2,'<p><strong>Mama Antula catequista</strong></p><p>En el 1700, nuestra beata de la Compañía de Jesús enseñaba la Palabra de Dios a los niños de las comunidades originarias de Santiago del Estero. En 2010 el Cardenal Bergoglio pidió a los catequistas de Buenos Aires que rezaran ante el sepulcro de Mama Antula. Y en 2021, ya siendo Papa Francisco, declaró el Ministerio Laical del catequista, que se celebra cada 21 de agosto.</p><p>Recordamos un fragmento de la carta a los catequistas que el Cardenal Jorge Bergoglio -hoy Papa Francisco- escribió en el Día del catequista de 2010:</p><blockquote>«..¡No te canses de sembrar! Y en este año del Bicentenario,<strong> me animo a proponerte que te acerques como peregrino a la Parroquia de Nuestra Señora de la Piedad. Y ante la tumba de la Madre Antula, pedile para vos, para mí y para cada uno de los catequistas de esta bendita ciudad, su grandeza y su fortaleza.</strong> Suplicale la gracia de poder acompañar y cuidar la fe de nuestro pueblo fiel como ella lo supo hacer tres siglos atrás, en circunstancias también difíciles como las actuales. Será una manera de <em>“anticipar la aurora, y construir la esperanza”.</em>Que Jesús te bendiga y la Virgen Santa te cuide. Afectuosamente. «</blockquote><p>Card. Jorge Mario Bergoglio SJ, arzobispo de Buenos Aires. Buenos Aires, 21 de agosto de 2010</p>','1762831981080.jpg',NULL,NULL,1,'2025-11-11 03:33:01',1);
INSERT INTO `cont_2contenidos` VALUES (46,26,3,'<p>Mama Antula, célebre por la enorme obra evangelizadora que realizó en el territorio del virreinato del Perú y del río de la Plata, dio sus primeros pasos como <strong>catequista de los indios de Santiago del Estero</strong>.</p><p>Hablaba en quechua y compartía la vida con las comunidades originarias con estrecha colaboración con las reducciones jesuitas. Por entonces catequizar no solo implicaba la tarea de dar a conocer la buena noticia de Jesús, sino también la educación integral para la vida digna: cocinar, bordar, plantar y cosechar además de leer y escribir.</p>','1762832061382.jpg',NULL,'Esta pintura de Mama Antula catequizando a caballo por los caminos de Santiago fue realizada por Marcela Torena, de la familia antuliana. Está sentada al estilo amazona, de costado, evangelizando a las familias quechuas de Santiago del Estero.',1,'2025-11-11 03:34:21',1);
INSERT INTO `cont_2contenidos` VALUES (47,28,1,'<p><strong>Consagración de los niños a San José</strong></p><blockquote>María Antonia de Paz y Figueroa tenía una especial predilección por el Padre de Jesús, por lo que eligió como nombre religioso María Antonia de San José. Oración para consagrar la vida de nuestras niñas y niños a San José y rogar su protección de Padre de la Iglesia y de las familias del mundo entero.</blockquote>',NULL,NULL,NULL,1,'2025-11-11 03:38:04',1);
INSERT INTO `cont_2contenidos` VALUES (48,28,3,'<p>San José es el patrono de la Compañía de Jesús. De ahí la veneración de María Antonia, que eligió llamarse “María Antonia de San José” un 18 de marzo de 1745, hace 277 años, según la tradición oral. Lo veneró toda su vida y todos los 19 de cada mes mandaba a rezarle Misa, rezando especialmente por la restitución de la Compañía de Jesús en América, como nos cuenta en sus cartas:</p><blockquote>«para mí cuento el interponer por <strong>medianero al señor San José obligándome a mandarle cantar misa en todos los días 19 del mes, </strong>como así mismo aplicando todo el trabajo que impendo en el ministerio de los Ejercicios» </blockquote><p>-María Antonia de San José, <a href=\"https://mamaantula.com/2020/10/06/carta-10-de-la-sierva-de-dios-al-p-juarez-buenos-aires-5-de-septiembre-de-1782/\" target=\"_blank\">carta 10 al Padre Gaspar Juárez</a></p><blockquote>«Prosigo en hacer cantar misa al Señor San José cada 19 del mes, como comencé desde que salieron Vds. de acá y esto sin faltar jamás. Y cuando por hacerse los Ejercicios no puedo en mi oratorio, la hago cantar en la Merced. Y de Córdoba y de todas las demás partes donde he estado me escriben que hacen esta diligencia, principalmente en mi tierra, donde me han estado corriendo estas misas que se cantan en la iglesia de la Compañía y de la Merced.</blockquote><blockquote>Tal vez pareciéndome que se me tardan los asuntos para honra y gloria de Dios, esto es, la restitución de la Compañía, empiezo a decir al Señor San José que me pague lo que me debe, pues me debe mucho (esto es, lo que yo gasto en estas misas por el Santo, a fin de que me alcance de Dios aquella gracia) y después caigo en la cuenta que más debo yo a él; pero como puede mucho, siempre quedo con el consuelo que me lo ha de hacer; esto es, aquello que sabe Vd.»</blockquote><p>María Antonia de San José, <a href=\"https://mamaantula.com/2020/11/13/carta-29-de-la-sierva-de-dios-al-p-juarez-buenos-aires-22-de-agosto-de-1785/\" target=\"_blank\">carta 29 al Padre Gaspar Juárez</a></p>','1762832481505.jpg',NULL,'Reliquia de Mama Antula junto a la imagen de San José, previa a su entronización en el altar de la Iglesia de la Concepción de la Av. Independencia.',1,'2025-11-11 03:41:21',1);
INSERT INTO `cont_2contenidos` VALUES (49,26,4,'<p><strong>El Manuelito</strong></p><p>Mama Antula llevaba del cuello esta imagen de un Niño Dios abrazado a la Cruz. La gente lo consideraba milagroso, le rezaban con fervor. Se encuentra en la Santa Casa de Ejercicios Espirituales que fundó Mama Antula. Es un Museo histórico que podés visitar cada primer Domingo de cada mes.</p>','1762832622543.jpg',NULL,'Reliquia de la Santa Casa',1,'2025-11-11 03:43:42',1);
INSERT INTO `cont_2contenidos` VALUES (50,17,2,NULL,NULL,'CJtrkX7DA4I',NULL,1,'2025-11-11 10:13:43',1);
INSERT INTO `cont_2contenidos` VALUES (51,9,4,NULL,'1762856103461.jpg',NULL,'Audiencia Privada de la Familia antuliana con el Papa Francisco, feb/2024',1,'2025-11-11 10:15:03',1);
INSERT INTO `cont_2contenidos` VALUES (52,8,2,NULL,'1762856287372.jpg',NULL,NULL,1,'2025-11-11 10:18:07',1);
INSERT INTO `cont_2contenidos` VALUES (53,10,NULL,'Nuestra Mama Antula : Caminante del Espíritu','1762860316771.jpg','2014 - San Pablo','Víctor Manuel Fernández',1,'2025-11-11 11:25:16',1);
INSERT INTO `cont_2contenidos` VALUES (54,10,NULL,'El estandarte de la mujer fuerte de nuestros días: Mama Antula','1762860370304.jpg','1791 - Sociedad Hijas del Divino Salvador','Autor Anónimo',1,'2025-11-11 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (55,10,NULL,'Mama Antula : la vida de la mujer que fundó la espiritualidad en la Argentina','1762860423562.jpg','2017 - Sudamericana','Ana María Cabrera',1,'2025-11-11 11:27:03',1);
INSERT INTO `cont_2contenidos` VALUES (56,10,NULL,'Crónicas de la beatificación','1762860452351.jpg','2017','Jorge Baya Casal Oyuela',1,'2025-11-11 11:27:32',1);
INSERT INTO `cont_2contenidos` VALUES (57,10,NULL,'El Retrato Documental de María Antonia de Paz y Figueroa, la Beata Santiagueña','1762860479713.jpg','2017','Aldo Marcos de Castro Paz',1,'2025-11-11 11:27:59',1);
INSERT INTO `cont_2contenidos` VALUES (58,10,NULL,'El estandarte de la mujer fuerte de nuestros días: Mama Antula','1762868916091.jpg','1791 - Descarga','Autor Anónimo',1,'2025-11-11 11:26:10',1);
INSERT INTO `cont_2contenidos` VALUES (59,5,3,'De la Santa Casa de Ejercicios Espirituales, Independencia 1190, CABA\r\n\r\n','1762872150449.jpg','1762872160637.jpg',NULL,1,'2025-11-11 14:42:30',1);
INSERT INTO `cont_2contenidos` VALUES (60,5,4,'Oración a María Antonia de San José','1762872209467.jpg','1762872218165.jpg',NULL,1,'2025-11-11 14:43:29',1);
INSERT INTO `cont_2contenidos` VALUES (61,28,2,'<p>Glorioso San José,<br>a vos Dios te encomendó<br>el cuidado de su Hijo unigénito<br>en medio de los muchos<br>peligros de este mundo.</p><p>Acudimos a vos<br>y te pedimos que<br>tomes bajo tu protección especial<br>a los niños que Dios nos ha dado.</p><p>A través del santo bautismo<br>se convirtieron en hijos de Dios<br>y en miembros de su Santa Iglesia.</p><p>Los consagramos hoy a vos,<br>para que a través de esta consagración<br>puedan convertirse en tus hijos de crianza.</p><p>Guardálos,<br>guiá sus pasos en la vida,<br>formá sus corazones<br>según los corazones<br>de Jesús y María.</p><p>San José,<br>que sentiste la tribulación<br>y la preocupación de un padre<br>cuando el niño Jesús se perdió,<br>protegé a nuestros queridos hijos<br>por el tiempo y la eternidad.</p><p>Que seas su padre y consejero.<br>Que ellos, como Jesús,<br>crezcan tanto en edad<br>como en sabiduría<br>y gracia ante Dios<br>y los hombres.</p><p>Preserválos de la corrupción del mundo<br>y danos la gracia<br>de estar unidos con ellos<br>en el cielo para siempre.</p>','1762832284430.jpg',NULL,NULL,1,'2025-11-11 15:43:36',1);
INSERT INTO `cont_2contenidos` VALUES (64,22,10,NULL,'1763516489622.jpg',NULL,'Virgen viajera de Loreto, o Pura y Limpia Concepción del Buen Viaje, tallada por los Padres Jesuitas',1,'2025-11-19 01:41:29',1);
INSERT INTO `cont_2contenidos` VALUES (65,22,4,'<blockquote>Te presentamos la imagen de Mama Antula de este antiguo templo dedicado a la Virgen del Buen Viaje, frente a la cual La Beata rezó de paso en su camino de Santiago a Buenos Aires.</blockquote>',NULL,NULL,NULL,1,'2025-11-19 01:30:49',1);
INSERT INTO `cont_2contenidos` VALUES (66,22,7,'<p>En su peregrinar a pie desde Santiago del Estero hasta Buenos Aires Mama Antula pasó por la posta Morón: bajando por el camino Real los que venían del norte hacia Buenos Aires paraban en la posta de Luján y en la posta de Morón, últimas paradas obligadas en aquellos tiempos coloniales de largos y polvorientos viajes en mula y carretas. Viaje que Mama Antula realizó caminando descalza.</p><p>Manuel Belgrano se detuvo también en este sitio histórico, en 1812, rumbo al encuentro con el Ejército del Norte. Y el papa Juan Pablo II también rezó por aquí en una de sus visitas a la Argentina.</p><p>Desde la época de la colonia hasta el día de hoy (gran parada de las actuales peregrinaciones a Luján que salen del Santuario de San Cayetano de Liniers) miles de caminantes se detienen un momento en la Catedral de Morón a pedirle a la Virgen un «Buen Viaje». Poco antes de arribar a Buenos Aires Mama Antula seguramente se postró a rezar ante Ella encomendándole su singular empresa.</p><p>Rumbo a Buenos Aires, luego de parar en la posta de Luján, Mama Antula paró en la capillita de la posta Morón, donde desde 1776 los Padres de la Compañía de Jesús habían instalado una imagen de la Virgen Viajera de Loreto o Virgen de la Pura y Limpia Concepción del Buen Viaje, tallada por ellos mismos. Tiempo más tarde la imagen de esta virgencita fue trasladada de esa capillita originaria a la actual Catedral de Morón (1885), ubicada a pocas cuadras de la capilla.</p>','1763516134577.jpg',NULL,NULL,1,'2025-11-19 01:35:34',1);
INSERT INTO `cont_2contenidos` VALUES (67,22,6,NULL,NULL,NULL,'Mama Antula abrazada al libro de los Ejercicios Espirituales de San Ignacio, con su estandarte, rostro enjuto y mirada aguda, en un retablo a la izquierda del altar mayor de la Catedral de Morón (en la pared este). En esta representación lleva también un morral, y está descalza, caminando',1,'2025-11-19 01:33:15',1);
/*!40000 ALTER TABLE `cont_2contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_3carrusel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_3carrusel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenido_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `imagen` varchar(17) NOT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `arrouselContenido` (`contenido_id`),
  CONSTRAINT `arrouselContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_3carrusel`
--

LOCK TABLES `cont_3carrusel` WRITE;
/*!40000 ALTER TABLE `cont_3carrusel` DISABLE KEYS */;
INSERT INTO `cont_3carrusel` VALUES (2,13,2,'1762630631369.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (3,13,3,'1762630631370.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (4,13,4,'1762630631371.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (5,13,5,'1762630631372.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (6,13,6,'1762630631373.jpg',1,'2025-11-08 19:37:11',1);
INSERT INTO `cont_3carrusel` VALUES (9,67,1,'1763515995301.jpg',1,'2025-11-19 01:33:15',1);
INSERT INTO `cont_3carrusel` VALUES (10,67,2,'1763515995302.jpg',1,'2025-11-19 01:33:15',1);
INSERT INTO `cont_3carrusel` VALUES (11,67,3,'1763515995303.jpg',1,'2025-11-19 01:33:15',1);
/*!40000 ALTER TABLE `cont_3carrusel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_ediciones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_ediciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenido_id` int(10) unsigned DEFAULT NULL,
  `orden` tinyint(1) unsigned DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `editadoPor_id` int(10) unsigned NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `encabezadoCarta` (`contenido_id`) USING BTREE,
  CONSTRAINT `edicionesContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_ediciones`
--

LOCK TABLES `cont_ediciones` WRITE;
/*!40000 ALTER TABLE `cont_ediciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cont_ediciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encab_1original`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encab_1original` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned DEFAULT NULL,
  `pestana_id` int(10) unsigned DEFAULT NULL,
  `numero` tinyint(3) unsigned DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `nombreDesde_id` tinyint(1) unsigned DEFAULT NULL,
  `nombreHacia_id` tinyint(1) unsigned DEFAULT NULL,
  `idioma_id` tinyint(1) unsigned DEFAULT NULL,
  `lugar_id` tinyint(1) unsigned DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `codigoLugar` varchar(25) DEFAULT NULL,
  `creadoPor_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`) USING BTREE,
  KEY `cartasEncabezado_usuario` (`creadoPor_id`) USING BTREE,
  KEY `encab_codigoLugar` (`codigoLugar`),
  CONSTRAINT `cartasEncabezado_lugar_copy` FOREIGN KEY (`lugar_id`) REFERENCES `aux_lugares` (`id`),
  CONSTRAINT `cartasEncabezado_statusRegistro_copy` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`),
  CONSTRAINT `cartasEncabezado_usuario_copy` FOREIGN KEY (`creadoPor_id`) REFERENCES `us_usuarios` (`id`),
  CONSTRAINT `encab_codigoLugar` FOREIGN KEY (`codigoLugar`) REFERENCES `nivel9_indices_lugar` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encab_1original`
--

LOCK TABLES `encab_1original` WRITE;
/*!40000 ALTER TABLE `encab_1original` DISABLE KEYS */;
INSERT INTO `encab_1original` VALUES (1,5,NULL,NULL,'Santa Mama Antula: primera fiesta litúrgica','Primera celebración del 7 de marzo en Buenos Aires después de la canonización de la primera santa argentina.',NULL,NULL,NULL,3,'2024-03-07',NULL,1,'2025-10-28 22:42:00',1);
INSERT INTO `encab_1original` VALUES (2,5,NULL,NULL,'Conferencia de Aldo Marcos de Castro Paz','',NULL,NULL,NULL,4,'2024-03-08',NULL,1,'2025-10-28 22:50:33',1);
INSERT INTO `encab_1original` VALUES (3,5,NULL,NULL,'Actividades en el Subte','Nuevo nombre para la estación Independencia',NULL,NULL,NULL,2,'2024-03-07',NULL,1,'2025-11-03 16:20:34',1);
INSERT INTO `encab_1original` VALUES (4,7,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 11:26:01',1);
INSERT INTO `encab_1original` VALUES (5,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 02:28:29',1);
INSERT INTO `encab_1original` VALUES (6,5,NULL,NULL,'Primera fiesta litúrgica como santa','',NULL,NULL,NULL,3,'2024-03-07',NULL,1,'2025-11-03 17:21:55',1);
INSERT INTO `encab_1original` VALUES (7,6,NULL,NULL,'Misa en acción de gracias por la canonización de Mama Antula','',NULL,NULL,NULL,3,'2024-02-11',NULL,1,'2025-11-06 23:17:08',1);
INSERT INTO `encab_1original` VALUES (8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-17 16:55:50',1);
INSERT INTO `encab_1original` VALUES (9,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-30 15:51:05',1);
INSERT INTO `encab_1original` VALUES (10,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-10-31 19:10:17',1);
INSERT INTO `encab_1original` VALUES (11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-05 14:12:04',1);
INSERT INTO `encab_1original` VALUES (12,NULL,5,NULL,'Oración a Mama Antula',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:24:47',1);
INSERT INTO `encab_1original` VALUES (13,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 11:14:15',1);
INSERT INTO `encab_1original` VALUES (14,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:34',1);
INSERT INTO `encab_1original` VALUES (15,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:39',1);
INSERT INTO `encab_1original` VALUES (16,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:23:48',1);
INSERT INTO `encab_1original` VALUES (17,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 10:12:03',1);
INSERT INTO `encab_1original` VALUES (18,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 18:58:18',1);
INSERT INTO `encab_1original` VALUES (19,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:25:30',1);
INSERT INTO `encab_1original` VALUES (20,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-06 23:25:44',1);
INSERT INTO `encab_1original` VALUES (21,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-12 19:44:37',1);
INSERT INTO `encab_1original` VALUES (22,17,NULL,NULL,'Catedral de Morón','El luga',NULL,NULL,NULL,NULL,NULL,'2caba',1,'2025-11-06 23:26:07',1);
INSERT INTO `encab_1original` VALUES (23,6,NULL,NULL,'Proyección de la ceremonia de canonización en pantalla gigante','',NULL,NULL,NULL,2,'2024-02-11',NULL,1,'2025-11-08 21:03:45',1);
INSERT INTO `encab_1original` VALUES (24,6,NULL,NULL,'Misa en el Vaticano','',NULL,NULL,NULL,7,'2024-02-11',NULL,1,'2025-11-08 21:26:37',1);
INSERT INTO `encab_1original` VALUES (25,17,NULL,NULL,'Introducción',NULL,NULL,NULL,NULL,NULL,NULL,'1introduccion',1,'2025-11-11 02:46:42',1);
INSERT INTO `encab_1original` VALUES (26,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:08:54',1);
INSERT INTO `encab_1original` VALUES (27,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:13:33',1);
INSERT INTO `encab_1original` VALUES (28,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:36:21',1);
INSERT INTO `encab_1original` VALUES (29,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-11-11 03:13:33',1);
INSERT INTO `encab_1original` VALUES (30,10,NULL,1,NULL,NULL,1,2,2,1,'1778-01-06',NULL,1,'2025-10-17 16:56:11',1);
INSERT INTO `encab_1original` VALUES (31,10,NULL,2,NULL,NULL,1,2,1,2,'1780-08-07',NULL,1,'2025-10-17 16:56:11',1);
INSERT INTO `encab_1original` VALUES (32,10,NULL,3,NULL,NULL,1,2,1,2,'1780-10-09',NULL,1,'2025-11-10 18:04:13',1);
INSERT INTO `encab_1original` VALUES (33,10,NULL,0,'Introducción',NULL,NULL,NULL,NULL,NULL,'1730-01-01',NULL,1,'2025-11-10 16:02:13',1);
INSERT INTO `encab_1original` VALUES (34,4,NULL,NULL,'Beatificación de Mama Antula','',NULL,NULL,NULL,6,'2016-04-27',NULL,1,'2025-11-18 23:39:54',1);
/*!40000 ALTER TABLE `encab_1original` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encab_2edicion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encab_2edicion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encab_id` int(10) unsigned DEFAULT NULL,
  `sinIndice_id` int(10) unsigned DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `numero` tinyint(3) unsigned DEFAULT NULL,
  `nombreDesde_id` tinyint(1) unsigned DEFAULT NULL,
  `nombreHacia_id` tinyint(1) unsigned DEFAULT NULL,
  `idioma_id` tinyint(1) unsigned DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `lugar_id` tinyint(1) unsigned DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `editadoPor_id` int(10) unsigned NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_desdePersonaje` (`nombreDesde_id`) USING BTREE,
  KEY `cartasEncabezado_haciaPersonaje` (`nombreHacia_id`) USING BTREE,
  KEY `cartasEncabezado_idioma` (`idioma_id`) USING BTREE,
  KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  KEY `cartasEncabezado_usuario` (`editadoPor_id`) USING BTREE,
  KEY `edic_exper` (`encab_id`),
  KEY `edic_sinindice` (`sinIndice_id`),
  CONSTRAINT `edic_editadopor` FOREIGN KEY (`editadoPor_id`) REFERENCES `us_usuarios` (`id`),
  CONSTRAINT `edic_exper` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encab_2edicion`
--

LOCK TABLES `encab_2edicion` WRITE;
/*!40000 ALTER TABLE `encab_2edicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `encab_2edicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel1_secciones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel1_secciones` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `conIndice` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel1_secciones`
--

LOCK TABLES `nivel1_secciones` WRITE;
/*!40000 ALTER TABLE `nivel1_secciones` DISABLE KEYS */;
INSERT INTO `nivel1_secciones` VALUES (1,1,'Inicio','inicio','inicio',NULL);
INSERT INTO `nivel1_secciones` VALUES (2,2,'Experiencias','experiencias','experiencias',1);
INSERT INTO `nivel1_secciones` VALUES (3,3,'Cartas y Escritos','cartasEscritos','cartas-y-escritos',NULL);
INSERT INTO `nivel1_secciones` VALUES (4,4,'Libros y Videos','librosVideos','libros-y-videos',NULL);
INSERT INTO `nivel1_secciones` VALUES (5,5,'Devoción','devocion','devocion',NULL);
INSERT INTO `nivel1_secciones` VALUES (6,6,'Institucionales','institucionales','institucionales',NULL);
/*!40000 ALTER TABLE `nivel1_secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel2_temas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel2_temas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seccion_id` tinyint(1) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `inactivo` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `capturadoPor_id` int(10) unsigned DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel2_1` (`seccion_id`),
  KEY `temas_capturadoPor` (`capturadoPor_id`),
  CONSTRAINT `nivel2_1` FOREIGN KEY (`seccion_id`) REFERENCES `nivel1_secciones` (`id`),
  CONSTRAINT `temas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel2_temas`
--

LOCK TABLES `nivel2_temas` WRITE;
/*!40000 ALTER TABLE `nivel2_temas` DISABLE KEYS */;
INSERT INTO `nivel2_temas` VALUES (1,1,1,'Novedades','novedades','novedades',1,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (2,1,2,'Quién es Mama Antula','quienEsMamaAntula','quien-es-mama-antula',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (3,1,3,'Quiénes somos','quienesSomos','quienes-somos',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (4,2,3,'Antes de la canonización','antesCanon','antes-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (5,2,1,'Después de la canonización','despuesCanon','despues-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (6,2,2,'Crónicas de la canonización','cronicasCanon','cronicas-de-la-canonizacion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (7,2,5,'Cronología de su causa','cronologia','cronologia-de-su-causa',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (8,4,2,'Videos','videos','videos',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (9,3,4,'Testamento','testamento','testamento',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (10,3,2,'Cartas','cartas','cartas',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (11,3,3,'Frases destacadas','frasesDestacadas','frases-destacadas',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (12,3,5,'Oración fúnebre','oracionFunebre','oracion-funebre',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (13,4,1,'Libros','libros','libros',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (15,5,1,'Oraciones','oraciones','oraciones',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (17,5,3,'Lugares de devoción','lugaresDevocion','lugares-de-devocion',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (18,5,2,'Imágenes','imagenes','imagenes',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (19,6,1,'Santa Casa','santaCasa','santa-casa',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (20,6,2,'Iglesia de La Piedad','iglesiaLaPiedad','iglesia-de-la-piedad',0,NULL,NULL);
INSERT INTO `nivel2_temas` VALUES (21,6,3,'Santiago del Estero','santiagoEstero','santiago-del-estero',0,NULL,NULL);
/*!40000 ALTER TABLE `nivel2_temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel3_pestanas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel3_pestanas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subTitulo` mediumtext DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `capturadoPor_id` int(10) unsigned DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel3_2` (`tema_id`),
  KEY `pestanas_capturadoPor` (`capturadoPor_id`),
  CONSTRAINT `nivel3_2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`),
  CONSTRAINT `pestanas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel3_pestanas`
--

LOCK TABLES `nivel3_pestanas` WRITE;
/*!40000 ALTER TABLE `nivel3_pestanas` DISABLE KEYS */;
INSERT INTO `nivel3_pestanas` VALUES (1,15,2,'Oración a San José',NULL,'oracionSj','oracion-a-san-jose',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (2,19,1,'Retiros Ignacianos',NULL,'retiros','retiros-ignacianos',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (3,19,2,'Otras Actividades',NULL,'otrasActividades','otras-actividades',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (4,19,3,'Historia',NULL,'historia','historia',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (5,15,1,'Oración a Mama Antula',NULL,'oracionMa','oracion-a-mama-antula',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (6,15,3,'Estampas',NULL,'estampas','estampas',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (7,8,1,'Biográficos',NULL,'biograficos','biograficos',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (8,8,2,'Conferencias',NULL,'conferencias','conferencias',NULL,NULL);
INSERT INTO `nivel3_pestanas` VALUES (9,8,3,'Varios',NULL,'varios','varios',NULL,NULL);
/*!40000 ALTER TABLE `nivel3_pestanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel9_indices_fecha`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel9_indices_fecha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indice_tema` (`tema_id`),
  CONSTRAINT `indice_tema` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel9_indices_fecha`
--

LOCK TABLES `nivel9_indices_fecha` WRITE;
/*!40000 ALTER TABLE `nivel9_indices_fecha` DISABLE KEYS */;
INSERT INTO `nivel9_indices_fecha` VALUES (1,10,'1778',NULL,'1778-01-01','1778-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (2,10,'1780 - 1784',NULL,'1780-01-01','1784-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (3,10,'1785 - 1789',NULL,'1785-01-01','1789-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (4,10,'1790 - 1794',NULL,'1790-01-01','1794-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (5,10,'1795 - 1799',NULL,'1795-01-01','1799-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (6,10,'1800 - 1816',NULL,'1800-01-01','1816-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (7,5,'2024',NULL,'2024-02-12','2024-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (8,5,'2025',NULL,'2025-01-01','2025-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (9,6,'Dom 11/feb',NULL,'2024-02-11','2024-02-11');
INSERT INTO `nivel9_indices_fecha` VALUES (10,6,'Sáb 10/feb',NULL,'2024-02-10','2024-02-10');
INSERT INTO `nivel9_indices_fecha` VALUES (11,6,'Vie 9/feb',NULL,'2024-02-09','2024-02-09');
INSERT INTO `nivel9_indices_fecha` VALUES (12,6,'Jue 8/feb',NULL,'2024-02-08','2024-02-08');
INSERT INTO `nivel9_indices_fecha` VALUES (13,6,'Mié 7/feb',NULL,'2024-02-07','2024-02-07');
INSERT INTO `nivel9_indices_fecha` VALUES (14,6,'Mar 6/feb',NULL,'2024-02-06','2024-02-06');
INSERT INTO `nivel9_indices_fecha` VALUES (15,6,'Lun 5/feb',NULL,'2024-02-05','2024-02-05');
INSERT INTO `nivel9_indices_fecha` VALUES (16,6,'Dom 4/feb',NULL,'2024-02-04','2024-02-04');
INSERT INTO `nivel9_indices_fecha` VALUES (17,6,'Sáb 3/feb',NULL,'2024-02-03','2024-02-03');
INSERT INTO `nivel9_indices_fecha` VALUES (18,10,'Introducción','introduccion','1730-01-01','1730-01-01');
INSERT INTO `nivel9_indices_fecha` VALUES (19,4,'2016',NULL,'2016-01-01','2016-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (20,4,'2017 - 2023',NULL,'2017-01-01','2023-12-31');
INSERT INTO `nivel9_indices_fecha` VALUES (21,4,'2000 - 2015',NULL,'2000-01-01','2015-12-31');
/*!40000 ALTER TABLE `nivel9_indices_fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel9_indices_lugar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel9_indices_lugar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indices_codigoLugar` (`codigo`),
  KEY `indice_tema` (`tema_id`) USING BTREE,
  CONSTRAINT `indice_tema_copy` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel9_indices_lugar`
--

LOCK TABLES `nivel9_indices_lugar` WRITE;
/*!40000 ALTER TABLE `nivel9_indices_lugar` DISABLE KEYS */;
INSERT INTO `nivel9_indices_lugar` VALUES (1,17,'Introducción','1introduccion');
INSERT INTO `nivel9_indices_lugar` VALUES (2,17,'CABA','2caba');
INSERT INTO `nivel9_indices_lugar` VALUES (3,17,'GBA','3gba');
INSERT INTO `nivel9_indices_lugar` VALUES (4,17,'Prov. Buenos Aires','4buenosAires');
INSERT INTO `nivel9_indices_lugar` VALUES (5,17,'Prov. Córdoba','6cordoba');
INSERT INTO `nivel9_indices_lugar` VALUES (6,17,'Prov. Santa Fe','santaFe');
INSERT INTO `nivel9_indices_lugar` VALUES (7,17,'Prov. Santiago del Estero','5santiagoDelEstero');
INSERT INTO `nivel9_indices_lugar` VALUES (8,17,'Prov. Salta','salta');
INSERT INTO `nivel9_indices_lugar` VALUES (9,17,'Prov. Jujuy','jujuy');
/*!40000 ALTER TABLE `nivel9_indices_lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('yFCEmG4wOobxUpQfvNvm0c03MmX14CnR',1763646685,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-19T20:43:39.845Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":1,\"cliente_id\":\"U0000000001\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-10-16\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":5,\"orden\":5,\"nombre\":\"Completo\",\"codigo\":\"completo\",\"actualizac\":true,\"revision\":true,\"cambioRoles\":true}},\"usuario\":{\"id\":1,\"nombreCompleto\":\"Diego Iribarren\",\"email\":\"diegoiribarren2015@gmail.com\",\"apodo\":\"Diego\",\"cliente_id\":\"U0000000001\",\"contrasena\":\"$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO\",\"pais_id\":null,\"imagen\":\"1761491982343.jpg\",\"notificacs\":false,\"visitaCreadaEn\":\"2025-10-16T23:29:07.000Z\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"versionWeb\":\"1.00\",\"creadoEn\":\"2025-10-16T23:29:07.000Z\",\"fechaContrasena\":\"2025-10-16T23:29:07.000Z\",\"rol_id\":5,\"statusRegistro_id\":3,\"rol\":{\"id\":5,\"orden\":5,\"nombre\":\"Completo\",\"codigo\":\"completo\",\"actualizac\":true,\"revision\":true,\"cambioRoles\":true},\"statusRegistro\":{\"id\":3,\"orden\":3,\"nombre\":\"Con apodo\",\"codigo\":\"conApodo\"}}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `actualizac` tinyint(1) DEFAULT 0,
  `revision` tinyint(1) DEFAULT 0,
  `cambioRoles` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_roles`
--

LOCK TABLES `us_roles` WRITE;
/*!40000 ALTER TABLE `us_roles` DISABLE KEYS */;
INSERT INTO `us_roles` VALUES (1,1,'Sólo lectura','lectura',0,0,0);
INSERT INTO `us_roles` VALUES (2,2,'Actualización','actualizac',1,0,0);
INSERT INTO `us_roles` VALUES (3,3,'Revisión','revision',1,1,0);
INSERT INTO `us_roles` VALUES (4,4,'Cambio de roles','cambioRoles',1,0,1);
INSERT INTO `us_roles` VALUES (5,5,'Completo','completo',1,1,1);
/*!40000 ALTER TABLE `us_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_status_registros`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_status_registros` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_status_registros`
--

LOCK TABLES `us_status_registros` WRITE;
/*!40000 ALTER TABLE `us_status_registros` DISABLE KEYS */;
INSERT INTO `us_status_registros` VALUES (1,1,'Mail a validar','mailPendValidar');
INSERT INTO `us_status_registros` VALUES (2,2,'Mail validado','mailValidado');
INSERT INTO `us_status_registros` VALUES (3,3,'Con apodo','conApodo');
/*!40000 ALTER TABLE `us_status_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_usuarios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `apodo` varchar(30) DEFAULT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `pais_id` varchar(2) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `notificacs` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime DEFAULT NULL,
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) unsigned NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rol_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `visita_id` (`cliente_id`),
  KEY `rol_usuario_id` (`rol_id`) USING BTREE,
  KEY `status_registro_id` (`statusRegistro_id`) USING BTREE,
  KEY `us_usuarios_pais` (`pais_id`),
  CONSTRAINT `us_usuarios_pais` FOREIGN KEY (`pais_id`) REFERENCES `aux_paises` (`id`),
  CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rol_id`) REFERENCES `us_roles` (`id`),
  CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_usuarios`
--

LOCK TABLES `us_usuarios` WRITE;
/*!40000 ALTER TABLE `us_usuarios` DISABLE KEYS */;
INSERT INTO `us_usuarios` VALUES (1,'Diego Iribarren','diegoiribarren2015@gmail.com','Diego','U0000000001','$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO',NULL,'1761491982343.jpg',0,'2025-10-16 23:29:07','2025-10-21',1,'1.00','2025-10-16 23:29:07','2025-10-16 23:29:07',5,3);
/*!40000 ALTER TABLE `us_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_visitas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_visitas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` varchar(11) DEFAULT NULL,
  `visitaCreadaEn` datetime DEFAULT utc_timestamp(),
  `fechaUltNaveg` date DEFAULT utc_date(),
  `diasNaveg` smallint(5) unsigned DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `rol_id` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cliente_id` (`cliente_id`),
  KEY `rolUsuario_id` (`rol_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_visitas`
--

LOCK TABLES `us_visitas` WRITE;
/*!40000 ALTER TABLE `us_visitas` DISABLE KEYS */;
INSERT INTO `us_visitas` VALUES (1,'V0000000001','2025-10-21 13:39:18','2025-10-21',0,'1.00',1);
INSERT INTO `us_visitas` VALUES (2,'V0000000002','2025-11-04 14:23:48','2025-11-04',0,'1.00',1);
INSERT INTO `us_visitas` VALUES (3,'V0000000003','2025-11-14 14:33:31','2025-11-14',1,'1.00',1);
/*!40000 ALTER TABLE `us_visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ma_bd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 11:15:51
