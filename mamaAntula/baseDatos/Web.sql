-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2025 at 06:11 PM
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

DROP DATABASE IF EXISTS `ma_bd`;
CREATE DATABASE IF NOT EXISTS `ma_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ma_bd`;

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
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_iconos_agrups`
--

INSERT INTO `aux_iconos_agrups` (`id`, `orden`, `nombre`, `clase`, `link`, `grupo`, `edicion`, `revision`, `admin`) VALUES
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
-- Table structure for table `aux_paises`
--

CREATE TABLE `aux_paises` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `continente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_paises`
--

INSERT INTO `aux_paises` (`id`, `nombre`, `continente`) VALUES
('AD', 'Andorra', 'Europa'),
('AE', 'Emiratos Árabes Unidos', 'Asia'),
('AF', 'Afganistán', 'Asia'),
('AG', 'Antigua y Barbuda', 'América'),
('AI', 'Anguila', 'América'),
('AL', 'Albania', 'Europa'),
('AM', 'Armenia', 'Asia'),
('AO', 'Angola', 'Africa'),
('AQ', 'Antártida', 'Polar'),
('AR', 'Argentina', 'América'),
('AS', 'Samoa Americana', 'Oceanía'),
('AT', 'Austria', 'Europa'),
('AU', 'Australia', 'Oceanía'),
('AW', 'Aruba', 'América'),
('AX', 'Aland', 'Europa'),
('AZ', 'Azerbaiyán', 'Asia'),
('BA', 'Bosnia y Herzegovina', 'Europa'),
('BB', 'Barbados', 'América'),
('BD', 'Bangladés', 'Asia'),
('BE', 'Bélgica', 'Europa'),
('BF', 'Burkina Faso', 'Africa'),
('BG', 'Bulgaria', 'Europa'),
('BH', 'Baréin', 'Asia'),
('BI', 'Burundi', 'Africa'),
('BJ', 'Benín', 'Africa'),
('BL', 'San Bartolomé', 'América'),
('BM', 'Bermudas', 'América'),
('BN', 'Brunéi', 'Asia'),
('BO', 'Bolivia', 'América'),
('BQ', 'Bonaire, San Eustaquio y Saba', 'América'),
('BR', 'Brasil', 'América'),
('BS', 'Bahamas', 'América'),
('BT', 'Bután', 'Asia'),
('BV', 'Isla Bouvet', 'Polar'),
('BW', 'Botswana', 'Africa'),
('BY', 'Bielorrusia', 'Europa'),
('BZ', 'Belice', 'América'),
('CA', 'Canadá', 'América'),
('CC', 'Islas Cocos', 'Oceanía'),
('CD', 'Congo', 'Africa'),
('CF', 'República Centroafricana', 'Africa'),
('CG', 'República del Congo', 'Africa'),
('CH', 'Suiza', 'Europa'),
('CI', 'Costa de Marfil', 'Africa'),
('CK', 'Islas Cook', 'Oceanía'),
('CL', 'Chile', 'América'),
('CM', 'Camerún', 'Africa'),
('CN', 'China', 'Asia'),
('CO', 'Colombia', 'América'),
('CR', 'Costa Rica', 'América'),
('CU', 'Cuba', 'América'),
('CV', 'Cabo Verde', 'Africa'),
('CW', 'Curazao', 'América'),
('CX', 'Isla de Navidad', 'Oceanía'),
('CY', 'Chipre', 'Europa'),
('CZ', 'República Checa', 'Europa'),
('DE', 'Alemania', 'Europa'),
('DJ', 'Yibuti', 'Africa'),
('DK', 'Dinamarca', 'Europa'),
('DM', 'Dominica', 'América'),
('DO', 'República Dominicana', 'América'),
('DZ', 'Argelia', 'Africa'),
('EC', 'Ecuador', 'América'),
('EE', 'Estonia', 'Europa'),
('EG', 'Egipto', 'Africa'),
('EH', 'República Árabe Saharaui', 'Africa'),
('ER', 'Eritrea', 'Africa'),
('ES', 'España', 'Europa'),
('ET', 'Etiopía', 'Africa'),
('FI', 'Finlandia', 'Europa'),
('FJ', 'Fiyi', 'Oceanía'),
('FK', 'Islas Malvinas', 'América'),
('FM', 'Micronesia', 'Oceanía'),
('FO', 'Islas Feroe', 'Europa'),
('FR', 'Francia', 'Europa'),
('GA', 'Gabón', 'Africa'),
('GB', 'Reino Unido', 'Europa'),
('GD', 'Granada', 'América'),
('GE', 'Georgia', 'Asia'),
('GF', 'Guayana Francesa', 'América'),
('GG', 'Guernsey', 'Europa'),
('GH', 'Ghana', 'Africa'),
('GI', 'Gibraltar', 'Europa'),
('GL', 'Groenlandia', 'América'),
('GM', 'Gambia', 'Africa'),
('GN', 'Guinea', 'Africa'),
('GP', 'Guadalupe', 'América'),
('GQ', 'Guinea Ecuatorial', 'Africa'),
('GR', 'Grecia', 'Europa'),
('GS', 'Islas Georgias del Sur', 'América'),
('GT', 'Guatemala', 'América'),
('GU', 'Guam', 'Oceanía'),
('GW', 'Guinea-Bisáu', 'Africa'),
('GY', 'Guyana', 'América'),
('HK', 'Hong Kong', 'Asia'),
('HM', 'Islas Heard y McDonald', 'Oceanía'),
('HN', 'Honduras', 'América'),
('HR', 'Croacia', 'Europa'),
('HT', 'Haití', 'América'),
('HU', 'Hungría', 'Europa'),
('ID', 'Indonesia', 'Asia'),
('IE', 'Irlanda', 'Europa'),
('IL', 'Israel', 'Asia'),
('IM', 'Isla de Man', 'Europa'),
('IN', 'India', 'Asia'),
('IO', 'Territorio Británico Índico', 'Africa'),
('IQ', 'Irak', 'Asia'),
('IR', 'Irán', 'Asia'),
('IS', 'Islandia', 'Europa'),
('IT', 'Italia', 'Europa'),
('JE', 'Jersey', 'Europa'),
('JM', 'Jamaica', 'América'),
('JO', 'Jordania', 'Asia'),
('JP', 'Japón', 'Asia'),
('KE', 'Kenia', 'Africa'),
('KG', 'Kirguistán', 'Asia'),
('KH', 'Camboya', 'Asia'),
('KI', 'Kiribati', 'Oceanía'),
('KM', 'Comoras', 'Africa'),
('KN', 'San Cristóbal y Nieves', 'América'),
('KP', 'Corea del Norte', 'Asia'),
('KR', 'Corea del Sur', 'Asia'),
('KW', 'Kuwait', 'Asia'),
('KY', 'Islas Caimán', 'América'),
('KZ', 'Kazajistán', 'Asia'),
('LA', 'Laos', 'Asia'),
('LB', 'Líbano', 'Asia'),
('LC', 'Santa Lucía', 'América'),
('LI', 'Liechtenstein', 'Europa'),
('LK', 'Sri Lanka', 'Asia'),
('LR', 'Liberia', 'Africa'),
('LS', 'Lesoto', 'Africa'),
('LT', 'Lituania', 'Europa'),
('LU', 'Luxemburgo', 'Europa'),
('LV', 'Letonia', 'Europa'),
('LY', 'Libia', 'Africa'),
('MA', 'Marruecos', 'Africa'),
('MC', 'Mónaco', 'Europa'),
('MD', 'Moldavia', 'Europa'),
('ME', 'Montenegro', 'Europa'),
('MF', 'San Martín', 'América'),
('MG', 'Madagascar', 'Africa'),
('MH', 'Islas Marshall', 'Oceanía'),
('MK', 'Macedonia del Norte', 'Europa'),
('ML', 'Malí', 'Africa'),
('MM', 'Myanmar', 'Asia'),
('MN', 'Mongolia', 'Asia'),
('MO', 'Macao', 'Asia'),
('MP', 'Islas Marianas del Norte', 'Oceanía'),
('MQ', 'Martinica', 'América'),
('MR', 'Mauritania', 'Africa'),
('MS', 'Montserrat', 'América'),
('MT', 'Malta', 'Europa'),
('MU', 'Mauricio', 'Africa'),
('MV', 'Maldivas', 'Asia'),
('MW', 'Malaui', 'Africa'),
('MX', 'México', 'América'),
('MY', 'Malasia', 'Asia'),
('MZ', 'Mozambique', 'Africa'),
('NA', 'Namibia', 'Africa'),
('NC', 'Nueva Caledonia', 'Oceanía'),
('NE', 'Níger', 'Africa'),
('NF', 'Isla Norfolk', 'Oceanía'),
('NG', 'Nigeria', 'Africa'),
('NI', 'Nicaragua', 'América'),
('NL', 'Países Bajos', 'Europa'),
('NN', 'Desconocido', 'Ninguno'),
('NO', 'Noruega', 'Europa'),
('NP', 'Nepal', 'Asia'),
('NR', 'Nauru', 'Oceanía'),
('NU', 'Niue', 'Oceanía'),
('NZ', 'Nueva Zelanda', 'Oceanía'),
('OM', 'Omán', 'Asia'),
('PA', 'Panamá', 'América'),
('PE', 'Perú', 'América'),
('PF', 'Polinesia Francesa', 'Oceanía'),
('PG', 'Papúa Nueva Guinea', 'Oceanía'),
('PH', 'Filipinas', 'Asia'),
('PK', 'Pakistán', 'Asia'),
('PL', 'Polonia', 'Europa'),
('PM', 'San Pedro y Miquelón', 'América'),
('PN', 'Islas Pitcairn', 'Oceanía'),
('PR', 'Puerto Rico', 'América'),
('PS', 'Palestina', 'Asia'),
('PT', 'Portugal', 'Europa'),
('PW', 'Palaos', 'Oceanía'),
('PY', 'Paraguay', 'América'),
('QA', 'Catar', 'Asia'),
('RE', 'Reunión', 'Africa'),
('RO', 'Rumania', 'Europa'),
('RS', 'Serbia', 'Europa'),
('RU', 'Rusia', 'Europa'),
('RW', 'Ruanda', 'Africa'),
('SA', 'Arabia Saudita', 'Asia'),
('SB', 'Islas Salomón', 'Oceanía'),
('SC', 'Seychelles', 'Africa'),
('SD', 'Sudán', 'Africa'),
('SE', 'Suecia', 'Europa'),
('SG', 'Singapur', 'Asia'),
('SH', 'Santa Elena', 'Africa'),
('SI', 'Eslovenia', 'Europa'),
('SJ', 'Svalbard y Jan Mayen', 'Europa'),
('SK', 'Eslovaquia', 'Europa'),
('SL', 'Sierra Leona', 'Africa'),
('SM', 'San Marino', 'Europa'),
('SN', 'Senegal', 'Africa'),
('SO', 'Somalia', 'Africa'),
('SR', 'Surinam', 'América'),
('SS', 'Sudán del Sur', 'Africa'),
('ST', 'Santo Tomé y Príncipe', 'Africa'),
('SV', 'El Salvador', 'América'),
('SX', 'San Martín', 'América'),
('SY', 'Siria', 'Asia'),
('SZ', 'Suazilandia', 'Africa'),
('TC', 'Islas Turcas y Caicos', 'América'),
('TD', 'Chad', 'Africa'),
('TF', 'Tierras Antárticas Francesas', 'Africa'),
('TG', 'Togo', 'Africa'),
('TH', 'Tailandia', 'Asia'),
('TJ', 'Tayikistán', 'Asia'),
('TK', 'Tokelau', 'Oceanía'),
('TL', 'Timor Oriental', 'Asia'),
('TM', 'Turkmenistán', 'Asia'),
('TN', 'Túnez', 'Africa'),
('TO', 'Tonga', 'Oceanía'),
('TR', 'Turquía', 'Asia'),
('TT', 'Trinidad y Tobago', 'América'),
('TV', 'Tuvalu', 'Oceanía'),
('TW', 'Taiwán', 'Asia'),
('TZ', 'Tanzania', 'Africa'),
('UA', 'Ucrania', 'Europa'),
('UG', 'Uganda', 'Africa'),
('UM', 'Islas Menores de EE.UU.', 'América'),
('US', 'Estados Unidos', 'América'),
('UY', 'Uruguay', 'América'),
('UZ', 'Uzbekistán', 'Asia'),
('VA', 'Ciudad del Vaticano', 'Europa'),
('VC', 'San Vicente y las Granadinas', 'América'),
('VE', 'Venezuela', 'América'),
('VG', 'Islas Vírgenes Británicas', 'América'),
('VI', 'Islas Vírgenes de EE.UU.', 'América'),
('VN', 'Vietnam', 'Asia'),
('VU', 'Vanuatu', 'Oceanía'),
('WF', 'Wallis y Futuna', 'Oceanía'),
('WS', 'Samoa', 'Oceanía'),
('XK', 'República de Kosovo', 'Europa'),
('YE', 'Yemen', 'Asia'),
('YT', 'Mayotte', 'Africa'),
('ZA', 'Sudáfrica', 'Africa'),
('ZM', 'Zambia', 'Africa'),
('ZW', 'Zimbabue', 'Africa');

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
(11, 3, 4, 'Frases destacadas', 'frasesDestacadas', 0),
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
('-RWAOPNHvbCp0W1M17QdUoi-h04MDofI', 1763465138, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T11:25:37.710Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":903,\"cliente_id\":\"V0000000903\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('-fT0iwyi1HOqE2U1ELoCaquIXy3RHnii', 1763482808, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T16:20:08.038Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":913,\"cliente_id\":\"V0000000913\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('0_kVqYggouuOE73ZxFoWUAooBJcKlJTr', 1763443479, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:38.840Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":806,\"cliente_id\":\"V0000000806\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('0o6jcTB1FgNDBnMsFGkVWw7ZIzD9wypg', 1763443480, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:40.070Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":807,\"cliente_id\":\"V0000000807\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('0pyQ2BvGAAFw1EwSOfyOhyVLSTKpjAWZ', 1763443452, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:12.129Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":792,\"cliente_id\":\"V0000000792\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('1dMQFJrLvH3z909EqyTs7SyK4mO1NWXE', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:55.303Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":861,\"cliente_id\":\"V0000000861\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('2-1wvKQ-vbeSjFMEPSXM5sTDVZNNsWsB', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:55.058Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":860,\"cliente_id\":\"V0000000860\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('2Ooc3CS5KfF8jYGc9IPp5RrhK-XNFCIi', 1763444736, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:35.806Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":877,\"cliente_id\":\"V0000000877\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('2UqAVMFvumru_jkdB1Q6IZDe7mGkd5XW', 1763463316, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T10:55:16.327Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":901,\"cliente_id\":\"V0000000901\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('2jXL40F5u3GVDu4Np8rU0caE__dwhQ90', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.718Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":894,\"cliente_id\":\"V0000000894\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('2wtc79Z7ZRj1pDHufrKmPrbaH8bTH1AI', 1763444764, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.002Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":889,\"cliente_id\":\"V0000000889\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('4AJiNFc3Ah3PvYFI3exN7iRRCM-HX2Se', 1763444692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:51.804Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":852,\"cliente_id\":\"V0000000852\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('4BU2M5SxBv9Uhme0wIIQHCmetPNZreho', 1763443503, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:02.914Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":821,\"cliente_id\":\"V0000000821\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('54vSwcG6-FYWPE3bChhj9LLGZBMA9lmA', 1763443507, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:07.188Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":837,\"cliente_id\":\"V0000000837\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('5Arzpl1do994tnZcf0qdaO52UCLCxvjZ', 1763444736, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:35.819Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":878,\"cliente_id\":\"V0000000878\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('5eUVKrgLYV0GS59EDAUtd0Ho87_89nGo', 1763443490, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:49.833Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":810,\"cliente_id\":\"V0000000810\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('5tcBoUSIACPkADE-QQTVOskf_Bbp6Ib5', 1763444694, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:54.387Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":855,\"cliente_id\":\"V0000000855\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('77pBMeqKQkfwiP7l_PJ5HeNdeEaPlinK', 1763489500, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T18:11:40.207Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":916,\"cliente_id\":\"V0000000916\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('8OOorIbStTe5O7fqFhmWuGs3gqqlAjLe', 1763444697, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:56.519Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":864,\"cliente_id\":\"V0000000864\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('8wybUVDsSrN1SAoQ5KsVoiYJSng7B-Rj', 1763491735, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T18:48:55.254Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":917,\"cliente_id\":\"V0000000917\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('9UIdvzP2LHgd_EvdkgXEcRRoXEr-GZST', 1763482534, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T16:15:34.046Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":911,\"cliente_id\":\"V0000000911\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('9UfWtXjMiF65OjJOspE-CwFWJZewg1f4', 1763445229, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:53:49.203Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":898,\"cliente_id\":\"V0000000898\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('9bBmWEzXBI4Ad4EU0XdDaDlf6k1J6gxp', 1763444692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:51.759Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":851,\"cliente_id\":\"V0000000851\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('AUFdBOtK636bKBkxYFHpcYCNdy8ftWw-', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.620Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":893,\"cliente_id\":\"V0000000893\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('AzOft6WmRnGP1s2RPmlbBElvvvxM0zbn', 1763444675, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:35.010Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":838,\"cliente_id\":\"V0000000838\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('BN6aySDp6L6h9rFa1TknYmCJQUtnE_Og', 1763444691, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.751Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":845,\"cliente_id\":\"V0000000845\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Bmm_t0FP1_6B4x3QwZ0JpEYU-E3sVqCD', 1763444726, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:26.194Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":871,\"cliente_id\":\"V0000000871\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('CwhjPJfZbRTkJNpf-CuRWK5yNaD6O-Kx', 1763444756, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:56.486Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":883,\"cliente_id\":\"V0000000883\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('DQ7b6dc42NvZiHXQERUxjXJoLqlj4S4i', 1763443503, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:03.148Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":822,\"cliente_id\":\"V0000000822\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('DW53fgw6llaciaLIO-ehpV6Yl2xmdlAE', 1763443491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.499Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":815,\"cliente_id\":\"V0000000815\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Dp7LhyBu3bFo0Fd2_BMyTv7oHA4T6-lI', 1763482362, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T16:12:42.300Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":910,\"cliente_id\":\"V0000000910\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('FmdOIW6zmxZP2C7QGKuMbDSTwTMGfWL_', 1763443438, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:23:58.194Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":790,\"cliente_id\":\"V0000000790\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('GPn0vcDpxSvxoS8ExeKOgQkr4zx8yCup', 1763444764, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:03.916Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":888,\"cliente_id\":\"V0000000888\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('GZBBiBNclomOE2HicWT6Bn6NXjjgwU5r', 1763443505, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-11-18T05:25:04.838Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":829,\"cliente_id\":\"V0000000829\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('GkQrcQGHeeCpR_K39CplIGf85kFhMBGy', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.772Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":895,\"cliente_id\":\"V0000000895\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('HMhNWVLAiKqFTqVZXiPCwItFsqx9-iOz', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.551Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":797,\"cliente_id\":\"V0000000797\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Hkrtb8WpFtSAmV07bKc5KZ8gDn1H03w_', 1763444755, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:55.255Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":882,\"cliente_id\":\"V0000000882\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('IZtyjMfe-PgbtZIReTYvWybigs7hCiqa', 1763443438, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:23:58.119Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":789,\"cliente_id\":\"V0000000789\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Icd5S06ntP-CZA3IF96NdkLiij81wreK', 1763443478, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:37.785Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":804,\"cliente_id\":\"V0000000804\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('IqwIP_017p7spK7bzu0MxBMXSmSDN4qS', 1763443505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:04.658Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":828,\"cliente_id\":\"V0000000828\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('JdB_l61gWPeHic4VWjA1Aha3K2Te7zxQ', 1763463246, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T10:54:05.880Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":899,\"cliente_id\":\"V0000000899\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Je1dO2_ChXZ2HVrDagbL0UlU8rynM0aw', 1763443397, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:23:16.804Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":787,\"cliente_id\":\"V0000000787\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('K69xx8SV4Qi-JA_oDGaEtx5senl4Ex1W', 1763444691, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.780Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":847,\"cliente_id\":\"V0000000847\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('KM8l3O29R6rliUu_5ItngNiPtTIwjBtK', 1763482801, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T16:20:01.029Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":912,\"cliente_id\":\"V0000000912\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Kq3a521PziQeM3SMz0ly68v-TQ5v7fZB', 1763443492, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.537Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":817,\"cliente_id\":\"V0000000817\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Kt5FDXcT-3_L3b_fFgFHq31vAM1A496b', 1763443504, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:04.247Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":826,\"cliente_id\":\"V0000000826\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('KyYVkhIFvotmT9VpID8iWybyYe4PpN1z', 1763443505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:05.238Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":833,\"cliente_id\":\"V0000000833\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('LCKsljIX4tuQTvwftk8qSxJx4RBshGGk', 1763444691, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.885Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":848,\"cliente_id\":\"V0000000848\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('M1N4vFjv1UqlhO33QXOZk4yrAUZmlyZO', 1763444726, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:26.226Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":872,\"cliente_id\":\"V0000000872\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('MIGSURzyXC3uBZg7amcxNHDmdc7j2HH7', 1763473501, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T13:45:01.026Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":909,\"cliente_id\":\"V0000000909\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('MNyq0d5z6RCOjUsXl9b0G1cgl-9yPRC-', 1763444758, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:57.930Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":886,\"cliente_id\":\"V0000000886\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('MbVi0tZe7r6T2E1yKN-yI87GywO2AG3L', 1763444692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:51.687Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":850,\"cliente_id\":\"V0000000850\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ND3PKK64EDDCc43RHx7FZm4lhr79eth_', 1763443491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.127Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":812,\"cliente_id\":\"V0000000812\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('NRhAMuqHo7hAsIpQd-FlXgHdc05InBj0', 1763443460, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.420Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":796,\"cliente_id\":\"V0000000796\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('OBgnKemmdSxLvXJkWTmKqsdQswBR2IaX', 1763442814, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-11-18T05:13:34.190Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":786,\"cliente_id\":\"V0000000786\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('OZiqcpwzvIzTKLnPIfwRiKLKVDfjhxMn', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:54.576Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":857,\"cliente_id\":\"V0000000857\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('P-kh-EaqDjQ_e5TrT1UO6RYQxXfCbH8g', 1763443490, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:49.815Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":808,\"cliente_id\":\"V0000000808\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('P28lxyOVqt73Ee88urFpg1cMUFIAwGpX', 1763471119, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-11-18T13:05:19.360Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":906,\"cliente_id\":\"V0000000906\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('P8LomR63fxeSOf8UU1F9gkVtHSYPYjQ0', 1763443490, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:50.208Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":809,\"cliente_id\":\"V0000000809\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('QMxTmrXlJMKLTs5j0emNfajiSeKvEL7k', 1763444736, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:35.723Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":875,\"cliente_id\":\"V0000000875\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('QSQkCbPSaJ8Q3KF4ZCpDJIIxAE0Ge5wc', 1763443504, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:04.272Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":827,\"cliente_id\":\"V0000000827\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('QmrHLzZZq0zTc-wxEQYY02pIbL5pWVH4', 1763444755, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:54.928Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":880,\"cliente_id\":\"V0000000880\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('RbAIbky1Xx8bJN3hpkmZABgSYJkdKy8A', 1763444692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:51.863Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":853,\"cliente_id\":\"V0000000853\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('S1ugOyj14mBTrqUGWqszPiDbU3QkNXwU', 1763487243, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T17:34:02.837Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":914,\"cliente_id\":\"V0000000914\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('SWmwTRyaYzfLpGitJFPtsBijQ6uN7PGO', 1763444690, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.380Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":843,\"cliente_id\":\"V0000000843\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Tp6E8tjWjV_poaeo-xQcvq-_6gqPbFyq', 1763444694, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:54.411Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":856,\"cliente_id\":\"V0000000856\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('U82yRkxroz2jgwiegCh_6h9WGMDpvA3F', 1763488075, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T17:47:54.869Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":915,\"cliente_id\":\"V0000000915\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('UH0SQeJXtLXvkGOY9jXysp64Ke3a835k', 1763444685, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:44.829Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":842,\"cliente_id\":\"V0000000842\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('Uw8LR8P4S4gF4yGeAMAmP7PBSkdOG6m-', 1763443498, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:58.090Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":820,\"cliente_id\":\"V0000000820\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('V0P2gOwh4ZhWks8Nz7E3bRpy-4FMG6-8', 1763443491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.227Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":813,\"cliente_id\":\"V0000000813\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('WOtGLSjZjConpYyCgtr2SLhsTBpT6YIn', 1763469652, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T12:40:52.229Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":905,\"cliente_id\":\"V0000000905\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('WjlzdcZ4PjiPgUCGKvm6AOIgTBAUI9P9', 1763444726, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:25.775Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":870,\"cliente_id\":\"V0000000870\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('XlWzmD_A_kxyoLHIQA-j4Ny8im-wLO7l', 1763444697, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:56.500Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":863,\"cliente_id\":\"V0000000863\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('YI8pt06MyKoDsUh1glG5Nu8_g9ndgWGN', 1763422454, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-17T23:34:14.453Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":784,\"cliente_id\":\"V0000000784\",\"fechaUltNaveg\":\"2025-11-16\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-16\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ZLjWz3qaUxrN8GWKRCLGM4dhQqGsDKI6', 1763444724, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:24.124Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":867,\"cliente_id\":\"V0000000867\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ZT1Hiuu9MnXjlRl1ddOJqieQ127akCBf', 1763444694, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:54.069Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":854,\"cliente_id\":\"V0000000854\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ZoTHzGWZCZttOfSpk5v_-AAgfIWVh9md', 1763463314, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T10:55:13.522Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":900,\"cliente_id\":\"V0000000900\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('_fBELW_nsq0mLE4Jw0gAIxc0PKyXL8HN', 1763444685, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:44.820Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":841,\"cliente_id\":\"V0000000841\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('_lD86XYqQS3_ulK0nvzH5smOqvzYnJR1', 1763444685, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:44.767Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":840,\"cliente_id\":\"V0000000840\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('a0CU3otypDs0EJeXpC1TQsGpGqTgF2Ue', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:55.019Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":858,\"cliente_id\":\"V0000000858\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('aV-YrBRCEIZvT5Q4rDMiKyUov4v_Q5Bx', 1763443504, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:03.637Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":823,\"cliente_id\":\"V0000000823\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ad0sbSQHwpZegH3_W1vA8VSoZkTok6qA', 1763495692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T19:54:52.380Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":921,\"cliente_id\":\"V0000000921\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('bjBnk3axjgZCdWcue1rbCwfdyw4YaNts', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.789Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":897,\"cliente_id\":\"V0000000897\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('byUq9_hMrO94AXR52qSNUYgr63xg7mY5', 1763444725, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:24.953Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":868,\"cliente_id\":\"V0000000868\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('cCj_dFa-6fC4ejOrIdbM6DisImhrIAOv', 1763443452, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:12.139Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":793,\"cliente_id\":\"V0000000793\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('cVTsv0e1Ke-bwrUaktMNNOB3REY4Td3W', 1763443436, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:23:55.550Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":788,\"cliente_id\":\"V0000000788\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('cVqNQuJVAsB9KG7MJmYg8Xi_Y5Tx91pl', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.534Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":799,\"cliente_id\":\"V0000000799\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('cr3_WAbG__LxFv1ThmmxsKnRhpqgcIMr', 1763443505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:05.184Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":831,\"cliente_id\":\"V0000000831\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('dSs7lYAW4hmlXk-bNR5yBhZMtKX4hSTo', 1763443506, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:06.020Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":835,\"cliente_id\":\"V0000000835\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('dbulvHoEP7rOTXR_uCX1Cf5NpJCJ1Z5f', 1763472269, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T13:24:28.865Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":907,\"cliente_id\":\"V0000000907\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('dnT1HxTfFzSFBvqAKn9A7y5SeUYD4T9Y', 1763444755, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:55.235Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":881,\"cliente_id\":\"V0000000881\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('dyyC6bU8sQu3pBzpJwOQi35gLnaI4f-T', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.778Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":896,\"cliente_id\":\"V0000000896\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('eFcYBXlbRffzF_x2VYJUjgW-Pb1LQ1Sk', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.573Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":800,\"cliente_id\":\"V0000000800\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ePcVoBHnLF0gXVOkGYksV1uJ8k-9cYjS', 1763444758, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-11-18T05:45:57.749Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":885,\"cliente_id\":\"V0000000885\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('f-kJ8PfwY2rckBNycDEHXDA5eZD4OLtN', 1763443491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.282Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":814,\"cliente_id\":\"V0000000814\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('f8KrwKyoMfaABB3eQVob3Mym5IzNU7ey', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:21.003Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":802,\"cliente_id\":\"V0000000802\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('fLnfNpM77vkmr3an98sU_aqzgs-zII6z', 1763443478, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:38.485Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":805,\"cliente_id\":\"V0000000805\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ffwmkvteE9INZDQgAgSkkKQju2_f1EvD', 1763444726, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:26.236Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":873,\"cliente_id\":\"V0000000873\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('fpwJ3XXxXBtY2yqOQog0uU3rNEC22YZg', 1763491883, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T18:51:22.814Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":918,\"cliente_id\":\"V0000000918\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('gieF8b39BSrUpxLf7_c4k9-Y-De-B2HX', 1763443452, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:12.228Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":794,\"cliente_id\":\"V0000000794\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('h85Gn1HHCieqQA0F6HLe4Ib9W4Og-wcN', 1763495693, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T19:54:53.239Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":922,\"cliente_id\":\"V0000000922\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('hFZ1BuX7rd8ZJeWYtJJEQ8kM1VIC9scE', 1763443504, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:04.222Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":825,\"cliente_id\":\"V0000000825\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ileP3q7hsO_aaIeOn5r6-k6aDyPIUrAd', 1763444765, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.593Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":892,\"cliente_id\":\"V0000000892\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('in90zdzpCNzuomRmPDIiPtKapJePoqYS', 1763443460, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.452Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":798,\"cliente_id\":\"V0000000798\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('j8h84uup-tghkT-9Ixwlil9p2RRUsJGX', 1763444692, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:51.626Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":849,\"cliente_id\":\"V0000000849\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('jVjEMH4Ug6VnM755JH5sBrl3f-8fi7c7', 1763444724, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:23.949Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":865,\"cliente_id\":\"V0000000865\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('jdmrzh-zVbWDuVYN_ooCN9zmMWDARCAr', 1763472684, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T13:31:24.367Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":908,\"cliente_id\":\"V0000000908\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}');
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('jicAwTH26KIhcPcu7eaoTRwrYkPIKJ1G', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.959Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":801,\"cliente_id\":\"V0000000801\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('jrjZMSAzg0DoQkBcanBQi0P8Wr31f7Dp', 1763444764, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.015Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":890,\"cliente_id\":\"V0000000890\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('jxZEwkHfbfBcpp6u4sTk9UQrqLqq174v', 1763444764, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:46:04.020Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":891,\"cliente_id\":\"V0000000891\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('l4SsZpGO6M-lrcd7WnkpIKXMPi6oidVJ', 1763443505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:05.195Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":832,\"cliente_id\":\"V0000000832\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('lO_yhsxoSicQJncph3mzRwfc_sTrEcBZ', 1763491929, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T18:52:08.707Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":920,\"cliente_id\":\"V0000000920\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ll8XtRCHe7MLF0jQhghOamWCqSXknFxx', 1763443498, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:57.970Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":819,\"cliente_id\":\"V0000000819\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('m7Zb6yySXcSmDcPP0nK0nc2lfayBiKOh', 1763444691, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.770Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":846,\"cliente_id\":\"V0000000846\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('mMsDF1Gt0N4_aooILEjS5LXN-as3dMHG', 1763444725, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:25.027Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":869,\"cliente_id\":\"V0000000869\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('mXQjeTx-VgkLEyjM9fCGB5MYPku71eAC', 1763444691, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:50.659Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":844,\"cliente_id\":\"V0000000844\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('mgtw2rzEbt1eR4b3AFpwWeJM0-mfaRnO', 1763444736, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:35.633Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":874,\"cliente_id\":\"V0000000874\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('nVpQAQTaTyx2eoPe4bUWB1kCFOVLB7hq', 1763466083, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T11:41:22.951Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":904,\"cliente_id\":\"V0000000904\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('nfJgFNyZyzIp7gr9sIIGsh18-_zgSo7Y', 1763491888, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T18:51:27.863Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":919,\"cliente_id\":\"V0000000919\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('o1R8rv1xBPQKjQZOY6BDDgDOq2WCwYlB', 1763443498, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:57.838Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":818,\"cliente_id\":\"V0000000818\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('oA8Vp-qR_dUE3VopKqMwohRdoRH8AnJg', 1763443505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:04.942Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":830,\"cliente_id\":\"V0000000830\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('okyTJAj6zb-6_UXcVDSo2XIsZAvA0sI9', 1763444755, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:54.642Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":879,\"cliente_id\":\"V0000000879\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ow73jcyKcSDnfE2ROolpT6_hfOUFUvzs', 1763444758, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:57.932Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":887,\"cliente_id\":\"V0000000887\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('oyLJdlvm4FTeQ_Vuyfpm3Qj3CtiByZWO', 1763443460, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:20.348Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":795,\"cliente_id\":\"V0000000795\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('q2qYGtbZueHMnyPf1hRF1lXTQC0sGTYn', 1763443490, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:49.790Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":811,\"cliente_id\":\"V0000000811\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('qsJE4GNrWTdn0ugvKGyQ0iiiUGejJznn', 1763444757, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:56.660Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":884,\"cliente_id\":\"V0000000884\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('r1SaXEouRtoEyqQZYGq-kVwh9tCNZ9LN', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:55.055Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":859,\"cliente_id\":\"V0000000859\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('rvGMvpw5IgvA5iF0rMstKNiRSoDHITZB', 1763463381, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T10:56:20.676Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":902,\"cliente_id\":\"V0000000902\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('rw7IGpUDO1ghtZ8-of39febIGpEa91BA', 1763443450, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:10.340Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":791,\"cliente_id\":\"V0000000791\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('rxSwm5vmbPq_YSGnw3iONUMPn4WglG3Z', 1763444736, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:35.801Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":876,\"cliente_id\":\"V0000000876\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('sLl82N4BpR6FnVAmF_f1PJ8NDcOfwBcZ', 1763443461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:21.355Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":803,\"cliente_id\":\"V0000000803\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('sv5fGCO4YJSS45PEoehb5ZLSNS4DomQ8', 1763443492, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:24:51.517Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":816,\"cliente_id\":\"V0000000816\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('tf0HTn-oUm1dvPdSZ6vZCoYF-VKP1tw2', 1763444685, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:44.546Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":839,\"cliente_id\":\"V0000000839\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('uoplOX7yg8nWFrkrydPQEn_t8oLiqo7p', 1763444695, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:44:55.350Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":862,\"cliente_id\":\"V0000000862\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('xmfE8b32Yz480p5rKfBDzYo0mCWqAIRc', 1763443504, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:03.710Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":824,\"cliente_id\":\"V0000000824\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('yUyO-wcSIiKhfK8QnyGucgkV6BVnoPsG', 1763444724, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:45:24.090Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":866,\"cliente_id\":\"V0000000866\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('ys88HT7xiddMvLmh8AbbGV8ENIquZVbv', 1763443506, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:05.958Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":834,\"cliente_id\":\"V0000000834\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}'),
('zcaeCof3ozwf48b7mCHQmC9oka6vI0sE', 1763443507, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-18T05:25:07.078Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":836,\"cliente_id\":\"V0000000836\",\"fechaUltNaveg\":\"2025-11-17\",\"diasNaveg\":0,\"visitaCreadaEn\":\"2025-11-17\",\"versionWeb\":\"1.00\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"edicion\":false,\"revision\":false,\"admin\":false}}}');

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
  `admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_roles`
--

INSERT INTO `us_roles` (`id`, `orden`, `nombre`, `codigo`, `edicion`, `revision`, `admin`) VALUES
(1, 1, 'Sólo lectura', 'lectura', 0, 0, 0),
(2, 2, 'Edición', 'edicion', 1, 0, 0),
(3, 3, 'Revisión', 'revision', 1, 1, 0),
(4, 4, 'Administrador', 'admin', 1, 0, 1),
(5, 5, 'Admin. y revisor', 'adminRevision', 1, 1, 1);

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
  `nombre` varchar(30) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `apodo` varchar(30) DEFAULT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `pais_id` varchar(2) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime DEFAULT NULL,
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rolUsuario_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_usuarios`
--

