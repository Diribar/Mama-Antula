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
-- Table structure for table `aux_iconos_agrups`
--
DROP DATABASE IF EXISTS `ma_bd`;
CREATE DATABASE `ma_bd`;
USE `ma_bd`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_iconos_agrups` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `clase` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `edicion` tinyint(1) NOT NULL DEFAULT 0,
  `revision` tinyint(1) NOT NULL DEFAULT 0,
  `abmUs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_iconos_agrups`
--

LOCK TABLES `aux_iconos_agrups` WRITE;
/*!40000 ALTER TABLE `aux_iconos_agrups` DISABLE KEYS */;
INSERT INTO `aux_iconos_agrups` VALUES (1,1,'Facebook','fa-facebook','https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561','footerRedes',0,0,0);
INSERT INTO `aux_iconos_agrups` VALUES (2,2,'Instagram','fa-instagram','https://www.instagram.com/beatificacionantula/','footerRedes',0,0,0);
INSERT INTO `aux_iconos_agrups` VALUES (3,3,'Twitter','fa-twitter','https://twitter.com/beatificaciona1','footerRedes',0,0,0);
INSERT INTO `aux_iconos_agrups` VALUES (4,4,'TikTok','fa-tiktok','https://www.tiktok.com/@mamaantula.com','footerRedes',0,0,0);
INSERT INTO `aux_iconos_agrups` VALUES (5,1,'ABM de contenido','fa-square-plus','/contenido/abm','footerOtros',1,0,0);
INSERT INTO `aux_iconos_agrups` VALUES (6,2,'Revisión de ABMs','fa-glasses','/contenido/revision-de-abm','footerOtros',0,1,0);
INSERT INTO `aux_iconos_agrups` VALUES (7,3,'Cambio de roles','fa-user-graduate','/usuarios/cambio-de-roles','footerOtros',0,0,1);
INSERT INTO `aux_iconos_agrups` VALUES (8,4,'Estadísticas','fa-chart-simple','/estadisticas','footerOtros',1,0,0);
/*!40000 ALTER TABLE `aux_iconos_agrups` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_novs_del_sitio`
--

LOCK TABLES `aux_novs_del_sitio` WRITE;
/*!40000 ALTER TABLE `aux_novs_del_sitio` DISABLE KEYS */;
INSERT INTO `aux_novs_del_sitio` VALUES (1,'Subida a internet del primer borrador','2025-10-21','1.00');
/*!40000 ALTER TABLE `aux_novs_del_sitio` ENABLE KEYS */;
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
-- Table structure for table `cartas_lugares`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_lugares` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(1) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_lugares`
--

LOCK TABLES `cartas_lugares` WRITE;
/*!40000 ALTER TABLE `cartas_lugares` DISABLE KEYS */;
INSERT INTO `cartas_lugares` VALUES (1,1,'Córdoba');
INSERT INTO `cartas_lugares` VALUES (2,2,'Buenos Aires');
/*!40000 ALTER TABLE `cartas_lugares` ENABLE KEYS */;
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
-- Table structure for table `cont_1encab_articulos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_1encab_articulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema_id` int(10) unsigned DEFAULT NULL,
  `pestana_id` int(10) unsigned DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subtitulo` varchar(100) DEFAULT NULL,
  `donde` varchar(30) DEFAULT NULL,
  `fechaOcurrio` date DEFAULT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`) USING BTREE,
  KEY `encabezadoSeccionNivel2` (`tema_id`),
  KEY `encabezadoSeccionNivel3` (`pestana_id`),
  CONSTRAINT `encabezadoSeccionNivel2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`),
  CONSTRAINT `encabezadoSeccionNivel3` FOREIGN KEY (`pestana_id`) REFERENCES `nivel3_pestanas` (`id`),
  CONSTRAINT `encabezadoStatusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_1encab_articulos`
--

