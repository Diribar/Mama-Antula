-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2025 at 12:36 PM
-- Server version: 10.5.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ma_bd`
--

DROP DATABASE IF EXISTS `ma_bd1`;
CREATE DATABASE IF NOT EXISTS `ma_bd1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ma_bd1`;

-- --------------------------------------------------------

--
-- Table structure for table `aux_iconos_agrups`
--

CREATE TABLE `aux_iconos_agrups` (
  `id` tinyint(2) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `clase` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `edicion` tinyint(1) NOT NULL DEFAULT 0,
  `revision` tinyint(1) NOT NULL DEFAULT 0,
  `abmUs` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_iconos_agrups`
--

INSERT INTO `aux_iconos_agrups` (`id`, `orden`, `nombre`, `clase`, `link`, `grupo`, `edicion`, `revision`, `abmUs`) VALUES
(1, 1, 'Facebook', 'fa-facebook', 'https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561', 'footerRedes', 0, 0, 0),
(2, 2, 'Instagram', 'fa-instagram', 'https://www.instagram.com/beatificacionantula/', 'footerRedes', 0, 0, 0),
(3, 3, 'Twitter', 'fa-twitter', 'https://twitter.com/beatificaciona1', 'footerRedes', 0, 0, 0),
(4, 4, 'TikTok', 'fa-tiktok', 'https://www.tiktok.com/@mamaantula.com', 'footerRedes', 0, 0, 0),
(5, 1, 'ABM de contenido', 'fa-square-plus', '/contenido/abm', 'footerOtros', 1, 0, 0),
(6, 2, 'Revisión de ABMs', 'fa-glasses', '/contenido/revision-de-abm', 'footerOtros', 0, 1, 0),
(7, 3, 'Cambio de roles', 'fa-user-graduate', '/usuarios/cambio-de-roles', 'footerOtros', 0, 0, 1),
(8, 4, 'Estadísticas', 'fa-chart-simple', '/estadisticas', 'footerOtros', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aux_novs_del_sitio`
--

CREATE TABLE `aux_novs_del_sitio` (
  `id` int(10) UNSIGNED NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT utc_date(),
  `version` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_novs_del_sitio`
--

INSERT INTO `aux_novs_del_sitio` (`id`, `comentario`, `fecha`, `version`) VALUES
(1, 'Subida a internet del primer borrador', '2025-10-21', '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `aux_status_registros`
--

CREATE TABLE `aux_status_registros` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_status_registros`
--

INSERT INTO `aux_status_registros` (`id`, `orden`, `nombre`, `codigo`) VALUES
(1, 1, 'Creado', 'creado'),
(3, 3, 'Aprobado', 'aprobado'),
(6, 6, 'Inactivo', 'inactivo');

-- --------------------------------------------------------

--
-- Table structure for table `cartas_idiomas`
--

CREATE TABLE `cartas_idiomas` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartas_idiomas`
--

INSERT INTO `cartas_idiomas` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'castellano'),
(2, 2, 'frances');

-- --------------------------------------------------------

--
-- Table structure for table `cartas_lugares`
--

CREATE TABLE `cartas_lugares` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartas_lugares`
--

INSERT INTO `cartas_lugares` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'Córdoba'),
(2, 2, 'Buenos Aires');

-- --------------------------------------------------------

--
-- Table structure for table `cartas_personajes`
--

CREATE TABLE `cartas_personajes` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartas_personajes`
--

INSERT INTO `cartas_personajes` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'Mama Antula'),
(2, 2, 'P. Gaspar Juárez'),
(3, 3, 'Ambrosio Funes');

-- --------------------------------------------------------

--
-- Table structure for table `cont_1encab_articulos`
--

CREATE TABLE `cont_1encab_articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_id` int(10) UNSIGNED DEFAULT NULL,
  `pestana_id` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subtitulo` varchar(100) DEFAULT NULL,
  `donde` varchar(30) DEFAULT NULL,
  `fechaOcurrio` date DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cont_1encab_articulos`
--