INSERT INTO `us_usuarios` (`id`, `nombre`, `email`, `apodo`, `cliente_id`, `contrasena`, `pais_id`, `avatar`, `newsletter`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `creadoEn`, `fechaContrasena`, `rolUsuario_id`, `statusRegistro_id`) VALUES
(1, 'Diego Iribarren', 'diegoiribarren2015@gmail.com', 'Diego', 'U0000000001', '$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO', NULL, NULL, 1, '2025-10-16 23:29:07', '2025-10-21', 1, '1.00', '2025-10-16 23:29:07', '2025-10-16 23:29:07', 4, 2),
(2, NULL, 'sp2015w@gmail.com', NULL, 'U0000000002', '$2b$10$qmzwjLLomIz7dYKZpg/KqezGvWGcASvJCAC6/zeeE8/BZAQhcbg0G', NULL, NULL, 0, NULL, '2025-10-23', 1, '1.00', '2025-10-23 15:23:58', '2025-10-23 15:23:58', 1, 1);

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
(2, 'V0000000002', '2025-10-23 17:01:51', '2025-10-23', 0, '1.00', 1),
(3, 'V0000000003', '2025-10-23 17:01:48', '2025-10-23', 0, '1.00', 1),
(4, 'V0000000004', '2025-10-23 17:01:52', '2025-10-23', 0, '1.00', 1),
(5, 'V0000000005', '2025-10-23 17:01:55', '2025-10-23', 0, '1.00', 1),
(6, 'V0000000006', '2025-10-23 17:04:41', '2025-10-23', 0, '1.00', 1),
(7, 'V0000000007', '2025-10-23 17:04:43', '2025-10-23', 0, '1.00', 1),
(8, 'V0000000008', '2025-10-23 17:04:44', '2025-10-23', 0, '1.00', 1),
(9, 'V0000000009', '2025-10-23 17:04:46', '2025-10-23', 0, '1.00', 1),
(10, 'V0000000010', '2025-10-23 17:27:38', '2025-10-23', 0, '1.00', 1),
(11, 'V0000000011', '2025-10-23 17:48:29', '2025-10-23', 0, '1.00', 1),
(12, 'V0000000012', '2025-10-23 18:00:54', '2025-10-23', 0, '1.00', 1),
(13, 'V0000000013', '2025-10-23 18:00:56', '2025-10-23', 0, '1.00', 1),
(14, 'V0000000014', '2025-10-23 18:00:57', '2025-10-23', 0, '1.00', 1),
(15, 'V0000000015', '2025-10-23 18:01:01', '2025-10-23', 0, '1.00', 1),
(16, 'V0000000016', '2025-10-23 20:34:17', '2025-10-23', 0, '1.00', 1),
(17, 'V0000000017', '2025-10-23 20:34:18', '2025-10-23', 0, '1.00', 1),
(18, 'V0000000018', '2025-10-23 20:53:46', '2025-10-23', 0, '1.00', 1),
(19, 'V0000000019', '2025-10-23 20:53:48', '2025-10-23', 0, '1.00', 1),
(20, 'V0000000020', '2025-10-23 20:53:50', '2025-10-23', 0, '1.00', 1),
(21, 'V0000000021', '2025-10-23 20:53:52', '2025-10-23', 0, '1.00', 1),
(22, 'V0000000022', '2025-10-23 20:56:05', '2025-10-23', 0, '1.00', 1),
(23, 'V0000000023', '2025-10-23 20:56:06', '2025-10-23', 0, '1.00', 1),
(24, 'V0000000024', '2025-10-23 20:56:07', '2025-10-23', 0, '1.00', 1),
(25, 'V0000000025', '2025-10-23 20:56:08', '2025-10-23', 0, '1.00', 1),
(26, 'V0000000026', '2025-10-23 20:56:09', '2025-10-23', 0, '1.00', 1),
(27, 'V0000000027', '2025-10-23 20:56:10', '2025-10-23', 0, '1.00', 1),
(28, 'V0000000028', '2025-10-23 20:56:12', '2025-10-23', 0, '1.00', 1),
(29, 'V0000000029', '2025-10-23 20:56:13', '2025-10-23', 0, '1.00', 1),
(30, 'V0000000030', '2025-10-23 20:56:14', '2025-10-23', 0, '1.00', 1),
(31, 'V0000000031', '2025-10-23 20:56:15', '2025-10-23', 0, '1.00', 1),
(32, 'V0000000032', '2025-10-23 20:56:16', '2025-10-23', 0, '1.00', 1),
(33, 'V0000000033', '2025-10-23 20:56:17', '2025-10-23', 0, '1.00', 1),
(34, 'V0000000034', '2025-10-23 20:56:18', '2025-10-23', 0, '1.00', 1),
(35, 'V0000000035', '2025-10-23 20:56:19', '2025-10-23', 0, '1.00', 1),
(36, 'V0000000036', '2025-10-23 20:56:20', '2025-10-23', 0, '1.00', 1),
(37, 'V0000000037', '2025-10-23 20:56:21', '2025-10-23', 0, '1.00', 1),
(38, 'V0000000038', '2025-10-23 20:56:22', '2025-10-23', 0, '1.00', 1),
(39, 'V0000000039', '2025-10-23 20:56:25', '2025-10-23', 0, '1.00', 1),
(40, 'V0000000040', '2025-10-23 20:56:26', '2025-10-23', 0, '1.00', 1),
(41, 'V0000000041', '2025-10-23 20:56:27', '2025-10-23', 0, '1.00', 1),
(42, 'V0000000042', '2025-10-23 20:56:28', '2025-10-23', 0, '1.00', 1),
(43, 'V0000000043', '2025-10-23 20:56:29', '2025-10-23', 0, '1.00', 1),
(44, 'V0000000044', '2025-10-23 20:56:30', '2025-10-23', 0, '1.00', 1),
(45, 'V0000000045', '2025-10-23 20:56:31', '2025-10-23', 0, '1.00', 1),
(46, 'V0000000046', '2025-10-23 20:56:32', '2025-10-23', 0, '1.00', 1),
(47, 'V0000000047', '2025-10-23 20:56:33', '2025-10-23', 0, '1.00', 1),
(48, 'V0000000048', '2025-10-23 20:56:34', '2025-10-23', 0, '1.00', 1),
(49, 'V0000000049', '2025-10-23 20:56:35', '2025-10-23', 0, '1.00', 1),
(50, 'V0000000050', '2025-10-23 20:56:36', '2025-10-23', 0, '1.00', 1),
(51, 'V0000000051', '2025-10-23 20:56:38', '2025-10-23', 0, '1.00', 1),
(52, 'V0000000052', '2025-10-23 20:56:39', '2025-10-23', 0, '1.00', 1),
(53, 'V0000000053', '2025-10-23 20:56:40', '2025-10-23', 0, '1.00', 1),
(54, 'V0000000054', '2025-10-23 20:56:41', '2025-10-23', 0, '1.00', 1),
(55, 'V0000000055', '2025-10-23 20:56:42', '2025-10-23', 0, '1.00', 1),
(56, 'V0000000056', '2025-10-23 20:56:43', '2025-10-23', 0, '1.00', 1),
(57, 'V0000000057', '2025-10-23 20:56:44', '2025-10-23', 0, '1.00', 1),
(58, 'V0000000058', '2025-10-23 20:56:45', '2025-10-23', 0, '1.00', 1),
(59, 'V0000000059', '2025-10-23 20:56:46', '2025-10-23', 0, '1.00', 1),
(60, 'V0000000060', '2025-10-23 20:56:48', '2025-10-23', 0, '1.00', 1),
(61, 'V0000000061', '2025-10-23 20:56:49', '2025-10-23', 0, '1.00', 1),
(62, 'V0000000062', '2025-10-23 20:56:54', '2025-10-23', 0, '1.00', 1),
(63, 'V0000000063', '2025-10-23 20:56:55', '2025-10-23', 0, '1.00', 1),
(64, 'V0000000064', '2025-10-23 20:56:57', '2025-10-23', 0, '1.00', 1),
(65, 'V0000000065', '2025-10-23 20:56:58', '2025-10-23', 0, '1.00', 1),
(66, 'V0000000066', '2025-10-23 20:56:59', '2025-10-23', 0, '1.00', 1),
(67, 'V0000000067', '2025-10-23 20:57:00', '2025-10-23', 0, '1.00', 1),
(68, 'V0000000068', '2025-10-23 20:57:01', '2025-10-23', 0, '1.00', 1),
(69, 'V0000000069', '2025-10-23 20:57:02', '2025-10-23', 0, '1.00', 1),
(70, 'V0000000070', '2025-10-23 20:57:03', '2025-10-23', 0, '1.00', 1),
(71, 'V0000000071', '2025-10-23 20:57:04', '2025-10-23', 0, '1.00', 1),
(72, 'V0000000072', '2025-10-23 20:57:05', '2025-10-23', 0, '1.00', 1),
(73, 'V0000000073', '2025-10-23 20:57:06', '2025-10-23', 0, '1.00', 1),
(74, 'V0000000074', '2025-10-23 20:57:07', '2025-10-23', 0, '1.00', 1),
(75, 'V0000000075', '2025-10-23 20:57:08', '2025-10-23', 0, '1.00', 1),
(76, 'V0000000076', '2025-10-23 20:57:09', '2025-10-23', 0, '1.00', 1),
(77, 'V0000000077', '2025-10-23 20:57:10', '2025-10-23', 0, '1.00', 1),
(78, 'V0000000078', '2025-10-23 20:57:12', '2025-10-23', 0, '1.00', 1),
(79, 'V0000000079', '2025-10-23 20:57:13', '2025-10-23', 0, '1.00', 1),
(80, 'V0000000080', '2025-10-23 20:57:14', '2025-10-23', 0, '1.00', 1),
(81, 'V0000000081', '2025-10-23 20:57:15', '2025-10-23', 0, '1.00', 1),
(82, 'V0000000082', '2025-10-23 20:57:16', '2025-10-23', 0, '1.00', 1),
(83, 'V0000000083', '2025-10-23 20:57:17', '2025-10-23', 0, '1.00', 1),
(84, 'V0000000084', '2025-10-23 20:57:18', '2025-10-23', 0, '1.00', 1),
(85, 'V0000000085', '2025-10-23 20:57:19', '2025-10-23', 0, '1.00', 1),
(86, 'V0000000086', '2025-10-23 20:57:20', '2025-10-23', 0, '1.00', 1),
(87, 'V0000000087', '2025-10-23 20:57:21', '2025-10-23', 0, '1.00', 1),
(88, 'V0000000088', '2025-10-23 20:57:22', '2025-10-23', 0, '1.00', 1),
(89, 'V0000000089', '2025-10-23 20:57:24', '2025-10-23', 0, '1.00', 1),
(90, 'V0000000090', '2025-10-23 20:57:25', '2025-10-23', 0, '1.00', 1),
(91, 'V0000000091', '2025-10-23 20:57:26', '2025-10-23', 0, '1.00', 1),
(92, 'V0000000092', '2025-10-23 20:57:27', '2025-10-23', 0, '1.00', 1),
(93, 'V0000000093', '2025-10-23 20:57:29', '2025-10-23', 0, '1.00', 1),
(94, 'V0000000094', '2025-10-23 20:57:30', '2025-10-23', 0, '1.00', 1),
(95, 'V0000000095', '2025-10-23 20:57:31', '2025-10-23', 0, '1.00', 1),
(96, 'V0000000096', '2025-10-23 20:57:32', '2025-10-23', 0, '1.00', 1),
(97, 'V0000000097', '2025-10-23 20:57:33', '2025-10-23', 0, '1.00', 1),
(98, 'V0000000098', '2025-10-23 20:57:34', '2025-10-23', 0, '1.00', 1),
(99, 'V0000000099', '2025-10-23 20:57:35', '2025-10-23', 0, '1.00', 1),
(100, 'V0000000100', '2025-10-23 20:57:36', '2025-10-23', 0, '1.00', 1),
(101, 'V0000000101', '2025-10-23 20:57:37', '2025-10-23', 0, '1.00', 1),
(102, 'V0000000102', '2025-10-23 20:57:38', '2025-10-23', 0, '1.00', 1),
(103, 'V0000000103', '2025-10-23 20:57:39', '2025-10-23', 0, '1.00', 1),
(104, 'V0000000104', '2025-10-23 20:57:40', '2025-10-23', 0, '1.00', 1),
(105, 'V0000000105', '2025-10-23 20:57:41', '2025-10-23', 0, '1.00', 1),
(106, 'V0000000106', '2025-10-23 20:57:42', '2025-10-23', 0, '1.00', 1),
(107, 'V0000000107', '2025-10-23 20:57:43', '2025-10-23', 0, '1.00', 1),
(108, 'V0000000108', '2025-10-23 20:57:45', '2025-10-23', 0, '1.00', 1),
(109, 'V0000000109', '2025-10-23 20:57:46', '2025-10-23', 0, '1.00', 1),
(110, 'V0000000110', '2025-10-23 20:57:47', '2025-10-23', 0, '1.00', 1),
(111, 'V0000000111', '2025-10-23 20:57:48', '2025-10-23', 0, '1.00', 1),
(112, 'V0000000112', '2025-10-23 20:57:49', '2025-10-23', 0, '1.00', 1),
(113, 'V0000000113', '2025-10-23 20:57:50', '2025-10-23', 0, '1.00', 1),
(114, 'V0000000114', '2025-10-23 20:57:51', '2025-10-23', 0, '1.00', 1),
(115, 'V0000000115', '2025-10-23 20:57:52', '2025-10-23', 0, '1.00', 1),
(116, 'V0000000116', '2025-10-23 20:57:53', '2025-10-23', 0, '1.00', 1),
(117, 'V0000000117', '2025-10-23 20:57:54', '2025-10-23', 0, '1.00', 1),
(118, 'V0000000118', '2025-10-23 20:57:55', '2025-10-23', 0, '1.00', 1),
(119, 'V0000000119', '2025-10-23 20:57:56', '2025-10-23', 0, '1.00', 1),
(120, 'V0000000120', '2025-10-23 20:57:57', '2025-10-23', 0, '1.00', 1),
(121, 'V0000000121', '2025-10-23 20:57:58', '2025-10-23', 0, '1.00', 1),
(122, 'V0000000122', '2025-10-23 20:57:59', '2025-10-23', 0, '1.00', 1),
(123, 'V0000000123', '2025-10-23 20:58:01', '2025-10-23', 0, '1.00', 1),
(124, 'V0000000124', '2025-10-23 20:58:02', '2025-10-23', 0, '1.00', 1),
(125, 'V0000000125', '2025-10-23 20:58:03', '2025-10-23', 0, '1.00', 1),
(126, 'V0000000126', '2025-10-23 20:58:04', '2025-10-23', 0, '1.00', 1),
(127, 'V0000000127', '2025-10-23 20:58:05', '2025-10-23', 0, '1.00', 1),
(128, 'V0000000128', '2025-10-23 20:58:06', '2025-10-23', 0, '1.00', 1),
(129, 'V0000000129', '2025-10-23 20:58:07', '2025-10-23', 0, '1.00', 1),
(130, 'V0000000130', '2025-10-23 20:58:08', '2025-10-23', 0, '1.00', 1),
(131, 'V0000000131', '2025-10-23 20:58:09', '2025-10-23', 0, '1.00', 1),
(132, 'V0000000132', '2025-10-23 20:58:10', '2025-10-23', 0, '1.00', 1),
(133, 'V0000000133', '2025-10-23 20:58:11', '2025-10-23', 0, '1.00', 1),
(134, 'V0000000134', '2025-10-23 20:58:12', '2025-10-23', 0, '1.00', 1),
(135, 'V0000000135', '2025-10-23 20:58:13', '2025-10-23', 0, '1.00', 1),
(136, 'V0000000136', '2025-10-23 20:58:14', '2025-10-23', 0, '1.00', 1),
(137, 'V0000000137', '2025-10-23 20:58:15', '2025-10-23', 0, '1.00', 1),
(138, 'V0000000138', '2025-10-23 20:58:16', '2025-10-23', 0, '1.00', 1),
(139, 'V0000000139', '2025-10-23 20:58:17', '2025-10-23', 0, '1.00', 1),
(140, 'V0000000140', '2025-10-23 20:58:19', '2025-10-23', 0, '1.00', 1),
(141, 'V0000000141', '2025-10-23 20:58:20', '2025-10-23', 0, '1.00', 1),
(142, 'V0000000142', '2025-10-23 20:58:21', '2025-10-23', 0, '1.00', 1),
(143, 'V0000000143', '2025-10-23 20:58:22', '2025-10-23', 0, '1.00', 1),
(144, 'V0000000144', '2025-10-23 20:58:23', '2025-10-23', 0, '1.00', 1),
(145, 'V0000000145', '2025-10-23 20:58:24', '2025-10-23', 0, '1.00', 1),
(146, 'V0000000146', '2025-10-23 20:58:25', '2025-10-23', 0, '1.00', 1),
(147, 'V0000000147', '2025-10-23 20:58:28', '2025-10-23', 0, '1.00', 1),
(148, 'V0000000148', '2025-10-23 20:58:29', '2025-10-23', 0, '1.00', 1),
(149, 'V0000000149', '2025-10-23 20:58:30', '2025-10-23', 0, '1.00', 1),
(150, 'V0000000150', '2025-10-23 20:58:31', '2025-10-23', 0, '1.00', 1),
(151, 'V0000000151', '2025-10-23 20:58:32', '2025-10-23', 0, '1.00', 1),
(152, 'V0000000152', '2025-10-23 20:58:34', '2025-10-23', 0, '1.00', 1),
(153, 'V0000000153', '2025-10-23 20:58:35', '2025-10-23', 0, '1.00', 1),
(154, 'V0000000154', '2025-10-23 20:58:36', '2025-10-23', 0, '1.00', 1),
(155, 'V0000000155', '2025-10-23 20:58:37', '2025-10-23', 0, '1.00', 1),
(156, 'V0000000156', '2025-10-23 20:58:38', '2025-10-23', 0, '1.00', 1),
(157, 'V0000000157', '2025-10-23 20:58:39', '2025-10-23', 0, '1.00', 1),
(158, 'V0000000158', '2025-10-23 20:58:40', '2025-10-23', 0, '1.00', 1),
(159, 'V0000000159', '2025-10-23 20:58:41', '2025-10-23', 0, '1.00', 1),
(160, 'V0000000160', '2025-10-23 20:58:42', '2025-10-23', 0, '1.00', 1),
(161, 'V0000000161', '2025-10-23 20:58:43', '2025-10-23', 0, '1.00', 1),
(162, 'V0000000162', '2025-10-23 20:58:44', '2025-10-23', 0, '1.00', 1),
(163, 'V0000000163', '2025-10-23 20:58:45', '2025-10-23', 0, '1.00', 1),
(164, 'V0000000164', '2025-10-23 20:58:46', '2025-10-23', 0, '1.00', 1),
(165, 'V0000000165', '2025-10-23 20:58:47', '2025-10-23', 0, '1.00', 1),
(166, 'V0000000166', '2025-10-23 20:58:48', '2025-10-23', 0, '1.00', 1),
(167, 'V0000000167', '2025-10-23 20:58:49', '2025-10-23', 0, '1.00', 1),
(168, 'V0000000168', '2025-10-23 20:58:50', '2025-10-23', 0, '1.00', 1),
(169, 'V0000000169', '2025-10-23 20:58:52', '2025-10-23', 0, '1.00', 1),
(170, 'V0000000170', '2025-10-23 20:58:53', '2025-10-23', 0, '1.00', 1),
(171, 'V0000000171', '2025-10-23 20:58:54', '2025-10-23', 0, '1.00', 1),
(172, 'V0000000172', '2025-10-23 20:58:55', '2025-10-23', 0, '1.00', 1),
(173, 'V0000000173', '2025-10-23 20:58:56', '2025-10-23', 0, '1.00', 1),
(174, 'V0000000174', '2025-10-23 20:58:57', '2025-10-23', 0, '1.00', 1),
(175, 'V0000000175', '2025-10-23 20:58:58', '2025-10-23', 0, '1.00', 1),
(176, 'V0000000176', '2025-10-23 20:58:59', '2025-10-23', 0, '1.00', 1),
(177, 'V0000000177', '2025-10-23 20:59:00', '2025-10-23', 0, '1.00', 1),
(178, 'V0000000178', '2025-10-23 20:59:01', '2025-10-23', 0, '1.00', 1),
(179, 'V0000000179', '2025-10-23 20:59:03', '2025-10-23', 0, '1.00', 1),
(180, 'V0000000180', '2025-10-23 20:59:04', '2025-10-23', 0, '1.00', 1),
(181, 'V0000000181', '2025-10-23 20:59:05', '2025-10-23', 0, '1.00', 1),
(182, 'V0000000182', '2025-10-23 20:59:06', '2025-10-23', 0, '1.00', 1),
(183, 'V0000000183', '2025-10-23 20:59:07', '2025-10-23', 0, '1.00', 1),
(184, 'V0000000184', '2025-10-23 20:59:08', '2025-10-23', 0, '1.00', 1),
(185, 'V0000000185', '2025-10-23 20:59:09', '2025-10-23', 0, '1.00', 1),
(186, 'V0000000186', '2025-10-23 20:59:10', '2025-10-23', 0, '1.00', 1),
(187, 'V0000000187', '2025-10-23 20:59:11', '2025-10-23', 0, '1.00', 1),
(188, 'V0000000188', '2025-10-23 20:59:13', '2025-10-23', 0, '1.00', 1),
(189, 'V0000000189', '2025-10-23 20:59:14', '2025-10-23', 0, '1.00', 1),
(190, 'V0000000190', '2025-10-23 20:59:15', '2025-10-23', 0, '1.00', 1),
(191, 'V0000000191', '2025-10-23 20:59:16', '2025-10-23', 0, '1.00', 1),
(192, 'V0000000192', '2025-10-23 20:59:17', '2025-10-23', 0, '1.00', 1),
(193, 'V0000000193', '2025-10-23 20:59:19', '2025-10-23', 0, '1.00', 1),
(194, 'V0000000194', '2025-10-23 20:59:20', '2025-10-23', 0, '1.00', 1),
(195, 'V0000000195', '2025-10-23 20:59:21', '2025-10-23', 0, '1.00', 1),
(196, 'V0000000196', '2025-10-23 20:59:22', '2025-10-23', 0, '1.00', 1),
(197, 'V0000000197', '2025-10-23 20:59:23', '2025-10-23', 0, '1.00', 1),
(198, 'V0000000198', '2025-10-23 20:59:24', '2025-10-23', 0, '1.00', 1),
(199, 'V0000000199', '2025-10-23 20:59:25', '2025-10-23', 0, '1.00', 1),
(200, 'V0000000200', '2025-10-23 20:59:26', '2025-10-23', 0, '1.00', 1),
(201, 'V0000000201', '2025-10-23 20:59:27', '2025-10-23', 0, '1.00', 1),
(202, 'V0000000202', '2025-10-23 20:59:29', '2025-10-23', 0, '1.00', 1),
(203, 'V0000000203', '2025-10-23 20:59:30', '2025-10-23', 0, '1.00', 1),
(204, 'V0000000204', '2025-10-23 20:59:31', '2025-10-23', 0, '1.00', 1),
(205, 'V0000000205', '2025-10-23 20:59:32', '2025-10-23', 0, '1.00', 1),
(206, 'V0000000206', '2025-10-23 20:59:33', '2025-10-23', 0, '1.00', 1),
(207, 'V0000000207', '2025-10-23 20:59:34', '2025-10-23', 0, '1.00', 1),
(208, 'V0000000208', '2025-10-23 20:59:35', '2025-10-23', 0, '1.00', 1),
(209, 'V0000000209', '2025-10-23 20:59:36', '2025-10-23', 0, '1.00', 1),
(210, 'V0000000210', '2025-10-23 20:59:37', '2025-10-23', 0, '1.00', 1),
(211, 'V0000000211', '2025-10-23 20:59:38', '2025-10-23', 0, '1.00', 1),
(212, 'V0000000212', '2025-10-23 20:59:39', '2025-10-23', 0, '1.00', 1),
(213, 'V0000000213', '2025-10-23 20:59:41', '2025-10-23', 0, '1.00', 1),
(214, 'V0000000214', '2025-10-23 20:59:42', '2025-10-23', 0, '1.00', 1),
(215, 'V0000000215', '2025-10-23 20:59:43', '2025-10-23', 0, '1.00', 1),
(216, 'V0000000216', '2025-10-23 20:59:44', '2025-10-23', 0, '1.00', 1),
(217, 'V0000000217', '2025-10-23 20:59:45', '2025-10-23', 0, '1.00', 1),
(218, 'V0000000218', '2025-10-23 20:59:46', '2025-10-23', 0, '1.00', 1),
(219, 'V0000000219', '2025-10-23 20:59:47', '2025-10-23', 0, '1.00', 1),
(220, 'V0000000220', '2025-10-23 20:59:48', '2025-10-23', 0, '1.00', 1),
(221, 'V0000000221', '2025-10-23 20:59:49', '2025-10-23', 0, '1.00', 1),
(222, 'V0000000222', '2025-10-23 20:59:50', '2025-10-23', 0, '1.00', 1),
(223, 'V0000000223', '2025-10-23 20:59:51', '2025-10-23', 0, '1.00', 1),
(224, 'V0000000224', '2025-10-23 20:59:52', '2025-10-23', 0, '1.00', 1),
(225, 'V0000000225', '2025-10-23 20:59:53', '2025-10-23', 0, '1.00', 1),
(226, 'V0000000226', '2025-10-23 20:59:54', '2025-10-23', 0, '1.00', 1),
(227, 'V0000000227', '2025-10-23 20:59:58', '2025-10-23', 0, '1.00', 1),
(228, 'V0000000228', '2025-10-23 20:59:59', '2025-10-23', 0, '1.00', 1),
(229, 'V0000000229', '2025-10-23 21:00:00', '2025-10-23', 0, '1.00', 1),
(230, 'V0000000230', '2025-10-23 21:00:01', '2025-10-23', 0, '1.00', 1),
(231, 'V0000000231', '2025-10-23 21:00:02', '2025-10-23', 0, '1.00', 1),
(232, 'V0000000232', '2025-10-23 21:00:03', '2025-10-23', 0, '1.00', 1),
(233, 'V0000000233', '2025-10-23 21:00:04', '2025-10-23', 0, '1.00', 1),
(234, 'V0000000234', '2025-10-23 21:00:05', '2025-10-23', 0, '1.00', 1),
(235, 'V0000000235', '2025-10-23 21:00:06', '2025-10-23', 0, '1.00', 1),
(236, 'V0000000236', '2025-10-23 21:00:07', '2025-10-23', 0, '1.00', 1),
(237, 'V0000000237', '2025-10-23 21:00:08', '2025-10-23', 0, '1.00', 1),
(238, 'V0000000238', '2025-10-23 21:00:09', '2025-10-23', 0, '1.00', 1),
(239, 'V0000000239', '2025-10-23 21:00:11', '2025-10-23', 0, '1.00', 1),
(240, 'V0000000240', '2025-10-23 21:00:12', '2025-10-23', 0, '1.00', 1),
(241, 'V0000000241', '2025-10-23 21:00:13', '2025-10-23', 0, '1.00', 1),
(242, 'V0000000242', '2025-10-23 21:00:14', '2025-10-23', 0, '1.00', 1),
(243, 'V0000000243', '2025-10-23 21:00:15', '2025-10-23', 0, '1.00', 1),
(244, 'V0000000244', '2025-10-23 21:00:16', '2025-10-23', 0, '1.00', 1),
(245, 'V0000000245', '2025-10-23 21:00:17', '2025-10-23', 0, '1.00', 1),
(246, 'V0000000246', '2025-10-23 22:17:23', '2025-10-23', 0, '1.00', 1),
(247, 'V0000000247', '2025-10-23 22:47:33', '2025-10-23', 0, '1.00', 1),
(248, 'V0000000248', '2025-10-23 23:10:30', '2025-10-23', 0, '1.00', 1),
(249, 'V0000000249', '2025-10-23 23:10:35', '2025-10-23', 0, '1.00', 1),
(250, 'V0000000250', '2025-10-23 23:10:37', '2025-10-23', 0, '1.00', 1),
(251, 'V0000000251', '2025-10-23 23:10:43', '2025-10-23', 0, '1.00', 1),
(252, 'V0000000252', '2025-10-23 23:10:44', '2025-10-23', 0, '1.00', 1),
(253, 'V0000000253', '2025-10-23 23:10:47', '2025-10-23', 0, '1.00', 1),
(254, 'V0000000254', '2025-10-23 23:10:48', '2025-10-23', 0, '1.00', 1),
(255, 'V0000000255', '2025-10-23 23:10:50', '2025-10-23', 0, '1.00', 1),
(256, 'V0000000256', '2025-10-23 23:56:09', '2025-10-23', 0, '1.00', 1),
(257, 'V0000000257', '2025-10-24 00:20:21', '2025-10-24', 0, '1.00', 1),
(258, 'V0000000258', '2025-10-24 00:20:27', '2025-10-24', 0, '1.00', 1),
(259, 'V0000000259', '2025-10-24 00:20:30', '2025-10-24', 0, '1.00', 1),
(260, 'V0000000260', '2025-10-24 00:51:17', '2025-10-24', 0, '1.00', 1),
(261, 'V0000000261', '2025-10-24 00:51:50', '2025-10-24', 0, '1.00', 1),
(262, 'V0000000262', '2025-10-24 02:32:53', '2025-10-24', 0, '1.00', 1),
(263, 'V0000000263', '2025-10-24 02:48:45', '2025-10-24', 0, '1.00', 1),
(264, 'V0000000264', '2025-10-24 03:52:41', '2025-10-24', 0, '1.00', 1),
(265, 'V0000000265', '2025-10-24 06:32:33', '2025-10-24', 0, '1.00', 1),
(266, 'V0000000266', '2025-10-24 06:41:14', '2025-10-24', 0, '1.00', 1),
(267, 'V0000000267', '2025-10-24 06:41:18', '2025-10-24', 0, '1.00', 1),
(268, 'V0000000268', '2025-10-24 07:11:14', '2025-10-24', 0, '1.00', 1),
(269, 'V0000000269', '2025-10-24 10:29:39', '2025-10-24', 0, '1.00', 1),
(270, 'V0000000270', '2025-10-24 11:38:27', '2025-10-24', 0, '1.00', 1),
(271, 'V0000000271', '2025-10-24 12:15:52', '2025-10-24', 0, '1.00', 1),
(272, 'V0000000272', '2025-10-24 13:17:37', '2025-10-24', 0, '1.00', 1),
(273, 'V0000000273', '2025-10-24 13:27:57', '2025-10-24', 0, '1.00', 1),
(274, 'V0000000274', '2025-10-24 14:52:48', '2025-10-24', 0, '1.00', 1),
(275, 'V0000000275', '2025-10-24 14:52:50', '2025-10-24', 0, '1.00', 1),
(276, 'V0000000276', '2025-10-24 15:04:57', '2025-10-24', 0, '1.00', 1),
(277, 'V0000000277', '2025-10-24 15:12:54', '2025-10-24', 0, '1.00', 1),
(278, 'V0000000278', '2025-10-24 16:09:14', '2025-10-24', 0, '1.00', 1),
(279, 'V0000000279', '2025-10-24 16:09:56', '2025-10-24', 0, '1.00', 1),
(280, 'V0000000280', '2025-10-24 16:09:57', '2025-10-24', 0, '1.00', 1),
(281, 'V0000000281', '2025-10-24 16:10:56', '2025-10-24', 0, '1.00', 1),
(282, 'V0000000282', '2025-10-24 18:27:46', '2025-10-24', 0, '1.00', 1),
(283, 'V0000000283', '2025-10-24 18:32:39', '2025-10-24', 0, '1.00', 1),
(284, 'V0000000284', '2025-10-24 20:09:57', '2025-10-24', 0, '1.00', 1),
(285, 'V0000000285', '2025-10-24 20:09:58', '2025-10-24', 0, '1.00', 1),
(286, 'V0000000286', '2025-10-24 20:24:17', '2025-10-24', 0, '1.00', 1),
(287, 'V0000000287', '2025-10-24 20:24:42', '2025-10-24', 0, '1.00', 1),
(288, 'V0000000288', '2025-10-24 20:27:26', '2025-10-24', 0, '1.00', 1),
(289, 'V0000000289', '2025-10-24 20:28:01', '2025-10-24', 0, '1.00', 1),
(290, 'V0000000290', '2025-10-24 20:40:32', '2025-10-24', 0, '1.00', 1),
(291, 'V0000000291', '2025-10-24 21:14:19', '2025-10-24', 0, '1.00', 1),
(292, 'V0000000292', '2025-10-24 23:08:52', '2025-10-24', 0, '1.00', 1),
(293, 'V0000000293', '2025-10-24 23:27:43', '2025-10-24', 0, '1.00', 1),
(294, 'V0000000294', '2025-10-24 23:27:45', '2025-10-24', 0, '1.00', 1),
(295, 'V0000000295', '2025-10-24 23:27:47', '2025-10-24', 0, '1.00', 1),
(296, 'V0000000296', '2025-10-24 23:39:22', '2025-10-24', 0, '1.00', 1),
(297, 'V0000000297', '2025-10-25 00:37:36', '2025-10-25', 0, '1.00', 1),
(298, 'V0000000298', '2025-10-25 00:57:00', '2025-10-25', 0, '1.00', 1),
(299, 'V0000000299', '2025-10-25 00:59:23', '2025-10-25', 0, '1.00', 1),
(300, 'V0000000300', '2025-10-25 01:01:03', '2025-10-25', 0, '1.00', 1),
(301, 'V0000000301', '2025-10-25 01:02:56', '2025-10-25', 0, '1.00', 1),
(302, 'V0000000302', '2025-10-25 01:12:07', '2025-10-25', 0, '1.00', 1),
(303, 'V0000000303', '2025-10-25 02:10:21', '2025-10-25', 0, '1.00', 1),
(304, 'V0000000304', '2025-10-25 02:59:29', '2025-10-25', 0, '1.00', 1),
(305, 'V0000000305', '2025-10-25 03:26:58', '2025-10-25', 0, '1.00', 1),
(306, 'V0000000306', '2025-10-25 03:44:39', '2025-10-25', 0, '1.00', 1),
(307, 'V0000000307', '2025-10-25 04:15:48', '2025-10-25', 0, '1.00', 1),
(308, 'V0000000308', '2025-10-25 06:16:51', '2025-10-25', 0, '1.00', 1),
(309, 'V0000000309', '2025-10-25 06:31:25', '2025-10-25', 0, '1.00', 1),
(310, 'V0000000310', '2025-10-25 06:31:34', '2025-10-25', 0, '1.00', 1),
(311, 'V0000000311', '2025-10-25 06:31:35', '2025-10-25', 0, '1.00', 1),
(312, 'V0000000312', '2025-10-25 06:59:24', '2025-10-25', 0, '1.00', 1),
(313, 'V0000000313', '2025-10-25 06:59:29', '2025-10-25', 0, '1.00', 1),
(314, 'V0000000314', '2025-10-25 09:06:18', '2025-10-25', 0, '1.00', 1),
(315, 'V0000000315', '2025-10-25 10:17:12', '2025-10-25', 0, '1.00', 1),
(316, 'V0000000316', '2025-10-25 12:11:43', '2025-10-25', 0, '1.00', 1),
(317, 'V0000000317', '2025-10-25 12:11:45', '2025-10-25', 0, '1.00', 1),
(318, 'V0000000318', '2025-10-25 12:11:48', '2025-10-25', 0, '1.00', 1),
(319, 'V0000000319', '2025-10-25 12:11:53', '2025-10-25', 0, '1.00', 1),
(320, 'V0000000320', '2025-10-25 13:18:24', '2025-10-25', 0, '1.00', 1),
(321, 'V0000000321', '2025-10-25 13:18:48', '2025-10-25', 0, '1.00', 1),
(322, 'V0000000322', '2025-10-25 13:20:52', '2025-10-25', 0, '1.00', 1),
(323, 'V0000000323', '2025-10-25 13:21:00', '2025-10-25', 0, '1.00', 1),
(324, 'V0000000324', '2025-10-25 13:35:22', '2025-10-25', 0, '1.00', 1),
(325, 'V0000000325', '2025-10-25 15:08:11', '2025-10-25', 0, '1.00', 1),
(326, 'V0000000326', '2025-10-25 18:04:52', '2025-10-25', 0, '1.00', 1),
(327, 'V0000000327', '2025-10-25 20:12:23', '2025-10-25', 0, '1.00', 1),
(328, 'V0000000328', '2025-10-25 21:38:11', '2025-10-25', 0, '1.00', 1),
(329, 'V0000000329', '2025-10-25 23:20:16', '2025-10-25', 0, '1.00', 1),
(330, 'V0000000330', '2025-10-25 23:20:17', '2025-10-25', 0, '1.00', 1),
(331, 'V0000000331', '2025-10-25 23:20:20', '2025-10-25', 0, '1.00', 1),
(332, 'V0000000332', '2025-10-25 23:20:34', '2025-10-25', 0, '1.00', 1),
(333, 'V0000000333', '2025-10-25 23:20:37', '2025-10-25', 0, '1.00', 1),
(334, 'V0000000334', '2025-10-25 23:20:38', '2025-10-25', 0, '1.00', 1),
(335, 'V0000000335', '2025-10-25 23:20:40', '2025-10-25', 0, '1.00', 1),
(336, 'V0000000336', '2025-10-25 23:20:51', '2025-10-25', 0, '1.00', 1),
(337, 'V0000000337', '2025-10-26 00:52:21', '2025-10-26', 0, '1.00', 1),
(338, 'V0000000338', '2025-10-26 01:07:06', '2025-10-26', 0, '1.00', 1),
(339, 'V0000000339', '2025-10-26 01:19:18', '2025-10-26', 0, '1.00', 1),
(340, 'V0000000340', '2025-10-26 01:55:44', '2025-10-26', 0, '1.00', 1),
(341, 'V0000000341', '2025-10-26 01:55:51', '2025-10-26', 0, '1.00', 1),
(342, 'V0000000342', '2025-10-26 01:56:27', '2025-10-26', 0, '1.00', 1),
(343, 'V0000000343', '2025-10-26 02:12:02', '2025-10-26', 0, '1.00', 1),
(344, 'V0000000344', '2025-10-26 05:42:03', '2025-10-26', 0, '1.00', 1),
(345, 'V0000000345', '2025-10-26 05:43:17', '2025-10-26', 0, '1.00', 1),
(346, 'V0000000346', '2025-10-26 05:43:41', '2025-10-26', 0, '1.00', 1),
(347, 'V0000000347', '2025-10-26 06:32:48', '2025-10-26', 0, '1.00', 1),
(348, 'V0000000348', '2025-10-26 08:46:27', '2025-10-26', 0, '1.00', 1),
(349, 'V0000000349', '2025-10-26 12:15:37', '2025-10-26', 0, '1.00', 1),
(350, 'V0000000350', '2025-10-26 16:15:34', '2025-10-26', 0, '1.00', 1),
(351, 'V0000000351', '2025-10-26 16:15:59', '2025-10-26', 0, '1.00', 1),
(352, 'V0000000352', '2025-10-26 16:17:09', '2025-10-26', 0, '1.00', 1),
(353, 'V0000000353', '2025-10-26 16:17:20', '2025-10-26', 0, '1.00', 1),
(354, 'V0000000354', '2025-10-26 16:17:29', '2025-10-26', 0, '1.00', 1),
(355, 'V0000000355', '2025-10-26 17:58:56', '2025-10-26', 0, '1.00', 1),
(356, 'V0000000356', '2025-10-26 19:05:11', '2025-10-26', 0, '1.00', 1),
(357, 'V0000000357', '2025-10-26 19:05:20', '2025-10-26', 0, '1.00', 1),
(358, 'V0000000358', '2025-10-26 19:06:04', '2025-10-26', 0, '1.00', 1),
(359, 'V0000000359', '2025-10-26 19:08:45', '2025-10-26', 0, '1.00', 1),
(360, 'V0000000360', '2025-10-26 20:55:16', '2025-10-26', 0, '1.00', 1),
(361, 'V0000000361', '2025-10-26 20:55:17', '2025-10-26', 0, '1.00', 1),
(362, 'V0000000362', '2025-10-27 00:09:39', '2025-10-27', 0, '1.00', 1),
(363, 'V0000000363', '2025-10-27 00:51:19', '2025-10-27', 0, '1.00', 1),
(364, 'V0000000364', '2025-10-27 01:52:13', '2025-10-27', 0, '1.00', 1),
(365, 'V0000000365', '2025-10-27 02:01:22', '2025-10-27', 0, '1.00', 1),
(366, 'V0000000366', '2025-10-27 02:32:11', '2025-10-27', 0, '1.00', 1),
(367, 'V0000000367', '2025-10-27 02:54:25', '2025-10-27', 0, '1.00', 1),
(368, 'V0000000368', '2025-10-27 03:47:11', '2025-10-27', 0, '1.00', 1),
(369, 'V0000000369', '2025-10-27 04:23:41', '2025-10-27', 0, '1.00', 1),
(370, 'V0000000370', '2025-10-27 04:35:08', '2025-10-27', 0, '1.00', 1),
(371, 'V0000000371', '2025-10-27 04:35:09', '2025-10-27', 0, '1.00', 1),
(372, 'V0000000372', '2025-10-27 04:35:11', '2025-10-27', 0, '1.00', 1),
(373, 'V0000000373', '2025-10-27 04:38:58', '2025-10-27', 0, '1.00', 1),
(374, 'V0000000374', '2025-10-27 04:39:00', '2025-10-27', 0, '1.00', 1),
(375, 'V0000000375', '2025-10-27 04:39:01', '2025-10-27', 0, '1.00', 1),
(376, 'V0000000376', '2025-10-27 04:42:23', '2025-10-27', 0, '1.00', 1),
(377, 'V0000000377', '2025-10-27 04:42:24', '2025-10-27', 0, '1.00', 1),
(378, 'V0000000378', '2025-10-27 04:42:25', '2025-10-27', 0, '1.00', 1),
(379, 'V0000000379', '2025-10-27 05:47:50', '2025-10-27', 0, '1.00', 1),
(380, 'V0000000380', '2025-10-27 06:31:48', '2025-10-27', 0, '1.00', 1),
(381, 'V0000000381', '2025-10-27 09:41:50', '2025-10-27', 0, '1.00', 1),
(382, 'V0000000382', '2025-10-27 09:53:38', '2025-10-27', 0, '1.00', 1),
(383, 'V0000000383', '2025-10-27 10:29:50', '2025-10-27', 0, '1.00', 1),
(384, 'V0000000384', '2025-10-27 10:34:26', '2025-10-27', 0, '1.00', 1),
(385, 'V0000000385', '2025-10-27 13:28:50', '2025-10-27', 0, '1.00', 1),
(386, 'V0000000386', '2025-10-27 13:29:04', '2025-10-27', 0, '1.00', 1),
(387, 'V0000000387', '2025-10-27 13:29:30', '2025-10-27', 0, '1.00', 1),
(388, 'V0000000388', '2025-10-27 13:29:48', '2025-10-27', 0, '1.00', 1),
(389, 'V0000000389', '2025-10-27 17:09:55', '2025-10-27', 0, '1.00', 1),
(390, 'V0000000390', '2025-10-27 22:04:54', '2025-10-27', 0, '1.00', 1),
(391, 'V0000000391', '2025-10-27 22:04:58', '2025-10-27', 0, '1.00', 1),
(392, 'V0000000392', '2025-10-27 22:06:25', '2025-10-27', 0, '1.00', 1),
(393, 'V0000000393', '2025-10-27 22:07:41', '2025-10-27', 0, '1.00', 1),
(394, 'V0000000394', '2025-10-27 22:37:02', '2025-10-27', 0, '1.00', 1),
(395, 'V0000000395', '2025-10-27 23:52:56', '2025-10-27', 0, '1.00', 1),
(396, 'V0000000396', '2025-10-28 01:34:42', '2025-10-28', 0, '1.00', 1),
(397, 'V0000000397', '2025-10-28 03:09:18', '2025-10-28', 0, '1.00', 1),
(398, 'V0000000398', '2025-10-28 03:49:17', '2025-10-28', 0, '1.00', 1),
(399, 'V0000000399', '2025-10-28 04:13:09', '2025-10-28', 0, '1.00', 1),
(400, 'V0000000400', '2025-10-28 04:13:11', '2025-10-28', 0, '1.00', 1),
(401, 'V0000000401', '2025-10-28 04:13:12', '2025-10-28', 0, '1.00', 1),
(402, 'V0000000402', '2025-10-28 04:17:38', '2025-10-28', 0, '1.00', 1),
(403, 'V0000000403', '2025-10-28 04:17:40', '2025-10-28', 0, '1.00', 1),
(404, 'V0000000404', '2025-10-28 04:17:41', '2025-10-28', 0, '1.00', 1),
(405, 'V0000000405', '2025-10-28 04:22:05', '2025-10-28', 0, '1.00', 1),
(406, 'V0000000406', '2025-10-28 04:22:11', '2025-10-28', 0, '1.00', 1),
(407, 'V0000000407', '2025-10-28 04:22:12', '2025-10-28', 0, '1.00', 1),
(408, 'V0000000408', '2025-10-28 04:26:09', '2025-10-28', 0, '1.00', 1),
(409, 'V0000000409', '2025-10-28 04:26:12', '2025-10-28', 0, '1.00', 1),
(410, 'V0000000410', '2025-10-28 04:26:17', '2025-10-28', 0, '1.00', 1),
(411, 'V0000000411', '2025-10-28 06:29:59', '2025-10-28', 0, '1.00', 1),
(412, 'V0000000412', '2025-10-28 08:39:19', '2025-10-28', 0, '1.00', 1),
(413, 'V0000000413', '2025-10-28 08:47:40', '2025-10-28', 0, '1.00', 1),
(414, 'V0000000414', '2025-10-28 09:23:49', '2025-10-28', 0, '1.00', 1),
(415, 'V0000000415', '2025-10-28 09:23:51', '2025-10-28', 0, '1.00', 1),
(416, 'V0000000416', '2025-10-28 09:24:42', '2025-10-28', 0, '1.00', 1),
(417, 'V0000000417', '2025-10-28 09:24:43', '2025-10-28', 0, '1.00', 1),
(418, 'V0000000418', '2025-10-28 10:13:47', '2025-10-28', 0, '1.00', 1),
(419, 'V0000000419', '2025-10-28 10:14:12', '2025-10-28', 0, '1.00', 1),
(420, 'V0000000420', '2025-10-28 10:15:56', '2025-10-28', 0, '1.00', 1),
(421, 'V0000000421', '2025-10-28 10:15:57', '2025-10-28', 0, '1.00', 1),
(422, 'V0000000422', '2025-10-28 10:16:07', '2025-10-28', 0, '1.00', 1),
(423, 'V0000000423', '2025-10-28 10:20:41', '2025-10-28', 0, '1.00', 1),
(424, 'V0000000424', '2025-10-28 12:18:13', '2025-10-28', 0, '1.00', 1),
(425, 'V0000000425', '2025-10-28 12:19:24', '2025-10-28', 0, '1.00', 1),
(426, 'V0000000426', '2025-10-28 12:19:42', '2025-10-28', 0, '1.00', 1),
(427, 'V0000000427', '2025-10-28 12:19:51', '2025-10-28', 0, '1.00', 1),
(428, 'V0000000428', '2025-10-28 12:27:57', '2025-10-28', 0, '1.00', 1),
(429, 'V0000000429', '2025-10-28 12:34:12', '2025-10-28', 0, '1.00', 1),
(430, 'V0000000430', '2025-10-28 12:34:12', '2025-10-28', 0, '1.00', 1),
(431, 'V0000000431', '2025-10-28 14:16:57', '2025-10-28', 0, '1.00', 1),
(432, 'V0000000432', '2025-10-28 14:17:05', '2025-10-28', 0, '1.00', 1),
(433, 'V0000000433', '2025-10-28 14:19:23', '2025-10-28', 0, '1.00', 1),
(434, 'V0000000434', '2025-10-28 17:24:29', '2025-10-28', 0, '1.00', 1),
(435, 'V0000000435', '2025-10-28 18:42:20', '2025-10-28', 0, '1.00', 1),
(436, 'V0000000436', '2025-10-28 19:23:06', '2025-10-28', 0, '1.00', 1),
(437, 'V0000000437', '2025-10-28 19:23:06', '2025-10-28', 0, '1.00', 1),
(438, 'V0000000438', '2025-10-28 20:50:43', '2025-10-28', 0, '1.00', 1),
(439, 'V0000000439', '2025-10-28 20:58:20', '2025-10-28', 0, '1.00', 1),
(440, 'V0000000440', '2025-10-28 22:09:09', '2025-10-28', 0, '1.00', 1),
(441, 'V0000000441', '2025-10-28 22:35:02', '2025-10-28', 0, '1.00', 1),
(442, 'V0000000442', '2025-10-28 22:35:39', '2025-10-28', 0, '1.00', 1),
(443, 'V0000000443', '2025-10-28 22:36:58', '2025-10-28', 0, '1.00', 1),
(444, 'V0000000444', '2025-10-28 22:37:52', '2025-10-28', 0, '1.00', 1),
(445, 'V0000000445', '2025-10-28 23:13:42', '2025-10-28', 0, '1.00', 1),
(446, 'V0000000446', '2025-10-29 00:45:26', '2025-10-29', 0, '1.00', 1),
(447, 'V0000000447', '2025-10-29 00:45:31', '2025-10-29', 0, '1.00', 1),
(448, 'V0000000448', '2025-10-29 03:34:08', '2025-10-29', 0, '1.00', 1),
(449, 'V0000000449', '2025-10-29 03:34:34', '2025-10-29', 0, '1.00', 1),
(450, 'V0000000450', '2025-10-29 06:40:04', '2025-10-29', 0, '1.00', 1),
(451, 'V0000000451', '2025-10-29 06:40:42', '2025-10-29', 0, '1.00', 1),
(452, 'V0000000452', '2025-10-29 06:41:56', '2025-10-29', 0, '1.00', 1),
(453, 'V0000000453', '2025-10-29 07:04:28', '2025-10-29', 0, '1.00', 1),
(454, 'V0000000454', '2025-10-29 07:07:26', '2025-10-29', 0, '1.00', 1),
(455, 'V0000000455', '2025-10-29 09:46:31', '2025-10-29', 0, '1.00', 1),
(456, 'V0000000456', '2025-10-29 09:47:18', '2025-10-29', 0, '1.00', 1),
(457, 'V0000000457', '2025-10-29 10:17:57', '2025-10-29', 0, '1.00', 1),
(458, 'V0000000458', '2025-10-29 13:07:44', '2025-10-29', 0, '1.00', 1),
(459, 'V0000000459', '2025-10-29 14:04:18', '2025-10-29', 0, '1.00', 1),
(460, 'V0000000460', '2025-10-29 15:29:05', '2025-10-29', 0, '1.00', 1),
(461, 'V0000000461', '2025-10-29 15:34:58', '2025-10-29', 0, '1.00', 1),
(462, 'V0000000462', '2025-10-29 15:54:19', '2025-10-29', 0, '1.00', 1),
(463, 'V0000000463', '2025-10-29 17:25:02', '2025-10-29', 0, '1.00', 1),
(464, 'V0000000464', '2025-10-29 19:10:09', '2025-10-29', 0, '1.00', 1),
(465, 'V0000000465', '2025-10-29 19:15:38', '2025-10-29', 0, '1.00', 1),
(466, 'V0000000466', '2025-10-29 19:48:04', '2025-10-29', 0, '1.00', 1),
(467, 'V0000000467', '2025-10-29 20:02:51', '2025-10-29', 0, '1.00', 1),
(468, 'V0000000468', '2025-10-29 23:30:17', '2025-10-29', 0, '1.00', 1),
(469, 'V0000000469', '2025-10-30 01:25:02', '2025-10-30', 0, '1.00', 1),
(470, 'V0000000470', '2025-10-30 01:25:08', '2025-10-30', 0, '1.00', 1),
(471, 'V0000000471', '2025-10-30 01:25:12', '2025-10-30', 0, '1.00', 1),
(472, 'V0000000472', '2025-10-30 02:11:44', '2025-10-30', 0, '1.00', 1),
(473, 'V0000000473', '2025-10-30 02:12:12', '2025-10-30', 0, '1.00', 1),
(474, 'V0000000474', '2025-10-30 02:12:58', '2025-10-30', 0, '1.00', 1),
(475, 'V0000000475', '2025-10-30 02:14:22', '2025-10-30', 0, '1.00', 1),
(476, 'V0000000476', '2025-10-30 03:29:50', '2025-10-30', 0, '1.00', 1),
(477, 'V0000000477', '2025-10-30 03:53:29', '2025-10-30', 0, '1.00', 1),
(478, 'V0000000478', '2025-10-30 05:51:58', '2025-10-30', 0, '1.00', 1),
(479, 'V0000000479', '2025-10-30 06:28:21', '2025-10-30', 0, '1.00', 1),
(480, 'V0000000480', '2025-10-30 09:55:57', '2025-10-30', 0, '1.00', 1),
(481, 'V0000000481', '2025-10-30 11:17:15', '2025-10-30', 0, '1.00', 1),
(482, 'V0000000482', '2025-10-30 11:17:17', '2025-10-30', 0, '1.00', 1),
(483, 'V0000000483', '2025-10-30 11:18:17', '2025-10-30', 0, '1.00', 1),
(484, 'V0000000484', '2025-10-30 11:20:13', '2025-10-30', 0, '1.00', 1),
(485, 'V0000000485', '2025-10-30 14:33:18', '2025-10-30', 0, '1.00', 1),
(486, 'V0000000486', '2025-10-30 15:07:30', '2025-10-30', 0, '1.00', 1),
(487, 'V0000000487', '2025-10-30 15:21:18', '2025-10-30', 0, '1.00', 1),
(488, 'V0000000488', '2025-10-30 17:10:09', '2025-10-30', 0, '1.00', 1),
(489, 'V0000000489', '2025-10-30 17:10:39', '2025-10-30', 0, '1.00', 1),
(490, 'V0000000490', '2025-10-30 17:12:39', '2025-10-30', 0, '1.00', 1),
(491, 'V0000000491', '2025-10-30 17:13:44', '2025-10-30', 0, '1.00', 1),
(492, 'V0000000492', '2025-10-30 17:50:54', '2025-10-30', 0, '1.00', 1),
(493, 'V0000000493', '2025-10-30 18:48:00', '2025-10-30', 0, '1.00', 1),
(494, 'V0000000494', '2025-10-30 18:48:00', '2025-10-30', 0, '1.00', 1),
(495, 'V0000000495', '2025-10-30 20:23:15', '2025-10-30', 0, '1.00', 1),
(496, 'V0000000496', '2025-10-30 20:23:31', '2025-10-30', 0, '1.00', 1),
(497, 'V0000000497', '2025-10-30 20:29:00', '2025-10-30', 0, '1.00', 1),
(498, 'V0000000498', '2025-10-30 22:16:39', '2025-10-30', 0, '1.00', 1),
(499, 'V0000000499', '2025-10-30 22:17:50', '2025-10-30', 0, '1.00', 1),
(500, 'V0000000500', '2025-10-30 22:19:39', '2025-10-30', 0, '1.00', 1),
(501, 'V0000000501', '2025-10-30 22:19:57', '2025-10-30', 0, '1.00', 1),
(502, 'V0000000502', '2025-11-04 14:46:03', '2025-11-04', 0, '1.00', 1),
(503, 'V0000000503', '2025-11-04 15:19:49', '2025-11-04', 0, '1.00', 1),
(504, 'V0000000504', '2025-11-04 15:59:50', '2025-11-04', 0, '1.00', 1),
(505, 'V0000000505', '2025-11-04 16:29:29', '2025-11-04', 0, '1.00', 1),
(506, 'V0000000506', '2025-11-04 17:09:32', '2025-11-04', 0, '1.00', 1),
(507, 'V0000000507', '2025-11-04 18:04:34', '2025-11-04', 0, '1.00', 1),
(508, 'V0000000508', '2025-11-04 18:04:39', '2025-11-04', 0, '1.00', 1),
(509, 'V0000000509', '2025-11-04 19:19:44', '2025-11-04', 0, '1.00', 1),
(510, 'V0000000510', '2025-11-04 19:32:48', '2025-11-04', 0, '1.00', 1),
(511, 'V0000000511', '2025-11-04 20:24:39', '2025-11-04', 0, '1.00', 1),
(512, 'V0000000512', '2025-11-04 20:25:21', '2025-11-04', 0, '1.00', 1),
(513, 'V0000000513', '2025-11-04 20:26:08', '2025-11-04', 0, '1.00', 1),
(514, 'V0000000514', '2025-11-04 20:27:40', '2025-11-04', 0, '1.00', 1),
(515, 'V0000000515', '2025-11-05 02:29:23', '2025-11-05', 0, '1.00', 1),
(516, 'V0000000516', '2025-11-05 02:29:32', '2025-11-05', 0, '1.00', 1),
(517, 'V0000000517', '2025-11-05 02:29:52', '2025-11-05', 0, '1.00', 1),
(518, 'V0000000518', '2025-11-05 02:34:37', '2025-11-05', 0, '1.00', 1),
(519, 'V0000000519', '2025-11-05 03:27:30', '2025-11-05', 0, '1.00', 1),
(520, 'V0000000520', '2025-11-05 06:36:08', '2025-11-05', 0, '1.00', 1),
(521, 'V0000000521', '2025-11-05 07:18:53', '2025-11-05', 0, '1.00', 1),
(522, 'V0000000522', '2025-11-05 07:18:55', '2025-11-05', 0, '1.00', 1),
(523, 'V0000000523', '2025-11-05 07:18:56', '2025-11-05', 0, '1.00', 1),
(524, 'V0000000524', '2025-11-05 07:46:44', '2025-11-05', 0, '1.00', 1),
(525, 'V0000000525', '2025-11-05 08:56:14', '2025-11-05', 0, '1.00', 1),
(526, 'V0000000526', '2025-11-05 12:40:23', '2025-11-05', 0, '1.00', 1),
(527, 'V0000000527', '2025-11-05 15:00:10', '2025-11-05', 0, '1.00', 1),
(528, 'V0000000528', '2025-11-05 15:22:24', '2025-11-05', 0, '1.00', 1),
(529, 'V0000000529', '2025-11-05 15:22:37', '2025-11-05', 0, '1.00', 1),
(530, 'V0000000530', '2025-11-05 15:23:27', '2025-11-05', 0, '1.00', 1),
(531, 'V0000000531', '2025-11-05 16:18:17', '2025-11-05', 0, '1.00', 1),
(532, 'V0000000532', '2025-11-05 16:41:09', '2025-11-05', 0, '1.00', 1),
(533, 'V0000000533', '2025-11-05 17:01:49', '2025-11-05', 0, '1.00', 1),
(534, 'V0000000534', '2025-11-05 17:55:54', '2025-11-05', 0, '1.00', 1),
(535, 'V0000000535', '2025-11-05 17:55:54', '2025-11-05', 0, '1.00', 1),
(536, 'V0000000536', '2025-11-05 17:55:56', '2025-11-05', 0, '1.00', 1),
(537, 'V0000000537', '2025-11-06 00:21:18', '2025-11-06', 0, '1.00', 1),
(538, 'V0000000538', '2025-11-06 01:04:05', '2025-11-06', 0, '1.00', 1),
(539, 'V0000000539', '2025-11-06 01:26:26', '2025-11-06', 0, '1.00', 1),
(540, 'V0000000540', '2025-11-06 03:39:43', '2025-11-06', 0, '1.00', 1),
(541, 'V0000000541', '2025-11-06 05:38:54', '2025-11-06', 0, '1.00', 1),
(542, 'V0000000542', '2025-11-06 05:57:26', '2025-11-06', 0, '1.00', 1),
(543, 'V0000000543', '2025-11-06 06:24:31', '2025-11-06', 0, '1.00', 1),
(544, 'V0000000544', '2025-11-06 07:07:52', '2025-11-06', 0, '1.00', 1),
(545, 'V0000000545', '2025-11-06 07:09:00', '2025-11-06', 0, '1.00', 1),
(546, 'V0000000546', '2025-11-06 07:09:35', '2025-11-06', 0, '1.00', 1),
(547, 'V0000000547', '2025-11-06 07:20:58', '2025-11-06', 0, '1.00', 1),
(548, 'V0000000548', '2025-11-06 07:20:59', '2025-11-06', 0, '1.00', 1),
(549, 'V0000000549', '2025-11-06 09:00:09', '2025-11-06', 0, '1.00', 1),
(550, 'V0000000550', '2025-11-06 09:00:09', '2025-11-06', 0, '1.00', 1),
(551, 'V0000000551', '2025-11-06 09:58:24', '2025-11-06', 0, '1.00', 1),
(552, 'V0000000552', '2025-11-06 15:08:52', '2025-11-06', 0, '1.00', 1),
(553, 'V0000000553', '2025-11-06 16:11:27', '2025-11-06', 0, '1.00', 1),
(554, 'V0000000554', '2025-11-06 16:13:30', '2025-11-06', 0, '1.00', 1),
(555, 'V0000000555', '2025-11-06 16:14:01', '2025-11-06', 0, '1.00', 1),
(556, 'V0000000556', '2025-11-06 16:14:24', '2025-11-06', 0, '1.00', 1),
(557, 'V0000000557', '2025-11-06 16:14:28', '2025-11-06', 0, '1.00', 1),
(558, 'V0000000558', '2025-11-06 18:07:02', '2025-11-06', 0, '1.00', 1),
(559, 'V0000000559', '2025-11-06 20:32:29', '2025-11-06', 0, '1.00', 1),
(560, 'V0000000560', '2025-11-06 20:35:27', '2025-11-06', 0, '1.00', 1),
(561, 'V0000000561', '2025-11-06 20:36:42', '2025-11-06', 0, '1.00', 1),
(562, 'V0000000562', '2025-11-06 20:36:47', '2025-11-06', 0, '1.00', 1),
(563, 'V0000000563', '2025-11-07 00:45:01', '2025-11-07', 0, '1.00', 1),
(564, 'V0000000564', '2025-11-07 07:44:24', '2025-11-07', 0, '1.00', 1),
(565, 'V0000000565', '2025-11-07 07:46:17', '2025-11-07', 0, '1.00', 1),
(566, 'V0000000566', '2025-11-07 07:47:43', '2025-11-07', 0, '1.00', 1),
(567, 'V0000000567', '2025-11-07 09:25:17', '2025-11-07', 0, '1.00', 1),
(568, 'V0000000568', '2025-11-07 09:34:55', '2025-11-07', 0, '1.00', 1),
(569, 'V0000000569', '2025-11-07 11:09:07', '2025-11-07', 0, '1.00', 1),
(570, 'V0000000570', '2025-11-07 16:55:40', '2025-11-07', 0, '1.00', 1),
(571, 'V0000000571', '2025-11-07 16:56:08', '2025-11-07', 0, '1.00', 1),
(572, 'V0000000572', '2025-11-07 18:11:37', '2025-11-07', 0, '1.00', 1),
(573, 'V0000000573', '2025-11-07 18:11:38', '2025-11-07', 0, '1.00', 1),
(574, 'V0000000574', '2025-11-07 18:11:39', '2025-11-07', 0, '1.00', 1),
(575, 'V0000000575', '2025-11-07 19:34:25', '2025-11-07', 0, '1.00', 1),
(576, 'V0000000576', '2025-11-07 19:44:22', '2025-11-07', 0, '1.00', 1),
(577, 'V0000000577', '2025-11-07 19:45:25', '2025-11-07', 0, '1.00', 1),
(578, 'V0000000578', '2025-11-07 19:45:45', '2025-11-07', 0, '1.00', 1),
(579, 'V0000000579', '2025-11-07 19:46:36', '2025-11-07', 0, '1.00', 1),
(580, 'V0000000580', '2025-11-07 22:36:25', '2025-11-07', 0, '1.00', 1),
(581, 'V0000000581', '2025-11-07 22:37:30', '2025-11-07', 0, '1.00', 1),
(582, 'V0000000582', '2025-11-07 22:38:24', '2025-11-07', 0, '1.00', 1),
(583, 'V0000000583', '2025-11-07 22:39:58', '2025-11-07', 0, '1.00', 1),
(584, 'V0000000584', '2025-11-07 22:54:10', '2025-11-07', 0, '1.00', 1),
(585, 'V0000000585', '2025-11-07 22:54:32', '2025-11-07', 0, '1.00', 1),
(586, 'V0000000586', '2025-11-07 23:01:12', '2025-11-07', 0, '1.00', 1),
(587, 'V0000000587', '2025-11-08 02:49:56', '2025-11-08', 0, '1.00', 1),
(588, 'V0000000588', '2025-11-08 03:54:45', '2025-11-08', 0, '1.00', 1),
(589, 'V0000000589', '2025-11-08 04:00:32', '2025-11-08', 0, '1.00', 1),
(590, 'V0000000590', '2025-11-08 10:40:27', '2025-11-08', 0, '1.00', 1),
(591, 'V0000000591', '2025-11-08 15:18:25', '2025-11-08', 0, '1.00', 1),
(592, 'V0000000592', '2025-11-08 18:34:33', '2025-11-08', 0, '1.00', 1),
(593, 'V0000000593', '2025-11-08 18:34:52', '2025-11-08', 0, '1.00', 1),
(594, 'V0000000594', '2025-11-08 18:35:15', '2025-11-08', 0, '1.00', 1),
(595, 'V0000000595', '2025-11-08 18:35:18', '2025-11-08', 0, '1.00', 1),
(596, 'V0000000596', '2025-11-08 18:38:33', '2025-11-08', 0, '1.00', 1),
(597, 'V0000000597', '2025-11-09 06:45:18', '2025-11-09', 0, '1.00', 1),
(598, 'V0000000598', '2025-11-09 06:45:34', '2025-11-09', 0, '1.00', 1),
(599, 'V0000000599', '2025-11-09 06:56:27', '2025-11-09', 0, '1.00', 1),
(600, 'V0000000600', '2025-11-09 07:08:15', '2025-11-09', 0, '1.00', 1),
(601, 'V0000000601', '2025-11-09 07:23:15', '2025-11-09', 0, '1.00', 1),
(602, 'V0000000602', '2025-11-09 07:23:38', '2025-11-09', 0, '1.00', 1),
(603, 'V0000000603', '2025-11-09 07:27:16', '2025-11-09', 0, '1.00', 1),
(604, 'V0000000604', '2025-11-09 12:52:57', '2025-11-09', 0, '1.00', 1),
(605, 'V0000000605', '2025-11-09 14:13:46', '2025-11-09', 0, '1.00', 1),
(606, 'V0000000606', '2025-11-09 14:15:19', '2025-11-09', 0, '1.00', 1),
(607, 'V0000000607', '2025-11-09 14:15:28', '2025-11-09', 0, '1.00', 1),
(608, 'V0000000608', '2025-11-09 14:51:24', '2025-11-09', 0, '1.00', 1),
(609, 'V0000000609', '2025-11-09 14:51:25', '2025-11-09', 0, '1.00', 1),
(610, 'V0000000610', '2025-11-09 14:52:02', '2025-11-09', 0, '1.00', 1),
(611, 'V0000000611', '2025-11-09 16:23:41', '2025-11-09', 0, '1.00', 1),
(612, 'V0000000612', '2025-11-09 16:25:39', '2025-11-09', 0, '1.00', 1),
(613, 'V0000000613', '2025-11-09 16:26:34', '2025-11-09', 0, '1.00', 1),
(614, 'V0000000614', '2025-11-09 16:27:18', '2025-11-09', 0, '1.00', 1),
(615, 'V0000000615', '2025-11-09 19:05:48', '2025-11-09', 0, '1.00', 1),
(616, 'V0000000616', '2025-11-09 19:05:49', '2025-11-09', 0, '1.00', 1),
(617, 'V0000000617', '2025-11-09 23:59:38', '2025-11-09', 0, '1.00', 1),
(618, 'V0000000618', '2025-11-10 06:02:48', '2025-11-10', 0, '1.00', 1),
(619, 'V0000000619', '2025-11-10 07:49:22', '2025-11-10', 0, '1.00', 1),
(620, 'V0000000620', '2025-11-10 07:51:17', '2025-11-10', 0, '1.00', 1),
(621, 'V0000000621', '2025-11-10 07:51:52', '2025-11-10', 0, '1.00', 1),
(622, 'V0000000622', '2025-11-11 02:06:06', '2025-11-11', 0, '1.00', 1),
(623, 'V0000000623', '2025-11-11 02:06:15', '2025-11-11', 0, '1.00', 1),
(624, 'V0000000624', '2025-11-11 02:08:53', '2025-11-11', 0, '1.00', 1),
(625, 'V0000000625', '2025-11-11 03:29:37', '2025-11-11', 0, '1.00', 1),
(626, 'V0000000626', '2025-11-11 05:38:12', '2025-11-11', 0, '1.00', 1),
(627, 'V0000000627', '2025-11-11 05:59:16', '2025-11-11', 0, '1.00', 1),
(628, 'V0000000628', '2025-11-11 12:12:15', '2025-11-11', 0, '1.00', 1),
(629, 'V0000000629', '2025-11-11 12:45:37', '2025-11-11', 0, '1.00', 1),
(630, 'V0000000630', '2025-11-11 14:33:38', '2025-11-11', 0, '1.00', 1),
(631, 'V0000000631', '2025-11-11 14:34:42', '2025-11-11', 0, '1.00', 1),
(632, 'V0000000632', '2025-11-11 14:35:38', '2025-11-11', 0, '1.00', 1),
(633, 'V0000000633', '2025-11-11 14:37:43', '2025-11-11', 0, '1.00', 1),
(634, 'V0000000634', '2025-11-11 17:57:36', '2025-11-11', 0, '1.00', 1),
(635, 'V0000000635', '2025-11-11 17:57:37', '2025-11-11', 0, '1.00', 1),
(636, 'V0000000636', '2025-11-12 00:57:41', '2025-11-12', 0, '1.00', 1),
(637, 'V0000000637', '2025-11-12 00:58:22', '2025-11-12', 0, '1.00', 1),
(638, 'V0000000638', '2025-11-12 00:58:26', '2025-11-12', 0, '1.00', 1),
(639, 'V0000000639', '2025-11-12 03:21:40', '2025-11-12', 0, '1.00', 1),
(640, 'V0000000640', '2025-11-12 05:47:32', '2025-11-12', 0, '1.00', 1),
(641, 'V0000000641', '2025-11-12 10:37:43', '2025-11-12', 0, '1.00', 1),
(642, 'V0000000642', '2025-11-12 14:07:20', '2025-11-12', 0, '1.00', 1),
(643, 'V0000000643', '2025-11-12 15:16:04', '2025-11-12', 0, '1.00', 1),
(644, 'V0000000644', '2025-11-12 15:17:23', '2025-11-12', 0, '1.00', 1),
(645, 'V0000000645', '2025-11-12 15:18:09', '2025-11-12', 0, '1.00', 1),
(646, 'V0000000646', '2025-11-12 15:18:49', '2025-11-12', 0, '1.00', 1),
(647, 'V0000000647', '2025-11-12 17:01:20', '2025-11-12', 0, '1.00', 1),
(648, 'V0000000648', '2025-11-12 17:01:21', '2025-11-12', 0, '1.00', 1),
(649, 'V0000000649', '2025-11-12 18:34:28', '2025-11-12', 0, '1.00', 1),
(650, 'V0000000650', '2025-11-12 19:01:32', '2025-11-12', 0, '1.00', 1),
(651, 'V0000000651', '2025-11-12 19:29:51', '2025-11-12', 0, '1.00', 1),
(652, 'V0000000652', '2025-11-12 19:31:52', '2025-11-12', 0, '1.00', 1),
(653, 'V0000000653', '2025-11-12 20:06:10', '2025-11-12', 0, '1.00', 1),
(654, 'V0000000654', '2025-11-12 22:28:30', '2025-11-12', 0, '1.00', 1),
(655, 'V0000000655', '2025-11-12 23:29:55', '2025-11-12', 0, '1.00', 1),
(656, 'V0000000656', '2025-11-13 01:13:26', '2025-11-13', 0, '1.00', 1),
(657, 'V0000000657', '2025-11-13 01:49:47', '2025-11-13', 0, '1.00', 1),
(658, 'V0000000658', '2025-11-13 02:46:59', '2025-11-13', 0, '1.00', 1),
(659, 'V0000000659', '2025-11-13 02:47:28', '2025-11-13', 0, '1.00', 1),
(660, 'V0000000660', '2025-11-13 02:47:50', '2025-11-13', 0, '1.00', 1),
(661, 'V0000000661', '2025-11-13 02:48:05', '2025-11-13', 0, '1.00', 1),
(662, 'V0000000662', '2025-11-13 05:39:17', '2025-11-13', 0, '1.00', 1),
(663, 'V0000000663', '2025-11-13 06:41:02', '2025-11-13', 0, '1.00', 1),
(664, 'V0000000664', '2025-11-13 06:52:06', '2025-11-13', 0, '1.00', 1),
(665, 'V0000000665', '2025-11-13 07:32:22', '2025-11-13', 0, '1.00', 1),
(666, 'V0000000666', '2025-11-13 09:24:17', '2025-11-13', 0, '1.00', 1),
(667, 'V0000000667', '2025-11-13 09:47:55', '2025-11-13', 0, '1.00', 1),
(668, 'V0000000668', '2025-11-13 12:37:51', '2025-11-13', 0, '1.00', 1),
(669, 'V0000000669', '2025-11-13 13:02:08', '2025-11-13', 0, '1.00', 1),
(670, 'V0000000670', '2025-11-13 13:34:44', '2025-11-13', 0, '1.00', 1),
(671, 'V0000000671', '2025-11-13 15:14:10', '2025-11-13', 0, '1.00', 1),
(672, 'V0000000672', '2025-11-13 15:14:11', '2025-11-13', 0, '1.00', 1),
(673, 'V0000000673', '2025-11-13 15:18:18', '2025-11-13', 0, '1.00', 1),
(674, 'V0000000674', '2025-11-13 15:18:19', '2025-11-13', 0, '1.00', 1),
(675, 'V0000000675', '2025-11-13 15:18:21', '2025-11-13', 0, '1.00', 1),
(676, 'V0000000676', '2025-11-13 15:18:21', '2025-11-13', 0, '1.00', 1),
(677, 'V0000000677', '2025-11-13 15:18:21', '2025-11-13', 0, '1.00', 1),
(678, 'V0000000678', '2025-11-13 15:18:22', '2025-11-13', 0, '1.00', 1),
(679, 'V0000000679', '2025-11-13 15:18:22', '2025-11-13', 0, '1.00', 1),
(680, 'V0000000680', '2025-11-13 15:18:23', '2025-11-13', 0, '1.00', 1),
(681, 'V0000000681', '2025-11-13 15:18:23', '2025-11-13', 0, '1.00', 1),
(682, 'V0000000682', '2025-11-13 15:18:24', '2025-11-13', 0, '1.00', 1),
(683, 'V0000000683', '2025-11-13 15:18:24', '2025-11-13', 0, '1.00', 1),
(684, 'V0000000684', '2025-11-13 15:18:24', '2025-11-13', 0, '1.00', 1),
(685, 'V0000000685', '2025-11-13 15:18:25', '2025-11-13', 0, '1.00', 1),
(686, 'V0000000686', '2025-11-13 15:18:26', '2025-11-13', 0, '1.00', 1),
(687, 'V0000000687', '2025-11-13 15:18:26', '2025-11-13', 0, '1.00', 1),
(688, 'V0000000688', '2025-11-13 15:18:26', '2025-11-13', 0, '1.00', 1),
(689, 'V0000000689', '2025-11-13 15:18:27', '2025-11-13', 0, '1.00', 1),
(690, 'V0000000690', '2025-11-13 15:18:27', '2025-11-13', 0, '1.00', 1),
(691, 'V0000000691', '2025-11-13 15:18:27', '2025-11-13', 0, '1.00', 1),
(692, 'V0000000692', '2025-11-13 15:18:28', '2025-11-13', 0, '1.00', 1),
(693, 'V0000000693', '2025-11-13 15:18:28', '2025-11-13', 0, '1.00', 1),
(694, 'V0000000694', '2025-11-13 15:18:28', '2025-11-13', 0, '1.00', 1),
(695, 'V0000000695', '2025-11-13 15:18:29', '2025-11-13', 0, '1.00', 1),
(696, 'V0000000696', '2025-11-13 15:18:29', '2025-11-13', 0, '1.00', 1),
(697, 'V0000000697', '2025-11-13 15:18:29', '2025-11-13', 0, '1.00', 1),
(698, 'V0000000698', '2025-11-13 15:18:30', '2025-11-13', 0, '1.00', 1),
(699, 'V0000000699', '2025-11-13 15:18:30', '2025-11-13', 0, '1.00', 1),
(700, 'V0000000700', '2025-11-13 15:18:30', '2025-11-13', 0, '1.00', 1),
(701, 'V0000000701', '2025-11-13 15:18:31', '2025-11-13', 0, '1.00', 1),
(702, 'V0000000702', '2025-11-13 15:18:31', '2025-11-13', 0, '1.00', 1),
(703, 'V0000000703', '2025-11-13 15:18:32', '2025-11-13', 0, '1.00', 1);
INSERT INTO `us_visitas` (`id`, `cliente_id`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `rolUsuario_id`) VALUES
(704, 'V0000000704', '2025-11-13 15:22:18', '2025-11-13', 0, '1.00', 1),
(705, 'V0000000705', '2025-11-13 15:22:19', '2025-11-13', 0, '1.00', 1),
(706, 'V0000000706', '2025-11-13 16:55:58', '2025-11-13', 0, '1.00', 1),
(707, 'V0000000707', '2025-11-13 17:18:23', '2025-11-13', 0, '1.00', 1),
(708, 'V0000000708', '2025-11-13 17:26:35', '2025-11-13', 0, '1.00', 1),
(709, 'V0000000709', '2025-11-13 17:42:57', '2025-11-13', 0, '1.00', 1),
(710, 'V0000000710', '2025-11-13 17:47:32', '2025-11-13', 0, '1.00', 1),
(711, 'V0000000711', '2025-11-13 17:48:26', '2025-11-13', 0, '1.00', 1),
(712, 'V0000000712', '2025-11-13 18:10:17', '2025-11-13', 0, '1.00', 1),
(713, 'V0000000713', '2025-11-13 18:17:49', '2025-11-13', 0, '1.00', 1),
(714, 'V0000000714', '2025-11-13 18:20:12', '2025-11-13', 0, '1.00', 1),
(715, 'V0000000715', '2025-11-13 18:20:44', '2025-11-13', 0, '1.00', 1),
(716, 'V0000000716', '2025-11-13 18:21:03', '2025-11-13', 0, '1.00', 1),
(717, 'V0000000717', '2025-11-13 20:04:45', '2025-11-13', 0, '1.00', 1),
(718, 'V0000000718', '2025-11-13 20:04:46', '2025-11-13', 0, '1.00', 1),
(719, 'V0000000719', '2025-11-13 23:11:57', '2025-11-13', 0, '1.00', 1),
(720, 'V0000000720', '2025-11-14 00:03:19', '2025-11-14', 0, '1.00', 1),
(721, NULL, '2025-11-14 00:03:20', '2025-11-14', 0, '1.00', 1),
(722, 'V0000000722', '2025-11-14 00:55:03', '2025-11-14', 0, '1.00', 1),
(723, 'V0000000723', '2025-11-14 00:55:05', '2025-11-14', 0, '1.00', 1),
(724, 'V0000000724', '2025-11-14 04:56:34', '2025-11-14', 0, '1.00', 1),
(725, 'V0000000725', '2025-11-14 04:56:35', '2025-11-14', 0, '1.00', 1),
(726, 'V0000000726', '2025-11-14 04:58:06', '2025-11-14', 0, '1.00', 1),
(727, 'V0000000727', '2025-11-14 05:49:56', '2025-11-14', 0, '1.00', 1),
(728, 'V0000000728', '2025-11-14 06:55:14', '2025-11-14', 0, '1.00', 1),
(729, 'V0000000729', '2025-11-14 08:42:34', '2025-11-14', 0, '1.00', 1),
(730, 'V0000000730', '2025-11-14 08:45:28', '2025-11-14', 0, '1.00', 1),
(731, 'V0000000731', '2025-11-14 08:46:32', '2025-11-14', 0, '1.00', 1),
(732, 'V0000000732', '2025-11-14 14:55:23', '2025-11-14', 0, '1.00', 1),
(733, 'V0000000733', '2025-11-14 15:48:44', '2025-11-14', 0, '1.00', 1),
(734, 'V0000000734', '2025-11-14 16:10:26', '2025-11-14', 0, '1.00', 1),
(735, 'V0000000735', '2025-11-14 17:08:28', '2025-11-14', 0, '1.00', 1),
(736, 'V0000000736', '2025-11-14 17:09:13', '2025-11-14', 0, '1.00', 1),
(737, 'V0000000737', '2025-11-14 17:10:31', '2025-11-14', 0, '1.00', 1),
(738, 'V0000000738', '2025-11-14 17:12:13', '2025-11-14', 0, '1.00', 1),
(739, 'V0000000739', '2025-11-14 18:35:12', '2025-11-14', 0, '1.00', 1),
(740, 'V0000000740', '2025-11-14 18:35:13', '2025-11-14', 0, '1.00', 1),
(741, 'V0000000741', '2025-11-14 18:49:56', '2025-11-14', 0, '1.00', 1),
(742, 'V0000000742', '2025-11-14 18:49:57', '2025-11-14', 0, '1.00', 1),
(743, 'V0000000743', '2025-11-15 00:14:49', '2025-11-15', 0, '1.00', 1),
(744, 'V0000000744', '2025-11-15 00:57:52', '2025-11-15', 0, '1.00', 1),
(745, 'V0000000745', '2025-11-15 00:59:32', '2025-11-15', 0, '1.00', 1),
(746, 'V0000000746', '2025-11-15 02:07:51', '2025-11-15', 0, '1.00', 1),
(747, 'V0000000747', '2025-11-15 02:54:24', '2025-11-15', 0, '1.00', 1),
(748, 'V0000000748', '2025-11-15 05:24:44', '2025-11-15', 0, '1.00', 1),
(749, 'V0000000749', '2025-11-15 05:24:59', '2025-11-15', 0, '1.00', 1),
(750, 'V0000000750', '2025-11-15 05:25:10', '2025-11-15', 0, '1.00', 1),
(751, 'V0000000751', '2025-11-15 12:16:02', '2025-11-15', 0, '1.00', 1),
(752, 'V0000000752', '2025-11-15 16:30:07', '2025-11-15', 0, '1.00', 1),
(753, 'V0000000753', '2025-11-15 17:33:35', '2025-11-15', 0, '1.00', 1),
(754, 'V0000000754', '2025-11-15 17:34:29', '2025-11-15', 0, '1.00', 1),
(755, 'V0000000755', '2025-11-15 17:35:30', '2025-11-15', 0, '1.00', 1),
(756, 'V0000000756', '2025-11-15 17:36:23', '2025-11-15', 0, '1.00', 1),
(757, 'V0000000757', '2025-11-15 19:40:23', '2025-11-15', 0, '1.00', 1),
(758, 'V0000000758', '2025-11-15 19:40:24', '2025-11-15', 0, '1.00', 1),
(759, 'V0000000759', '2025-11-15 23:04:32', '2025-11-15', 0, '1.00', 1),
(760, 'V0000000760', '2025-11-16 02:07:33', '2025-11-16', 0, '1.00', 1),
(761, 'V0000000761', '2025-11-16 03:53:32', '2025-11-16', 0, '1.00', 1),
(762, 'V0000000762', '2025-11-16 03:54:54', '2025-11-16', 0, '1.00', 1),
(763, 'V0000000763', '2025-11-16 03:54:55', '2025-11-16', 0, '1.00', 1),
(764, 'V0000000764', '2025-11-16 04:39:54', '2025-11-16', 0, '1.00', 1),
(765, 'V0000000765', '2025-11-16 05:34:50', '2025-11-16', 0, '1.00', 1),
(766, 'V0000000766', '2025-11-16 07:25:44', '2025-11-16', 0, '1.00', 1),
(767, 'V0000000767', '2025-11-16 07:27:06', '2025-11-16', 0, '1.00', 1),
(768, 'V0000000768', '2025-11-16 07:27:21', '2025-11-16', 0, '1.00', 1),
(769, 'V0000000769', '2025-11-16 07:50:04', '2025-11-16', 0, '1.00', 1),
(770, 'V0000000770', '2025-11-16 09:25:20', '2025-11-16', 0, '1.00', 1),
(771, 'V0000000771', '2025-11-16 09:38:49', '2025-11-16', 0, '1.00', 1),
(772, 'V0000000772', '2025-11-16 09:58:58', '2025-11-16', 0, '1.00', 1),
(773, 'V0000000773', '2025-11-16 11:19:05', '2025-11-16', 0, '1.00', 1),
(774, 'V0000000774', '2025-11-16 11:19:45', '2025-11-16', 0, '1.00', 1),
(775, 'V0000000775', '2025-11-16 11:21:38', '2025-11-16', 0, '1.00', 1),
(776, 'V0000000776', '2025-11-16 11:22:09', '2025-11-16', 0, '1.00', 1),
(777, 'V0000000777', '2025-11-16 12:36:27', '2025-11-16', 0, '1.00', 1),
(778, 'V0000000778', '2025-11-16 12:36:32', '2025-11-16', 0, '1.00', 1),
(779, 'V0000000779', '2025-11-16 12:36:43', '2025-11-16', 0, '1.00', 1),
(780, 'V0000000780', '2025-11-16 12:36:45', '2025-11-16', 0, '1.00', 1),
(781, 'V0000000781', '2025-11-16 12:57:52', '2025-11-16', 0, '1.00', 1),
(782, 'V0000000782', '2025-11-16 12:59:59', '2025-11-16', 0, '1.00', 1),
(783, 'V0000000783', '2025-11-16 13:00:04', '2025-11-16', 0, '1.00', 1),
(784, 'V0000000784', '2025-11-16 23:34:13', '2025-11-16', 0, '1.00', 1),
(785, 'V0000000785', '2025-11-17 02:56:19', '2025-11-17', 0, '1.00', 1),
(786, 'V0000000786', '2025-11-17 05:13:32', '2025-11-17', 0, '1.00', 1),
(787, 'V0000000787', '2025-11-17 05:23:15', '2025-11-17', 0, '1.00', 1),
(788, 'V0000000788', '2025-11-17 05:23:51', '2025-11-17', 0, '1.00', 1),
(789, 'V0000000789', '2025-11-17 05:23:57', '2025-11-17', 0, '1.00', 1),
(790, 'V0000000790', '2025-11-17 05:23:58', '2025-11-17', 0, '1.00', 1),
(791, 'V0000000791', '2025-11-17 05:24:08', '2025-11-17', 0, '1.00', 1),
(792, 'V0000000792', '2025-11-17 05:24:10', '2025-11-17', 0, '1.00', 1),
(793, 'V0000000793', '2025-11-17 05:24:11', '2025-11-17', 0, '1.00', 1),
(794, 'V0000000794', '2025-11-17 05:24:12', '2025-11-17', 0, '1.00', 1),
(795, 'V0000000795', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(796, 'V0000000796', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(797, 'V0000000797', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(798, 'V0000000798', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(799, 'V0000000799', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(800, 'V0000000800', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(801, 'V0000000801', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(802, 'V0000000802', '2025-11-17 05:24:20', '2025-11-17', 0, '1.00', 1),
(803, 'V0000000803', '2025-11-17 05:24:21', '2025-11-17', 0, '1.00', 1),
(804, 'V0000000804', '2025-11-17 05:24:37', '2025-11-17', 0, '1.00', 1),
(805, 'V0000000805', '2025-11-17 05:24:37', '2025-11-17', 0, '1.00', 1),
(806, 'V0000000806', '2025-11-17 05:24:38', '2025-11-17', 0, '1.00', 1),
(807, 'V0000000807', '2025-11-17 05:24:38', '2025-11-17', 0, '1.00', 1),
(808, 'V0000000808', '2025-11-17 05:24:44', '2025-11-17', 0, '1.00', 1),
(809, 'V0000000809', '2025-11-17 05:24:44', '2025-11-17', 0, '1.00', 1),
(810, 'V0000000810', '2025-11-17 05:24:44', '2025-11-17', 0, '1.00', 1),
(811, 'V0000000811', '2025-11-17 05:24:44', '2025-11-17', 0, '1.00', 1),
(812, 'V0000000812', '2025-11-17 05:24:50', '2025-11-17', 0, '1.00', 1),
(813, 'V0000000813', '2025-11-17 05:24:50', '2025-11-17', 0, '1.00', 1),
(814, 'V0000000814', '2025-11-17 05:24:50', '2025-11-17', 0, '1.00', 1),
(815, 'V0000000815', '2025-11-17 05:24:51', '2025-11-17', 0, '1.00', 1),
(816, 'V0000000816', '2025-11-17 05:24:51', '2025-11-17', 0, '1.00', 1),
(817, 'V0000000817', '2025-11-17 05:24:51', '2025-11-17', 0, '1.00', 1),
(818, 'V0000000818', '2025-11-17 05:24:57', '2025-11-17', 0, '1.00', 1),
(819, 'V0000000819', '2025-11-17 05:24:57', '2025-11-17', 0, '1.00', 1),
(820, 'V0000000820', '2025-11-17 05:24:57', '2025-11-17', 0, '1.00', 1),
(821, 'V0000000821', '2025-11-17 05:25:02', '2025-11-17', 0, '1.00', 1),
(822, 'V0000000822', '2025-11-17 05:25:03', '2025-11-17', 0, '1.00', 1),
(823, 'V0000000823', '2025-11-17 05:25:03', '2025-11-17', 0, '1.00', 1),
(824, 'V0000000824', '2025-11-17 05:25:03', '2025-11-17', 0, '1.00', 1),
(825, 'V0000000825', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(826, 'V0000000826', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(827, 'V0000000827', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(828, 'V0000000828', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(829, 'V0000000829', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(830, 'V0000000830', '2025-11-17 05:25:04', '2025-11-17', 0, '1.00', 1),
(831, 'V0000000831', '2025-11-17 05:25:05', '2025-11-17', 0, '1.00', 1),
(832, 'V0000000832', '2025-11-17 05:25:05', '2025-11-17', 0, '1.00', 1),
(833, 'V0000000833', '2025-11-17 05:25:05', '2025-11-17', 0, '1.00', 1),
(834, 'V0000000834', '2025-11-17 05:25:05', '2025-11-17', 0, '1.00', 1),
(835, 'V0000000835', '2025-11-17 05:25:06', '2025-11-17', 0, '1.00', 1),
(836, 'V0000000836', '2025-11-17 05:25:07', '2025-11-17', 0, '1.00', 1),
(837, 'V0000000837', '2025-11-17 05:25:07', '2025-11-17', 0, '1.00', 1),
(838, 'V0000000838', '2025-11-17 05:44:34', '2025-11-17', 0, '1.00', 1),
(839, 'V0000000839', '2025-11-17 05:44:43', '2025-11-17', 0, '1.00', 1),
(840, 'V0000000840', '2025-11-17 05:44:44', '2025-11-17', 0, '1.00', 1),
(841, 'V0000000841', '2025-11-17 05:44:44', '2025-11-17', 0, '1.00', 1),
(842, 'V0000000842', '2025-11-17 05:44:44', '2025-11-17', 0, '1.00', 1),
(843, 'V0000000843', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(844, 'V0000000844', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(845, 'V0000000845', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(846, 'V0000000846', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(847, 'V0000000847', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(848, 'V0000000848', '2025-11-17 05:44:50', '2025-11-17', 0, '1.00', 1),
(849, 'V0000000849', '2025-11-17 05:44:51', '2025-11-17', 0, '1.00', 1),
(850, 'V0000000850', '2025-11-17 05:44:51', '2025-11-17', 0, '1.00', 1),
(851, 'V0000000851', '2025-11-17 05:44:51', '2025-11-17', 0, '1.00', 1),
(852, 'V0000000852', '2025-11-17 05:44:51', '2025-11-17', 0, '1.00', 1),
(853, 'V0000000853', '2025-11-17 05:44:51', '2025-11-17', 0, '1.00', 1),
(854, 'V0000000854', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(855, 'V0000000855', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(856, 'V0000000856', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(857, 'V0000000857', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(858, 'V0000000858', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(859, 'V0000000859', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(860, 'V0000000860', '2025-11-17 05:44:54', '2025-11-17', 0, '1.00', 1),
(861, 'V0000000861', '2025-11-17 05:44:55', '2025-11-17', 0, '1.00', 1),
(862, 'V0000000862', '2025-11-17 05:44:55', '2025-11-17', 0, '1.00', 1),
(863, 'V0000000863', '2025-11-17 05:44:56', '2025-11-17', 0, '1.00', 1),
(864, 'V0000000864', '2025-11-17 05:44:56', '2025-11-17', 0, '1.00', 1),
(865, 'V0000000865', '2025-11-17 05:45:23', '2025-11-17', 0, '1.00', 1),
(866, 'V0000000866', '2025-11-17 05:45:23', '2025-11-17', 0, '1.00', 1),
(867, 'V0000000867', '2025-11-17 05:45:24', '2025-11-17', 0, '1.00', 1),
(868, 'V0000000868', '2025-11-17 05:45:24', '2025-11-17', 0, '1.00', 1),
(869, 'V0000000869', '2025-11-17 05:45:24', '2025-11-17', 0, '1.00', 1),
(870, 'V0000000870', '2025-11-17 05:45:24', '2025-11-17', 0, '1.00', 1),
(871, 'V0000000871', '2025-11-17 05:45:25', '2025-11-17', 0, '1.00', 1),
(872, 'V0000000872', '2025-11-17 05:45:25', '2025-11-17', 0, '1.00', 1),
(873, 'V0000000873', '2025-11-17 05:45:26', '2025-11-17', 0, '1.00', 1),
(874, 'V0000000874', '2025-11-17 05:45:35', '2025-11-17', 0, '1.00', 1),
(875, 'V0000000875', '2025-11-17 05:45:35', '2025-11-17', 0, '1.00', 1),
(876, 'V0000000876', '2025-11-17 05:45:35', '2025-11-17', 0, '1.00', 1),
(877, 'V0000000877', '2025-11-17 05:45:35', '2025-11-17', 0, '1.00', 1),
(878, 'V0000000878', '2025-11-17 05:45:35', '2025-11-17', 0, '1.00', 1),
(879, 'V0000000879', '2025-11-17 05:45:54', '2025-11-17', 0, '1.00', 1),
(880, 'V0000000880', '2025-11-17 05:45:54', '2025-11-17', 0, '1.00', 1),
(881, 'V0000000881', '2025-11-17 05:45:54', '2025-11-17', 0, '1.00', 1),
(882, 'V0000000882', '2025-11-17 05:45:55', '2025-11-17', 0, '1.00', 1),
(883, 'V0000000883', '2025-11-17 05:45:56', '2025-11-17', 0, '1.00', 1),
(884, 'V0000000884', '2025-11-17 05:45:56', '2025-11-17', 0, '1.00', 1),
(885, 'V0000000885', '2025-11-17 05:45:57', '2025-11-17', 0, '1.00', 1),
(886, 'V0000000886', '2025-11-17 05:45:57', '2025-11-17', 0, '1.00', 1),
(887, 'V0000000887', '2025-11-17 05:45:57', '2025-11-17', 0, '1.00', 1),
(888, 'V0000000888', '2025-11-17 05:46:03', '2025-11-17', 0, '1.00', 1),
(889, 'V0000000889', '2025-11-17 05:46:03', '2025-11-17', 0, '1.00', 1),
(890, 'V0000000890', '2025-11-17 05:46:03', '2025-11-17', 0, '1.00', 1),
(891, 'V0000000891', '2025-11-17 05:46:03', '2025-11-17', 0, '1.00', 1),
(892, 'V0000000892', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(893, 'V0000000893', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(894, 'V0000000894', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(895, 'V0000000895', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(896, 'V0000000896', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(897, 'V0000000897', '2025-11-17 05:46:04', '2025-11-17', 0, '1.00', 1),
(898, 'V0000000898', '2025-11-17 05:53:49', '2025-11-17', 0, '1.00', 1),
(899, 'V0000000899', '2025-11-17 10:54:05', '2025-11-17', 0, '1.00', 1),
(900, 'V0000000900', '2025-11-17 10:55:13', '2025-11-17', 0, '1.00', 1),
(901, 'V0000000901', '2025-11-17 10:55:16', '2025-11-17', 0, '1.00', 1),
(902, 'V0000000902', '2025-11-17 10:56:20', '2025-11-17', 0, '1.00', 1),
(903, 'V0000000903', '2025-11-17 11:25:37', '2025-11-17', 0, '1.00', 1),
(904, 'V0000000904', '2025-11-17 11:41:22', '2025-11-17', 0, '1.00', 1),
(905, 'V0000000905', '2025-11-17 12:40:52', '2025-11-17', 0, '1.00', 1),
(906, 'V0000000906', '2025-11-17 13:05:19', '2025-11-17', 0, '1.00', 1),
(907, 'V0000000907', '2025-11-17 13:24:28', '2025-11-17', 0, '1.00', 1),
(908, 'V0000000908', '2025-11-17 13:31:24', '2025-11-17', 0, '1.00', 1),
(909, 'V0000000909', '2025-11-17 13:45:00', '2025-11-17', 0, '1.00', 1),
(910, 'V0000000910', '2025-11-17 16:12:42', '2025-11-17', 0, '1.00', 1),
(911, 'V0000000911', '2025-11-17 16:15:33', '2025-11-17', 0, '1.00', 1),
(912, 'V0000000912', '2025-11-17 16:20:00', '2025-11-17', 0, '1.00', 1),
(913, 'V0000000913', '2025-11-17 16:20:08', '2025-11-17', 0, '1.00', 1),
(914, 'V0000000914', '2025-11-17 17:34:02', '2025-11-17', 0, '1.00', 1),
(915, 'V0000000915', '2025-11-17 17:47:54', '2025-11-17', 0, '1.00', 1),
(916, 'V0000000916', '2025-11-17 18:11:40', '2025-11-17', 0, '1.00', 1),
(917, 'V0000000917', '2025-11-17 18:48:55', '2025-11-17', 0, '1.00', 1),
(918, 'V0000000918', '2025-11-17 18:51:22', '2025-11-17', 0, '1.00', 1),
(919, 'V0000000919', '2025-11-17 18:51:27', '2025-11-17', 0, '1.00', 1),
(920, 'V0000000920', '2025-11-17 18:52:08', '2025-11-17', 0, '1.00', 1),
(921, 'V0000000921', '2025-11-17 19:54:52', '2025-11-17', 0, '1.00', 1),
(922, 'V0000000922', '2025-11-17 19:54:53', '2025-11-17', 0, '1.00', 1);

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
-- Indexes for table `aux_paises`
--
ALTER TABLE `aux_paises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

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
  ADD KEY `status_registro_id` (`statusRegistro_id`) USING BTREE,
  ADD KEY `us_usuarios_pais` (`pais_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `us_visitas`
--
ALTER TABLE `us_visitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=923;

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
  ADD CONSTRAINT `us_usuarios_pais` FOREIGN KEY (`pais_id`) REFERENCES `aux_paises` (`id`),
  ADD CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rolUsuario_id`) REFERENCES `us_roles` (`id`),
  ADD CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