LOCK TABLES `cont_1encab_articulos` WRITE;
/*!40000 ALTER TABLE `cont_1encab_articulos` DISABLE KEYS */;
INSERT INTO `cont_1encab_articulos` VALUES (1,2,NULL,NULL,NULL,NULL,NULL,1,'2025-10-17 16:55:50',1);
INSERT INTO `cont_1encab_articulos` VALUES (2,NULL,1,'Proyección de la ceremonia de canonización en pantalla gigante y misa en acción de gracias',NULL,'Basílica de La Piedad','2024-02-11',1,'2025-10-17 16:55:50',1);
/*!40000 ALTER TABLE `cont_1encab_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_1encab_cartas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_1encab_cartas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreDesde_id` tinyint(1) unsigned NOT NULL,
  `nombreHacia_id` tinyint(1) unsigned NOT NULL,
  `lugar_id` tinyint(1) unsigned NOT NULL,
  `idioma_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `usuario_id` int(10) unsigned NOT NULL,
  `fechaEscrita` date NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`),
  KEY `cartasEncabezado_idioma` (`idioma_id`),
  KEY `cartasEncabezado_usuario` (`usuario_id`),
  KEY `cartasEncabezado_desdePersonaje` (`nombreDesde_id`),
  KEY `cartasEncabezado_haciaPersonaje` (`nombreHacia_id`),
  KEY `cartasEncabezado_lugar` (`lugar_id`),
  CONSTRAINT `cartasEncabezado_desdePersonaje` FOREIGN KEY (`nombreDesde_id`) REFERENCES `cartas_personajes` (`id`),
  CONSTRAINT `cartasEncabezado_haciaPersonaje` FOREIGN KEY (`nombreHacia_id`) REFERENCES `cartas_personajes` (`id`),
  CONSTRAINT `cartasEncabezado_idioma` FOREIGN KEY (`idioma_id`) REFERENCES `cartas_idiomas` (`id`),
  CONSTRAINT `cartasEncabezado_lugar` FOREIGN KEY (`lugar_id`) REFERENCES `cartas_lugares` (`id`),
  CONSTRAINT `cartasEncabezado_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`),
  CONSTRAINT `cartasEncabezado_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `us_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_1encab_cartas`
--

LOCK TABLES `cont_1encab_cartas` WRITE;
/*!40000 ALTER TABLE `cont_1encab_cartas` DISABLE KEYS */;
INSERT INTO `cont_1encab_cartas` VALUES (1,1,2,1,2,1,'1778-01-06','2025-10-17 16:56:11',1);
INSERT INTO `cont_1encab_cartas` VALUES (2,1,2,2,1,1,'1780-08-07','2025-10-17 16:56:11',1);
/*!40000 ALTER TABLE `cont_1encab_cartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_2contenidos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_2contenidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encabArtic_id` int(10) unsigned DEFAULT NULL,
  `encabCarta_id` int(10) unsigned DEFAULT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `link` mediumtext DEFAULT NULL,
  `resaltado` tinyint(1) DEFAULT NULL,
  `dots` tinyint(1) DEFAULT NULL,
  `textoImagenVideo` mediumtext DEFAULT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `encabezadoArticulo` (`encabArtic_id`),
  KEY `encabezadoCarta` (`encabCarta_id`),
  CONSTRAINT `encabezadoArticulo` FOREIGN KEY (`encabArtic_id`) REFERENCES `cont_1encab_articulos` (`id`),
  CONSTRAINT `encabezadoCarta` FOREIGN KEY (`encabCarta_id`) REFERENCES `cont_1encab_cartas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_2contenidos`
--

LOCK TABLES `cont_2contenidos` WRITE;
/*!40000 ALTER TABLE `cont_2contenidos` DISABLE KEYS */;
INSERT INTO `cont_2contenidos` VALUES (1,1,NULL,1,0,'María Antonia de Paz y Figueroa nació en Santiago del Estero en 1730. A los 15 años empezó a acompañar a los Jesuitas como Beata de la Compañía de Jesús en la tarea de evangelización de los pueblos originarios santiagueños, enseñándoles la Palabra de Dios, a leer y a escribir, y a perfeccionar técnicas de ganadería y agricultura. Mama Antula hablaba quichua. Y fueron los indígenas quienes la bautizaron Mama Antula. Cuando los jesuitas fueron expulsados de América en 1767, en una experiencia de epifanía en la celda capilla de San Francisco Solano y a la edad de 38 años, Mama Antula recibió la misión de su vida: continuar con la práctica de los Ejercicios Espirituales que realizaban los jesuitas, para la salvación de las almas.\r\nFue entonces cuando empezó su misión en salida y eligió su nombre de Iglesia: María Antonia de San José.','1760660122981.jpg','',NULL,NULL,'Peregrinaje que realizó santa Mama Antula','2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (2,1,NULL,1,0,'Por entonces las mujeres estaban confinadas a casarse o elegir los votos religiosos, no leían ni escribían y mucho menos salían al mundo sin la compañía de un hombre y libradas a la providencia divina. Mama Antula desafió las convenciones de su tiempo y peregrinó por todo el actual territorio del NOA argentino -por entonces formábamos parte del virreinato del Perú-, organizando los Ejercicios Espirituales a pesar de estar prohibidos por el Rey Carlos III, pero consiguiendo que los Obispos locales autorizaran su tarea. Llegó a Buenos Aires caminando más de 5 mil kilómetros, donde realizó su obra cúlmine -en los inicios del virreinato del Río de la Plata-: La construcción de la Santa Casa, un lugar levantado enteramente con donaciones, y donde exclusivamente se realizan los Ejercicios Espirituales de San Ignacio de Loyola. Fue inaugurada en 1795 y allí murió Mama Antula en 1799, y desde entonces sigue funciones hasta el día de hoy. Allí ricos y pobres compartían mesa y rezaban juntos, y se estima que 70 mil personas realizaron los Ejercicios Espirituales allí, compartiendo el pan y aprendiendo los valores que precedieron y formaron la gesta de mayo y a la creación del Estado Argentino.\r\nLa primera santa de la argentina es laica, valiente, considerada la primera escritora del Río de la Plata. Una mujer fuerte que nos enseña la santidad cotidiana y a confiar en la providencia con una fe inquebrantable. Es la patrona de las empresarias argentinas, y a ella se le reza pidiéndole perseverancia en las dificultades y la aceptación de la voluntad de Dios. Su fiesta litúrgica es el 7 de marzo.\r\n Para leer sus famosas cartas, haz click en la imagen.','1760660122983.jpg','/cartas-y-escritos/#cartas',NULL,NULL,NULL,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (4,2,NULL,1,0,'Llegó el día tan esperado: después de más de 200 años el nombre de María Antonia de San José fue inscripto en el Libro de los Santos. Las celebraciones en Buenos Aires, Santiago del Estero, Salta y localidades del gran Buenos Aires comenzaron con vigilias nocturnas. En Buenos Aires, a las 5 de la mañana, se reunieron en el Colegio de La Piedad más de 100 personas que compartieron en pantalla gigante la transmisión en directo de la Canonización en la capilla Papal de la Basílica de San Pedro en el Vaticano.','1760660122982.jpg',NULL,NULL,NULL,'Mons. Mollaghan, Mons. Carrara, Mons. Baliña y el P. Raúl Canali, en la procesión con las reliquias de Mama Antula en la Misa de acción de gracias en Buenos Aires','2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (5,NULL,1,1,0,'Por la inmediata traducción de las cartas de Mama Antula a diferentes idiomas apenas recibidas en Europa, muchas de ellas han sobrevivido solo en sus versiones en lenguas extranjeras. Tal es el caso de esta en francés escrita por Mama Antula desde Córdoba -donde está dando los Ejercicios Espirituales en tandas de 200 a 300 personas-, antes de iniciar su tarea evangelizadora en Buenos Aires. Comenta su esperanza profética de que la Compañía de Jesús será restituida; que cada 19 de mes hace dar una Misa en honor a San José y sus peripecias atravesando desiertos y al cruzar ríos caminando descalza durante cientos de kilómetros por la zona hoy denominada Noroeste Argentino.',NULL,NULL,NULL,NULL,NULL,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (6,NULL,1,1,0,'J’ai toujours été dans cette opinion et j’y suis encore, que la Compagnie de Jésus sera un jour rétablie; et pour obtenir cette grâce plus eff i cacement du Seigneur, si désirée de nous tous, je fais célébrer solennellement une Messe tous les 19 des mois en l ’ honneur de St. Joseph et je n ’ ai pas manqué partout où je me suis trouvée d epuis le départ de la Compagnie de ces contrées, comme les Exercices de St. Ignace n ’ ont point été interrompus depuis ce temps dans notre Patrie, à l ’ exception de trois années que j ’ ai été absente occupée à les établir dans la Province. Mon Evêque, N. S. Jean Emmanuel de Moscoso que je trouvai à Jujuy, m ’ accorda avec bonté tout ce qui pouvait faciliter les Exercices Spirituels; jusqu ’ à me permettre une chapelle privée perso n nelle et de faire faire les Exercices dans quelque lieux ce fut commode pour cela da ns tout son Diocèse: autant qu ’ on a pu, on les a donnés dans les Maisons qu ’ avaient les Jésuites. Dans cette ville de Corduba on les a donné pendant quatorze semaines et à chaque semaine il y avait plus de 200 personnes et quelqu e fois 300, sans que grâces à Dieu il y eut jamais de confusion ni qu ’ on eût rien souffert ou pour les habitations, ou pour les vivres, quoique toutes les dépenses n ’ ayant d ’ autre fond que les a u mônes. La Providence y a si bien pourvu que dans le même temps on pouvait aider encore le s pauvres et les prisonniers. Les fruits retirés de ces Saints Exercices ont été si constants qu ’ on y voit visiblement la main de Dieu, et le concours si grand que sans y appeler personne, on se trouvait dans le cas de ne pouvoir pas accepter tout le monde , et de les remettre à une autre fois. Au milieu de la grande consolation que j ’ éprouve à la vue du grand bien qui se fait aux âmes, je ne puis vous cacher les peines que je souffre.\r\n\r\nLa plus grande est que où la moisson est si abondante, les ouvriers sont si rares; encore si le petit nombre qu’on a voulait se donner tout de bon à la besogne. Que sert de semer beaucoup, si on a personne pour cultiver le terrain, et faire la moisson. C’est de là que vient la diminution des Sacrements; jusqu’au point que plusieurs ne peuvent satisfaire au devoir pascal. Les paroisses sont vastes, sans grand nombre de chrétiens et presque toutes se trouvent dispersées ça et là et loin de leur curé de 10 à 20 lieues.\r\nL’aide qu’avaient les curés, était qu’avant Pâques les Missionnaires Jésuites parcouraient ces paroisses, instruisant, prêchant et confessant, ainsi la besogne du curé à Pâques, lui pesait moins.\r\nOn parle là des Missions du Paraguay conduites autrefois par les Jésuites qui avant leur destruction étaient au nombre de 55, composées de plusieurs nations Indiennes, dont plusieurs étaient Catéchumènes. Les plus nombreuses étaient celles des Granirs et des Chichites, on y comptait environ 125 mille âmes.\r\nJe fus établie Régulatrice des Exercices Spirituels, et pour que le fruit en soit plus grand, elles sont sous la protection de Notre Dame des Douleurs et des Saints de la Compagnie dont je fais célébrer lés Fêtes avec solennité.\r\nPlusieurs personnes me sollicitent très fort de me transporter à Buenos: Je ne saurais me résoudre à rien jusqu’à ce que je voie clairement que c’est la volonté de Dieu. Et pour vous dire le tout en confiance, je ne fais pas un pas sans que le Seigneur me le commande et me conduise sensiblement comme par la main.\r\nComment cela arrive-t-il? Misérable que je suis. Je ne le sais pas. Cependant la chose est ainsi. De plus, si vous voulez que je vous instruise des soins tout amoureux de la Providence sur moi quelque indigne que j’en suis, sachez que dans mes pénibles voyages, dans des Pays si mauvais, dans les déserts, obligée de passer des fleuves, des torrents, j’ai toujours marché pieds nus, sans qu’il me soit rien arrivée de fâcheux: au contraire quelquefois que je me suis trouvée assez mal comme cela est arrivé à Catamarca où je fus désespérée des médecins, en me recommandant à la Sainte Vierge, sans autre remède je me levai du lit et continuai mon voyage jusqu’à Rioja. Une autre fois que je me rompis une côte par une chute, une autre que je m’étais donnée une entorse au pied, je me sentis par un tact invisible, guérie.\r\nSalués tous nos chers frères et en particulier mon ancien Confesseur. Que tous m’aident de leurs prières sans quoi je ne puis rien. Votre Soeur Marie Antoinette de St. Joseph.','1760660122984.jpg',NULL,NULL,NULL,NULL,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (7,NULL,1,1,0,'Cf. Blanco II: AL (en francés); G 16; P 184-186 (en francés): C. P., 273-275. Una versión existe también en ASR 62-66 (en italiano). No se conoce el original en castellano. Corduba, dans le Tucuman, le 6 janvier 1778.',NULL,NULL,NULL,NULL,NULL,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (8,NULL,2,1,0,'En 1780 Buenos Aires formaba parte del Virreinato del Perú. En esta carta Mama Antula comenta que el Obispo de Cuzco -Juan Manuel Moscoso- la ha autorizado a abrir oratorios en casas en la provincia de Córdoba del Tucumán. En esta época recién se inicia su tarea evangelizadora en Buenos Aires, para la que solicita colaboraciones y donde dice haber dado 4 tandas de Ejercicios Espirituales, mientras que en Tucumán ya ha ofrecido 60 retiros a la fecha de esta carta','1760660122985.jpg','https://scielo.conicyt.cl/scielo.php?script=sci_arttext&pid=S0717-71942018000200517',NULL,NULL,'En tiempos de Mama Antula disponer de un altar portátil permitía transportarlos fácilmente para celebrar Misa en diferentes lugares y facilitar la evangelización. Foto: Altar portátil (comienzos siglo xx) Museo de Arte Religioso Juan de Tejeda (Córdoba, Argentina). Fuente: https://scielo.conicyt.cl (click en la imagen)','2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (9,NULL,2,1,0,'La gracia del Espíritu Santo ilumine su alma eternamente, mi carísimo Don Gaspar en Jesucristo. He quedado muy reconocida a los singulares favores y privilegios que Vuestra Merced me ha alcanzado de Su Santidad y en las gracias que me confieren, trascendentales a toda mi descendencia, y en las que se me franquean concediéndome altar portátil para la protección de mis peregrinaciones. El Señor se sirva remunerarle en la vida futura estos beneficios; cuya posesión excitara cada día la frecuencia de mis recomendaciones al Altísimo, porque le de feliz despacho a todas las pretensiones que le convengan. A más de esto, procuraré interesar en el mismo logro de sus deseos a muchos y a todos, si fuese posible, de los que participan de tan utilísima concesión, y cuando tanta abundancia de deprecaciones no se obtenga, la Divina Providencia suplirá nuestros defectos en su obsequio, por habernos proveído por sus propios esfuerzos de tantos tesoros que redundarán en honra y gloria de Su Divina Majestad.',NULL,NULL,NULL,NULL,NULL,'2025-10-17 16:56:26',1);
INSERT INTO `cont_2contenidos` VALUES (10,NULL,2,1,0,'Cf. Blanco III: ASR 1-5 (en castellano); G 17; B 25-28. Otras versiones: Blanco V: ASR 7-11 (en italiano); G 17 / Más breves: Blanco IV: ASR 66- 69 (Lettera 2a al medesimo soggetto); G 16; P 187 (en francés); Blanco VI: P 187-190 (en francés): C. P., 376-379. Cf. también variantes: Blanco IX (fechada el 16/10/1780): ACSBA (original); G 18; Blanco XI: ACSBA (original); G 32. Pax Christi',NULL,NULL,NULL,NULL,NULL,'2025-10-17 16:56:26',1);
/*!40000 ALTER TABLE `cont_2contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cont_3carrousel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont_3carrousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenido_id` int(10) unsigned NOT NULL,
  `orden` tinyint(1) unsigned NOT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `usuario_id` int(10) unsigned NOT NULL,
  `statusRegistro_id` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arrouselContenido` (`contenido_id`),
  CONSTRAINT `arrouselContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont_3carrousel`
--

LOCK TABLES `cont_3carrousel` WRITE;
/*!40000 ALTER TABLE `cont_3carrousel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cont_3carrousel` ENABLE KEYS */;
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
  `link` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel1_secciones`
--

LOCK TABLES `nivel1_secciones` WRITE;
/*!40000 ALTER TABLE `nivel1_secciones` DISABLE KEYS */;
INSERT INTO `nivel1_secciones` VALUES (1,1,'Inicio','inicio','/');
INSERT INTO `nivel1_secciones` VALUES (2,2,'Experiencias','experiencias','/experiencias');
INSERT INTO `nivel1_secciones` VALUES (3,3,'Cartas y Escritos','cartasEscritos','/cartas-y-escritos');
INSERT INTO `nivel1_secciones` VALUES (4,4,'Libros','libros','/libros');
INSERT INTO `nivel1_secciones` VALUES (5,5,'Devoción','devocion','/devocion');
INSERT INTO `nivel1_secciones` VALUES (6,6,'Institucionales','institucionales','/institucionales');
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
  `ordenPorFecha` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel2_1` (`seccion_id`),
  CONSTRAINT `nivel2_1` FOREIGN KEY (`seccion_id`) REFERENCES `nivel1_secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel2_temas`
--

LOCK TABLES `nivel2_temas` WRITE;
/*!40000 ALTER TABLE `nivel2_temas` DISABLE KEYS */;
INSERT INTO `nivel2_temas` VALUES (1,1,1,'Próximos eventos','proximosEventos',1);
INSERT INTO `nivel2_temas` VALUES (2,1,2,'Quién es Mama Antula','quienEsMamaAntula',0);
INSERT INTO `nivel2_temas` VALUES (3,1,3,'Quiénes somos','quienesSomos',0);
INSERT INTO `nivel2_temas` VALUES (5,2,1,'Después de la canonización','despuesCanon',1);
INSERT INTO `nivel2_temas` VALUES (6,2,2,'Crónicas de la canonización','cronicasCanon',0);
INSERT INTO `nivel2_temas` VALUES (7,2,3,'Antes de la canonización','antesCanon',1);
INSERT INTO `nivel2_temas` VALUES (8,3,1,'Introducción','introduccion',0);
INSERT INTO `nivel2_temas` VALUES (9,3,2,'Testamento','testamento',0);
INSERT INTO `nivel2_temas` VALUES (10,3,3,'Cartas','cartas',1);
INSERT INTO `nivel2_temas` VALUES (11,3,4,'Frases famosas','frasesFamosas',0);
INSERT INTO `nivel2_temas` VALUES (12,3,5,'Oración fúnebre','oracionFunebre',0);
INSERT INTO `nivel2_temas` VALUES (13,4,1,'En librerías','librerias',1);
INSERT INTO `nivel2_temas` VALUES (14,4,2,'Descarga libre','descargas',1);
INSERT INTO `nivel2_temas` VALUES (15,5,1,'Oraciones','oraciones',0);
INSERT INTO `nivel2_temas` VALUES (16,5,2,'Iconografía','iconos',1);
INSERT INTO `nivel2_temas` VALUES (17,5,3,'Lugares de devoción','lugaresDevocion',0);
INSERT INTO `nivel2_temas` VALUES (18,5,4,'Imágenes','imagenes',0);
INSERT INTO `nivel2_temas` VALUES (19,6,1,'Santa Casa','santaCasa',0);
INSERT INTO `nivel2_temas` VALUES (20,6,2,'Iglesia de La piedad','iglesiaLaPiedad',0);
INSERT INTO `nivel2_temas` VALUES (21,6,3,'Santiago del Estero','santiagoEstero',0);
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
  `subtitulo` mediumtext DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `ordenPorFecha` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `nivel3_2` (`tema_id`),
  CONSTRAINT `nivel3_2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel3_pestanas`
--

LOCK TABLES `nivel3_pestanas` WRITE;
/*!40000 ALTER TABLE `nivel3_pestanas` DISABLE KEYS */;
INSERT INTO `nivel3_pestanas` VALUES (1,6,1,'Experiencias','Vigilias, actos, Misas, conferencias, visitas guiadas y reseñas de la vida de Mama Antula durante las celebraciones por su santificación','expersCanon',1);
INSERT INTO `nivel3_pestanas` VALUES (2,6,2,'Vigilia',NULL,'vigiliaCanon',0);
INSERT INTO `nivel3_pestanas` VALUES (3,7,1,'Cronología',NULL,'cronologiaCanon',0);
INSERT INTO `nivel3_pestanas` VALUES (4,7,2,'Experiencias',NULL,'expersAntesCanon',1);
INSERT INTO `nivel3_pestanas` VALUES (5,15,1,'Oración a Mama Antula',NULL,'oracionMa',0);
INSERT INTO `nivel3_pestanas` VALUES (6,15,2,'Estampas',NULL,'estampas',0);
INSERT INTO `nivel3_pestanas` VALUES (7,15,3,'Videos',NULL,'videos',0);
INSERT INTO `nivel3_pestanas` VALUES (8,19,1,'Retiros Ignacianos',NULL,'retiros',0);
INSERT INTO `nivel3_pestanas` VALUES (9,19,2,'Otras Actividades',NULL,'otrasActividades',0);
INSERT INTO `nivel3_pestanas` VALUES (11,19,3,'Historia',NULL,'historia',0);
/*!40000 ALTER TABLE `nivel3_pestanas` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('YuCTH26je9k8zhgAirzJTCv1CL_ZAyq-',1761140521,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-22T13:42:00.783Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":1,\"cliente_id\":\"V0000000001\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-21\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}');
INSERT INTO `sessions` VALUES ('k4OIsM9R_HeUNgDfIjricZEyf6nvlyHd',1761144847,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-22T14:54:07.053Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":1,\"cliente_id\":\"U0000000001\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-10-16\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":2,\"orden\":2,\"nombre\":\"Edición\",\"codigo\":\"edicion\",\"edicion\":true,\"revision\":false,\"abmUs\":false}},\"usuario\":{\"id\":1,\"nombre\":\"Diego Iribarren\",\"email\":\"diegoiribarren2015@gmail.com\",\"genero_id\":\"M\",\"apodo\":\"Diego\",\"cliente_id\":\"U0000000001\",\"contrasena\":\"$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO\",\"avatar\":null,\"newsletter\":true,\"visitaCreadaEn\":\"2025-10-16T23:29:07.000Z\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"versionWeb\":\"1.00\",\"creadoEn\":\"2025-10-16T23:29:07.000Z\",\"fechaContrasena\":\"2025-10-16T23:29:07.000Z\",\"rolUsuario_id\":2,\"statusRegistro_id\":2,\"rol\":{\"id\":2,\"orden\":2,\"nombre\":\"Edición\",\"codigo\":\"edicion\",\"edicion\":true,\"revision\":false,\"abmUs\":false},\"statusRegistro\":{\"id\":2,\"orden\":2,\"nombre\":\"Mail validado\",\"codigo\":\"mailValidado\"},\"genero\":{\"id\":\"M\",\"orden\":1,\"nombre\":\"Masculino\",\"letraFinal\":\"o\"}}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_generos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_generos` (
  `id` varchar(3) NOT NULL,
  `orden` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `letraFinal` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_generos`
--

LOCK TABLES `us_generos` WRITE;
/*!40000 ALTER TABLE `us_generos` DISABLE KEYS */;
INSERT INTO `us_generos` VALUES ('F',2,'Femenino','a');
INSERT INTO `us_generos` VALUES ('M',1,'Masculino','o');
/*!40000 ALTER TABLE `us_generos` ENABLE KEYS */;
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
  `edicion` tinyint(1) DEFAULT 0,
  `revision` tinyint(1) DEFAULT 0,
  `abmUs` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_roles`
--

LOCK TABLES `us_roles` WRITE;
/*!40000 ALTER TABLE `us_roles` DISABLE KEYS */;
INSERT INTO `us_roles` VALUES (1,1,'Sólo lectura','lectura',0,0,0);
INSERT INTO `us_roles` VALUES (2,2,'Edición','edicion',1,0,0);
INSERT INTO `us_roles` VALUES (3,3,'Revisión','revision',1,1,0);
INSERT INTO `us_roles` VALUES (4,4,'Administrador','abmUs',1,0,1);
INSERT INTO `us_roles` VALUES (5,5,'Admin. y revisor','abmUsRevision',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_status_registros`
--

LOCK TABLES `us_status_registros` WRITE;
/*!40000 ALTER TABLE `us_status_registros` DISABLE KEYS */;
INSERT INTO `us_status_registros` VALUES (1,1,'Mail a validar','mailPendValidar');
INSERT INTO `us_status_registros` VALUES (2,2,'Mail validado','mailValidado');
/*!40000 ALTER TABLE `us_status_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_usuarios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `genero_id` varchar(1) NOT NULL,
  `apodo` varchar(30) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) unsigned NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rolUsuario_id` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `statusRegistro_id` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `visita_id` (`cliente_id`),
  KEY `rol_usuario_id` (`rolUsuario_id`) USING BTREE,
  KEY `sexo_id` (`genero_id`) USING BTREE,
  KEY `status_registro_id` (`statusRegistro_id`) USING BTREE,
  CONSTRAINT `us_usuarios_genero` FOREIGN KEY (`genero_id`) REFERENCES `us_generos` (`id`),
  CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rolUsuario_id`) REFERENCES `us_roles` (`id`),
  CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_usuarios`
--

LOCK TABLES `us_usuarios` WRITE;
/*!40000 ALTER TABLE `us_usuarios` DISABLE KEYS */;
INSERT INTO `us_usuarios` VALUES (1,'Diego Iribarren','diegoiribarren2015@gmail.com','M','Diego','U0000000001','$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO',NULL,1,'2025-10-16 23:29:07','2025-10-21',1,'1.00','2025-10-16 23:29:07','2025-10-16 23:29:07',2,2);
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
  `diasNaveg` smallint(5) unsigned DEFAULT 0,
  `versionWeb` varchar(4) DEFAULT NULL,
  `rolUsuario_id` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cliente_id` (`cliente_id`),
  KEY `rolUsuario_id` (`rolUsuario_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_visitas`
--

LOCK TABLES `us_visitas` WRITE;
/*!40000 ALTER TABLE `us_visitas` DISABLE KEYS */;
INSERT INTO `us_visitas` VALUES (1,'V0000000001','2025-10-21 13:39:18','2025-10-21',0,'1.00',1);
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

-- Dump completed on 2025-10-21 12:04:20