INSERT INTO `cont_1encab_articulos` (`id`, `tema_id`, `pestana_id`, `titulo`, `subtitulo`, `donde`, `fechaOcurrio`, `usuario_id`, `creadoEn`, `statusRegistro_id`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-17 16:55:50', 1),
(2, NULL, 1, 'Proyección de la ceremonia de canonización en pantalla gigante y misa en acción de gracias', NULL, 'Basílica de La Piedad', '2024-02-11', 1, '2025-10-17 16:55:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cont_1encab_cartas`
--

CREATE TABLE `cont_1encab_cartas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreDesde_id` tinyint(1) UNSIGNED NOT NULL,
  `nombreHacia_id` tinyint(1) UNSIGNED NOT NULL,
  `lugar_id` tinyint(1) UNSIGNED NOT NULL,
  `idioma_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `fechaEscrita` date NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cont_1encab_cartas`
--

INSERT INTO `cont_1encab_cartas` (`id`, `nombreDesde_id`, `nombreHacia_id`, `lugar_id`, `idioma_id`, `usuario_id`, `fechaEscrita`, `creadoEn`, `statusRegistro_id`) VALUES
(1, 1, 2, 1, 2, 1, '1778-01-06', '2025-10-17 16:56:11', 1),
(2, 1, 2, 2, 1, 1, '1780-08-07', '2025-10-17 16:56:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cont_2contenidos`
--

CREATE TABLE `cont_2contenidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `encabArtic_id` int(10) UNSIGNED DEFAULT NULL,
  `encabCarta_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `link` mediumtext DEFAULT NULL,
  `resaltado` tinyint(1) DEFAULT NULL,
  `dots` tinyint(1) DEFAULT NULL,
  `textoImagenVideo` mediumtext DEFAULT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cont_2contenidos`
--

INSERT INTO `cont_2contenidos` (`id`, `encabArtic_id`, `encabCarta_id`, `usuario_id`, `orden`, `texto`, `imagen`, `link`, `resaltado`, `dots`, `textoImagenVideo`, `creadoEn`, `statusRegistro_id`) VALUES
(1, 1, NULL, 1, 0, 'María Antonia de Paz y Figueroa nació en Santiago del Estero en 1730. A los 15 años empezó a acompañar a los Jesuitas como Beata de la Compañía de Jesús en la tarea de evangelización de los pueblos originarios santiagueños, enseñándoles la Palabra de Dios, a leer y a escribir, y a perfeccionar técnicas de ganadería y agricultura. Mama Antula hablaba quichua. Y fueron los indígenas quienes la bautizaron Mama Antula. Cuando los jesuitas fueron expulsados de América en 1767, en una experiencia de epifanía en la celda capilla de San Francisco Solano y a la edad de 38 años, Mama Antula recibió la misión de su vida: continuar con la práctica de los Ejercicios Espirituales que realizaban los jesuitas, para la salvación de las almas.\r\nFue entonces cuando empezó su misión en salida y eligió su nombre de Iglesia: María Antonia de San José.', '1760660122981.jpg', '', NULL, NULL, 'Peregrinaje que realizó santa Mama Antula', '2025-10-17 16:56:26', 1),
(2, 1, NULL, 1, 0, 'Por entonces las mujeres estaban confinadas a casarse o elegir los votos religiosos, no leían ni escribían y mucho menos salían al mundo sin la compañía de un hombre y libradas a la providencia divina. Mama Antula desafió las convenciones de su tiempo y peregrinó por todo el actual territorio del NOA argentino -por entonces formábamos parte del virreinato del Perú-, organizando los Ejercicios Espirituales a pesar de estar prohibidos por el Rey Carlos III, pero consiguiendo que los Obispos locales autorizaran su tarea. Llegó a Buenos Aires caminando más de 5 mil kilómetros, donde realizó su obra cúlmine -en los inicios del virreinato del Río de la Plata-: La construcción de la Santa Casa, un lugar levantado enteramente con donaciones, y donde exclusivamente se realizan los Ejercicios Espirituales de San Ignacio de Loyola. Fue inaugurada en 1795 y allí murió Mama Antula en 1799, y desde entonces sigue funciones hasta el día de hoy. Allí ricos y pobres compartían mesa y rezaban juntos, y se estima que 70 mil personas realizaron los Ejercicios Espirituales allí, compartiendo el pan y aprendiendo los valores que precedieron y formaron la gesta de mayo y a la creación del Estado Argentino.\r\nLa primera santa de la argentina es laica, valiente, considerada la primera escritora del Río de la Plata. Una mujer fuerte que nos enseña la santidad cotidiana y a confiar en la providencia con una fe inquebrantable. Es la patrona de las empresarias argentinas, y a ella se le reza pidiéndole perseverancia en las dificultades y la aceptación de la voluntad de Dios. Su fiesta litúrgica es el 7 de marzo.\r\n Para leer sus famosas cartas, haz click en la imagen.', '1760660122983.jpg', '/cartas-y-escritos/#cartas', NULL, NULL, NULL, '2025-10-17 16:56:26', 1),
(4, 2, NULL, 1, 0, 'Llegó el día tan esperado: después de más de 200 años el nombre de María Antonia de San José fue inscripto en el Libro de los Santos. Las celebraciones en Buenos Aires, Santiago del Estero, Salta y localidades del gran Buenos Aires comenzaron con vigilias nocturnas. En Buenos Aires, a las 5 de la mañana, se reunieron en el Colegio de La Piedad más de 100 personas que compartieron en pantalla gigante la transmisión en directo de la Canonización en la capilla Papal de la Basílica de San Pedro en el Vaticano.', '1760660122982.jpg', NULL, NULL, NULL, 'Mons. Mollaghan, Mons. Carrara, Mons. Baliña y el P. Raúl Canali, en la procesión con las reliquias de Mama Antula en la Misa de acción de gracias en Buenos Aires', '2025-10-17 16:56:26', 1),
(5, NULL, 1, 1, 0, 'Por la inmediata traducción de las cartas de Mama Antula a diferentes idiomas apenas recibidas en Europa, muchas de ellas han sobrevivido solo en sus versiones en lenguas extranjeras. Tal es el caso de esta en francés escrita por Mama Antula desde Córdoba -donde está dando los Ejercicios Espirituales en tandas de 200 a 300 personas-, antes de iniciar su tarea evangelizadora en Buenos Aires. Comenta su esperanza profética de que la Compañía de Jesús será restituida; que cada 19 de mes hace dar una Misa en honor a San José y sus peripecias atravesando desiertos y al cruzar ríos caminando descalza durante cientos de kilómetros por la zona hoy denominada Noroeste Argentino.', NULL, NULL, NULL, NULL, NULL, '2025-10-17 16:56:26', 1),
(6, NULL, 1, 1, 0, 'J’ai toujours été dans cette opinion et j’y suis encore, que la Compagnie de Jésus sera un jour rétablie; et pour obtenir cette grâce plus eff i cacement du Seigneur, si désirée de nous tous, je fais célébrer solennellement une Messe tous les 19 des mois en l ’ honneur de St. Joseph et je n ’ ai pas manqué partout où je me suis trouvée d epuis le départ de la Compagnie de ces contrées, comme les Exercices de St. Ignace n ’ ont point été interrompus depuis ce temps dans notre Patrie, à l ’ exception de trois années que j ’ ai été absente occupée à les établir dans la Province. Mon Evêque, N. S. Jean Emmanuel de Moscoso que je trouvai à Jujuy, m ’ accorda avec bonté tout ce qui pouvait faciliter les Exercices Spirituels; jusqu ’ à me permettre une chapelle privée perso n nelle et de faire faire les Exercices dans quelque lieux ce fut commode pour cela da ns tout son Diocèse: autant qu ’ on a pu, on les a donnés dans les Maisons qu ’ avaient les Jésuites. Dans cette ville de Corduba on les a donné pendant quatorze semaines et à chaque semaine il y avait plus de 200 personnes et quelqu e fois 300, sans que grâces à Dieu il y eut jamais de confusion ni qu ’ on eût rien souffert ou pour les habitations, ou pour les vivres, quoique toutes les dépenses n ’ ayant d ’ autre fond que les a u mônes. La Providence y a si bien pourvu que dans le même temps on pouvait aider encore le s pauvres et les prisonniers. Les fruits retirés de ces Saints Exercices ont été si constants qu ’ on y voit visiblement la main de Dieu, et le concours si grand que sans y appeler personne, on se trouvait dans le cas de ne pouvoir pas accepter tout le monde , et de les remettre à une autre fois. Au milieu de la grande consolation que j ’ éprouve à la vue du grand bien qui se fait aux âmes, je ne puis vous cacher les peines que je souffre.\r\n\r\nLa plus grande est que où la moisson est si abondante, les ouvriers sont si rares; encore si le petit nombre qu’on a voulait se donner tout de bon à la besogne. Que sert de semer beaucoup, si on a personne pour cultiver le terrain, et faire la moisson. C’est de là que vient la diminution des Sacrements; jusqu’au point que plusieurs ne peuvent satisfaire au devoir pascal. Les paroisses sont vastes, sans grand nombre de chrétiens et presque toutes se trouvent dispersées ça et là et loin de leur curé de 10 à 20 lieues.\r\nL’aide qu’avaient les curés, était qu’avant Pâques les Missionnaires Jésuites parcouraient ces paroisses, instruisant, prêchant et confessant, ainsi la besogne du curé à Pâques, lui pesait moins.\r\nOn parle là des Missions du Paraguay conduites autrefois par les Jésuites qui avant leur destruction étaient au nombre de 55, composées de plusieurs nations Indiennes, dont plusieurs étaient Catéchumènes. Les plus nombreuses étaient celles des Granirs et des Chichites, on y comptait environ 125 mille âmes.\r\nJe fus établie Régulatrice des Exercices Spirituels, et pour que le fruit en soit plus grand, elles sont sous la protection de Notre Dame des Douleurs et des Saints de la Compagnie dont je fais célébrer lés Fêtes avec solennité.\r\nPlusieurs personnes me sollicitent très fort de me transporter à Buenos: Je ne saurais me résoudre à rien jusqu’à ce que je voie clairement que c’est la volonté de Dieu. Et pour vous dire le tout en confiance, je ne fais pas un pas sans que le Seigneur me le commande et me conduise sensiblement comme par la main.\r\nComment cela arrive-t-il? Misérable que je suis. Je ne le sais pas. Cependant la chose est ainsi. De plus, si vous voulez que je vous instruise des soins tout amoureux de la Providence sur moi quelque indigne que j’en suis, sachez que dans mes pénibles voyages, dans des Pays si mauvais, dans les déserts, obligée de passer des fleuves, des torrents, j’ai toujours marché pieds nus, sans qu’il me soit rien arrivée de fâcheux: au contraire quelquefois que je me suis trouvée assez mal comme cela est arrivé à Catamarca où je fus désespérée des médecins, en me recommandant à la Sainte Vierge, sans autre remède je me levai du lit et continuai mon voyage jusqu’à Rioja. Une autre fois que je me rompis une côte par une chute, une autre que je m’étais donnée une entorse au pied, je me sentis par un tact invisible, guérie.\r\nSalués tous nos chers frères et en particulier mon ancien Confesseur. Que tous m’aident de leurs prières sans quoi je ne puis rien. Votre Soeur Marie Antoinette de St. Joseph.', '1760660122984.jpg', NULL, NULL, NULL, NULL, '2025-10-17 16:56:26', 1),
(7, NULL, 1, 1, 0, 'Cf. Blanco II: AL (en francés); G 16; P 184-186 (en francés): C. P., 273-275. Una versión existe también en ASR 62-66 (en italiano). No se conoce el original en castellano. Corduba, dans le Tucuman, le 6 janvier 1778.', NULL, NULL, NULL, NULL, NULL, '2025-10-17 16:56:26', 1),
(8, NULL, 2, 1, 0, 'En 1780 Buenos Aires formaba parte del Virreinato del Perú. En esta carta Mama Antula comenta que el Obispo de Cuzco -Juan Manuel Moscoso- la ha autorizado a abrir oratorios en casas en la provincia de Córdoba del Tucumán. En esta época recién se inicia su tarea evangelizadora en Buenos Aires, para la que solicita colaboraciones y donde dice haber dado 4 tandas de Ejercicios Espirituales, mientras que en Tucumán ya ha ofrecido 60 retiros a la fecha de esta carta', '1760660122985.jpg', 'https://scielo.conicyt.cl/scielo.php?script=sci_arttext&pid=S0717-71942018000200517', NULL, NULL, 'En tiempos de Mama Antula disponer de un altar portátil permitía transportarlos fácilmente para celebrar Misa en diferentes lugares y facilitar la evangelización. Foto: Altar portátil (comienzos siglo xx) Museo de Arte Religioso Juan de Tejeda (Córdoba, Argentina). Fuente: https://scielo.conicyt.cl (click en la imagen)', '2025-10-17 16:56:26', 1),
(9, NULL, 2, 1, 0, 'La gracia del Espíritu Santo ilumine su alma eternamente, mi carísimo Don Gaspar en Jesucristo. He quedado muy reconocida a los singulares favores y privilegios que Vuestra Merced me ha alcanzado de Su Santidad y en las gracias que me confieren, trascendentales a toda mi descendencia, y en las que se me franquean concediéndome altar portátil para la protección de mis peregrinaciones. El Señor se sirva remunerarle en la vida futura estos beneficios; cuya posesión excitara cada día la frecuencia de mis recomendaciones al Altísimo, porque le de feliz despacho a todas las pretensiones que le convengan. A más de esto, procuraré interesar en el mismo logro de sus deseos a muchos y a todos, si fuese posible, de los que participan de tan utilísima concesión, y cuando tanta abundancia de deprecaciones no se obtenga, la Divina Providencia suplirá nuestros defectos en su obsequio, por habernos proveído por sus propios esfuerzos de tantos tesoros que redundarán en honra y gloria de Su Divina Majestad.', NULL, NULL, NULL, NULL, NULL, '2025-10-17 16:56:26', 1),
(10, NULL, 2, 1, 0, 'Cf. Blanco III: ASR 1-5 (en castellano); G 17; B 25-28. Otras versiones: Blanco V: ASR 7-11 (en italiano); G 17 / Más breves: Blanco IV: ASR 66- 69 (Lettera 2a al medesimo soggetto); G 16; P 187 (en francés); Blanco VI: P 187-190 (en francés): C. P., 376-379. Cf. también variantes: Blanco IX (fechada el 16/10/1780): ACSBA (original); G 18; Blanco XI: ACSBA (original); G 32. Pax Christi', NULL, NULL, NULL, NULL, NULL, '2025-10-17 16:56:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cont_3carrousel`
--

CREATE TABLE `cont_3carrousel` (
  `id` int(10) UNSIGNED NOT NULL,
  `contenido_id` int(10) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `statusRegistro_id` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nivel1_secciones`
--

CREATE TABLE `nivel1_secciones` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `link` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel1_secciones`
--

INSERT INTO `nivel1_secciones` (`id`, `orden`, `nombre`, `codigo`, `link`) VALUES
(1, 1, 'Inicio', 'inicio', '/'),
(2, 2, 'Experiencias', 'experiencias', '/experiencias'),
(3, 3, 'Cartas y Escritos', 'cartasEscritos', '/cartas-y-escritos'),
(4, 4, 'Libros', 'libros', '/libros'),
(5, 5, 'Devoción', 'devocion', '/devocion'),
(6, 6, 'Institucionales', 'institucionales', '/institucionales');

-- --------------------------------------------------------

--
-- Table structure for table `nivel2_temas`
--

CREATE TABLE `nivel2_temas` (
  `id` int(10) UNSIGNED NOT NULL,
  `seccion_id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `ordenPorFecha` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel2_temas`
--

INSERT INTO `nivel2_temas` (`id`, `seccion_id`, `orden`, `titulo`, `codigo`, `ordenPorFecha`) VALUES
(1, 1, 1, 'Próximos eventos', 'proximosEventos', 1),
(2, 1, 2, 'Quién es Mama Antula', 'quienEsMamaAntula', 0),
(3, 1, 3, 'Quiénes somos', 'quienesSomos', 0),
(5, 2, 1, 'Después de la canonización', 'despuesCanon', 1),
(6, 2, 2, 'Crónicas de la canonización', 'cronicasCanon', 0),
(7, 2, 3, 'Antes de la canonización', 'antesCanon', 1),
(8, 3, 1, 'Introducción', 'introduccion', 0),
(9, 3, 2, 'Testamento', 'testamento', 0),
(10, 3, 3, 'Cartas', 'cartas', 1),
(11, 3, 4, 'Frases famosas', 'frasesFamosas', 0),
(12, 3, 5, 'Oración fúnebre', 'oracionFunebre', 0),
(13, 4, 1, 'En librerías', 'librerias', 1),
(14, 4, 2, 'Descarga libre', 'descargas', 1),
(15, 5, 1, 'Oraciones', 'oraciones', 0),
(16, 5, 2, 'Iconografía', 'iconos', 1),
(17, 5, 3, 'Lugares de devoción', 'lugaresDevocion', 0),
(18, 5, 4, 'Imágenes', 'imagenes', 0),
(19, 6, 1, 'Santa Casa', 'santaCasa', 0),
(20, 6, 2, 'Iglesia de La piedad', 'iglesiaLaPiedad', 0),
(21, 6, 3, 'Santiago del Estero', 'santiagoEstero', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nivel3_pestanas`
--

CREATE TABLE `nivel3_pestanas` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_id` int(10) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subtitulo` mediumtext DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `ordenPorFecha` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel3_pestanas`
--

INSERT INTO `nivel3_pestanas` (`id`, `tema_id`, `orden`, `titulo`, `subtitulo`, `codigo`, `ordenPorFecha`) VALUES
(1, 6, 1, 'Experiencias', 'Vigilias, actos, Misas, conferencias, visitas guiadas y reseñas de la vida de Mama Antula durante las celebraciones por su santificación', 'expersCanon', 1),
(2, 6, 2, 'Vigilia', NULL, 'vigiliaCanon', 0),
(3, 7, 1, 'Cronología', NULL, 'cronologiaCanon', 0),
(4, 7, 2, 'Experiencias', NULL, 'expersAntesCanon', 1),
(5, 15, 1, 'Oración a Mama Antula', NULL, 'oracionMa', 0),
(6, 15, 2, 'Estampas', NULL, 'estampas', 0),
(7, 15, 3, 'Videos', NULL, 'videos', 0),
(8, 19, 1, 'Retiros Ignacianos', NULL, 'retiros', 0),
(9, 19, 2, 'Otras Actividades', NULL, 'otrasActividades', 0),
(11, 19, 3, 'Historia', NULL, 'historia', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('-4r-AuTgP_uJ9RxlO-2dJSg1RaoektJs', 1761267664, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T01:01:04.369Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":280,\"cliente_id\":\"V0000000280\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('-GKoOVfnqQvwj9LtIW28M5PLoayYY_SE', 1761261635, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:20:34.718Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":267,\"cliente_id\":\"V0000000267\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('-eOHKQ6VBXHP_3qcZzijNm01_5QGAHSZ', 1761297206, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:13:25.714Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":307,\"cliente_id\":\"V0000000307\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('0Dx8qzcm4do-CBjVoBySFSqPxInjY97v', 1761297375, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:16:15.119Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":309,\"cliente_id\":\"V0000000309\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('0HeA3GPTilquwVRf9m3143EurIP3g5Jt', 1761261306, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:06.242Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":262,\"cliente_id\":\"V0000000262\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('0xcg2qSnVwf22FeUiMKszCOBcrTO-GW-', 1761272066, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T02:14:25.670Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":284,\"cliente_id\":\"V0000000284\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('1lIVT2Z7_pBpyd3O5PocufyO71PUvmSx', 1761267090, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:51:29.949Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":276,\"cliente_id\":\"V0000000276\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('317pYhG4pe6iIw6frrWgZSJqiB5Nx9WK', 1761279549, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T04:19:09.439Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":296,\"cliente_id\":\"V0000000296\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('3E4p4SR5mqKs6gH3VfIS5k1iBqsTrrEj', 1761308243, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T12:17:23.183Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":317,\"cliente_id\":\"V0000000317\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('3V-dih1bmDVyz6LJexduq5omVpv1vzN4', 1761316695, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T14:38:14.715Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":331,\"cliente_id\":\"V0000000331\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('48Y_QT1yl2mQv9WlASBvAojbkxQVepDg', 1761319675, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T15:27:55.328Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":338,\"cliente_id\":\"V0000000338\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('4Y98LewAA0P5JKcUMDltc1XESeuKlCmR', 1761269163, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T01:26:02.522Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":282,\"cliente_id\":\"V0000000282\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('4pjOW9y15m20zTRS6IwPOarplHdB62bW', 1761249892, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:04:51.947Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":235,\"cliente_id\":\"V0000000235\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('4ziE-ktI-l8Tr8qmyA55e_KYAFz1e4_O', 1761265925, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:32:05.322Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":272,\"cliente_id\":\"V0000000272\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('5sg8PH9ir-W1ygzVegZZ7oE8Oh1PqiGE', 1761256586, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:46:37.867Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":245,\"cliente_id\":\"V0000000245\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('67SJL1VslPSfMPWitRApa4St3I7OXP7Y', 1761293761, '{\"cookie\":{\"originalMaxAge\":86399986,\"expires\":\"2025-10-24T08:16:00.936Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":302,\"cliente_id\":\"V0000000302\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('7Bn8OrnbgYmfcMtEa6iwia7d34CwZoMh', 1761295629, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T08:47:09.332Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":304,\"cliente_id\":\"V0000000304\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('8NlRXV6vdESaWIl-t54A1wEbVrEQV_nl', 1761263646, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:54:05.633Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":269,\"cliente_id\":\"V0000000269\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('9NSwqgeLEs2hAMyfLfqK4WpypZQ3aqB6', 1761261253, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:09.403Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":253,\"cliente_id\":\"V0000000253\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('9_t8WAfYN6HK_k8bvm_I_qycK1V5GiIY', 1761249053, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:50:52.502Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":229,\"cliente_id\":\"V0000000229\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('CSs4-v5mYGF8jmM4bqtz1gxCgfNcxo2s', 1761264980, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:16:20.493Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":270,\"cliente_id\":\"V0000000270\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('CsXZ-uJTEYfa39I3TCo-njgFBardDLoZ', 1761255913, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:45:12.093Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":242,\"cliente_id\":\"V0000000242\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('CvlybqW97-YVKjcYxirtr3bHcIzVwn5k', 1761263521, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:52:00.560Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":268,\"cliente_id\":\"V0000000268\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('DEGO6NUf6e_nMG3H8PJHF-sGY2SDmY2l', 1761305177, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T11:26:04.090Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":6,\"cliente_id\":\"V0000000006\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-21\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('E9hPwoBXlvSdeJ3cxBTaTfTtb_TIznoy', 1761260921, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-23T23:08:40.500Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":250,\"cliente_id\":\"V0000000250\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('EbszdLRVuDQAWZAun8s1Y3jsl-LFrxho', 1761256234, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:50:33.110Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":246,\"cliente_id\":\"V0000000246\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('EyasFNmWP7fiaXAQ7-1BOWg446ZaGNDj', 1761316671, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:37:50.587Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":330,\"cliente_id\":\"V0000000330\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('FhTuqTJ9CDr7Y2C0yVWluY5bQtiowDvV', 1761261256, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:13.442Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":255,\"cliente_id\":\"V0000000255\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Gj6PpVevy1SAVmlrfAXmL1i901iiIVnW', 1761261303, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:03.100Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":260,\"cliente_id\":\"V0000000260\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('H4Rf1GZLXIT7GQu9URyGyUr7E5JAs7KG', 1761265946, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:32:25.560Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":273,\"cliente_id\":\"V0000000273\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('I3xv4qc-3sOguuh0cyGudDste-TGne_z', 1761273876, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:44:26.346Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":1,\"cliente_id\":\"U0000000001\",\"fechaUltNaveg\":\"2025-10-21\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-10-16\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":2,\"orden\":2,\"nombre\":\"Edición\",\"codigo\":\"edicion\",\"edicion\":true,\"revision\":false,\"abmUs\":false}}}'),
('IcGFIeXAk62TSdQcaknqpuEx_A6nDEQz', 1761298839, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:40:38.866Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":311,\"cliente_id\":\"V0000000311\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Io_75IvnuHBVqPQ3FAiTe80EXH1zsvWD', 1761314564, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:02:44.097Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":325,\"cliente_id\":\"V0000000325\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('JGmk5ZSqd1tojmRd1rFVszwKdFigw2uV', 1761272066, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T02:14:25.631Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":283,\"cliente_id\":\"V0000000283\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('JLzZ4Jo6jPhaW8YznDPK0l8ru2MUs89o', 1761311007, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T13:03:27.241Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":319,\"cliente_id\":\"V0000000319\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('K5omsVjywg5iKwNz8IMx_i1XIg8bEUIY', 1761282320, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T05:05:20.182Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":299,\"cliente_id\":\"V0000000299\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('KV6KcbQXIPmt6GWdnvK00pNDc5Ur6fUh', 1761244818, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T18:40:18.397Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":223,\"cliente_id\":\"V0000000223\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('KunHAUwTLYEGd5CXB68JVg5R-OoapNxO', 1761249013, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:50:12.532Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":227,\"cliente_id\":\"V0000000227\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('LJ1z1i81X93POAc97NbYqoI6snARsUEM', 1761261302, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:02.242Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":259,\"cliente_id\":\"V0000000259\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('MbQDoM4hKgqZls_qDZusOTIOBxIRXjEX', 1761316645, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:37:24.601Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":329,\"cliente_id\":\"V0000000329\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('MkhRYc1_c4nig4DHyK2bKMMurc6lmZk5', 1761267725, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T01:02:05.434Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":281,\"cliente_id\":\"V0000000281\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('N55mIfNHsj7cAK3yaa0Zc2osxt3qFCxo', 1761235126, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T15:58:45.520Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":220,\"cliente_id\":\"V0000000220\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('NknzXR3U6kIZlKV1PdAjplz5M5hAR0CY', 1761234468, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T15:47:48.339Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":219,\"cliente_id\":\"V0000000219\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('OiOJLzAD8oJYhsSlPJvtmQ2uI6KWGYQc', 1761299662, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:54:21.681Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":313,\"cliente_id\":\"V0000000313\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Or6hUVE9KCPDDLApz0C4o0PpKTsJBYPR', 1761287570, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T06:32:50.254Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":301,\"cliente_id\":\"V0000000301\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('PZB8LE4ioE4Y2hLIYM4TTJHghCJydtSa', 1761314653, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:04:12.986Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":326,\"cliente_id\":\"V0000000326\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Q3fNO3r5QZT5ncmniI3CdZvVa8Fbfi2O', 1761257801, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T22:16:40.570Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":248,\"cliente_id\":\"V0000000248\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('QlzEWd_xbSsH9oRaWzClnyNoUYlLuCQU', 1761267090, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T00:51:29.937Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":275,\"cliente_id\":\"V0000000275\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('QmTvCzvg4q6h_SDOailHZzrUcsFRxMlP', 1761282411, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T05:06:51.218Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":300,\"cliente_id\":\"V0000000300\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('S-LBgfS08boqkzxrVIseSdf5sfTJKmbz', 1761316711, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:38:30.688Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":332,\"cliente_id\":\"V0000000332\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('SecfzY_cQbWTPenEX_emnyaZsFkcrP0m', 1761275900, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:18:20.443Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":288,\"cliente_id\":\"V0000000288\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('TqInzPzJoZ16WRTUgR7ERTV1yJNhYZY4', 1761295621, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T08:47:00.671Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":303,\"cliente_id\":\"V0000000303\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('UvlXrQkRqBd8GWWFWuoEldcYOuwPhNZU', 1761277536, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:45:36.351Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":290,\"cliente_id\":\"V0000000290\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Vem53aYbi9UM5PCumd9MQiM_09FGgX8z', 1761267257, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:54:14.938Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":278,\"cliente_id\":\"V0000000278\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Ws0WcvSMEW7eThOrFadqUtWtQ3pBRsmQ', 1761248952, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:49:12.499Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":225,\"cliente_id\":\"V0000000225\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Xk2xHLm5C8HbIMsRLkzSdJG3l23qQELK', 1761298069, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:27:49.259Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":310,\"cliente_id\":\"V0000000310\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('XpAsNlZWMb5uKkl7CE2Yd5l9-3_twfA-', 1761319675, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T15:27:55.265Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":336,\"cliente_id\":\"V0000000336\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('YKCw7ojpWj0m0LtdrbRxntiW8BUhLRXP', 1761311145, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T13:05:44.508Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":321,\"cliente_id\":\"V0000000321\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('YSp4LTRtgHCJbTnA3u8ocC4IPbJMc1oA', 1761256328, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:46:03.977Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":244,\"cliente_id\":\"V0000000244\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('Yqz0tCltABXcAHB4qFBAExnaMyGPNpDc', 1761261261, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:20.960Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":256,\"cliente_id\":\"V0000000256\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ZKy2db7N3KLd7XKt_2-XU2WLYnCvYWgu', 1761256260, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-23T21:50:57.696Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":247,\"cliente_id\":\"V0000000247\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('_D6poIHRJCr7MtAFTvod_CnbZwbc6086', 1761249522, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:58:39.949Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":232,\"cliente_id\":\"V0000000232\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('_NxIJ1l_IE89uAkkCr2N14w74Z28Hi4W', 1761299681, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:54:40.757Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":315,\"cliente_id\":\"V0000000315\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('aA2DtIuLryqjCffyF5CIUop_pPrT7WNg', 1761250629, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:17:09.370Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":237,\"cliente_id\":\"V0000000237\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('aPAJCQX7hC1l-mFWZ-pQZzG5GfYXGAD6', 1761309161, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T12:32:40.657Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":318,\"cliente_id\":\"V0000000318\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('aiEkVS-2Wvi-sYbEgLuEJeJbFvTUV399', 1761244429, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T18:33:49.102Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":222,\"cliente_id\":\"V0000000222\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('b4UPIgZFWLn77oiXk6FeQiuIytrCdRCy', 1761266745, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:45:45.009Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":274,\"cliente_id\":\"V0000000274\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('busw7UIVLu57H7gHdaEwzRYd2JeyTSZ0', 1761319675, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T15:27:55.237Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":337,\"cliente_id\":\"V0000000337\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('cFjwlFIRDr94-MRIMuu9FgI4AnB1J8DP', 1761249491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:58:07.393Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":230,\"cliente_id\":\"V0000000230\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('cxtgOLxbkG-nMW6krfC67hTPW0LQogr-', 1761261300, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:59.638Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":257,\"cliente_id\":\"V0000000257\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('dSYcrcOF87qpy1QmIZzs3rvcihZ8pN2m', 1761279020, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T04:10:18.831Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":295,\"cliente_id\":\"V0000000295\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('e0mBcH-dUqBR65ql2fF5K5VgAD7elCkP', 1761278111, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:55:11.144Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":293,\"cliente_id\":\"V0000000293\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('eURrs5j2cLYtf3q9vdhf7znQDznFi8mQ', 1761314032, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T13:53:52.240Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":324,\"cliente_id\":\"V0000000324\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ew2R4syyaIuqpTuo_GWvB8zD2ZZhDjSp', 1761315453, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T14:17:33.020Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":328,\"cliente_id\":\"V0000000328\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('fO17SKdcIvwhLattKeLelGj2gMmu-7o3', 1761280436, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T04:33:56.296Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":298,\"cliente_id\":\"V0000000298\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('g3CMOAVaY6gxxYUHKjOXEhkH2EJunHGi', 1761249879, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:04:38.918Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":234,\"cliente_id\":\"V0000000234\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('gDQL2oTMT6aDZRkIUR3uyGdvtg4FZMyN', 1761267616, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T01:00:12.771Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":279,\"cliente_id\":\"V0000000279\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('gU3l5MfWewXZUIWO5hZTMl5UCs-SfWCb', 1761299692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:54:52.041Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":316,\"cliente_id\":\"V0000000316\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('gWcQSUrIFZtF3r6JCD_j_h9L5MwEbMT7', 1761313615, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T13:45:55.245Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":323,\"cliente_id\":\"V0000000323\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('hCbgReuJhPRtuP82mFGXKuIxiJyVWt6r', 1761261636, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:20:34.467Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":266,\"cliente_id\":\"V0000000266\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('hcsneRwk2qkujF07o-_GYTWyeTxsQ5C9', 1761297216, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:13:36.165Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":308,\"cliente_id\":\"V0000000308\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('hw_fQQuj7aKoMulvGvjwZgeJgPXaXXuc', 1761274942, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:02:17.084Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":286,\"cliente_id\":\"V0000000286\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('iRvA8gSMrdbpr6iKucSyo805MJAXHnxj', 1761249039, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:50:38.548Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":228,\"cliente_id\":\"V0000000228\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('iWTWkYSLjJ8_eS3bet0Z1B3dsUmt-F7N', 1761275900, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:18:20.468Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":287,\"cliente_id\":\"V0000000287\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ieDe4xeTvHL4fx66Co5a7tFsaW_ynvkZ', 1761265925, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:32:05.210Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":271,\"cliente_id\":\"V0000000271\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ifvIddLjFkMyNkT2LXsjjSVexiN2i_-l', 1761249491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:58:07.694Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":231,\"cliente_id\":\"V0000000231\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('jA0nc8mB5bAPRwwSAwanns7xwtfBvyk9', 1761261301, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:00.698Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":258,\"cliente_id\":\"V0000000258\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('kG6Wp7q66rNvrTzxxapmQqZsu0VpglKr', 1761261305, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:05.381Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":261,\"cliente_id\":\"V0000000261\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('kLMVcTt1PmJ3Sgyu6ly0O3MxI-AgIb5s', 1761253649, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:07:29.189Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":241,\"cliente_id\":\"V0000000241\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('klAIkrOEwyERlIjUYP6Fe65aD-7P6MmC', 1761251570, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:32:49.973Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":240,\"cliente_id\":\"V0000000240\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ky1TdP7_o9a_it5LpPO3JonuwE1Ov2mN', 1761251422, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:30:21.768Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":239,\"cliente_id\":\"V0000000239\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('l26TiSLrX-t6X2e6fT-MlA5-jvra4PYb', 1761319098, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T15:18:17.955Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":334,\"cliente_id\":\"V0000000334\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('lEfnvtgynoDnrSft5RdgcsFIEX4Haj6s', 1761299675, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:54:35.278Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":314,\"cliente_id\":\"V0000000314\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('lHLWvF1ez5mh1ffnrZSy3FxtivKfHmEJ', 1761277562, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:46:02.452Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":291,\"cliente_id\":\"V0000000291\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('mlsQ5W9iANgHuMM7vsALhcqkZsyrQLvc', 1761261253, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:09.302Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":252,\"cliente_id\":\"V0000000252\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('nW3mRgg8Kg71Z8i1Oq30zQfcU_dSIyag', 1761250629, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:17:09.355Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":236,\"cliente_id\":\"V0000000236\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('nhGMbDFFVpdQ_6CxDGqwH1awXscu5xT3', 1761248851, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:47:31.442Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":224,\"cliente_id\":\"V0000000224\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('nrxRnDPJlGCxwHP0gxGtTxZiWQijqQKt', 1761280435, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T04:33:55.387Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":297,\"cliente_id\":\"V0000000297\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('oCXvZFBWsq0rIIGMmzAu0igw_fLzFAxq', 1761267120, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T00:52:00.213Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":277,\"cliente_id\":\"V0000000277\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('oJIF2gsN8hU4yM-f1lse6-EWJSittitL', 1761279019, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T04:10:17.187Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":294,\"cliente_id\":\"V0000000294\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('ofdDavjUA0t9u3pCwuPbbTsBtw6x8hEn', 1761319675, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T15:27:55.175Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":335,\"cliente_id\":\"V0000000335\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('oqHKD-_3cRxC6XcjH5JLaf_4XW9EBJrt', 1761260892, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:08:11.543Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":249,\"cliente_id\":\"V0000000249\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('oy7ws3i9AkPyc_Hxc2UEE3JI_Lmr-yGL', 1761261307, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:07.288Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":263,\"cliente_id\":\"V0000000263\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('pZQbuGh60TvsWjMvZSLHnvaLD2AEv7jU', 1761261309, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:15:08.927Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":264,\"cliente_id\":\"V0000000264\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('q_tBGxt4bslz3GwY-OVL_mJxjsBsmue2', 1761275913, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:18:33.185Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":289,\"cliente_id\":\"V0000000289\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('rsXzmB3lcTk7J-G9fkkvSpMBAydgpblS', 1761249525, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:58:43.266Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":233,\"cliente_id\":\"V0000000233\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('rsbwAp4TfNoEh2k2yuoJoC2QXLJ_-SB-', 1761318426, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T15:07:06.257Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":333,\"cliente_id\":\"V0000000333\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}');
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('sRWbum675NwM7VkGRb5kw3dfH0vLrMwd', 1761248983, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T19:49:43.112Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":226,\"cliente_id\":\"V0000000226\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('tFZ-GPWM2wdRp2u7ccJa3fQhfQc1U8Na', 1761274886, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:01:25.936Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":285,\"cliente_id\":\"V0000000285\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('tO0q6-Qm0H6TPE3-q6YWPu1yZAjrtRD6', 1761314654, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-10-24T14:04:14.245Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":327,\"cliente_id\":\"V0000000327\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('thfNfC2yxlN-bT0qTZTrqFxL98ANUTpD', 1761255970, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T21:45:58.581Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":243,\"cliente_id\":\"V0000000243\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('twchVW-eQQO1wgcZ7oxEZFDvL2NTCsBg', 1761261051, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:10:45.997Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":251,\"cliente_id\":\"V0000000251\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('u4okSfdo0LB70M8CxSoOmrDmG-6hXC-F', 1761295765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T08:49:25.330Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":306,\"cliente_id\":\"V0000000306\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('u_q0x8AERThDHKJj64Sc33w7_rPZUqJP', 1761295701, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T08:48:20.991Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":305,\"cliente_id\":\"V0000000305\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('uf2K0nyvrYGoySEiy0CAQKL0IUKNa_We', 1761278048, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T03:54:07.999Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":292,\"cliente_id\":\"V0000000292\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('vjSttRcZNonMc2OUV8cQf0mNeH-Dz8my', 1761299308, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T09:48:28.369Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":312,\"cliente_id\":\"V0000000312\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('vmXc-9Y-p2OYxp10pciCjwnYy6AkvEQP', 1761312110, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T13:21:46.074Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":322,\"cliente_id\":\"V0000000322\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('wpqEOSArx3tpuaoncPA247IV5JEd-1uT', 1761311074, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-24T13:04:34.364Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":320,\"cliente_id\":\"V0000000320\",\"fechaUltNaveg\":\"2025-10-23\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-23\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('xtzekrnpHUlQ3sNe-9655g_OluoCh2oq', 1761250629, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T20:17:09.409Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":238,\"cliente_id\":\"V0000000238\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('yyFPrt3sO6nM0rMon-5hLPWGMiAv-Rs7', 1761261385, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:16:21.575Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":265,\"cliente_id\":\"V0000000265\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('z8wuI3SH3loxs21WF2mcRsKL9XeRoXYu', 1761235416, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T16:03:35.807Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":221,\"cliente_id\":\"V0000000221\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}'),
('zPzlj3s-UTCT_v7bX72_O0gQTFnOAiq3', 1761261255, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-10-23T23:14:13.195Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":254,\"cliente_id\":\"V0000000254\",\"fechaUltNaveg\":\"2025-10-22\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-10-22\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"abmUs\":false}}}');

-- --------------------------------------------------------

--
-- Table structure for table `us_generos`
--

CREATE TABLE `us_generos` (
  `id` varchar(3) NOT NULL,
  `orden` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `letraFinal` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_generos`
--

INSERT INTO `us_generos` (`id`, `orden`, `nombre`, `letraFinal`) VALUES
('F', 2, 'Femenino', 'a'),
('M', 1, 'Masculino', 'o');

-- --------------------------------------------------------

--
-- Table structure for table `us_roles`
--

CREATE TABLE `us_roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `orden` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `edicion` tinyint(1) DEFAULT 0,
  `revision` tinyint(1) DEFAULT 0,
  `abmUs` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_roles`
--

INSERT INTO `us_roles` (`id`, `orden`, `nombre`, `codigo`, `edicion`, `revision`, `abmUs`) VALUES
(1, 1, 'Sólo lectura', 'lectura', 0, 0, 0),
(2, 2, 'Edición', 'edicion', 1, 0, 0),
(3, 3, 'Revisión', 'revision', 1, 1, 0),
(4, 4, 'Administrador', 'abmUs', 1, 0, 1),
(5, 5, 'Admin. y revisor', 'abmUsRevision', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `us_status_registros`
--

CREATE TABLE `us_status_registros` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_status_registros`
--

INSERT INTO `us_status_registros` (`id`, `orden`, `nombre`, `codigo`) VALUES
(1, 1, 'Mail a validar', 'mailPendValidar'),
(2, 2, 'Mail validado', 'mailValidado');

-- --------------------------------------------------------

--
-- Table structure for table `us_usuarios`
--

CREATE TABLE `us_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `genero_id` varchar(1) NOT NULL,
  `apodo` varchar(30) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rolUsuario_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_usuarios`
--

INSERT INTO `us_usuarios` (`id`, `nombre`, `email`, `genero_id`, `apodo`, `cliente_id`, `contrasena`, `avatar`, `newsletter`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `creadoEn`, `fechaContrasena`, `rolUsuario_id`, `statusRegistro_id`) VALUES
(1, 'Diego Iribarren', 'diegoiribarren2015@gmail.com', 'M', 'Diego', 'U0000000001', '$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO', NULL, 1, '2025-10-16 23:29:07', '2025-10-21', 1, '1.00', '2025-10-16 23:29:07', '2025-10-16 23:29:07', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `us_visitas`
--

CREATE TABLE `us_visitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `visitaCreadaEn` datetime DEFAULT utc_timestamp(),
  `fechaUltNaveg` date DEFAULT utc_date(),
  `diasNaveg` smallint(5) UNSIGNED DEFAULT 0,
  `versionWeb` varchar(4) DEFAULT NULL,
  `rolUsuario_id` tinyint(3) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_visitas`
--

INSERT INTO `us_visitas` (`id`, `cliente_id`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `rolUsuario_id`) VALUES
(1, 'V0000000001', '2025-10-21 13:39:18', '2025-10-21', 0, '1.00', 1),
(2, 'V0000000002', '2025-10-21 15:18:47', '2025-10-21', 0, '1.00', 1),
(3, 'V0000000003', '2025-10-21 16:03:19', '2025-10-21', 0, '1.00', 1),
(4, 'V0000000004', '2025-10-21 15:18:55', '2025-10-21', 0, '1.00', 1),
(5, 'V0000000005', '2025-10-21 15:24:09', '2025-10-21', 0, '1.00', 1),
(6, 'V0000000006', '2025-10-21 16:11:37', '2025-10-21', 0, '1.00', 1),
(7, 'V0000000007', '2025-10-21 16:12:59', '2025-10-21', 0, '1.00', 1),
(8, 'V0000000008', '2025-10-21 16:13:06', '2025-10-21', 0, '1.00', 1),
(9, 'V0000000009', '2025-10-21 16:13:10', '2025-10-21', 0, '1.00', 1),
(10, 'V0000000010', '2025-10-21 16:15:24', '2025-10-21', 0, '1.00', 1),
(11, 'V0000000011', '2025-10-21 16:20:44', '2025-10-21', 0, '1.00', 1),
(12, 'V0000000012', '2025-10-21 16:23:55', '2025-10-21', 0, '1.00', 1),
(13, 'V0000000013', '2025-10-21 16:34:07', '2025-10-21', 0, '1.00', 1),
(14, 'V0000000014', '2025-10-21 16:36:08', '2025-10-21', 0, '1.00', 1),
(15, 'V0000000015', '2025-10-21 17:02:13', '2025-10-21', 0, '1.00', 1),
(16, 'V0000000016', '2025-10-21 17:06:03', '2025-10-21', 0, '1.00', 1),
(17, 'V0000000017', '2025-10-21 17:19:45', '2025-10-21', 0, '1.00', 1),
(18, 'V0000000018', '2025-10-21 17:26:20', '2025-10-21', 0, '1.00', 1),
(19, 'V0000000019', '2025-10-21 18:17:28', '2025-10-21', 0, '1.00', 1),
(20, 'V0000000020', '2025-10-21 19:20:21', '2025-10-21', 0, '1.00', 1),
(21, 'V0000000021', '2025-10-21 20:18:39', '2025-10-21', 0, '1.00', 1),
(22, 'V0000000022', '2025-10-21 20:24:33', '2025-10-21', 0, '1.00', 1),
(23, 'V0000000023', '2025-10-21 21:09:46', '2025-10-21', 0, '1.00', 1),
(24, 'V0000000024', '2025-10-21 22:08:07', '2025-10-21', 0, '1.00', 1),
(25, 'V0000000025', '2025-10-21 22:17:22', '2025-10-21', 0, '1.00', 1),
(26, 'V0000000026', '2025-10-21 22:17:47', '2025-10-21', 0, '1.00', 1),
(27, 'V0000000027', '2025-10-21 22:19:33', '2025-10-21', 0, '1.00', 1),
(28, 'V0000000028', '2025-10-21 22:50:36', '2025-10-21', 0, '1.00', 1),
(29, 'V0000000029', '2025-10-21 22:50:37', '2025-10-21', 0, '1.00', 1),
(30, 'V0000000030', '2025-10-21 22:50:39', '2025-10-21', 0, '1.00', 1),
(31, 'V0000000031', '2025-10-21 23:14:00', '2025-10-21', 0, '1.00', 1),
(32, 'V0000000032', '2025-10-21 23:14:03', '2025-10-21', 0, '1.00', 1),
(33, 'V0000000033', '2025-10-21 23:14:04', '2025-10-21', 0, '1.00', 1),
(34, 'V0000000034', '2025-10-21 23:14:09', '2025-10-21', 0, '1.00', 1),
(35, 'V0000000035', '2025-10-21 23:14:10', '2025-10-21', 0, '1.00', 1),
(36, 'V0000000036', '2025-10-21 23:14:12', '2025-10-21', 0, '1.00', 1),
(37, 'V0000000037', '2025-10-21 23:22:19', '2025-10-21', 0, '1.00', 1),
(38, 'V0000000038', '2025-10-21 23:26:13', '2025-10-21', 0, '1.00', 1),
(39, 'V0000000039', '2025-10-21 23:26:33', '2025-10-21', 0, '1.00', 1),
(40, 'V0000000040', '2025-10-21 23:26:34', '2025-10-21', 0, '1.00', 1),
(41, 'V0000000041', '2025-10-21 23:26:34', '2025-10-21', 0, '1.00', 1),
(42, 'V0000000042', '2025-10-21 23:54:00', '2025-10-21', 0, '1.00', 1),
(43, 'V0000000043', '2025-10-22 00:03:41', '2025-10-22', 0, '1.00', 1),
(44, 'V0000000044', '2025-10-22 00:03:46', '2025-10-22', 0, '1.00', 1),
(45, 'V0000000045', '2025-10-22 00:07:48', '2025-10-22', 0, '1.00', 1),
(46, 'V0000000046', '2025-10-22 00:15:59', '2025-10-22', 0, '1.00', 1),
(47, 'V0000000047', '2025-10-22 00:16:49', '2025-10-22', 0, '1.00', 1),
(48, 'V0000000048', '2025-10-22 00:18:35', '2025-10-22', 0, '1.00', 1),
(49, 'V0000000049', '2025-10-22 00:49:33', '2025-10-22', 0, '1.00', 1),
(50, 'V0000000050', '2025-10-22 01:00:42', '2025-10-22', 0, '1.00', 1),
(51, 'V0000000051', '2025-10-22 02:12:36', '2025-10-22', 0, '1.00', 1),
(52, 'V0000000052', '2025-10-22 02:43:33', '2025-10-22', 0, '1.00', 1),
(53, 'V0000000053', '2025-10-22 02:53:53', '2025-10-22', 0, '1.00', 1),
(54, 'V0000000054', '2025-10-22 02:58:16', '2025-10-22', 0, '1.00', 1),
(55, 'V0000000055', '2025-10-22 03:14:52', '2025-10-22', 0, '1.00', 1),
(56, 'V0000000056', '2025-10-22 06:31:42', '2025-10-22', 0, '1.00', 1),
(57, 'V0000000057', '2025-10-22 06:31:45', '2025-10-22', 0, '1.00', 1),
(58, 'V0000000058', '2025-10-22 06:55:10', '2025-10-22', 0, '1.00', 1),
(59, 'V0000000059', '2025-10-22 06:56:18', '2025-10-22', 0, '1.00', 1),
(60, 'V0000000060', '2025-10-22 06:57:25', '2025-10-22', 0, '1.00', 1),
(61, 'V0000000061', '2025-10-22 07:49:33', '2025-10-22', 0, '1.00', 1),
(62, 'V0000000062', '2025-10-22 07:59:29', '2025-10-22', 0, '1.00', 1),
(63, 'V0000000063', '2025-10-22 07:59:35', '2025-10-22', 0, '1.00', 1),
(64, 'V0000000064', '2025-10-22 07:59:35', '2025-10-22', 0, '1.00', 1),
(65, 'V0000000065', '2025-10-22 09:31:00', '2025-10-22', 0, '1.00', 1),
(66, 'V0000000066', '2025-10-22 09:31:01', '2025-10-22', 0, '1.00', 1),
(67, 'V0000000067', '2025-10-22 09:31:02', '2025-10-22', 0, '1.00', 1),
(68, 'V0000000068', '2025-10-22 10:06:06', '2025-10-22', 0, '1.00', 1),
(69, 'V0000000069', '2025-10-22 10:07:16', '2025-10-22', 0, '1.00', 1),
(70, 'V0000000070', '2025-10-22 10:42:54', '2025-10-22', 0, '1.00', 1),
(71, 'V0000000071', '2025-10-22 10:42:59', '2025-10-22', 0, '1.00', 1),
(72, 'V0000000072', '2025-10-22 11:36:41', '2025-10-22', 0, '1.00', 1),
(73, 'V0000000073', '2025-10-22 11:56:31', '2025-10-22', 0, '1.00', 1),
(74, 'V0000000074', '2025-10-22 11:56:31', '2025-10-22', 0, '1.00', 1),
(75, 'V0000000075', '2025-10-22 12:08:24', '2025-10-22', 0, '1.00', 1),
(76, 'V0000000076', '2025-10-22 12:08:25', '2025-10-22', 0, '1.00', 1),
(77, 'V0000000077', '2025-10-22 12:09:33', '2025-10-22', 0, '1.00', 1),
(78, 'V0000000078', '2025-10-22 12:09:34', '2025-10-22', 0, '1.00', 1),
(79, 'V0000000079', '2025-10-22 12:17:16', '2025-10-22', 0, '1.00', 1),
(80, 'V0000000080', '2025-10-22 12:17:17', '2025-10-22', 0, '1.00', 1),
(81, 'V0000000081', '2025-10-22 14:12:57', '2025-10-22', 0, '1.00', 1),
(82, 'V0000000082', '2025-10-22 14:15:02', '2025-10-22', 0, '1.00', 1),
(83, 'V0000000083', '2025-10-22 14:15:03', '2025-10-22', 0, '1.00', 1),
(84, 'V0000000084', '2025-10-22 14:32:18', '2025-10-22', 0, '1.00', 1),
(85, 'V0000000085', '2025-10-22 14:33:46', '2025-10-22', 0, '1.00', 1),
(86, 'V0000000086', '2025-10-22 14:33:47', '2025-10-22', 0, '1.00', 1),
(87, 'V0000000087', '2025-10-22 14:33:51', '2025-10-22', 0, '1.00', 1),
(88, 'V0000000088', '2025-10-22 14:33:53', '2025-10-22', 0, '1.00', 1),
(89, 'V0000000089', '2025-10-22 14:33:54', '2025-10-22', 0, '1.00', 1),
(90, 'V0000000090', '2025-10-22 14:33:55', '2025-10-22', 0, '1.00', 1),
(91, 'V0000000091', '2025-10-22 14:33:57', '2025-10-22', 0, '1.00', 1),
(92, 'V0000000092', '2025-10-22 14:33:58', '2025-10-22', 0, '1.00', 1),
(93, 'V0000000093', '2025-10-22 14:33:59', '2025-10-22', 0, '1.00', 1),
(94, 'V0000000094', '2025-10-22 14:34:00', '2025-10-22', 0, '1.00', 1),
(95, 'V0000000095', '2025-10-22 14:34:01', '2025-10-22', 0, '1.00', 1),
(96, 'V0000000096', '2025-10-22 14:34:02', '2025-10-22', 0, '1.00', 1),
(97, 'V0000000097', '2025-10-22 14:34:03', '2025-10-22', 0, '1.00', 1),
(98, 'V0000000098', '2025-10-22 14:34:04', '2025-10-22', 0, '1.00', 1),
(99, 'V0000000099', '2025-10-22 14:34:05', '2025-10-22', 0, '1.00', 1),
(100, 'V0000000100', '2025-10-22 14:34:06', '2025-10-22', 0, '1.00', 1),
(101, 'V0000000101', '2025-10-22 14:34:07', '2025-10-22', 0, '1.00', 1),
(102, 'V0000000102', '2025-10-22 14:34:08', '2025-10-22', 0, '1.00', 1),
(103, 'V0000000103', '2025-10-22 14:34:09', '2025-10-22', 0, '1.00', 1),
(104, 'V0000000104', '2025-10-22 14:34:10', '2025-10-22', 0, '1.00', 1),
(105, 'V0000000105', '2025-10-22 14:34:11', '2025-10-22', 0, '1.00', 1),
(106, 'V0000000106', '2025-10-22 14:34:13', '2025-10-22', 0, '1.00', 1),
(107, 'V0000000107', '2025-10-22 14:34:14', '2025-10-22', 0, '1.00', 1),
(108, 'V0000000108', '2025-10-22 14:34:14', '2025-10-22', 0, '1.00', 1),
(109, 'V0000000109', '2025-10-22 14:34:16', '2025-10-22', 0, '1.00', 1),
(110, 'V0000000110', '2025-10-22 14:34:17', '2025-10-22', 0, '1.00', 1),
(111, 'V0000000111', '2025-10-22 14:34:18', '2025-10-22', 0, '1.00', 1),
(112, 'V0000000112', '2025-10-22 14:34:19', '2025-10-22', 0, '1.00', 1),
(113, 'V0000000113', '2025-10-22 14:34:21', '2025-10-22', 0, '1.00', 1),
(114, 'V0000000114', '2025-10-22 14:34:22', '2025-10-22', 0, '1.00', 1),
(115, 'V0000000115', '2025-10-22 14:34:23', '2025-10-22', 0, '1.00', 1),
(116, 'V0000000116', '2025-10-22 14:34:24', '2025-10-22', 0, '1.00', 1),
(117, 'V0000000117', '2025-10-22 14:34:25', '2025-10-22', 0, '1.00', 1),
(118, 'V0000000118', '2025-10-22 14:34:26', '2025-10-22', 0, '1.00', 1),
(119, 'V0000000119', '2025-10-22 14:34:27', '2025-10-22', 0, '1.00', 1),
(120, 'V0000000120', '2025-10-22 14:34:28', '2025-10-22', 0, '1.00', 1),
(121, 'V0000000121', '2025-10-22 14:34:29', '2025-10-22', 0, '1.00', 1),
(122, 'V0000000122', '2025-10-22 14:34:30', '2025-10-22', 0, '1.00', 1),
(123, 'V0000000123', '2025-10-22 14:34:31', '2025-10-22', 0, '1.00', 1),
(124, 'V0000000124', '2025-10-22 14:34:32', '2025-10-22', 0, '1.00', 1),
(125, 'V0000000125', '2025-10-22 14:34:33', '2025-10-22', 0, '1.00', 1),
(126, 'V0000000126', '2025-10-22 14:34:34', '2025-10-22', 0, '1.00', 1),
(127, 'V0000000127', '2025-10-22 14:34:35', '2025-10-22', 0, '1.00', 1),
(128, 'V0000000128', '2025-10-22 14:34:36', '2025-10-22', 0, '1.00', 1),
(129, 'V0000000129', '2025-10-22 14:34:37', '2025-10-22', 0, '1.00', 1),
(130, 'V0000000130', '2025-10-22 14:34:38', '2025-10-22', 0, '1.00', 1),
(131, 'V0000000131', '2025-10-22 14:34:39', '2025-10-22', 0, '1.00', 1),
(132, 'V0000000132', '2025-10-22 14:34:40', '2025-10-22', 0, '1.00', 1),
(133, 'V0000000133', '2025-10-22 14:34:41', '2025-10-22', 0, '1.00', 1),
(134, 'V0000000134', '2025-10-22 14:34:42', '2025-10-22', 0, '1.00', 1),
(135, 'V0000000135', '2025-10-22 14:34:43', '2025-10-22', 0, '1.00', 1),
(136, 'V0000000136', '2025-10-22 14:34:44', '2025-10-22', 0, '1.00', 1),
(137, 'V0000000137', '2025-10-22 14:34:46', '2025-10-22', 0, '1.00', 1),
(138, 'V0000000138', '2025-10-22 14:34:48', '2025-10-22', 0, '1.00', 1),
(139, 'V0000000139', '2025-10-22 14:34:49', '2025-10-22', 0, '1.00', 1),
(140, 'V0000000140', '2025-10-22 14:34:50', '2025-10-22', 0, '1.00', 1),
(141, 'V0000000141', '2025-10-22 14:34:51', '2025-10-22', 0, '1.00', 1),
(142, 'V0000000142', '2025-10-22 14:34:52', '2025-10-22', 0, '1.00', 1),
(143, 'V0000000143', '2025-10-22 14:34:53', '2025-10-22', 0, '1.00', 1),
(144, 'V0000000144', '2025-10-22 14:34:54', '2025-10-22', 0, '1.00', 1),
(145, 'V0000000145', '2025-10-22 14:34:56', '2025-10-22', 0, '1.00', 1),
(146, 'V0000000146', '2025-10-22 14:35:01', '2025-10-22', 0, '1.00', 1),
(147, 'V0000000147', '2025-10-22 14:35:02', '2025-10-22', 0, '1.00', 1),
(148, 'V0000000148', '2025-10-22 14:35:03', '2025-10-22', 0, '1.00', 1),
(149, 'V0000000149', '2025-10-22 14:35:04', '2025-10-22', 0, '1.00', 1),
(150, 'V0000000150', '2025-10-22 14:35:05', '2025-10-22', 0, '1.00', 1),
(151, 'V0000000151', '2025-10-22 14:35:05', '2025-10-22', 0, '1.00', 1),
(152, 'V0000000152', '2025-10-22 14:35:06', '2025-10-22', 0, '1.00', 1),
(153, 'V0000000153', '2025-10-22 14:35:07', '2025-10-22', 0, '1.00', 1),
(154, 'V0000000154', '2025-10-22 14:35:08', '2025-10-22', 0, '1.00', 1),
(155, 'V0000000155', '2025-10-22 14:35:09', '2025-10-22', 0, '1.00', 1),
(156, 'V0000000156', '2025-10-22 14:35:10', '2025-10-22', 0, '1.00', 1),
(157, 'V0000000157', '2025-10-22 14:35:11', '2025-10-22', 0, '1.00', 1),
(158, 'V0000000158', '2025-10-22 14:35:12', '2025-10-22', 0, '1.00', 1),
(159, 'V0000000159', '2025-10-22 14:35:13', '2025-10-22', 0, '1.00', 1),
(160, 'V0000000160', '2025-10-22 14:35:14', '2025-10-22', 0, '1.00', 1),
(161, 'V0000000161', '2025-10-22 14:35:15', '2025-10-22', 0, '1.00', 1),
(162, 'V0000000162', '2025-10-22 14:35:17', '2025-10-22', 0, '1.00', 1),
(163, 'V0000000163', '2025-10-22 14:35:17', '2025-10-22', 0, '1.00', 1),
(164, 'V0000000164', '2025-10-22 14:35:19', '2025-10-22', 0, '1.00', 1),
(165, 'V0000000165', '2025-10-22 14:35:21', '2025-10-22', 0, '1.00', 1),
(166, 'V0000000166', '2025-10-22 14:35:22', '2025-10-22', 0, '1.00', 1),
(167, 'V0000000167', '2025-10-22 14:35:23', '2025-10-22', 0, '1.00', 1),
(168, 'V0000000168', '2025-10-22 14:35:24', '2025-10-22', 0, '1.00', 1),
(169, 'V0000000169', '2025-10-22 14:35:25', '2025-10-22', 0, '1.00', 1),
(170, 'V0000000170', '2025-10-22 14:35:26', '2025-10-22', 0, '1.00', 1),
(171, 'V0000000171', '2025-10-22 14:35:27', '2025-10-22', 0, '1.00', 1),
(172, 'V0000000172', '2025-10-22 14:35:28', '2025-10-22', 0, '1.00', 1),
(173, 'V0000000173', '2025-10-22 14:35:29', '2025-10-22', 0, '1.00', 1),
(174, 'V0000000174', '2025-10-22 14:35:30', '2025-10-22', 0, '1.00', 1),
(175, 'V0000000175', '2025-10-22 14:35:31', '2025-10-22', 0, '1.00', 1),
(176, 'V0000000176', '2025-10-22 14:35:32', '2025-10-22', 0, '1.00', 1),
(177, 'V0000000177', '2025-10-22 14:35:33', '2025-10-22', 0, '1.00', 1),
(178, 'V0000000178', '2025-10-22 14:35:35', '2025-10-22', 0, '1.00', 1),
(179, 'V0000000179', '2025-10-22 14:35:36', '2025-10-22', 0, '1.00', 1),
(180, 'V0000000180', '2025-10-22 14:35:37', '2025-10-22', 0, '1.00', 1),
(181, 'V0000000181', '2025-10-22 14:35:38', '2025-10-22', 0, '1.00', 1),
(182, 'V0000000182', '2025-10-22 14:35:39', '2025-10-22', 0, '1.00', 1),
(183, 'V0000000183', '2025-10-22 14:35:40', '2025-10-22', 0, '1.00', 1),
(184, 'V0000000184', '2025-10-22 14:35:41', '2025-10-22', 0, '1.00', 1),
(185, 'V0000000185', '2025-10-22 14:35:42', '2025-10-22', 0, '1.00', 1),
(186, 'V0000000186', '2025-10-22 14:35:43', '2025-10-22', 0, '1.00', 1),
(187, 'V0000000187', '2025-10-22 14:35:44', '2025-10-22', 0, '1.00', 1),
(188, 'V0000000188', '2025-10-22 14:35:45', '2025-10-22', 0, '1.00', 1),
(189, 'V0000000189', '2025-10-22 14:35:46', '2025-10-22', 0, '1.00', 1),
(190, 'V0000000190', '2025-10-22 14:35:47', '2025-10-22', 0, '1.00', 1),
(191, 'V0000000191', '2025-10-22 14:35:48', '2025-10-22', 0, '1.00', 1),
(192, 'V0000000192', '2025-10-22 14:35:49', '2025-10-22', 0, '1.00', 1),
(193, 'V0000000193', '2025-10-22 14:35:50', '2025-10-22', 0, '1.00', 1),
(194, 'V0000000194', '2025-10-22 14:35:51', '2025-10-22', 0, '1.00', 1),
(195, 'V0000000195', '2025-10-22 14:35:52', '2025-10-22', 0, '1.00', 1),
(196, 'V0000000196', '2025-10-22 14:35:53', '2025-10-22', 0, '1.00', 1),
(197, 'V0000000197', '2025-10-22 14:35:54', '2025-10-22', 0, '1.00', 1),
(198, 'V0000000198', '2025-10-22 14:35:55', '2025-10-22', 0, '1.00', 1),
(199, 'V0000000199', '2025-10-22 14:35:56', '2025-10-22', 0, '1.00', 1),
(200, 'V0000000200', '2025-10-22 14:35:57', '2025-10-22', 0, '1.00', 1),
(201, 'V0000000201', '2025-10-22 14:35:58', '2025-10-22', 0, '1.00', 1),
(202, 'V0000000202', '2025-10-22 14:35:59', '2025-10-22', 0, '1.00', 1),
(203, 'V0000000203', '2025-10-22 14:36:00', '2025-10-22', 0, '1.00', 1),
(204, 'V0000000204', '2025-10-22 14:36:00', '2025-10-22', 0, '1.00', 1),
(205, 'V0000000205', '2025-10-22 14:36:02', '2025-10-22', 0, '1.00', 1),
(206, 'V0000000206', '2025-10-22 14:36:03', '2025-10-22', 0, '1.00', 1),
(207, 'V0000000207', '2025-10-22 14:36:04', '2025-10-22', 0, '1.00', 1),
(208, 'V0000000208', '2025-10-22 14:36:05', '2025-10-22', 0, '1.00', 1),
(209, 'V0000000209', '2025-10-22 14:36:06', '2025-10-22', 0, '1.00', 1),
(210, 'V0000000210', '2025-10-22 14:36:07', '2025-10-22', 0, '1.00', 1),
(211, 'V0000000211', '2025-10-22 14:36:08', '2025-10-22', 0, '1.00', 1),
(212, 'V0000000212', '2025-10-22 14:36:09', '2025-10-22', 0, '1.00', 1),
(213, 'V0000000213', '2025-10-22 14:36:10', '2025-10-22', 0, '1.00', 1),
(214, 'V0000000214', '2025-10-22 14:40:18', '2025-10-22', 0, '1.00', 1),
(215, 'V0000000215', '2025-10-22 14:40:37', '2025-10-22', 0, '1.00', 1),
(216, 'V0000000216', '2025-10-22 14:41:12', '2025-10-22', 0, '1.00', 1),
(217, 'V0000000217', '2025-10-22 14:42:41', '2025-10-22', 0, '1.00', 1),
(218, 'V0000000218', '2025-10-22 15:15:37', '2025-10-22', 0, '1.00', 1),
(219, 'V0000000219', '2025-10-22 15:47:48', '2025-10-22', 0, '1.00', 1),
(220, 'V0000000220', '2025-10-22 15:58:45', '2025-10-22', 0, '1.00', 1),
(221, 'V0000000221', '2025-10-22 16:03:35', '2025-10-22', 0, '1.00', 1),
(222, 'V0000000222', '2025-10-22 18:33:48', '2025-10-22', 0, '1.00', 1),
(223, 'V0000000223', '2025-10-22 18:40:18', '2025-10-22', 0, '1.00', 1),
(224, 'V0000000224', '2025-10-22 19:47:31', '2025-10-22', 0, '1.00', 1),
(225, 'V0000000225', '2025-10-22 19:49:12', '2025-10-22', 0, '1.00', 1),
(226, 'V0000000226', '2025-10-22 19:49:43', '2025-10-22', 0, '1.00', 1),
(227, 'V0000000227', '2025-10-22 19:50:12', '2025-10-22', 0, '1.00', 1),
(228, 'V0000000228', '2025-10-22 19:50:38', '2025-10-22', 0, '1.00', 1),
(229, 'V0000000229', '2025-10-22 19:50:52', '2025-10-22', 0, '1.00', 1),
(230, 'V0000000230', '2025-10-22 19:58:07', '2025-10-22', 0, '1.00', 1),
(231, 'V0000000231', '2025-10-22 19:58:07', '2025-10-22', 0, '1.00', 1),
(232, 'V0000000232', '2025-10-22 19:58:39', '2025-10-22', 0, '1.00', 1),
(233, 'V0000000233', '2025-10-22 19:58:43', '2025-10-22', 0, '1.00', 1),
(234, 'V0000000234', '2025-10-22 20:04:38', '2025-10-22', 0, '1.00', 1),
(235, 'V0000000235', '2025-10-22 20:04:51', '2025-10-22', 0, '1.00', 1),
(236, 'V0000000236', '2025-10-22 20:17:09', '2025-10-22', 0, '1.00', 1),
(237, 'V0000000237', '2025-10-22 20:17:09', '2025-10-22', 0, '1.00', 1),
(238, 'V0000000238', '2025-10-22 20:17:09', '2025-10-22', 0, '1.00', 1),
(239, 'V0000000239', '2025-10-22 20:30:21', '2025-10-22', 0, '1.00', 1),
(240, 'V0000000240', '2025-10-22 20:32:49', '2025-10-22', 0, '1.00', 1),
(241, 'V0000000241', '2025-10-22 21:07:29', '2025-10-22', 0, '1.00', 1),
(242, 'V0000000242', '2025-10-22 21:45:12', '2025-10-22', 0, '1.00', 1),
(243, 'V0000000243', '2025-10-22 21:45:58', '2025-10-22', 0, '1.00', 1),
(244, 'V0000000244', '2025-10-22 21:46:03', '2025-10-22', 0, '1.00', 1),
(245, 'V0000000245', '2025-10-22 21:46:37', '2025-10-22', 0, '1.00', 1),
(246, 'V0000000246', '2025-10-22 21:50:33', '2025-10-22', 0, '1.00', 1),
(247, 'V0000000247', '2025-10-22 21:50:57', '2025-10-22', 0, '1.00', 1),
(248, 'V0000000248', '2025-10-22 22:16:40', '2025-10-22', 0, '1.00', 1),
(249, 'V0000000249', '2025-10-22 23:08:11', '2025-10-22', 0, '1.00', 1),
(250, 'V0000000250', '2025-10-22 23:08:40', '2025-10-22', 0, '1.00', 1),
(251, 'V0000000251', '2025-10-22 23:10:45', '2025-10-22', 0, '1.00', 1),
(252, 'V0000000252', '2025-10-22 23:14:08', '2025-10-22', 0, '1.00', 1),
(253, 'V0000000253', '2025-10-22 23:14:09', '2025-10-22', 0, '1.00', 1),
(254, 'V0000000254', '2025-10-22 23:14:13', '2025-10-22', 0, '1.00', 1),
(255, 'V0000000255', '2025-10-22 23:14:13', '2025-10-22', 0, '1.00', 1),
(256, 'V0000000256', '2025-10-22 23:14:20', '2025-10-22', 0, '1.00', 1),
(257, 'V0000000257', '2025-10-22 23:14:59', '2025-10-22', 0, '1.00', 1),
(258, 'V0000000258', '2025-10-22 23:15:00', '2025-10-22', 0, '1.00', 1),
(259, 'V0000000259', '2025-10-22 23:15:02', '2025-10-22', 0, '1.00', 1),
(260, 'V0000000260', '2025-10-22 23:15:03', '2025-10-22', 0, '1.00', 1),
(261, 'V0000000261', '2025-10-22 23:15:05', '2025-10-22', 0, '1.00', 1),
(262, 'V0000000262', '2025-10-22 23:15:06', '2025-10-22', 0, '1.00', 1),
(263, 'V0000000263', '2025-10-22 23:15:07', '2025-10-22', 0, '1.00', 1),
(264, 'V0000000264', '2025-10-22 23:15:08', '2025-10-22', 0, '1.00', 1),
(265, 'V0000000265', '2025-10-22 23:16:21', '2025-10-22', 0, '1.00', 1),
(266, 'V0000000266', '2025-10-22 23:20:34', '2025-10-22', 0, '1.00', 1),
(267, 'V0000000267', '2025-10-22 23:20:34', '2025-10-22', 0, '1.00', 1),
(268, 'V0000000268', '2025-10-22 23:52:00', '2025-10-22', 0, '1.00', 1),
(269, 'V0000000269', '2025-10-22 23:54:05', '2025-10-22', 0, '1.00', 1),
(270, 'V0000000270', '2025-10-23 00:16:19', '2025-10-23', 0, '1.00', 1),
(271, 'V0000000271', '2025-10-23 00:32:05', '2025-10-23', 0, '1.00', 1),
(272, 'V0000000272', '2025-10-23 00:32:05', '2025-10-23', 0, '1.00', 1),
(273, 'V0000000273', '2025-10-23 00:32:25', '2025-10-23', 0, '1.00', 1),
(274, 'V0000000274', '2025-10-23 00:45:44', '2025-10-23', 0, '1.00', 1),
(275, 'V0000000275', '2025-10-23 00:51:29', '2025-10-23', 0, '1.00', 1),
(276, 'V0000000276', '2025-10-23 00:51:29', '2025-10-23', 0, '1.00', 1),
(277, 'V0000000277', '2025-10-23 00:51:58', '2025-10-23', 0, '1.00', 1),
(278, 'V0000000278', '2025-10-23 00:54:14', '2025-10-23', 0, '1.00', 1),
(279, 'V0000000279', '2025-10-23 01:00:12', '2025-10-23', 0, '1.00', 1),
(280, 'V0000000280', '2025-10-23 01:01:04', '2025-10-23', 0, '1.00', 1),
(281, 'V0000000281', '2025-10-23 01:02:05', '2025-10-23', 0, '1.00', 1),
(282, 'V0000000282', '2025-10-23 01:26:02', '2025-10-23', 0, '1.00', 1),
(283, 'V0000000283', '2025-10-23 02:14:25', '2025-10-23', 0, '1.00', 1),
(284, 'V0000000284', '2025-10-23 02:14:25', '2025-10-23', 0, '1.00', 1),
(285, 'V0000000285', '2025-10-23 03:01:25', '2025-10-23', 0, '1.00', 1),
(286, 'V0000000286', '2025-10-23 03:02:17', '2025-10-23', 0, '1.00', 1),
(287, 'V0000000287', '2025-10-23 03:18:20', '2025-10-23', 0, '1.00', 1),
(288, 'V0000000288', '2025-10-23 03:18:20', '2025-10-23', 0, '1.00', 1),
(289, 'V0000000289', '2025-10-23 03:18:33', '2025-10-23', 0, '1.00', 1),
(290, 'V0000000290', '2025-10-23 03:45:36', '2025-10-23', 0, '1.00', 1),
(291, 'V0000000291', '2025-10-23 03:46:02', '2025-10-23', 0, '1.00', 1),
(292, 'V0000000292', '2025-10-23 03:54:07', '2025-10-23', 0, '1.00', 1),
(293, 'V0000000293', '2025-10-23 03:55:11', '2025-10-23', 0, '1.00', 1),
(294, 'V0000000294', '2025-10-23 04:10:16', '2025-10-23', 0, '1.00', 1),
(295, 'V0000000295', '2025-10-23 04:10:18', '2025-10-23', 0, '1.00', 1),
(296, 'V0000000296', '2025-10-23 04:19:09', '2025-10-23', 0, '1.00', 1),
(297, 'V0000000297', '2025-10-23 04:33:55', '2025-10-23', 0, '1.00', 1),
(298, 'V0000000298', '2025-10-23 04:33:56', '2025-10-23', 0, '1.00', 1),
(299, 'V0000000299', '2025-10-23 05:05:20', '2025-10-23', 0, '1.00', 1),
(300, 'V0000000300', '2025-10-23 05:06:51', '2025-10-23', 0, '1.00', 1),
(301, 'V0000000301', '2025-10-23 06:32:50', '2025-10-23', 0, '1.00', 1),
(302, 'V0000000302', '2025-10-23 08:16:00', '2025-10-23', 0, '1.00', 1),
(303, 'V0000000303', '2025-10-23 08:47:00', '2025-10-23', 0, '1.00', 1),
(304, 'V0000000304', '2025-10-23 08:47:09', '2025-10-23', 0, '1.00', 1),
(305, 'V0000000305', '2025-10-23 08:48:20', '2025-10-23', 0, '1.00', 1),
(306, 'V0000000306', '2025-10-23 08:49:25', '2025-10-23', 0, '1.00', 1),
(307, 'V0000000307', '2025-10-23 09:13:23', '2025-10-23', 0, '1.00', 1),
(308, 'V0000000308', '2025-10-23 09:13:36', '2025-10-23', 0, '1.00', 1),
(309, 'V0000000309', '2025-10-23 09:16:15', '2025-10-23', 0, '1.00', 1),
(310, 'V0000000310', '2025-10-23 09:27:49', '2025-10-23', 0, '1.00', 1),
(311, 'V0000000311', '2025-10-23 09:40:38', '2025-10-23', 0, '1.00', 1),
(312, 'V0000000312', '2025-10-23 09:48:28', '2025-10-23', 0, '1.00', 1),
(313, 'V0000000313', '2025-10-23 09:54:21', '2025-10-23', 0, '1.00', 1),
(314, 'V0000000314', '2025-10-23 09:54:35', '2025-10-23', 0, '1.00', 1),
(315, 'V0000000315', '2025-10-23 09:54:40', '2025-10-23', 0, '1.00', 1),
(316, 'V0000000316', '2025-10-23 09:54:51', '2025-10-23', 0, '1.00', 1),
(317, 'V0000000317', '2025-10-23 12:17:23', '2025-10-23', 0, '1.00', 1),
(318, 'V0000000318', '2025-10-23 12:32:40', '2025-10-23', 0, '1.00', 1),
(319, 'V0000000319', '2025-10-23 13:03:26', '2025-10-23', 0, '1.00', 1),
(320, 'V0000000320', '2025-10-23 13:04:34', '2025-10-23', 0, '1.00', 1),
(321, 'V0000000321', '2025-10-23 13:05:44', '2025-10-23', 0, '1.00', 1),
(322, 'V0000000322', '2025-10-23 13:21:46', '2025-10-23', 0, '1.00', 1),
(323, 'V0000000323', '2025-10-23 13:45:55', '2025-10-23', 0, '1.00', 1),
(324, 'V0000000324', '2025-10-23 13:53:52', '2025-10-23', 0, '1.00', 1),
(325, 'V0000000325', '2025-10-23 14:02:44', '2025-10-23', 0, '1.00', 1),
(326, 'V0000000326', '2025-10-23 14:04:12', '2025-10-23', 0, '1.00', 1),
(327, 'V0000000327', '2025-10-23 14:04:14', '2025-10-23', 0, '1.00', 1),
(328, 'V0000000328', '2025-10-23 14:17:32', '2025-10-23', 0, '1.00', 1),
(329, 'V0000000329', '2025-10-23 14:37:24', '2025-10-23', 0, '1.00', 1),
(330, 'V0000000330', '2025-10-23 14:37:50', '2025-10-23', 0, '1.00', 1),
(331, 'V0000000331', '2025-10-23 14:38:14', '2025-10-23', 0, '1.00', 1),
(332, 'V0000000332', '2025-10-23 14:38:30', '2025-10-23', 0, '1.00', 1),
(333, 'V0000000333', '2025-10-23 15:07:06', '2025-10-23', 0, '1.00', 1),
(334, 'V0000000334', '2025-10-23 15:18:17', '2025-10-23', 0, '1.00', 1),
(335, 'V0000000335', '2025-10-23 15:27:55', '2025-10-23', 0, '1.00', 1),
(336, 'V0000000336', '2025-10-23 15:27:55', '2025-10-23', 0, '1.00', 1),
(337, 'V0000000337', '2025-10-23 15:27:55', '2025-10-23', 0, '1.00', 1),
(338, 'V0000000338', '2025-10-23 15:27:55', '2025-10-23', 0, '1.00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aux_iconos_agrups`
--
ALTER TABLE `aux_iconos_agrups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aux_novs_del_sitio`
--
ALTER TABLE `aux_novs_del_sitio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aux_status_registros`
--
ALTER TABLE `aux_status_registros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `cartas_idiomas`
--
ALTER TABLE `cartas_idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartas_lugares`
--
ALTER TABLE `cartas_lugares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartas_personajes`
--
ALTER TABLE `cartas_personajes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cont_1encab_articulos`
--
ALTER TABLE `cont_1encab_articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`) USING BTREE,
  ADD KEY `encabezadoSeccionNivel2` (`tema_id`),
  ADD KEY `encabezadoSeccionNivel3` (`pestana_id`);

--
-- Indexes for table `cont_1encab_cartas`
--
ALTER TABLE `cont_1encab_cartas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`),
  ADD KEY `cartasEncabezado_idioma` (`idioma_id`),
  ADD KEY `cartasEncabezado_usuario` (`usuario_id`),
  ADD KEY `cartasEncabezado_desdePersonaje` (`nombreDesde_id`),
  ADD KEY `cartasEncabezado_haciaPersonaje` (`nombreHacia_id`),
  ADD KEY `cartasEncabezado_lugar` (`lugar_id`);

--
-- Indexes for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encabezadoArticulo` (`encabArtic_id`),
  ADD KEY `encabezadoCarta` (`encabCarta_id`);

--
-- Indexes for table `cont_3carrousel`
--
ALTER TABLE `cont_3carrousel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arrouselContenido` (`contenido_id`);

--
-- Indexes for table `nivel1_secciones`
--
ALTER TABLE `nivel1_secciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nivel2_temas`
--
ALTER TABLE `nivel2_temas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `nivel2_1` (`seccion_id`);

--
-- Indexes for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `nivel3_2` (`tema_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `us_generos`
--
ALTER TABLE `us_generos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_roles`
--
ALTER TABLE `us_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_status_registros`
--
ALTER TABLE `us_status_registros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_usuarios`
--
ALTER TABLE `us_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `visita_id` (`cliente_id`),
  ADD KEY `rol_usuario_id` (`rolUsuario_id`) USING BTREE,
  ADD KEY `sexo_id` (`genero_id`) USING BTREE,
  ADD KEY `status_registro_id` (`statusRegistro_id`) USING BTREE;

--
-- Indexes for table `us_visitas`
--
ALTER TABLE `us_visitas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cliente_id` (`cliente_id`),
  ADD KEY `rolUsuario_id` (`rolUsuario_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aux_iconos_agrups`
--
ALTER TABLE `aux_iconos_agrups`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `aux_novs_del_sitio`
--
ALTER TABLE `aux_novs_del_sitio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aux_status_registros`
--
ALTER TABLE `aux_status_registros`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cartas_idiomas`
--
ALTER TABLE `cartas_idiomas`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cartas_lugares`
--
ALTER TABLE `cartas_lugares`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cartas_personajes`
--
ALTER TABLE `cartas_personajes`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cont_1encab_articulos`
--
ALTER TABLE `cont_1encab_articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cont_1encab_cartas`
--
ALTER TABLE `cont_1encab_cartas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cont_3carrousel`
--
ALTER TABLE `cont_3carrousel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nivel1_secciones`
--
ALTER TABLE `nivel1_secciones`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nivel2_temas`
--
ALTER TABLE `nivel2_temas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `us_roles`
--
ALTER TABLE `us_roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `us_status_registros`
--
ALTER TABLE `us_status_registros`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `us_usuarios`
--
ALTER TABLE `us_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `us_visitas`
--
ALTER TABLE `us_visitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cont_1encab_articulos`
--
ALTER TABLE `cont_1encab_articulos`
  ADD CONSTRAINT `encabezadoSeccionNivel2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`),
  ADD CONSTRAINT `encabezadoSeccionNivel3` FOREIGN KEY (`pestana_id`) REFERENCES `nivel3_pestanas` (`id`),
  ADD CONSTRAINT `encabezadoStatusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`);

--
-- Constraints for table `cont_1encab_cartas`
--
ALTER TABLE `cont_1encab_cartas`
  ADD CONSTRAINT `cartasEncabezado_desdePersonaje` FOREIGN KEY (`nombreDesde_id`) REFERENCES `cartas_personajes` (`id`),
  ADD CONSTRAINT `cartasEncabezado_haciaPersonaje` FOREIGN KEY (`nombreHacia_id`) REFERENCES `cartas_personajes` (`id`),
  ADD CONSTRAINT `cartasEncabezado_idioma` FOREIGN KEY (`idioma_id`) REFERENCES `cartas_idiomas` (`id`),
  ADD CONSTRAINT `cartasEncabezado_lugar` FOREIGN KEY (`lugar_id`) REFERENCES `cartas_lugares` (`id`),
  ADD CONSTRAINT `cartasEncabezado_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`),
  ADD CONSTRAINT `cartasEncabezado_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `us_usuarios` (`id`);

--
-- Constraints for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  ADD CONSTRAINT `encabezadoArticulo` FOREIGN KEY (`encabArtic_id`) REFERENCES `cont_1encab_articulos` (`id`),
  ADD CONSTRAINT `encabezadoCarta` FOREIGN KEY (`encabCarta_id`) REFERENCES `cont_1encab_cartas` (`id`);

--
-- Constraints for table `cont_3carrousel`
--
ALTER TABLE `cont_3carrousel`
  ADD CONSTRAINT `arrouselContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`);

--
-- Constraints for table `nivel2_temas`
--
ALTER TABLE `nivel2_temas`
  ADD CONSTRAINT `nivel2_1` FOREIGN KEY (`seccion_id`) REFERENCES `nivel1_secciones` (`id`);

--
-- Constraints for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  ADD CONSTRAINT `nivel3_2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`);

--
-- Constraints for table `us_usuarios`
--
ALTER TABLE `us_usuarios`
  ADD CONSTRAINT `us_usuarios_genero` FOREIGN KEY (`genero_id`) REFERENCES `us_generos` (`id`),
  ADD CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rolUsuario_id`) REFERENCES `us_roles` (`id`),
  ADD CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
