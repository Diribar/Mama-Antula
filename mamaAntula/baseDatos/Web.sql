-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 30, 2025 at 12:26 PM
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

-- --------------------------------------------------------
DROP DATABASE IF EXISTS `ma_bd`;
CREATE DATABASE IF NOT EXISTS `ma_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ma_bd`;

--
-- Table structure for table `aux_iconos_agrups`
--

CREATE TABLE `aux_iconos_agrups` (
  `id` tinyint(2) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `clase` varchar(20) NOT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_iconos_agrups`
--

INSERT INTO `aux_iconos_agrups` (`id`, `orden`, `nombre`, `codigo`, `clase`, `link`) VALUES
(1, 1, 'Facebook', NULL, 'fa-facebook', 'https://www.facebook.com/Beatificaci%C3%B3n-Mama-Antula-103876214815561'),
(2, 2, 'Instagram', NULL, 'fa-instagram', 'https://www.instagram.com/beatificacionantula/'),
(3, 3, 'Twitter', NULL, 'fa-twitter', 'https://twitter.com/beatificaciona1'),
(4, 4, 'TikTok', NULL, 'fa-tiktok', 'https://www.tiktok.com/@mamaantula.com'),
(5, 1, 'Lectura', 'lectura', 'fa-link', NULL),
(6, 2, 'Actualizar contenido', 'actualiza', 'fa-square-plus', '/contenido/actualizar'),
(7, 3, 'Revisar actualizaciones', 'revisa', 'fa-book', '/contenido/revisar'),
(8, 4, 'Cambio de roles', 'cambioRoles', 'fa-user', '/usuarios/cambio-de-roles');

-- --------------------------------------------------------

--
-- Table structure for table `aux_lugares`
--

CREATE TABLE `aux_lugares` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aux_lugares`
--

INSERT INTO `aux_lugares` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'Córdoba'),
(2, 2, 'Buenos Aires'),
(3, 3, 'Basílica La Piedad, Bs. As.'),
(4, 4, 'Basílica del Socorro, Bs. As.'),
(5, 5, 'Santa Casa, Bs. As.'),
(6, 99, 'Varios'),
(7, 6, 'Vaticano');

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
(1, 'Subida a internet del primer borrador', '2025-10-21', '1.00'),
(2, 'Subida a internet del segundo borrador', '2025-11-18', '1.01');

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
(4, 4, 'Inactivar', 'inactivar'),
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
-- Table structure for table `cont_2contenidos`
--

CREATE TABLE `cont_2contenidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `encab_id` int(10) UNSIGNED DEFAULT NULL,
  `orden` tinyint(1) UNSIGNED DEFAULT 1,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `creadoPor_id` int(10) UNSIGNED NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cont_2contenidos`
--

INSERT INTO `cont_2contenidos` (`id`, `encab_id`, `orden`, `texto`, `imagen`, `video`, `leyenda`, `creadoPor_id`, `creadoEn`, `statusRegistro_id`) VALUES
(1, 8, 1, '<p><strong>María Antonia de Paz y Figueroa</strong> nació en Santiago del Estero en 1730. A los 15 años empezó a acompañar a los Jesuitas como <em>Beata de la Compañía de Jesús</em>en la tarea de evangelización de los pueblos originarios santiagueños, enseñándoles la Palabra de Dios, a leer y a escribir, y a perfeccionar técnicas de ganadería y agricultura. Mama Antula hablaba quichua. Y fueron los indígenas quienes la bautizaron <strong><em>Mama Antula</em>.</strong> Cuando los jesuitas fueron expulsados de América en 1767, en una experiencia de epifanía en la celda capilla de San Francisco Solano y a la edad de 38 años, Mama Antula recibió la misión de su vida: continuar <strong>con la práctica de los Ejercicios Espirituales que realizaban los jesuitas</strong>, para la salvación de las almas.</p><p>Fue entonces cuando empezó su misión en salida y eligió su nombre de Iglesia: <strong>María Antonia de San José.</strong></p><p>Por entonces las mujeres estaban confinadas a casarse o elegir los votos religiosos, no leían ni escribían y mucho menos salían al mundo sin la compañía de un hombre y libradas a la providencia divina. <strong>Mama Antula desafió las convenciones de su tiempo</strong> y peregrinó por todo el actual territorio del NOA argentino -por entonces formábamos parte del virreinato del Perú-, organizando los Ejercicios Espirituales a pesar de estar prohibidos por el Rey Carlos III, pero consiguiendo que los Obispos locales autorizaran su tarea. Llegó a Buenos Aires caminando más de 5 mil kilómetros, donde realizó su obra cúlmine -en los inicios del virreinato del Río de la Plata-: La construcción de <strong>la Santa Casa</strong>, un lugar levantado enteramente con donaciones, y donde exclusivamente se realizan los Ejercicios Espirituales de San Ignacio de Loyola. Fue inaugurada en 1795 y allí murió Mama Antula en 1799, y desde entonces sigue funciones hasta el día de hoy. Allí ricos y pobres compartían mesa y rezaban juntos, y se estima que 70 mil personas realizaron los Ejercicios Espirituales allí, compartiendo el pan y aprendiendo los valores que precedieron y formaron la gesta de mayo y a la creación del Estado Argentino.</p><p>La primera santa de la argentina es laica, valiente, considerada la primera escritora del Río de la Plata (se pueden <a href=\"/cartas-y-escritos/cartas\" target=\"_blank\">leer aquí sus famosas cartas</a>); una mujer fuerte que nos enseña la santidad cotidiana y a confiar en la providencia con una fe inquebrantable. Es la patrona de las empresarias argentinas, y a ella se le reza pidiéndole perseverancia en las dificultades y la aceptación de la voluntad de Dios. Su fiesta litúrgica es el 7 de marzo.</p>', '1760660122981.jpg', NULL, 'Peregrinaje que realizó santa Mama Antula', 1, '2025-10-17 16:56:26', 1),
(2, 2, 3, NULL, NULL, 'FEMEkVui6w4', 'En el encuentro, el Arq. Jorge Bayá Casal compartió su experiencia recorriendo el camino de Mama Antula desde Santiago del Estero hasta Buenos Aires, e hizo cantar a los presentes la zamba compuesta por él mismo: «Mama Antula a través del camino real».', 1, '2025-11-04 18:56:14', 1),
(3, 3, 1, '<p>Ya el miércoles 6 a la tardecita fue renombrada la estación Independencia del Subte E como <strong>«Independencia – Santa Mama Antula»</strong></p><p>Por la tarde, se realizó el Acto de cierre de la muestra&nbsp;<strong><em>«El estandarte de la mujer fuerte. Homenaje a Mama Antula»</em></strong>&nbsp;en la vitrina del Senado de la Nación de la Estación Congreso del Subte A con la presencia de&nbsp;<strong>Xil Buffone</strong>&nbsp;-creadora de las reproducciones exhibidas-, el director de Cultura del Senado&nbsp;<strong>Daniel Abate,</strong>&nbsp;el párroco de la Basílica de la Piedad&nbsp;<strong>Raúl Laurencena&nbsp;</strong>junto a su comunidad, el Sr.&nbsp;<strong>Damián Abregú</strong>&nbsp;en representación de la Familia Antuliana, junto a&nbsp;<strong>Teresa González Fernández, el prof. Aldo Marcos de Castro Paz y el Sr. José Torres Argañaraz,</strong>&nbsp;venido especialmente de Santiago del Estero a presenciar las celebraciones en Buenos Aires.</p>', '1760660122989.jpg', NULL, NULL, 1, '2025-11-04 20:01:50', 1),
(4, 23, 0, '<p>Llegó el día tan esperado: después de más de 200 años el nombre de María Antonia de San José fue inscripto en el Libro de los Santos. Las celebraciones en Buenos Aires, Santiago del Estero, Salta y localidades del gran Buenos Aires comenzaron con vigilias nocturnas.</p>', NULL, NULL, NULL, 1, '2025-11-08 21:05:08', 1),
(5, 32, 1, '<blockquote>Los Ejercicios Espirituales que organiza La Beata son cada vez más multitudinarios. En esta carta describe cómo aumenta la concurrencia en una casa donde organiza los retiros, frente a la Iglesia de San Miguel (de la ciudad de Buenos Aires), donde no cesa de ocurrir el milagro de la multiplicación de los panes para darles de comer a todos.</blockquote>', NULL, NULL, NULL, 1, '2025-11-10 20:03:30', 1),
(6, 31, 4, '<p><em>Cf. Blanco III: ASR 1-5 (en castellano); G 17; B 25-28. Otras versiones: Blanco V: ASR 7-11 (en italiano); G 17 / Más breves: Blanco IV: ASR 66- 69 (Lettera 2a al medesimo soggetto); G 16; P 187 (en francés); Blanco VI: P 187-190 (en francés): C. P., 376-379. Cf. también variantes: Blanco IX (fechada el 16/10/1780): ACSBA (original); G 18; Blanco XI: ACSBA (original); G 32. Pax Christi</em></p>', NULL, NULL, NULL, 1, '2025-11-10 20:00:34', 1),
(7, 6, 2, '<p>En su primera fiesta litúrgica como santa después de la canonización, el 7 de marzo, Buenos Aires se vistió de fiesta en calles, capillas, Iglesias y hasta hubo una breve peregrinación de estudiantes del colegio Echeverry Boneo desde el colegio en Juncal y Azcuénaga hasta el Sepulcro de Mama Antula en la Basílica de La Piedad para realizar un glorioso momento de adoración. Luego la peregrinación siguió hasta la Santa Casa.</p><p>En la Basílica de La Piedad se realizó una <a href=\"https://www.facebook.com/canonizacionmamaantula/videos/342126738201398\" target=\"_blank\">Misa presidida por el obispo emérito de Mendoza Mons. Eduardo Taussig</a>, en presencia de descendientes colaterales y devotos que no cesaron de desfilar ante el Sepulcro Histórico Nacional donde descansa Mama Antula, pidiendo gracias y agradeciendo dones.</p><p>Luego de la Misa se desplegó una placa por el reconocimiento de Mama Antula como Doctora Honoris Causa por la Universidad de Santiago del Estero en presencia de la propulsora de la idea, la periodista&nbsp;<strong>Cintia Suárez.</strong></p>', '1760660122988.jpg', NULL, NULL, 1, '2025-11-04 19:58:35', 1),
(8, 9, 3, '<p>Somos devotos de <strong>la primera santa de la Argentina: María Antonia de San José,&nbsp;<em>Mama Antula.</em></strong>&nbsp;Somos descendientes colaterales de María Antonia de Paz y Figueroa (Santiago del Estero, 1730-1799) y miembros de la gran familia de almas que realizan y difunden los Ejercicios Espirituales de San Ignacio de Loyola.</p><p>Admiramos su valentía femenina y la fuerza de su evangelización, que logró que ricos y pobres compartieran mesa y oración en miles de tandas de Ejercicios Espirituales en la Santa Casa, en un preclaro ejercicio de fraternidad humana en tiempos en los que no existía la libertad de vientres.</p><p>Difundimos su vida y obra, que abrió un camino espiritual en los albores de la patria protegiendo a los niños y vistiendo de dignidad el rol de las mujeres durante la época colonial, dándoles voz y voto en la salvación de sus almas.</p><p>Estamos en todo el territorio argentino. Somos de Santiago del Estero (foto), Tucumán, Buenos Aires, Santa Fe, Salta, Jujuy, Mendoza. Hay fervientes devotos en varios países de Latinoamérica como México, Brasil, Costa Rica, Filipinas y Perú.</p><p>Nuestro objetivo es la difusión de la obra de Santa Mama Antula, llegando hasta donde no es conocida para darla a conocer; colaboramos con la confección de pinturas, vitreaux, esculturas, imágenes, estampas y material didáctico para difundir su obra en parroquias, escuelas, Universidades y barrios populares.</p><p>Colaboramos con el sostenimiento del Sepulcro Histórico Nacional de la Basílica de La Piedad, donde descansan las reliquias de La Beata.</p><p>Participamos y difundimos la realización de las tandas de Ejercicios Espirituales gratuitos en la Santa Casa, que se vienen realizando desde hace más de 200 años, cada primeros sábados de mes.</p><p>Y todos los días 7 mes celebramos Misa en la Piedad en memoria de Mama Antula. Luego rezamos en su sepulcro encomendándole nuestros ruegos y oraciones a nuestra milagrosa santa argentina.</p>', '1760660122987.jpg', NULL, '2017- Procesión del 7 de marzo en ciudad de Buenos Aires, en el primer aniversario de la beatificación de MA.\r\n\r\n', 1, '2025-11-05 15:32:24', 1),
(9, 13, 2, '<p>Buenos Aires, 6 de marzo de 1779.-</p><p><em>Blanco, pp 362-366</em></p><p>En el Nombre de Dios todopoderoso y con su Santa Gracia, Amén. Sepan todos cuanto esta carta de mi testamento y última voluntad vieren, cómo yo, María Antonia de San José, Beata profesa, natural de Santiago del Estero, Obispado de Córdoba del Tucumán, hallándome enferma en cama, pero en mi sano juicio, memoria y entendimiento natural, creyendo y confesando como firmemente creo y confieso en el inefable Misterio de la Santísima Trinidad; Padre, Hijo y Espíritu Santo, tres Personas realmente distintas y un solo Dios verdadero, y todos los demás misterios, Sacramentos y Dogmas que reconoce, cree y confiesa Nuestra Santa Madre Iglesia Católica. Apostólica Romana, en cuya verdadera fe y creencia he vivido y vivo y protesto vivir y morir como católica, fiel cristiana que soy, invocando por principal intercesora y protectora a la serenísima<strong> reina de los Ángeles, María Santísima; a su Santísimo esposo el Señor San José, al Santísimo Ángel de mi guarda, al de mi Nombre, al gran Patriarca San Ignacio, a los Bienaventurados San Francisco Javier, San Francisco de Borja, San Luis Gonzaga, San Estanislao y San Cayetano,</strong>&nbsp;a fin de que impetren a Nuestro Señor Jesucristo que por los infinitos méritos de preciosísima vida, pasión y muerte, me perdone todas mis culpas, y misericordiosamente conduzca mi pobrecita alma a la Bienaventuranza eterna, para la cual fuimos todos criados; teniendo a la vista la muerte, tan necesario a toda criatura como incierta su hora, con maduro acuerdo, en descargo de mi conciencia, y para evitar cualquier trastorno y confusión que pudiera originarse después de mis días, ordeno mi testamento y última voluntad, en la manera y forma siguiente:</p><ol><li>Primeramente encomiendo mi alma a Dios Nuestro Señor, pues la creó de la nada y la redimió con su preciosísima Sangre, y mi cuerpo a la tierra de que fue formado; el cuál amortajado (p.363) con el propio traje que públicamente visto de Beata profesa,<strong>&nbsp;mando sea enterrado en el campo santo de la Iglesia Parroquial de Nuestra Señora de la Piedad,</strong>&nbsp;de esta ciudad, con entierro menor, rezado, y pido encarecidamente por amor de Dios a los señores curas respectivos, ejerciten esta obra de caridad, con el cadáver de una indigna pecadora, en atención a mi notoria pobreza. A consecuencia, pido que desde esta Casa de Ejercicios, donde me hallo enferma, y donde es regular fallezca, se conduzca mi cadáver en una hora silenciosa, por cuatro peones de los que actualmente están trabajando en la obra. Así lo declaro para que conste.</li><li>Declaro que conducida de un ardiente deseo a la mayor honra y gloria de Dios, puesta en las manos de la Providencia, avivando mi confianza y consultando el mejor medio de evitar los pecados, que se cometen contra la Majestad Soberana, desde que puse el pie en esta Ciudad, me he dedicado constantemente a sostener una casa de Penitencia, en donde se han dado al público y a personas de ambos sexos, los ejercicios espirituales que formalizó el Glorioso Patriarca San Ignacio de Loyola, y aprobó auténticamente la Iglesia; que con la ideal de llevar adelante este piadoso establecimiento, cuya ventajosa utilidad ha hecho constante la experiencia, me propuse fabricar la casa que actualmente sirve para este fin, y que pido a Dios sea duradero; que esto se ha conseguido, aunque no con la perfección que corresponde, por medio de las limosnas que la piedad de los fieles, o más bien los designios de mi gran Dios, se ha dignado poner en mis manos; que me consta que la intención sería de los contribuyentes no ha sido otra, que la que se den Ejercicios todo el año, sin más intervalos, que los que dictare la prudencia, y la necesidad; como auxiliada de Dios, lo ha practicado mi debilidad. A consecuencia encargo por la Sangre de mi Redentor, sean admitidos, como lo dictan las leyes de la caridad, y preferidos, si es posible, los pobrecitos del campo, en quienes he advertido siempre la más urgente necesidad de este auxilio.</li><li>Declaro que con concepto a la intención de los bienhechores de quienes tal vez se podrán presentar documentos en forma; con concepto igualmente al radical y práctico conocimiento que en tan dilatado tiempo he adquirido: y finalmente en atención a las serias combinaciones y particular estudio que he hecho en una materia tan delicada, en la que Dios, por sus altos fines, se dignó elegir mi pequeñez para instrumento; jamás podría dejar con tranquilidad mi conciencia, sino declarara, como declaro, en la parte que puedo y debo por nula, subversiva e intrusa, cualquier mudanza o destino (p.364) extraño, que tal vez algunas intenciones humanas o de aparente utilidad, intentasen sugerir en lo sucesivo sobre este establecimiento, que con las licencias necesarias, cuyos instrumentos deben existir en los respectivos oficios públicos donde se archivaron, sin poder hacer por ahora mención de cuáles son , he fabricado para Casa de Ejercicios, debiéndose ésta mirar con el recomendable aspecto de un recurso de la virtud, y de un asilo seguro, en donde se presenten a la consideración del cristiano los desengaños de esta vida mortal por una práctica constante de los referidos Ejercicios Espirituales.</li><li>Hallándome próxima a ir a dar cuenta a Dios, recomiendo su subsistencia con toda la ternura de mi corazón a todos los señores Jueces y magistrados de quienes espero la protejan con su autoridad; a la piedad del público la sostengan con las efusiones de su caridad; y a mis Albaceas ordeno la conserven y aumenten con celosa integridad como tan conducente al servicio de Dios, y a los intereses eternos del pecador. Así lo declaro para que conste.</li><li><strong>Declaro que del gobierno económico se ha de hacer cargo precisamente una mujer.</strong>&nbsp;En cláusula distinta se hará su nombramiento. Su principal objeto se dirigirá a la vigilancia exacta de los santos ejercicios en lo económico al interés espiritual y temporal de las demás mujeres que, estén a su cargo, a cuyo fin, y con respecto a la necesidad del servicio, he fabricado con distinción habitaciones separadas de lo principal que ha de servir para los ejercicios. La experiencia y el conocimiento me han sugerido esta determinación, cuya observancia pido no se altere, y en la parte que puedo lo mando como fundadora e institutriz de esta obra de piedad.</li><li>Encargo se mantengan en la casa , y sean tratadas con cariño, benignidad y amor, todas las que actualmente se hallan en ella, principalmente las que con conocida juiciosidad han desempañando sus deberes respectivos en el servicio; en éstas, su misma utilidad, y en otras unos motivos de caridad, me obligan a esta piadosa recomendación, como me han obligado siempre a tratarlas como a hijas de mi corazón, en el que las conservo hasta los últimos momentos de mi vida, esperando de su generosa gratitud, me encomienden a Dios incesantemente y rueguen por mi alma; yo lo haré por ellas, así, como espero de la infinita piedad, merezco lograr Bienaventuranza eterna.</li><li>Declaro que el finado, Ilustrísimo y Excelentísimo Señor Don Fray Sebastián Malvar y Pinto; Caballero gran cruz de Carlos III, dignísimo Obispo de esta Diócesis, y Arzobispo después (365) de Santiago de Galicia, tuvo a bien en ejercicios de su liberalidad, hacer una donación, en forma, cuyo instrumento existe en autos de la cantidad de 18 mil pesos a beneficio de esta casa, de la cual sólo tengo recibidos 1130 $ cuya distribución consta de los cuadernos de las cuentas, y creyendo de deberlas dar de lo restante el Señor Magistral de esta santa Iglesia Catedral, Doctor don Carlos José Monteros, encargado para la reintegración de esta piadosa donación , de cuyo puntual cumplimiento no he separado mi atención, aplicando puntuales diligencias, ya judiciales, ya extrajudiciales sin efecto verdaderamente; prevengo no se omitan en lo sucesivo las que correspondan. Así lo declaro para que conste.</li><li>Declaro que hay en la casa tres esclavos viejos e inútiles, llamados Simón, Domingo Ignacio y María quienes se mantendrán en ella; igualmente existe un&nbsp;<strong>negra moro llamado Pascual, a quien por su fidelidad, su buen servicio, y lo mucho que me ha ayudado, debo concederle la la libertad sin reparo,&nbsp;</strong>como se la concedo, respecto, a que debo presumir que la voluntad de los donantes quedó resignada a la mía, en una y otra circunstancia de equidad y de prudencia. Pero esto deberá entenderse con la precisa condición y calidad de que durante su vida, venga a servir en las datas de ejercicios, en aquellos ministerios, que acostumbra. siendo esta condición tan solemne y estrecha que sin su cumplimiento no tendrá efecto la libertad.</li><li>Declaro que de todos los bienes así muebles como raíces, papeles y cuanto hay en casa, se tome un prolijo inventario judicial, bajo el cual se deberá hacer cargo la persona nombrada con responsabilidad formal para ante quien corresponda, no siendo de mi inspección determinarlo; así lo declaro.</li><li><strong>Declaro que habiendo vivido de la Providencia meramente, no tengo bienes sobre que recaiga institución de heredero,</strong>&nbsp;sin embargo por un efecto de solemnidad legal nombro por tales a las benditas almas del Purgatorio, en cuyo sufragio y beneficio deberá invertirse cualquier derecho que pudiera corresponderme, como de algual (sic, por alguna) limosna se dará a las mandas forzosas y acostumbradas a real cada una; así lo declaro para que conste.</li><li>Declaro que la casa se halla gravada en algunas dependencias pasivas, cuyos acreedores y cantidades constan de mis apuntes; declárolo así para que conste.</li><li>&nbsp;<strong>Declaro y nombro por mi sucesora a Doña Margarita Melgarejo,</strong>&nbsp;quien cuidará principalmente de solicitar un director, y capellanes, que corran con el gobierno y dirección espiritual de los (366) ejercitantes, y en la parte que puedo prevengo, que en lo sucesivo se transmita esta elección en los mismos términos, rogando a todas las que quedan por la paz, tranquilidad, y religiosa unión; y principalmente por el celo en el servicio de Dios, y cumplimiento exacto de los santos fines, que las condujeron a esta Casa, cuyas puertas debe sellar el recato, la moderación, y el silencio. Dios derrame sobre todas ellas sus bendiciones,<strong>&nbsp;y yo como buena madre, y con mi mayor ternura les dispenso la mía, y me despido de todas hasta la eternidad</strong>.</li><li>Y para cumplir todo lo que contiene este testamento cerrado, nombro por mis testamentarias, y albaceas, a las Señora Doña María Cabrera, Doña Florentina Gómez, Doña Mercedes Guillota, y Doña María Josefa Pérez, a cada una in solidum, y les confiero amplio poder para todos los efectos de este nombramiento, durándoles el año legal, o el más tiempo que necesitasen, pues les prorrogo, y por el presente revoco y anulo todos los testamentos, que antes de ahora hubiere formalizado, disposiciones, o codicilos, de palabra o escrito, o en otra forma, y sólo quiero se estime y tenga éste por mi última deliberada voluntad, en la vía y forma que mejor haya lugar en Derecho.</li></ol><p>Así lo otorgo y ruego firme por mí el Señor Doctor Don Felipe Antonio Martínez de Iriarte, que se halla presente, en esta muy notable y muy leal Ciudad de la Santísima Trinidad Puerto de Santa María de Buenos Aires, en 6 días del mes de marzo de este año de 1779.- A ruego de la otorgante y por su imposibilidad.-Doctor Felipe Antonio de Iriarte.</p>', NULL, NULL, NULL, 1, '2025-11-06 11:17:53', 1),
(10, 4, 1, '<ul><li>2 de julio de 2010: El Santo Padre Benedicto XVI autorizó a la Congregación vaticana para las Causas de los Santos a promulgar el decreto por el que se reconoce que<strong> la Sierva de Dios María Antonia de Paz y Figueroa (María Antonia de San José) practicó las virtudes cristianas en grado heroico y la proclamó Venerable</strong>.</li><li>25 de junio de 2015: la Junta Médica de la Congregación para las Causas de los Santos dio su&nbsp;<strong>voto positivo al presunto milagro</strong>&nbsp;ocurrido por intercesión de la venerable María Antonia de Paz y Figueroa.</li><li>12 de noviembre de 2015: La Comisión de Teólogos de la Congregación para las Causas de los Santos emitió un&nbsp;<strong>dictamen unánime y positivo sobre la causa de beatificación</strong>&nbsp;de María Antonia de Paz y Figueroa, también conocida como Mama Antula.</li><li>9 de febrero de 2016: la reunión plenaria de Obispos y Cardenales de la Congregación de la Causa de los Santos en Roma&nbsp;<strong>aprobó por unanimidad todo el proceso de la Causa de Canonización de Mama Antula.</strong></li><li>El 27 de agosto de 2016 fue&nbsp;<strong>beatificada</strong>&nbsp;en su tierra Natal, Santiago del Estero.</li><li>El 24 de octubre de 2023 el Papa Francisco aprobó el segundo milagro que permitó su<strong>&nbsp;canonización</strong>.</li><li>El 11 de febrero de 2024&nbsp;<strong>Santa María Antonia de San José</strong>&nbsp;-Mama Antula- es canonizada en el Vaticano por el Papa Francisco.</li></ul>', '1762622261953.jpg', NULL, NULL, 1, '2025-11-06 11:26:10', 1),
(11, 1, 1, NULL, '1760660122986.jpg', NULL, 'Descendientes colaterales y devotos de Mama Antula en la Misa en la Basílica de La Piedad: Aldo Marcos de Castro Paz, Susana Saguier Elía, Dolores Costa Paz y sus hijas, Damián Abregú, Jorge Bayá Casal, Sebastián Gorostiaga y las hermanas Mariana y Victoria Bayá Casal', 1, '2025-10-28 22:45:56', 1),
(12, 2, 2, '<p>Con una conferencia magistral en el salón parroquial de la Basílica del Socorro brindada por el profesor Aldo Marcos de Castro Paz -historiador y descendiente colateral de María Antonia de San José- se cerró la semana de celebraciones de la primera fiesta litúrgica de Santa Mama Antula, después de 7 años de celebrar, cada 7 de marzo a «la Beata»</p><p>La conferencia se realizó en el marco del Día Internacional de la Mujer. Justamente Mama Antula fue llamada «Mujer Fuerte» en vida por su excepcional obra en pleno siglo XVIII, gestionando ejercicios ignacianos y autorizaciones con Obispos, Virreyes, militares y administradores del cabildo de Buenos Aires en épocas en las que las mujeres estaban confinadas a las tareas domésticas o la vida religiosa en monasterios de clausura.</p>', NULL, NULL, NULL, 1, '2025-11-12 19:56:29', 1),
(13, 24, 3, NULL, NULL, NULL, NULL, 1, '2025-11-08 19:37:11', 1),
(14, 7, 6, NULL, '1762637132905.jpg', NULL, 'Adoración al Manuelito de Mama Antula luego de la Misa, y bendiciones. Fieles y devotos rezando por la paz.', 1, '2025-11-08 21:25:32', 1),
(15, 7, 5, NULL, '1762637021230.jpg', NULL, 'Procesión de reliquias de Mama Antula y veneración al Manuelito, luego de la Misa en la Basílica de la Piedad.', 1, '2025-11-08 21:23:41', 1),
(16, 23, 0, NULL, '1762635928444.jpg', NULL, 'En Buenos Aires, a las 5 de la mañana, se reunieron en el Colegio de La Piedad más de 100 personas que compartieron en pantalla gigante la transmisión en directo de la Canonización en la capilla Papal de la Basílica de San Pedro en el Vaticano.', 1, '2025-11-08 21:05:28', 1),
(17, 7, 0, '<p>El Domingo 11 a las 10 de la mañana, Mons. Gustavo Carrara presidió la Misa en acción de gracias por su santificación en la Basílica de La Piedad, donde se encuentra el Sepulcro de Mama Antula, que ya desde las 8 de la mañana rebosaba de fieles que hicieron cola para tomar gracia en su mausoleo.</p>', NULL, NULL, NULL, 1, '2025-11-08 21:09:24', 1),
(18, 7, 4, NULL, '1762636986650.jpg', NULL, 'Mons. Mollaghan, Mons. Carrara, Mons. Baliña y el P. Raúl Canali, en la procesión con las reliquias de Mama Antula en la Misa de acción de gracias en Buenos Aires', 1, '2025-11-08 21:23:06', 1),
(19, 13, 1, NULL, '1762640150924.jpg', NULL, NULL, 1, '2025-11-08 22:15:50', 1),
(20, 13, 3, NULL, '1762640245999.jpg', NULL, 'Firma María Antonia de San José, Beata', 1, '2025-11-08 22:17:26', 1),
(21, 17, 1, '<p><strong>María Antonia de San José, la Beata de los Ejercicios, primera santa argentina</strong></p><p>Por la Dra. Alicia Fraschina</p>', NULL, NULL, NULL, 1, '2025-11-11 10:12:47', 1),
(22, 15, 4, NULL, '1762640635083.jpg', NULL, 'Retrato de Mama Antula pintado por José de Salas, «el madrileño», que conoció a la beata. El retrato fue colocado en la Misa exequial en la que el Padre Perdriel pronunció la Oración Fúnebre. Cuando murió Mama Antula el 7 de marzo de 1779 se cumplió su voluntad: fue enterrada muy sencillamente, sin ataúd ni funerales, en el camposanto de la antigua Iglesia de La Piedad.', 1, '2025-11-08 22:23:55', 1),
(23, 15, 1, '<blockquote>Pronunciada por el R. P. Fray Julián Perdriel, prior del Convento de Predicadores de Buenos Aires, en las solemnes exequias que se celebraron en la Iglesia de Santo Domingo por el alma de la Señora Beata María Antonia de la Paz, el día 12 de julio de 1799.</blockquote>', NULL, NULL, NULL, 1, '2025-11-11 04:07:57', 1),
(24, 15, 5, NULL, '1762640858832.jpg', NULL, 'Sepulcro Histórico Nacional de Mama Antula, donde descansan sus restos, Basíllica de La Piedad.', 1, '2025-11-08 22:27:38', 1),
(25, 15, 3, '<p>«Al fin, cristianos, la muerte cruel no satisfecha con haber ya tantas veces arrancando del seno de nuestras familias cuanto en ellas teníamos más amable, padres, hijos, esposos, amigos, caras prendas, pedazos del corazón, como para echar el resto de su insaciable voracidad, se entró inhumana en esta capital el día siete de marzo y, de un solo golpe, nos arrebató con violencia aquella mujer fuerte, que por cerca de veinte años, la edificó con su vida ejemplar, y la santificó por su extraordinario celo; aquella mujer sierva del Señor, sierva devota, <strong>sierva fiel y prudente, declarada mortal enemiga del vicio y de sus sombras; amante firme de la virtud y propagadora incansable de la devoción: aquella mujer fecunda en pensamientos de santidad; diestra y humilde al comunicarlos; intrépida y confiada en Dios para ejecutarlos; constante a todas las pruebas en la necesidad de sostenerlos; aquella mujer superior a su sexo, émula y aun vencedora del varonil, rara y singular;</strong>&nbsp;cuyo corazón se inflamaba cada momento en deseos de nuestra santificación. Sí, la muerte cruel, insensible a nuestra pena, sacó de la tierra de los vivientes aquella mujer…</p><p>Más, ¿para qué anda huyendo de nombrarla, si por último ha de sufrir el ánimo este torrente de amargura? Salgamos de una vez del paso:&nbsp;<strong>vino la muerte inexorable y acabó con la respetable vida de la Señora María Antonia de la Paz o, por llamarla con los nombres que la impuso su devoción y edificante exterior, murió la Señora Beata María Antonia de San José.</strong>&nbsp;Sácala Dios de en medio de nosotros, y quién sabe si porque no éramos dignos de ella y en grave castigo de nuestros pecados, ya no la vemos andar por esas calles, los pies descalzos, cubiertos de polvo y todo fatigado el aliento, conduciendo un cuerpo extenuado con rigurosas abstinencias, y mortificado con ásperos cilicios, toda ocupada en las solicitudes del amor de sus prójimos. Ya no admiramos aquel semblante modesto sin hipocresía, gracioso sin disipación, afable sin bajeza y sin interés. Ya no hieren nuestros oídos aquellos suspiros de lo íntimo de su angustiado espíritu, nuncios y desahogo a un tiempo mismo de su caridad. Su cuerpo yace sepultado como los demás entre la tierra de la parroquia de la Piedad; y su alma, su buena alma, partió al destino que Dios justo y misericordioso haya querido darle. ¡Oh, pesadumbre la que ha venido a recargar nuestro ánimo! ¡Oh, pérdida la que hemos hecho! Vosotros conocéis bien que más es para llorada que para encarecida, y yo añado que de los míos.</p><p>Porque, ¿quién podrá mejor medir el tamaño de esta pérdida irreparable, que vosotros mismos, regulándolo por el precio de los beneficios recibidos por su mediación? Así es que cada uno de nosotros, inspirado de la gratitud, formó su panegírico interrumpido de sollozos y de lágrimas en el momento de su muerte y le repetiréis todas las veces que venga vuestra memoria la de cuánto debéis a la Señora Beata María Antonia de San José.</p>', '1762640927832.jpg', NULL, 'Celda 8 de la Santa Casa, donde murió Mama Antula: «En esta celda vivió la Venerable Sierva de Dios María Antonia de San José. En ella murió el 7 de marzo de 1799 a las 3 de la tarde».', 1, '2025-11-08 22:28:47', 1),
(26, 12, 1, '<p>Dios omnipotente y misericordioso,<br>que en Santa María Antonia de San José,<br>incansable peregrina de los ejercicios espirituales,<br>diste a tu Iglesia un modelo de entrega para<br>anunciar el Evangelio: concédenos, por su intercesión,<br>meditar constantemente el misterio de tu Hijo,<br>para salir al encuentro de los pobres y desamparados.</p><p>Por nuestro Señor Jesucristo, tu Hijo,<br>que vive y reina contigo en la unidad<br>del Espíritu Santo, y es Dios,<br>por los siglos de los siglos.</p><p>Amén</p>', '1762828354951.jpg', NULL, NULL, 1, '2025-11-11 02:32:34', 1),
(27, 33, 1, '<p>A la luz de la historia Argentina las cartas escritas por Mama Antula han resultado un tesoro nacional, no solo por la fe que transmiten sino por el contenido histórico que contienen. La Beata es considerada la primera escritora del Río de la Plata -lo sería de la Argentina pero a su muerte (en 1779) la Argentina aún no existía como Estado moderno-. Las cartas que enviaba, recibía y que fueron escritas en su tiempo en torno a su excepcional figura eran esperadas con expectativa en Europa y traducidas a diversos idiomas para ser a su vez reenviadas por todo el viejo continente. Mama Antula escribía en español pero al haberse perdido los originales, muchas de sus cartas están reproducidas aquí en otros idiomas. Esas cartas de La Beata -adjuntas a la <em>Positio</em> de su canonización y reproducidas en esta página- pueden ser consideradas como la literatura epistolar originaria más importante -sino la más antigua- de la Argentina. En sus relatos están presentes hechos históricos de la vida del Virreinato del Río de La Plata y reflejan la vida cotidiana de la incipiente aldea ribereña que era Buenos Aires. Cada una de sus cartas resulta un texto coloreado, y juntas forman el todo de ese paisaje «vitreaux» que era el clima previo a la independencia Argentina.</p><p><em>«Hasta la fecha, estamos frente a la mayor epistológrafa del período hispánico del Plata»</em>sostiene don Pedro Luis Barcia, ex presidente de la Academia Argentina de Letras. <em>«Ninguna escritora ni escritor nacido en el Plata alcanzó la difusión mundial que alcanzaron las epístolas de María Antonia, traducidas a las más importantes lenguas modernas -francés, italiano, inglés y alemán- sino al latín, para mayor universalidad de su difusión. Esta situación no puede exhibirla ningún escritor argentino, no ya del período hispánico, sino hasta entrado el siglo XX».</em></p><p>La Beata se escribía con su confesor, el <strong>Padre Gaspar Juárez</strong> –santiagueño como ella, exiliado en Europa luego de la expulsión de los Jesuitas de América-. Dice el sacerdote jesuita e historiador Guillermo Furlong en el libro de Ana María Cabrera: <em>«Le cabe al Padre Juárez la altísima gloria de haber sido</em><strong><em>mentor</em></strong><em>de aquella mujer santiagueña que rivaliza con la santa avileña (</em>N de R: Santa Teresa de Ávila<em>) en cuanto a sus virtudes, y a la que supera en lo andariega, y a la que está a la par en el admirable don persuasivo con que doblegó las frentes más reacias y brujuleó las voluntades más obstinadas. Sin duda alguna, María Antonia de la Paz y Figueroa es una de las figuras femeninas más extraordinarias en la historia universal, y fue Gaspar Juárez quien templó esa alma y contribuyó a la que fue: una Teresa de Jesús de subido tono criollo”. </em></p><p>Se escribía la Beata también con el <strong>fraile Julián Perdriel</strong>-sacerdote dominico que fue su confesor a la hora de su muerte- y con <strong>Ambrosio Funes</strong> -hermano del célebre Deán Funes-, secretario de Mama Antula y actor junto a su hermano de la revolución de Mayo de 1810.</p><p><em>«La prosa de La Beata es de tono familiar, espontánea, fresca, decantada y fluida. No registra repeticiones ni tropiezos, tan frecuentes en el género epistolar de imperitos</em>-comenta don Pedro Luis Barcia. <em>Llama la atención su decir llano, fácil y sin afectación. Nunca se mete en «bachillerías», como decía burlándose de ese intento Teresa la avilense».</em></p><p>Barcia, al igual que el P. Furlong, también compara la tarea y estilo de Mama Antula con el de Santa Teresa de Ávila y con aquello de que Dios anda entre los pucheros: <em>«También en el caso de María Antonia se alternan los momentos de recogimiento con los trajines de la cocina y previsiones de lo pequeño y cotidiano».</em></p><p>Gracias al paciente trabajo de transcripción de estas cartas, realizado por devotos de Mama Antula -que han sido clasificadas e identificadas por la Dra. Silvia Mónica Correale (postuladora de la causa de canonización), Mons. Guillermo Karcher (colaborador), Mons. José Luis Gutiérrez (relator)- las reproducimos con breves epígrafes que intentan ofrecer el horizonte histórico al momento de ser escritas, para su mayor comprensión y disfrute.</p><p>Los textuales de Pedro Luis Barcia, Presidente de la Academia Argentina de Letras, son extractos de su ponencia en las Jornadas de Literatura Colonial del Cono Sur realizadas en Buenos Aires el 29 y 30 de noviembre de 2001 por el Centro de estudios Iberoamericanos de la Universidad Católica Argentina.</p>', '1762820888907.jpg', NULL, 'Ilustración de Máximo de Castro Paz.', 1, '2025-11-10 17:06:44', 1),
(28, 32, 3, '<p><em>Blanco VII: ACSBA (original, en castellano); ASR 19-21 (en castellano); G 24; B 30-32. Otras versiones: Blanco VIII: G 18; ASR 11-16 (Lettera continuazione) y ASR 69-72 (Lettera 3a al medesimo soggetto). Cf. también Blanco X: ACSBA (original); G 24 / Blanco XXIV: P 201-203 (en francés): C. P., 290-292. Pax Christi</em></p>', NULL, NULL, NULL, 1, '2025-11-10 19:51:14', 1),
(29, 5, 1, NULL, '1762871415624.jpg', '1762871428082.jpg', NULL, 1, '2025-11-11 14:30:15', 1),
(30, 31, 2, '<blockquote>En 1780 Buenos Aires formaba parte del Virreinato del Perú. En esta carta Mama Antula comenta que el Obispo de Cuzco -Juan Manuel Moscoso- la ha autorizado a abrir oratorios en casas en la provincia de Córdoba del Tucumán. En esta época recién se inicia su tarea evangelizadora en Buenos Aires, para la que solicita colaboraciones y donde dice haber dado 4 tandas de Ejercicios Espirituales, mientras que en Tucumán ya ha ofrecido 60 retiros a la fecha de esta carta</blockquote>', NULL, NULL, NULL, 1, '2025-11-10 19:58:30', 1),
(31, 31, 3, '<p>Buenos Aires, 7 de agosto de 1780.</p><p>La gracia del Espíritu Santo ilumine su alma eternamente, mi carísimo Don Gaspar en Jesucristo. He quedado muy reconocida a los singulares favores y privilegios que Vuestra Merced me ha alcanzado de Su Santidad y en las gracias que me confieren, trascendentales a toda mi descendencia, y en las que se me franquean <strong>concediéndome altar portátil para la protección de mis peregrinaciones.</strong> El Señor se sirva remunerarle en la vida futura estos beneficios; cuya posesión excitara cada día la frecuencia de mis recomendaciones al Altísimo, porque le de feliz despacho a todas las pretensiones que le convengan. A más de esto, procuraré interesar en el mismo logro de sus deseos a muchos y a todos, si fuese posible, de los que participan de tan utilísima concesión, y cuando tanta abundancia de deprecaciones no se obtenga, la Divina Providencia suplirá nuestros defectos en su obsequio, por habernos proveído por sus propios esfuerzos de tantos tesoros que redundarán en honra y gloria de Su Divina Majestad.</p><p>La vehemencia irresistible de este principio y el anhelo de heredar el espíritu de quien estableció (entre otros prodigios de la gracia) los Ejercicios Espirituales, con el proyecto de reformar las costumbres de todo el mundo y cristiandad principalmente, me han constituido en la profesión de esta parte de su Instituto.</p><p>Toda la provincia de Tucumán sus ciudades y jurisdicciones quedan exhortadas, habituadas y dispuestas a continuación, después de haberlos recibido en distintas ocasiones mediante a que Su Divina Majestad se sirvió adornar a sus vecinos de una docilidad y amor para recibirlos, por mis reconvenciones (es verdad) menos que por su celestial inspiración. Tan piadosamente dispuestos encontré los corazones de sus moradores, que sin extrañarlos (como que se hallaban insinuados y nutridos de ellos tan de antemano), ni repugnarlos, obedecieron la voz de su pobrecilla sierva, resolviendo tomarlos en mi presencia y reiterarlos en mi ausencia.</p><p>Hoy me hallo en esta ciudad fomentando la propagación de la misma empresa, y aunque hace once meses a que estoy demorada por defecto de licencias del Ilmo. actual (cuando más he merecido promesas sin efecto), con todo <strong>mi fe no varía y se sostiene en quien la da.</strong> Se me proponen varios impedimentos: el mundo está un poco alterado; los superiores no muy flexibles; los vecinos vacilando sobre mi misión; otros la reputan de fatua; en suma, cooperaron a ello rumores frívolos; empero, la providencia del Señor hará llanos los caminos, que a primera vista parecen insuperables. Todo lo puedo en el que me conforta.<strong> En esta atención espero firmemente recoger en breve la abundante mies que ofrece el país. </strong>Y si Su Divina Majestad rodea las cosas de tal conformidad, que sea indispensable diseminarlos en todas las provincias del Virreinato y de todo el Orbe, será preciso suministrarlos y anunciarlos en todos sus climas.</p><p>Meditando cuánto merece ser amada la Bondad infinita de mi Dios, juzgo muy corto recinto la estrechez de este mundo y de millares que hubiera, para ofrecerlos con los posibles, todos cubiertos de inocencia y penitencia a su honor y gloria. Ya que no lo puedo servir con obras de esta naturaleza, lo deseo.</p><p>Y así concluida mi carrera en América, pienso trasladarme a esos Reinos de Europa. Semejante determinación quizá la verifique dentro de poco tiempo. No obstante, pídale Vuestra Merced el dictamen correspondiente a mi confesor, que quiero experimentarlo. ¡Oh, mi Dios, y quien os viera ya amado de todas sus criaturas tanto cuanto sois de amable, o a lo menos fuese nuestra caridad igual al grado de maldad con que se envuelven nuestras ofensas para contigo!</p><p><strong>Vuestras Mercedes que han sido alimentados con el suave néctar de la tierra madre, la Compañía de Jesús, establecida sobre su honra y gloria, con que santificó a su fundador Ignacio, deben atender con sus ruegos y lágrimas incesantes la propia empresa, hasta que la veamos extendida con los mayores y más rápidos progresos. </strong>Así lo pido y espero conseguir.</p><p>Algunos han reputado, según he dicho, mis pretensiones por locas o por ridículas. No me embaraza este desorden, porque el mundo, siempre fatuo y siempre adverso al Evangelio, debe explicarse con oposición a todo lo que le es contrario. Todas sus objeciones se desvanecen sucesivamente y no sirven de otra cosa que de añadir trofeos y realces a mi misión. Bien me intima Jesucristo: Los perseguirá el mundo, pero alentaos; yo he vencido al mundo. A veces me parecen tan necesarias sus contradicciones, que sin ellas quizás desconfiaría de la conveniencia de mis obras; y no puedo menos que conocer que son la señal característica de las proezas que toman fuerza y origen del mismo Jesucristo; he Vuestra Merced aquí el fundamento por que siempre aguardo la resurrección de su orden. Algunas reliquias yacen sumergidas y esparcidas por el Orbe, y no será mucho que, agradando a Dios, su reunión forme de los últimos residuos el mismo cuerpo, la misma religión.</p><p>Otro asunto he meditado concerniente a su profesión y es que se administre a este pueblo un asalto o misión de aquellas que acostumbraban, y me parece que también lo conseguiré. <strong>Su Excelencia (el Virrey) y el Obispo se hallan requeridos para su ejecución</strong>. El cielo bendecirá sus permisiones. Si el éxito no corresponde a mis deseos, atribúyalo a mis pecados y rueguen a Dios los oculte del rostro de su Padre.</p><p>La víspera de la Asunción le mandé decir a mi San Estanislao una misa cantada en su iglesia y propio altar, en su honor y reconocimiento de haber docilizado los ánimos y dándome proporción de seguir en breve con mis designios. Le vistieron de peregrino y estaba para ojeado.</p><p><strong>Volviendo al asunto primario, digo que Vuestras Mercedes, como prácticos, me consigan cuantas gracias, cuantas preeminencias y privilegios me son conducentes a hacer más cómoda, interesada y atractiva mi misión, mediante las distancias dilatadas, caminos fragosos, países desiertos, pueblos desproveídos y otros mil inconvenientes que hay que experimentar.</strong> Con eso la abundancia de concesiones suavizará y hará amables todos sus obstáculos. A esto agregaré algunos arbitrios que me dicte la Divina Providencia, a quien únicamente debo todo lo que se invierte en las citadas obras piadosas. A más de lo cual, yo quiero operar con mayor libertad y darle otra reputación a mi empresa, para atraer almas a Dios hasta de los sentidos, y así Vuestras Mercedes discurran si es preciso en este intento, que yo les remita certificaciones y letras auténticas de la prosperidad que Dios me ha conferido en sus Ejercicios.</p><p><strong>Del Sr. Moscoso, actual Obispo de Cuzco, tengo una patente, en que, a más de concederme amplia facultad de distribuirlos en toda la Provincia de Tucumán indistintamente a pueblos, personas, lugares y tiempos, me permite abrir oratorios en casas particulares. </strong>Los demás canónigos y superiores de todas aquellas comarcas me ofrecen espontáneamente la misma exhibición, que, como hasta aquí me ha sido inútil, no me he querido aprovechar de ella, la cual en lo sucesivo puede graduarse por un prudente auxilio para lo que se ejecute. Hay tiempo de adquirir dichos documentos que remitiré con oportunidad.</p><p>El principio de la honra y gloria de Dios no me permiten separarme de los medios que la fomentan; por esto suplico a Vuestras Mercedes encarecidamente cooperen conmigo a su dilatación; yo que he corrido los países referidos y que tengo noticias de todo este Reino, informo a Vuestras Mercedes de <strong>la notable falta de pasto espiritual</strong> que echamos menos y lloramos por estas partes, y principalmente en cuanto a misiones y Ejercicios. Cuando yo a mis solas, dentro del silencio de mí misma, reflexiono (considero) este punto, soy oprimida de aflicción, me lamento y suspiro incesantemente por el remedio que exigen tales necesidades, y no encuentro otro arbitrio de ser dichosa, sino el agitar aquel del cual dimana la precaución contra estos males.</p><p>La administración de bienes espirituales que Dios prepara por mis manos, sin embargo de la indignidad con que admito semejantes beneficios y de la divina misericordia con que para ellos se distingue, me hacen inferir que Su Divina Majestad tal vez me conceda terminar mi carrera en la práctica de algún proyecto que produzca utilidades permanentes; cuyo establecimiento es indispensable robe las atenciones de Vuestras Mercedes, aunque las hayan anticipado penetrando mis designios. Los que actualmente forman toda mi ocupación pueden servir de previas disposiciones para aquellos; por lo que espero que Vuestras Mercedes hagan de éstos el uso más conveniente en elevar sus ideas hasta donde Su Divina Majestad fuese servido.</p><p>A mi confesor muchas expresiones de caridad, y así a él, como a Vuestras Mercedes, ruego no se olviden de mí, cual yo siempre le pido a Dios me los haga unos santos y guarde su vida muchos años.</p><p>Buenos Aires, 7 de agosto de 1780. B.L.M. de Vm. su aficionada y humilde sierva María Antonia de S. José.</p><p>P. D. La Casa de Ejercicios de esta ciudad, sin embargo de las órdenes de Su Majestad, se halla ocupada con ciertos huérfanos, lo que da motivo para denominarla hoy Casa de la Cuna. Nada de esto me impedirá franquear mis Ejercicios, porque <strong>habiendo oratorio en una casa capaz se remedia todo.</strong> No obstante, quisiera ver las cosas en su lugar. Sin salir de este régimen, <strong>he dado en la provincia del Tucumán 60 Ejercicios; aquí 4,</strong> y Dios quiera que pasen al número primero; yo quisiera darlos en todo el mundo; por lo que deseo una licencia para que nadie me ciña, sujete, ni detenga a lugar determinado.</p>', '1762804771094.jpg', NULL, 'En tiempos de Mama Antula disponer de un altar portátil permitía transportarlos fácilmente para celebrar Misa en diferentes lugares y facilitar la evangelización. Foto: Altar portátil (comienzos siglo xx) Museo de Arte Religioso Juan de Tejeda (Córdoba, Argentina).', 1, '2025-11-10 19:59:31', 1),
(32, 30, 3, '<blockquote>Por la inmediata traducción de las cartas de Mama Antula a diferentes idiomas apenas recibidas en Europa, muchas de ellas han sobrevivido solo en sus versiones en lenguas extranjeras. Tal es el caso de esta en francés escrita por Mama Antula desde Córdoba -donde está dando los Ejercicios Espirituales en tandas de 200 a 300 personas-, antes de iniciar su tarea evangelizadora en Buenos Aires. Comenta su esperanza profética de que la Compañía de Jesús será restituida; que cada 19 de mes hace dar una Misa en honor a San José y sus peripecias atravesando desiertos y al cruzar ríos caminando descalza durante cientos de kilómetros por la zona hoy denominada Noroeste Argentino.</blockquote>', NULL, NULL, NULL, 1, '2025-11-10 20:01:32', 1);
INSERT INTO `cont_2contenidos` (`id`, `encab_id`, `orden`, `texto`, `imagen`, `video`, `leyenda`, `creadoPor_id`, `creadoEn`, `statusRegistro_id`) VALUES
(33, 30, 4, '<p>J’ai toujours été dans cette opinion et j’y suis encore, que la <strong>Compagnie de Jésus sera un jour rétablie; </strong>et pour obtenir cette grâce plus eff i cacement du Seigneur, si désirée de nous tous, je fais <strong>célébrer solennellement une Messe tous les 19 des mois en l ’ honneur de St. Joseph</strong> et je n ’ ai pas manqué partout où je me suis trouvée d epuis le départ de la Compagnie de ces contrées, comme les Exercices de St. Ignace n ’ ont point été interrompus depuis ce temps dans notre Patrie, à l ’ exception de trois années que j ’ ai été absente occupée à les établir dans la Province. Mon Evêque, N. S. Jean Emmanuel de Moscoso que je trouvai à Jujuy, m ’ accorda avec bonté tout ce qui pouvait faciliter les Exercices Spirituels; jusqu ’ à me permettre une chapelle privée perso n nelle et de faire faire les Exercices dans quelque lieux ce fut commode pour cela da ns tout son Diocèse: autant qu ’ on a pu, on les a donnés dans les Maisons qu ’ avaient les Jésuites. Dans cette ville de Corduba on les a donné pendant quatorze semaines et à chaque semaine il y avait plus de 200 personnes et quelqu e fois 300, sans que grâces à Dieu il y eut jamais de confusion ni qu ’ on eût rien souffert ou pour les habitations, ou pour les vivres, quoique toutes les dépenses n ’ ayant d ’ autre fond que les a u mônes. La Providence y a si bien pourvu que dans le même temps on pouvait aider encore le s pauvres et les prisonniers. Les fruits retirés de ces Saints Exercices ont été si constants qu ’ on y voit visiblement la main de Dieu, et le concours si grand que sans y appeler personne, on se trouvait dans le cas de ne pouvoir pas accepter tout le monde , et de les remettre à une autre fois. Au milieu de la grande consolation que j ’ éprouve à la vue du grand bien qui se fait aux âmes, je ne puis vous cacher les peines que je souffre.</p><p>La plus grande est que où la moisson est si abondante, les ouvriers sont si rares; encore si le petit nombre qu’on a voulait se donner tout de bon à la besogne. Que sert de semer beaucoup, si on a personne pour cultiver le terrain, et faire la moisson. C’est de là que vient la diminution des Sacrements; jusqu’au point que plusieurs ne peuvent satisfaire au devoir pascal. Les paroisses sont vastes, sans grand nombre de chrétiens et presque toutes se trouvent dispersées ça et là et loin de leur curé de 10 à 20 lieues.</p><p>L’aide qu’avaient les curés, était qu’avant Pâques les Missionnaires Jésuites parcouraient ces paroisses, instruisant, prêchant et confessant, ainsi la besogne du curé à Pâques, lui pesait moins.</p><p>On parle là des Missions du Paraguay conduites autrefois par les Jésuites qui avant leur destruction étaient au nombre de 55, composées de plusieurs nations Indiennes, dont plusieurs étaient Catéchumènes. Les plus nombreuses étaient celles des Granirs et des Chichites, on y comptait environ 125 mille âmes.</p><p>Je fus établie Régulatrice des Exercices Spirituels, et pour que le fruit en soit plus grand, elles sont sous la protection de Notre Dame des Douleurs et des Saints de la Compagnie dont je fais célébrer lés Fêtes avec solennité.</p><p>Plusieurs personnes me sollicitent très fort de me transporter à Buenos: Je ne saurais me résoudre à rien jusqu’à ce que je voie clairement que c’est la volonté de Dieu. Et pour vous dire le tout en confiance, je ne fais pas un pas sans que le Seigneur me le commande et me conduise sensiblement comme par la main.</p><p>Comment cela arrive-t-il? Misérable que je suis. Je ne le sais pas. Cependant la chose est ainsi. De plus, si vous voulez que je vous instruise des soins tout amoureux de la Providence sur moi quelque indigne que j’en suis, sachez que dans mes pénibles voyages, dans des Pays si mauvais, </p><p>dans les déserts, obligée de passer de<strong>s fleuves, des torrents, j’ai toujours marché pieds nus, sans qu’il me soit rien arrivée de fâcheux: au contraire</strong></p><p> quelquefois que je me suis trouvée assez mal comme cela est arrivé à Catamarca où je fus désespérée des médecins, en me recommandant à la Sainte Vierge, sans autre remède je me levai du lit et continuai mon voyage jusqu’à Rioja. Une autre fois que je me rompis une côte par une chute, une autre que je m’étais donnée une entorse au pied, je me sentis par un tact invisible, guérie.</p><p>Salués tous nos chers frères et en particulier mon ancien Confesseur. Que tous m’aident de leurs prières sans quoi je ne puis rien. Votre Soeur Marie Antoinette de St. Joseph.</p><p> Corduba, dans le Tucuman, le 6 janvier 1778.</p>', '1762804934411.jpg', NULL, 'Ícono de Mama Antula, por Luis Quiróz', 1, '2025-11-10 20:02:14', 1),
(34, 30, 5, '<p><em>Cf. Blanco II: AL (en francés); G 16; P 184-186 (en francés): C. P., 273-275. Una versión existe también en ASR 62-66 (en italiano). No se conoce el original en castellano.</em></p>', NULL, NULL, NULL, 1, '2025-11-10 20:02:35', 1),
(35, 32, 2, '<p>Buenos Aires, 9 de octubre de 1780.</p><p>La gracia del Espíritu Santo sea con Vuestra Merced, mi Don Gaspar.</p><p>Esta carta es continuación de la que le acompaña.</p><p>La una dará a Vuestra Merced instrucción completa de los motivos y sucesos de mi esperanza, dirigida a suministrar en esta ciudad los Ejercicios de Nuestro Padre San Ignacio; la otra le impondrá de su consecución.</p><p>Aquélla es testimonio de mis aflicciones, por la supresión del aumento de la gloria y honra del Señor, que precisamente resultarían de ellos mismos. Ésta es un diseño e incentivo del gozo que me causa la actual práctica de contribuirlos. En suma, la primera suscitó (si me es permitido hablar así) los efectos de la terrible justicia del Señor; la segunda la produjeron los que dimanan de la inmensa, suave y amabilísima misericordia del Altísimo, de quien profirió el Profeta: “Señor, toda la tierra está inundada de tus misericordias”.</p><p>En efecto, han tomado las cosas de un instante a otro tal semblante, que cuando no se pensaba comúnmente sino en la repulsa de esta obra del cielo, se dispuso de un modo improviso su admisión, la cual ha provenido de las amplias facultades y permisos que me ha franqueado el Excmo. de esta Diócesis, siendo él mismo que antes más la resistía por fines que sin duda graduó por convenientes.</p><p>Luego que le obtuve, solicité casa distinta de la que se debía destinar, por hallarse ésta ocupada con ciertos huérfanos, como abajo expondré. Pero como son de Dios todas las que poseen los hombres, un pobrecito de éstos me ha cedido la suya para todo el tiempo que quiera, cuyas protestas (sin embargo de la tibieza con que parece la ofreció a los principios), las reitera inducido de gozo al fin de cada uno de dichos Ejercicios; y aunque es bastante estrecha nos facilita hasta hoy la extensión suficiente a adecuar los actuales designios del Señor.</p><p><strong>Su capacidad admite poco más de 100 personas con mucha incomodidad; </strong>como en los primeros y segundos Ejercicios concurrió poca gente, se dieron con regular desahogo. <strong>En los terceros empezamos a sentir su estrechez, porque llenaron toda la casa</strong>. Y últimamente en los cuartos, que estamos siguiendo, nos han oprimido con exceso y tanto que es preciso privarles la introducción de catres y cujas, para que así se den lugar unas a otras, tiradas en el suelo sobre esteras, chuces y colchones. Si el número de ellas se va recrudeciendo sucesivamente (como lo voy experimentando y promete el país), <strong>es necesario que Su Divina Majestad y mi Señora de los Dolores me oigan, a fin de que me provean de habitación correspondiente a la multitud de almas que anhelan nutrirse con el maná que adquieren mediante las sabias cristianas reglas que nos prescribió Ignacio</strong>; tan abundante en el espíritu que agita a las mujeres de este país. La referida casa que hoy sirve, está colocada calle de por medio frente a frente de la iglesia de San Miguel, adonde pasamos todos los días, mañana y tarde, a oír la Misa y pláticas del presentado Fr. Diego Toro, que las dispone y vierte con celestial emoción propia de su bello espíritu.</p><p>El alimento, aunque no hay fincas visibles,<strong> lo da Dios muy sobrante, excesivo y sazonado</strong>, con que logro complacer a todas las que los participan, quienes a más de esta dicha que logro no recusan mezclarse (hablo de las señoras principales ) con las pobrecitas domésticas, negras y pardas que admito con ellas. Ya se hace indispensable valerme de estos humildes arbitrios, para no malograr ni perder el fruto que ofrece el mismo Jesucristo, que jamás fue aceptador de personas.</p><p>Bien parece que carecían estas gentes de que mi misión fuese autorizada con algunas distinciones de hombres, y hasta en esto Dios les ha dado el gusto a unas, y a otras mucho en qué entender. A este intento han observado que los Excmos., que actualmente se hallan aquí, a saber: el de la misma ciudad y el Carmelita español de nuestra provincia (que llegó en el convoy poco más ha de un mes, mientras daba mis primeros Ejercicios), han asistido repetidas veces a las pláticas, que las han aplaudido con tanta complacencia, como lo restante de las distribuciones interiores que seguimos. El primero concurría casi solo, pero el segundo ha venido varias veces con lo más de su familia. Concluida su asistencia, sin duda en demostración del aprecio de tal obra, nos concedió indulgencias a todas las personas que participasen de ella, ejercitantes y no ejercitantes.</p><p>Ya he expresado cuántos favores me tributa el Excmo. de aquí; se me ha ofrecido a cuanto yo disponga de sus facultades y persona en lo posible. El nuestro es un sujeto de muchísimas circunstancias: es santo y es sabio con cuantas prendas pueden apetecerse capaces de equivocarle con los Padres primitivos. Los designios que lleva para efectuados en nuestra provincia, son los más adecuados a un verdadero pastor y, si no fuera por demorarme, yo le hiciera aquí un elogio de ellos. Baste por ahora decirle que me ha propuesto regrese a su diócesis, a fin de que juntos corramos su provincia, yo sin variar de profesión y él en calidad de confesor, pastor y misionero. ¿Puede darse mayor felicidad? Tales son los estímulos que a Vuestras Mercedes les presento, por los cuales vendrán en conocimiento del amor que mutuamente nos une en Jesucristo, a quien es debida toda preferencia, no a mí. “No a nosotros, Señor, no a nosotros, sino a Vuestro Nombre se debe tributar todo honor y toda gloria”. Si alguna cosa tenemos, es confusión.</p><p>A más de esto, después de haberse informado de mis asuntos y de habernos tratado (bien que no como deseábamos), me ha intimado el precepto, como superior tan legítimo, de que le escriba cuanto ocurra, y de que vuelva según el espíritu de sus órdenes futuras. Él sale mañana para Córdoba. Yo estoy muy contenta con este hombre raro, y confío en mi Dios, que me lo ha traído para cosas grandes. Así se lo expresó, según me cuentan, un alma justa, al tiempo de morir en España; y sus obras bien lo indican.</p><p>Prestándole la obediencia que debo no podré tan fácilmente transmigrarme a esos reinos. Si bien que yo en todo he de seguir la interior voz de mi Señor y Dios; también las inspiraciones de nuestra Señora de los Dolores. En adelante le referiré a Vuestra Merced las cosas conforme ocurran y me parezca. Entretanto ruegue a Dios con mis hermanos, se haga en mí cuanto fuere mayor honra, gloria y beneplácito del Altísimo.</p><p>La Casa de Ejercicios, ya he dicho, que se halla ocupada por ciertos huérfanos. Llegará ocasión que vuelva a su primitivo destino, si viene. Dios lo hará todo.</p><p>“Su diestra es omnipotente” y en tanto participamos de su fuerza en cuanto confiamos menos en los auxilios humanos. Cualquiera que sólo ponga la mira en tales socorros caducos suministrados por manos de hombres perderá todas sus empresas, confundirá su fe, se perderá eternamente, y así será “maldito el hombre que confiare absolutamente en otro hombre”.</p><p>Esta luz es bastante para afianzar en nuestras almas toda esperanza aun sobre aquellas cosas más destituidas de restauración. La esperanza que Dios aprecia es la que merece corona; quiero decir, la sólida, la firme, la perseverante.</p><p>Y así, ánimo, queridos, ánimo y fortaleza. La omnipotencia del brazo del Altísimo no descaece ni cede a nadie; y si algún vigor debe sostener nuestros corazones, su diestra le da, le señala y le conserva. El miserable poder y disposiciones de los hombres alucinan nuestros sentidos; pero el torrente de su fuerza destruye a aquéllas y protege hasta el fin a los inocentes, humildes, abatidos.</p><p>Poco ha nos han llenado de gozo las noticias del paisano Canónigo Juárez, quien habiendo verificado su introducción al Chaco en compañía del Coronel Comandante Don Francisco Gavino de Arias, vecino de Salta, ha convertido o reducido a la paz sola, o también a la religión, a tres numerosas naciones y prosiguen con la solicitud de alianza con otra más o con otras varias.</p><p>Ignoramos la prolija individualidad de su expedición. Procuren Vuestras Mercedes encomendar a Dios todas estas cosas, que yo no me olvido de las suyas.</p>', '1762805136287.jpg', NULL, 'Acuarela de José Torres Argañaráz (2020)', 1, '2025-11-10 20:05:36', 1),
(36, 5, 2, 'Del Arzobispado de Buenos Aires', '1762872082903.jpg', '1762872098223.jpg', NULL, 1, '2025-11-11 14:41:22', 1),
(37, 25, 4, '<p><a href=\"https://www.google.com/maps/d/u/8/viewer?mid=1I24ck3_l92w-4RpLlUbygrFnW4K4_DBn&amp;ll=-33.034478022251385%2C-60.96347780000002&amp;z=5\" target=\"_blank\">En Argentina</a></p><ul><li>Templete Mama Antula -villa Silípica, Santiago del Estero-</li><li><a href=\"http://mamaantula.com/2021/11/30/mama-antula-es-un-tesoro-de-nuestro-pais/\" target=\"_blank\">Basílica de San Ponciano -La Plata-</a></li><li><a href=\"http://mamaantula.com/2021/06/29/mama-antula-en-la-catedral-de-moron/\" target=\"_blank\">Catedral de Morón</a></li><li>Santuario Nueva Pompeya -Mar del Plata-</li><li>Catedral Nuestra Señora del Carmen -Santiago del Estero-</li><li>Catedral de Santa Fe</li><li>Pquia. San Cayetano, Río Cuarto -Córdoba-</li><li><a href=\"http://mamaantula.com/2021/02/18/hogar-de-cristo-mama-antula/\" target=\"_blank\">Hogar de Cristo Mama Antula</a> -Isidro Casanova-</li><li>Santuario Nuestra Señora delos Milagros -Santa Fe-</li><li>Parroquia Santo Domingo de Guzmán -San Isidro-</li><li>Santuario Mama Antula -Santiago del Estero-</li><li>Catedral de Añatuya -pquia. Virgen del Valle, Sgo. del Estero-</li><li>Casa de Espiritualidad Mama Antula, Berisso, Buenos Aires</li><li>Santuario Mama Antula, Villa Silípica, Sgo. del Estero</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li>Colegio Hogar San Mauricio, González Catán, Buenos Aires</li><li>Parque Unidad Nacional, Merlo, Buenos Aires</li><li>Parroquia San Cayetano, Olavarría, Buenos Aires</li><li><a href=\"https://goo.gl/maps/gGqSLBnNiw9iKYzP7\" target=\"_blank\">Basílica La Consolata, Sampacho, Córdoba</a></li><li><a href=\"https://goo.gl/maps/wKw8Ecu8cUGH1JWHA\" target=\"_blank\">Casa de Ejercicios Madre María Antonia de Paz y Figueroa, La Candelaria, Salta</a></li><li>Catedral de Salta</li><li>Catedral del Santísimo Salvador, San Salvador de Jujuy</li></ul>', '1762830036884.jpg', NULL, 'Mapa de la Argentina', 1, '2025-11-11 03:00:36', 1),
(38, 25, 1, '<p><a href=\"/contactanos\" target=\"_blank\">Envianos un mensaje</a> si querés que incluyamos el retablo, imagen o devoción de tu comunidad.</p>', NULL, NULL, NULL, 1, '2025-11-11 02:51:07', 1),
(39, 25, 5, '<p><a href=\"https://bit.ly/DevocionesMamaAntula\" target=\"_blank\">En CABA</a></p><ul><li><a href=\"http://mamaantula.com/2021/12/01/actividades-en-la-santa-casa-2/\" target=\"_blank\">Santa Casa de Ejercicios Espirituales</a>, CABA</li><li>Sepulcro Histórico Nacional Mama Antula, Basílica de La Piedad, CABA</li><li>Catedral Metropolitana de la Ciudad de Buenos Aires, CABA</li><li><a href=\"http://mamaantula.com/2021/02/07/mama-antula-y-san-cayetano/\" target=\"_blank\">Santuario San Cayetano de Liniers</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/02/24/por-los-que-sufren/\" target=\"_blank\">La Esperanza de Puerto Madero</a>, CABA</li><li><a href=\"http://mamaantula.com/2021/08/08/mama-antula-en-su-parroquia/\" target=\"_blank\">Parroquia de La Concepción</a>, CABA</li><li>Plaza Santiago del Estero -CABA-</li><li><a href=\"http://mamaantula.com/2021/12/30/la-mayolica-de-mama-antula/\" target=\"_blank\">Estación Sáenz Peña, Subte A -CABA-</a></li><li><a href=\"http://mamaantula.com/2021/12/29/mama-antula-en-alpi/\" target=\"_blank\">ALPI Asociación Civil</a>, CABA</li><li>Iglesia Ntra. Sra. de Montserrat, CABA</li><li>Cripta de la Iglesia Ortodoxa San Martín de Tours, CABA</li></ul>', '1762830105475.jpg', NULL, 'Mapa de CABA', 1, '2025-11-11 03:01:45', 1),
(40, 26, 1, '<p><strong>Fiesta de santos y santas</strong></p><p>Bajo el lema «Los santos, faros que iluminan caminos» celebramos el día de todos los santos contemplando una imagen que muestra a Mama Antula como catequista y rodeada de su mundo y de los santos y santas de su mayor devoción.</p><p>La ilustración -de Dolores Avendaño- resume el mundo y la actitud de Mama Antula, la primera santa argentina: <strong>para encontrar a Dios hay que abajarse.</strong> Porque Dios está en los más pequeños, frágiles, pobres y vulnerables.</p><p>En la ilustración, a la izquierda, aparece a lo lejos la <strong>Basílica de Luján,</strong> por donde entró Mama Antula a Buenos Aires, después de haber caminado evangelizando por Santiago del Estero, Jujuy, Salta, Tucumán, La Rioja, Catamarca y Córdoba.</p><p>Están acompañándola los santos y santas a quienes les profesaba especial devoción:<strong> San Cayetano </strong>-con el Niño Dios en Brazos-,<strong> la Virgen de los Dolores</strong> y <strong>San José</strong>.</p><p>La naturaleza a pleno revela en cierta forma algo del Pesebre -están todos sus actores- y su Santiago del Estero natal está presente en el <strong>cactus.</strong> No faltan las <strong>mujeres </strong>-que la ayudaron en su misión- y <strong>la familia.</strong></p><p>Como telón de fondo, la obra cúlmine de Mama Antula: <a href=\"https://mamaantula.com/santa-casa-de-ee/\" target=\"_blank\">La Santa Casa de Ejercicios Espirituales.</a></p>', '1762830673474.jpg', NULL, 'Mama Antula, rodeada de los santos de su devoción. Ilustración de Dolores Avendaño.', 1, '2025-11-11 03:11:13', 1),
(41, 27, 3, NULL, NULL, 'IaH5YJQGTBg', NULL, 1, '2025-11-11 03:27:23', 1),
(42, 27, 2, '<p><strong>Doña Jovita a Mamá Antula</strong></p><p>Doña Jovita -interpretada por José Luis Serrano- es una abuela del interior de la Argentina, humilde, que exhuda la sabiduría de los años y las adversidades de la vida. En esta genial payada describe aspectos de la vida y obra de Mama Antula, predecesora del Cura Brochero en la difusión de los Ejercicios Espirituales.</p>', NULL, NULL, NULL, 1, '2025-11-11 03:15:21', 1),
(43, 29, 1, '<p><strong>Llamado a la santidad</strong></p><p>Video biográfico de Mama Antula, que intercala escenas reales de adolescentes en la escuela con un gran trabajo interpretativo al momento de encarnar los principales momentos y prodigios de la primera santa argentina. Realizado por estudiantes del Colegio de la Providencia (Bella Vista, Bs. As)</p>', NULL, NULL, NULL, 1, '2025-11-11 03:28:40', 1),
(44, 29, 2, NULL, NULL, 'StqZFOuH23Q', NULL, 1, '2025-11-11 03:29:13', 1),
(45, 26, 2, '<p><strong>Mama Antula catequista</strong></p><p>En el 1700, nuestra beata de la Compañía de Jesús enseñaba la Palabra de Dios a los niños de las comunidades originarias de Santiago del Estero. En 2010 el Cardenal Bergoglio pidió a los catequistas de Buenos Aires que rezaran ante el sepulcro de Mama Antula. Y en 2021, ya siendo Papa Francisco, declaró el Ministerio Laical del catequista, que se celebra cada 21 de agosto.</p><p>Recordamos un fragmento de la carta a los catequistas que el Cardenal Jorge Bergoglio -hoy Papa Francisco- escribió en el Día del catequista de 2010:</p><blockquote>«..¡No te canses de sembrar! Y en este año del Bicentenario,<strong> me animo a proponerte que te acerques como peregrino a la Parroquia de Nuestra Señora de la Piedad. Y ante la tumba de la Madre Antula, pedile para vos, para mí y para cada uno de los catequistas de esta bendita ciudad, su grandeza y su fortaleza.</strong> Suplicale la gracia de poder acompañar y cuidar la fe de nuestro pueblo fiel como ella lo supo hacer tres siglos atrás, en circunstancias también difíciles como las actuales. Será una manera de <em>“anticipar la aurora, y construir la esperanza”.</em>Que Jesús te bendiga y la Virgen Santa te cuide. Afectuosamente. «</blockquote><p>Card. Jorge Mario Bergoglio SJ, arzobispo de Buenos Aires. Buenos Aires, 21 de agosto de 2010</p>', '1762831981080.jpg', NULL, NULL, 1, '2025-11-11 03:33:01', 1),
(46, 26, 3, '<p>Mama Antula, célebre por la enorme obra evangelizadora que realizó en el territorio del virreinato del Perú y del río de la Plata, dio sus primeros pasos como <strong>catequista de los indios de Santiago del Estero</strong>.</p><p>Hablaba en quechua y compartía la vida con las comunidades originarias con estrecha colaboración con las reducciones jesuitas. Por entonces catequizar no solo implicaba la tarea de dar a conocer la buena noticia de Jesús, sino también la educación integral para la vida digna: cocinar, bordar, plantar y cosechar además de leer y escribir.</p>', '1762832061382.jpg', NULL, 'Esta pintura de Mama Antula catequizando a caballo por los caminos de Santiago fue realizada por Marcela Torena, de la familia antuliana. Está sentada al estilo amazona, de costado, evangelizando a las familias quechuas de Santiago del Estero.', 1, '2025-11-11 03:34:21', 1),
(47, 28, 1, '<p><strong>Consagración de los niños a San José</strong></p><blockquote>María Antonia de Paz y Figueroa tenía una especial predilección por el Padre de Jesús, por lo que eligió como nombre religioso María Antonia de San José. Oración para consagrar la vida de nuestras niñas y niños a San José y rogar su protección de Padre de la Iglesia y de las familias del mundo entero.</blockquote>', NULL, NULL, NULL, 1, '2025-11-11 03:38:04', 1),
(48, 28, 3, '<p>San José es el patrono de la Compañía de Jesús. De ahí la veneración de María Antonia, que eligió llamarse “María Antonia de San José” un 18 de marzo de 1745, hace 277 años, según la tradición oral. Lo veneró toda su vida y todos los 19 de cada mes mandaba a rezarle Misa, rezando especialmente por la restitución de la Compañía de Jesús en América, como nos cuenta en sus cartas:</p><blockquote>«para mí cuento el interponer por <strong>medianero al señor San José obligándome a mandarle cantar misa en todos los días 19 del mes, </strong>como así mismo aplicando todo el trabajo que impendo en el ministerio de los Ejercicios» </blockquote><p>-María Antonia de San José, <a href=\"https://mamaantula.com/2020/10/06/carta-10-de-la-sierva-de-dios-al-p-juarez-buenos-aires-5-de-septiembre-de-1782/\" target=\"_blank\">carta 10 al Padre Gaspar Juárez</a></p><blockquote>«Prosigo en hacer cantar misa al Señor San José cada 19 del mes, como comencé desde que salieron Vds. de acá y esto sin faltar jamás. Y cuando por hacerse los Ejercicios no puedo en mi oratorio, la hago cantar en la Merced. Y de Córdoba y de todas las demás partes donde he estado me escriben que hacen esta diligencia, principalmente en mi tierra, donde me han estado corriendo estas misas que se cantan en la iglesia de la Compañía y de la Merced.</blockquote><blockquote>Tal vez pareciéndome que se me tardan los asuntos para honra y gloria de Dios, esto es, la restitución de la Compañía, empiezo a decir al Señor San José que me pague lo que me debe, pues me debe mucho (esto es, lo que yo gasto en estas misas por el Santo, a fin de que me alcance de Dios aquella gracia) y después caigo en la cuenta que más debo yo a él; pero como puede mucho, siempre quedo con el consuelo que me lo ha de hacer; esto es, aquello que sabe Vd.»</blockquote><p>María Antonia de San José, <a href=\"https://mamaantula.com/2020/11/13/carta-29-de-la-sierva-de-dios-al-p-juarez-buenos-aires-22-de-agosto-de-1785/\" target=\"_blank\">carta 29 al Padre Gaspar Juárez</a></p>', '1762832481505.jpg', NULL, 'Reliquia de Mama Antula junto a la imagen de San José, previa a su entronización en el altar de la Iglesia de la Concepción de la Av. Independencia.', 1, '2025-11-11 03:41:21', 1),
(49, 26, 4, '<p><strong>El Manuelito</strong></p><p>Mama Antula llevaba del cuello esta imagen de un Niño Dios abrazado a la Cruz. La gente lo consideraba milagroso, le rezaban con fervor. Se encuentra en la Santa Casa de Ejercicios Espirituales que fundó Mama Antula. Es un Museo histórico que podés visitar cada primer Domingo de cada mes.</p>', '1762832622543.jpg', NULL, 'Reliquia de la Santa Casa', 1, '2025-11-11 03:43:42', 1),
(50, 17, 2, NULL, NULL, 'CJtrkX7DA4I', NULL, 1, '2025-11-11 10:13:43', 1),
(51, 9, 4, NULL, '1762856103461.jpg', NULL, 'Audiencia Privada de la Familia antuliana con el Papa Francisco, feb/2024', 1, '2025-11-11 10:15:03', 1),
(52, 8, 2, NULL, '1762856287372.jpg', NULL, NULL, 1, '2025-11-11 10:18:07', 1),
(53, 10, NULL, 'Nuestra Mama Antula : Caminante del Espíritu', '1762860316771.jpg', '2014 - San Pablo', 'Víctor Manuel Fernández', 1, '2025-11-11 11:25:16', 1),
(54, 10, NULL, 'El estandarte de la mujer fuerte de nuestros días: Mama Antula', '1762860370304.jpg', '1791 - Sociedad Hijas del Divino Salvador', 'Autor Anónimo', 1, '2025-11-11 11:26:10', 1),
(55, 10, NULL, 'Mama Antula : la vida de la mujer que fundó la espiritualidad en la Argentina', '1762860423562.jpg', '2017 - Sudamericana', 'Ana María Cabrera', 1, '2025-11-11 11:27:03', 1),
(56, 10, NULL, 'Crónicas de la beatificación', '1762860452351.jpg', '2017', 'Jorge Baya Casal Oyuela', 1, '2025-11-11 11:27:32', 1),
(57, 10, NULL, 'El Retrato Documental de María Antonia de Paz y Figueroa, la Beata Santiagueña', '1762860479713.jpg', '2017', 'Aldo Marcos de Castro Paz', 1, '2025-11-11 11:27:59', 1),
(58, 10, NULL, 'El estandarte de la mujer fuerte de nuestros días: Mama Antula', '1762868916091.jpg', '1791 - Descarga', 'Autor Anónimo', 1, '2025-11-11 11:26:10', 1),
(59, 5, 3, 'De la Santa Casa de Ejercicios Espirituales, Independencia 1190, CABA\r\n\r\n', '1762872150449.jpg', '1762872160637.jpg', NULL, 1, '2025-11-11 14:42:30', 1),
(60, 5, 4, 'Oración a María Antonia de San José', '1762872209467.jpg', '1762872218165.jpg', NULL, 1, '2025-11-11 14:43:29', 1),
(61, 28, 2, '<p>Glorioso San José,<br>a vos Dios te encomendó<br>el cuidado de su Hijo unigénito<br>en medio de los muchos<br>peligros de este mundo.</p><p>Acudimos a vos<br>y te pedimos que<br>tomes bajo tu protección especial<br>a los niños que Dios nos ha dado.</p><p>A través del santo bautismo<br>se convirtieron en hijos de Dios<br>y en miembros de su Santa Iglesia.</p><p>Los consagramos hoy a vos,<br>para que a través de esta consagración<br>puedan convertirse en tus hijos de crianza.</p><p>Guardálos,<br>guiá sus pasos en la vida,<br>formá sus corazones<br>según los corazones<br>de Jesús y María.</p><p>San José,<br>que sentiste la tribulación<br>y la preocupación de un padre<br>cuando el niño Jesús se perdió,<br>protegé a nuestros queridos hijos<br>por el tiempo y la eternidad.</p><p>Que seas su padre y consejero.<br>Que ellos, como Jesús,<br>crezcan tanto en edad<br>como en sabiduría<br>y gracia ante Dios<br>y los hombres.</p><p>Preserválos de la corrupción del mundo<br>y danos la gracia<br>de estar unidos con ellos<br>en el cielo para siempre.</p>', '1762832284430.jpg', NULL, NULL, 1, '2025-11-11 15:43:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cont_3carrusel`
--

CREATE TABLE `cont_3carrusel` (
  `id` int(10) UNSIGNED NOT NULL,
  `contenido_id` int(10) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `imagen` varchar(17) NOT NULL,
  `creadoPor_id` int(10) UNSIGNED NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cont_3carrusel`
--

INSERT INTO `cont_3carrusel` (`id`, `contenido_id`, `orden`, `imagen`, `creadoPor_id`, `creadoEn`, `statusRegistro_id`) VALUES
(2, 13, 2, '1762630631369.jpg', 1, '2025-11-08 19:37:11', 1),
(3, 13, 3, '1762630631370.jpg', 1, '2025-11-08 19:37:11', 1),
(4, 13, 4, '1762630631371.jpg', 1, '2025-11-08 19:37:11', 1),
(5, 13, 5, '1762630631372.jpg', 1, '2025-11-08 19:37:11', 1),
(6, 13, 6, '1762630631373.jpg', 1, '2025-11-08 19:37:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cont_ediciones`
--

CREATE TABLE `cont_ediciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `contenido_id` int(10) UNSIGNED DEFAULT NULL,
  `orden` tinyint(1) UNSIGNED DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `video` mediumtext DEFAULT NULL,
  `leyenda` mediumtext DEFAULT NULL,
  `editadoPor_id` int(10) UNSIGNED NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encab_1original`
--

CREATE TABLE `encab_1original` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_id` int(10) UNSIGNED DEFAULT NULL,
  `pestana_id` int(10) UNSIGNED DEFAULT NULL,
  `numero` tinyint(3) UNSIGNED DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `nombreDesde_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `nombreHacia_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `idioma_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `lugar_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `creadoPor_id` int(10) UNSIGNED NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `encab_1original`
--

INSERT INTO `encab_1original` (`id`, `tema_id`, `pestana_id`, `numero`, `titulo`, `subTitulo`, `nombreDesde_id`, `nombreHacia_id`, `idioma_id`, `lugar_id`, `fechaEvento`, `creadoPor_id`, `creadoEn`, `statusRegistro_id`) VALUES
(1, 5, NULL, NULL, 'Santa Mama Antula: primera fiesta litúrgica', 'Primera celebración del 7 de marzo en Buenos Aires después de la canonización de la primera santa argentina.', NULL, NULL, NULL, 3, '2024-03-07', 1, '2025-10-28 22:42:00', 1),
(2, 5, NULL, NULL, 'Conferencia de Aldo Marcos de Castro Paz', '', NULL, NULL, NULL, 4, '2024-03-08', 1, '2025-10-28 22:50:33', 1),
(3, 5, NULL, NULL, 'Actividades en el Subte', 'Nuevo nombre para la estación Independencia', NULL, NULL, NULL, 2, '2024-03-07', 1, '2025-11-03 16:20:34', 1),
(4, 7, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 11:26:01', 1),
(5, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 02:28:29', 1),
(6, 5, NULL, NULL, 'Primera fiesta litúrgica como santa', '', NULL, NULL, NULL, 3, '2024-03-07', 1, '2025-11-03 17:21:55', 1),
(7, 6, NULL, NULL, 'Misa en acción de gracias por la canonización de Mama Antula', '', NULL, NULL, NULL, 3, '2024-02-11', 1, '2025-11-06 23:17:08', 1),
(8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-17 16:55:50', 1),
(9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-30 15:51:05', 1),
(10, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-10-31 19:10:17', 1),
(11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-05 14:12:04', 1),
(12, NULL, 5, NULL, 'Oración a Mama Antula', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:24:47', 1),
(13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 11:14:15', 1),
(14, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:23:34', 1),
(15, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:23:39', 1),
(16, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:23:48', 1),
(17, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 10:12:03', 1),
(18, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 18:58:18', 1),
(19, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:25:30', 1),
(20, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:25:44', 1),
(21, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-12 19:44:37', 1),
(22, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-06 23:26:07', 1),
(23, 6, NULL, NULL, 'Proyección de la ceremonia de canonización en pantalla gigante', '', NULL, NULL, NULL, 2, '2024-02-11', 1, '2025-11-08 21:03:45', 1),
(24, 6, NULL, NULL, 'Misa en el Vaticano', '', NULL, NULL, NULL, 7, '2024-02-11', 1, '2025-11-08 21:26:37', 1),
(25, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 02:46:42', 1),
(26, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 03:08:54', 1),
(27, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 03:13:33', 1),
(28, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 03:36:21', 1),
(29, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-11 03:13:33', 1),
(30, 10, NULL, 1, NULL, NULL, 1, 2, 2, 1, '1778-01-06', 1, '2025-10-17 16:56:11', 1),
(31, 10, NULL, 2, NULL, NULL, 1, 2, 1, 2, '1780-08-07', 1, '2025-10-17 16:56:11', 1),
(32, 10, NULL, 3, NULL, NULL, 1, 2, 1, 2, '1780-10-09', 1, '2025-11-10 18:04:13', 1),
(33, 10, NULL, 0, 'Introducción', NULL, NULL, NULL, NULL, NULL, '1730-01-01', 1, '2025-11-10 16:02:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `encab_2edicion`
--

CREATE TABLE `encab_2edicion` (
  `id` int(10) UNSIGNED NOT NULL,
  `encab_id` int(10) UNSIGNED DEFAULT NULL,
  `sinIndice_id` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(150) DEFAULT NULL,
  `numero` tinyint(3) UNSIGNED DEFAULT NULL,
  `nombreDesde_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `nombreHacia_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `idioma_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `imagen` varchar(17) DEFAULT NULL,
  `lugar_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `editadoPor_id` int(10) UNSIGNED NOT NULL,
  `editadoEn` datetime NOT NULL DEFAULT utc_timestamp()
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
  `url` varchar(30) NOT NULL,
  `conIndice` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel1_secciones`
--

INSERT INTO `nivel1_secciones` (`id`, `orden`, `nombre`, `codigo`, `url`, `conIndice`) VALUES
(1, 1, 'Inicio', 'inicio', 'inicio', NULL),
(2, 2, 'Experiencias', 'experiencias', 'experiencias', 1),
(3, 3, 'Cartas y Escritos', 'cartasEscritos', 'cartas-y-escritos', NULL),
(4, 4, 'Libros y Videos', 'librosVideos', 'libros-y-videos', NULL),
(5, 5, 'Devoción', 'devocion', 'devocion', NULL),
(6, 6, 'Institucionales', 'institucionales', 'institucionales', NULL);

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
  `url` varchar(30) NOT NULL,
  `inactivo` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `capturadoPor_id` int(10) UNSIGNED DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel2_temas`
--

INSERT INTO `nivel2_temas` (`id`, `seccion_id`, `orden`, `titulo`, `codigo`, `url`, `inactivo`, `capturadoPor_id`, `capturadoEn`) VALUES
(1, 1, 1, 'Novedades', 'novedades', 'novedades', 1, NULL, NULL),
(2, 1, 2, 'Quién es Mama Antula', 'quienEsMamaAntula', 'quien-es-mama-antula', 0, NULL, NULL),
(3, 1, 3, 'Quiénes somos', 'quienesSomos', 'quienes-somos', 0, NULL, NULL),
(4, 2, 3, 'Antes de la canonización', 'antesCanon', 'antes-de-la-canonizacion', 0, NULL, NULL),
(5, 2, 1, 'Después de la canonización', 'despuesCanon', 'despues-de-la-canonizacion', 0, NULL, NULL),
(6, 2, 2, 'Crónicas de la canonización', 'cronicasCanon', 'cronicas-de-la-canonizacion', 0, NULL, NULL),
(7, 2, 4, 'Cronología de su causa', 'cronologia', 'cronologia-de-su-causa', 0, NULL, NULL),
(8, 4, 2, 'Videos', 'videos', 'videos', 0, NULL, NULL),
(9, 3, 4, 'Testamento', 'testamento', 'testamento', 0, NULL, NULL),
(10, 3, 2, 'Cartas', 'cartas', 'cartas', 0, NULL, NULL),
(11, 3, 3, 'Frases destacadas', 'frasesDestacadas', 'frases-destacadas', 0, NULL, NULL),
(12, 3, 5, 'Oración fúnebre', 'oracionFunebre', 'oracion-funebre', 0, NULL, NULL),
(13, 4, 1, 'Libros', 'libros', 'libros', 0, NULL, NULL),
(15, 5, 1, 'Oraciones', 'oraciones', 'oraciones', 0, NULL, NULL),
(17, 5, 3, 'Lugares de devoción', 'lugaresDevocion', 'lugares-de-devocion', 0, NULL, NULL),
(18, 5, 2, 'Imágenes', 'imagenes', 'imagenes', 0, NULL, NULL),
(19, 6, 1, 'Santa Casa', 'santaCasa', 'santa-casa', 0, NULL, NULL),
(20, 6, 2, 'Iglesia de La Piedad', 'iglesiaLaPiedad', 'iglesia-de-la-piedad', 0, NULL, NULL),
(21, 6, 3, 'Santiago del Estero', 'santiagoEstero', 'santiago-del-estero', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nivel3_pestanas`
--

CREATE TABLE `nivel3_pestanas` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_id` int(10) UNSIGNED NOT NULL,
  `orden` tinyint(1) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subTitulo` mediumtext DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL,
  `capturadoPor_id` int(10) UNSIGNED DEFAULT NULL,
  `capturadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel3_pestanas`
--

INSERT INTO `nivel3_pestanas` (`id`, `tema_id`, `orden`, `titulo`, `subTitulo`, `codigo`, `url`, `capturadoPor_id`, `capturadoEn`) VALUES
(1, 15, 2, 'Oración a San José', NULL, 'oracionSj', 'oracion-a-san-jose', NULL, NULL),
(2, 19, 1, 'Retiros Ignacianos', NULL, 'retiros', 'retiros-ignacianos', NULL, NULL),
(3, 19, 2, 'Otras Actividades', NULL, 'otrasActividades', 'otras-actividades', NULL, NULL),
(4, 19, 3, 'Historia', NULL, 'historia', 'historia', NULL, NULL),
(5, 15, 1, 'Oración a Mama Antula', NULL, 'oracionMa', 'oracion-a-mama-antula', NULL, NULL),
(6, 15, 3, 'Estampas', NULL, 'estampas', 'estampas', NULL, NULL),
(7, 8, 1, 'Biográficos', NULL, 'biograficos', 'biograficos', NULL, NULL),
(8, 8, 2, 'Conferencias', NULL, 'conferencias', 'conferencias', NULL, NULL),
(9, 8, 3, 'Varios', NULL, 'varios', 'varios', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nivel_indices`
--

CREATE TABLE `nivel_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivel_indices`
--

INSERT INTO `nivel_indices` (`id`, `tema_id`, `nombre`, `codigo`, `fechaDesde`, `fechaHasta`) VALUES
(1, 10, '1778', NULL, '1778-01-01', '1778-12-31'),
(2, 10, '1780 - 1784', NULL, '1780-01-01', '1784-12-31'),
(3, 10, '1785 - 1789', NULL, '1785-01-01', '1789-12-31'),
(4, 10, '1790 - 1794', NULL, '1790-01-01', '1794-12-31'),
(5, 10, '1795 - 1799', NULL, '1795-01-01', '1799-12-31'),
(6, 10, '1800 - 1816', NULL, '1800-01-01', '1816-12-31'),
(7, 5, '2024', NULL, '2024-02-12', '2024-12-31'),
(8, 5, '2025', NULL, '2025-01-01', '2025-12-31'),
(9, 6, 'Dom 11/feb', NULL, '2024-02-11', '2024-02-11'),
(10, 6, 'Sáb 10/feb', NULL, '2024-02-10', '2024-02-10'),
(11, 6, 'Vie 9/feb', NULL, '2024-02-09', '2024-02-09'),
(12, 6, 'Jue 8/feb', NULL, '2024-02-08', '2024-02-08'),
(13, 6, 'Mié 7/feb', NULL, '2024-02-07', '2024-02-07'),
(14, 6, 'Mar 6/feb', NULL, '2024-02-06', '2024-02-06'),
(15, 6, 'Lun 5/feb', NULL, '2024-02-05', '2024-02-05'),
(16, 6, 'Dom 4/feb', NULL, '2024-02-04', '2024-02-04'),
(17, 6, 'Sáb 3/feb', NULL, '2024-02-03', '2024-02-03'),
(18, 4, '2021', NULL, '2021-01-01', '2021-12-31'),
(19, 10, 'Introducción', 'introduccion', '1730-01-01', '1730-01-01'),
(22, 4, 'Cronología', 'cronologia', '1730-01-01', '1730-01-01');

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
('-1FjjL6wZofPzMwMW0dFkd93T98yql7m', 1764575958, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:59:18.305Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":530,\"cliente_id\":\"V0000000530\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('-cWWbG1YjF-o00JZI_Y3lHKu6Z7X0E0r', 1764594806, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T13:13:25.813Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":540,\"cliente_id\":\"V0000000540\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('2ZcSQ5Vz8mgZFn6EOc2oFbPGmGbNqaE5', 1764576047, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T08:00:47.302Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":535,\"cliente_id\":\"V0000000535\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('6BVOEEJ_ROFXyn0sG1WV9TihbLEy63QY', 1764518377, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T15:59:36.828Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":510,\"cliente_id\":\"V0000000510\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('7WJGaMY2OtDcigBAQDYG91rF0Cca_jMq', 1764529122, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T18:58:42.180Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":512,\"cliente_id\":\"V0000000512\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('7xRqxLNMgUnoSRo-0Yta9lVhPAmlsuVn', 1764575965, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:59:25.332Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":534,\"cliente_id\":\"V0000000534\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('EWqdc15s6IJxnHj_sKbUjiY87al5pXdZ', 1764575488, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:51:28.300Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":529,\"cliente_id\":\"V0000000529\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('FuroTfbawlS_ZTMIuUu-hk-VZaweY1qm', 1764575960, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:59:19.553Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":531,\"cliente_id\":\"V0000000531\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('HvHpImBQRLGF7xGQGZpLByOp72qnf-52', 1764553522, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T01:45:22.071Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":521,\"cliente_id\":\"V0000000521\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('IJVGKzxKE6iIZFLAv5ETp9d7neeKg97w', 1764532578, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T19:56:17.512Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":516,\"cliente_id\":\"V0000000516\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('Q074Gl5wTkcYPm-0j2E_7RZNO0jxd8ei', 1764528870, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T18:54:30.239Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":511,\"cliente_id\":\"V0000000511\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('RE7bDHwSS25xKWuS_1ecWjhFiTzoJRhf', 1764558307, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T03:05:07.160Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":525,\"cliente_id\":\"V0000000525\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('ZGJAfaaGGMmxS36wVsJ-Lc-1fpcUktTJ', 1764568712, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T05:58:32.137Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":526,\"cliente_id\":\"V0000000526\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('_rwleED7zD0xPHRHP_H6asXlxfgpQWvG', 1764557009, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T02:43:28.811Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":522,\"cliente_id\":\"V0000000522\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('cOmYIz2fTXEIil7Fl2LuIqOUikQxV9IN', 1764557493, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T02:51:32.884Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":523,\"cliente_id\":\"V0000000523\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('dCiTi0WRrhvH2-mTP_XVdVLwVZib6YFc', 1764538589, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T21:36:28.055Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":519,\"cliente_id\":\"V0000000519\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('dZC51c_zwcPSkumibJW1Le1AYOiPI9hh', 1764577972, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T08:32:52.418Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":537,\"cliente_id\":\"V0000000537\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('fQl4tfZExpjgWnJJNNDJy17AdgmI-AmQ', 1764581180, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T09:26:20.497Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":538,\"cliente_id\":\"V0000000538\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('gAmhMYuSl_-9jc5GJFYVdYkVeAPOVzIo', 1764538151, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T21:29:10.810Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":517,\"cliente_id\":\"V0000000517\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('g_QcmgW6gBl62q7WCA77H2IVqueUTlQW', 1764569505, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T06:11:45.209Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":527,\"cliente_id\":\"V0000000527\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('gjqn7i2EHjWA863W6H4Aafz_UDHLBz7P', 1764558305, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T03:05:05.367Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":524,\"cliente_id\":\"V0000000524\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('icD34tm1UHM5sb_vTxdGy2UmfTmWFCqx', 1764570974, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T06:36:13.875Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":528,\"cliente_id\":\"V0000000528\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('ksYdF8T9ITPmKKpal0Dzd-slR_TMBihh', 1764594804, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T13:12:10.633Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":539,\"cliente_id\":\"V0000000539\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('lIIieQx-2W7AdJsfsUddjy-5fJh0xmqV', 1764531353, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T19:35:53.352Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":513,\"cliente_id\":\"V0000000513\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('myAoTh7X6kfOMmbFLopkFUrEboSn4iLV', 1764577890, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T08:31:29.616Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":536,\"cliente_id\":\"V0000000536\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('pSEeo6guMY6i5n0GkREPIifMxyeRej4C', 1764532221, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T19:50:21.380Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":514,\"cliente_id\":\"V0000000514\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('pv_AnPPv_TzVxGRG5I2UzsV3FRyk3JIg', 1764548528, '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2025-12-01T00:22:08.424Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":520,\"cliente_id\":\"V0000000520\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('s5UvQN_hBbD1IWY7EHgy7PHxikr9TexQ', 1764538152, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T21:29:11.567Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":518,\"cliente_id\":\"V0000000518\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('w4kjuyheicDGkce7TxfGOUgmINxdSyvM', 1764575965, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:59:24.931Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":533,\"cliente_id\":\"V0000000533\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('wdtKutJ3juXhBt9hxOOSVvIlIodeks3u', 1764532222, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-11-30T19:50:22.160Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":515,\"cliente_id\":\"V0000000515\",\"fechaUltNaveg\":\"2025-11-29\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-29\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}'),
('yBQav13aKVQ1G2nFX1A0RsFV38IJf2Jd', 1764575962, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-12-01T07:59:22.377Z\",\"httpOnly\":true,\"path\":\"/\"},\"cliente\":{\"id\":532,\"cliente_id\":\"V0000000532\",\"fechaUltNaveg\":\"2025-11-30\",\"diasNaveg\":1,\"visitaCreadaEn\":\"2025-11-30\",\"versionWeb\":\"1.01\",\"rol\":{\"id\":1,\"orden\":1,\"nombre\":\"Sólo lectura\",\"codigo\":\"lectura\",\"actualizac\":false,\"revision\":false,\"cambioRoles\":false}}}');

-- --------------------------------------------------------

--
-- Table structure for table `us_roles`
--

CREATE TABLE `us_roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `orden` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `actualizac` tinyint(1) DEFAULT 0,
  `revision` tinyint(1) DEFAULT 0,
  `cambioRoles` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_roles`
--

INSERT INTO `us_roles` (`id`, `orden`, `nombre`, `codigo`, `actualizac`, `revision`, `cambioRoles`) VALUES
(1, 1, 'Sólo lectura', 'lectura', 0, 0, 0),
(2, 2, 'Actualización', 'actualizac', 1, 0, 0),
(3, 3, 'Revisión', 'revision', 1, 1, 0),
(4, 4, 'Cambio de roles', 'cambioRoles', 1, 0, 1),
(5, 5, 'Completo', 'completo', 1, 1, 1);

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
(2, 2, 'Mail validado', 'mailValidado'),
(3, 3, 'Con apodo', 'conApodo');

-- --------------------------------------------------------

--
-- Table structure for table `us_usuarios`
--

CREATE TABLE `us_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreCompleto` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `apodo` varchar(30) DEFAULT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL,
  `pais_id` varchar(2) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `notificacs` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `visitaCreadaEn` datetime DEFAULT NULL,
  `fechaUltNaveg` date NOT NULL DEFAULT utc_date(),
  `diasNaveg` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `creadoEn` datetime NOT NULL DEFAULT utc_timestamp(),
  `fechaContrasena` datetime NOT NULL DEFAULT utc_timestamp(),
  `rol_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `statusRegistro_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_usuarios`
--

INSERT INTO `us_usuarios` (`id`, `nombreCompleto`, `email`, `apodo`, `cliente_id`, `contrasena`, `pais_id`, `imagen`, `notificacs`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `creadoEn`, `fechaContrasena`, `rol_id`, `statusRegistro_id`) VALUES
(1, 'Diego Iribarren', 'diegoiribarren2015@gmail.com', 'Diego', 'U0000000001', '$2a$10$B78JgfuFnMmfdC5MLci06.HGD3AtXGGHYqQcKCStrq5b3v.jpI/aO', NULL, '1761491982343.jpg', 0, '2025-10-16 23:29:07', '2025-11-18', 2, '1.00', '2025-10-16 23:29:07', '2025-10-16 23:29:07', 5, 3),
(2, 'Damián Abregú', 'abredam@hotmail.com', 'Abredam', 'U0000000002', '$2b$10$MxgBNROzl0iaoiLIUmKg9ucBpkq.w6zRdKmMHludZ9ujxeIMmvtdi', NULL, '1763500318610.jpg', 0, '2025-11-18 00:00:00', '2025-11-18', 1, '1.01', '2025-11-18 21:06:59', '2025-11-18 21:06:59', 5, 3),
(3, 'Mariana  Baya Casal', 'mbayacasal@gmail.com', 'MARIANA', 'U0000000003', '$2b$10$qnYIxNazJmShsFnukRrZAe35zEDWYd/3uh3InCo73vGWZIUirNSSy', NULL, NULL, 0, '2025-11-18 00:00:00', '2025-11-18', 1, '1.01', '2025-11-18 21:34:48', '2025-11-18 21:34:48', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `us_visitas`
--

CREATE TABLE `us_visitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` varchar(11) DEFAULT NULL,
  `visitaCreadaEn` datetime DEFAULT utc_timestamp(),
  `fechaUltNaveg` date DEFAULT utc_date(),
  `diasNaveg` smallint(5) UNSIGNED DEFAULT 1,
  `versionWeb` varchar(4) NOT NULL,
  `rol_id` tinyint(3) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `us_visitas`
--

INSERT INTO `us_visitas` (`id`, `cliente_id`, `visitaCreadaEn`, `fechaUltNaveg`, `diasNaveg`, `versionWeb`, `rol_id`) VALUES
(1, 'V0000000001', '2025-10-21 13:39:18', '2025-10-21', 0, '1.00', 1),
(2, 'V0000000002', '2025-11-04 14:23:48', '2025-11-04', 0, '1.00', 1),
(3, 'V0000000003', '2025-11-14 14:33:31', '2025-11-14', 1, '1.00', 1),
(4, 'V0000000004', '2025-11-17 22:46:36', '2025-11-17', 1, '1.00', 1),
(5, 'V0000000005', '2025-11-18 00:17:28', '2025-11-18', 1, '1.00', 1),
(6, 'V0000000006', '2025-11-18 01:12:59', '2025-11-18', 1, '1.00', 1),
(7, 'V0000000007', '2025-11-18 02:38:56', '2025-11-18', 1, '1.00', 1),
(8, 'V0000000008', '2025-11-18 02:40:42', '2025-11-18', 1, '1.00', 1),
(9, 'V0000000009', '2025-11-18 02:42:01', '2025-11-18', 1, '1.00', 1),
(10, 'V0000000010', '2025-11-18 02:42:01', '2025-11-18', 1, '1.00', 1),
(11, 'V0000000011', '2025-11-18 02:43:00', '2025-11-18', 1, '1.00', 1),
(12, 'V0000000012', '2025-11-18 02:43:00', '2025-11-18', 1, '1.00', 1),
(13, 'V0000000013', '2025-11-18 02:43:35', '2025-11-18', 1, '1.00', 1),
(14, 'V0000000014', '2025-11-18 02:43:36', '2025-11-18', 1, '1.00', 1),
(15, 'V0000000015', '2025-11-18 02:48:01', '2025-11-18', 1, '1.00', 1),
(16, 'V0000000016', '2025-11-18 03:01:06', '2025-11-18', 1, '1.00', 1),
(17, 'V0000000017', '2025-11-18 03:01:10', '2025-11-18', 1, '1.00', 1),
(18, 'V0000000018', '2025-11-18 04:05:55', '2025-11-18', 1, '1.00', 1),
(19, 'V0000000019', '2025-11-18 04:06:43', '2025-11-18', 1, '1.00', 1),
(20, 'V0000000020', '2025-11-18 04:07:42', '2025-11-18', 1, '1.00', 1),
(21, 'V0000000021', '2025-11-18 04:07:43', '2025-11-18', 1, '1.00', 1),
(22, 'V0000000022', '2025-11-18 04:08:21', '2025-11-18', 1, '1.00', 1),
(23, 'V0000000023', '2025-11-18 04:08:21', '2025-11-18', 1, '1.00', 1),
(24, 'V0000000024', '2025-11-18 04:09:22', '2025-11-18', 1, '1.00', 1),
(25, 'V0000000025', '2025-11-18 04:09:22', '2025-11-18', 1, '1.00', 1),
(26, 'V0000000026', '2025-11-18 04:09:59', '2025-11-18', 1, '1.00', 1),
(27, 'V0000000027', '2025-11-18 04:09:59', '2025-11-18', 1, '1.00', 1),
(28, 'V0000000028', '2025-11-18 04:10:50', '2025-11-18', 1, '1.00', 1),
(29, 'V0000000029', '2025-11-18 04:11:35', '2025-11-18', 1, '1.00', 1),
(30, 'V0000000030', '2025-11-18 04:12:20', '2025-11-18', 1, '1.00', 1),
(31, 'V0000000031', '2025-11-18 04:12:21', '2025-11-18', 1, '1.00', 1),
(32, 'V0000000032', '2025-11-18 05:06:39', '2025-11-18', 1, '1.00', 1),
(33, 'V0000000033', '2025-11-18 05:07:33', '2025-11-18', 1, '1.00', 1),
(34, 'V0000000034', '2025-11-18 05:09:17', '2025-11-18', 1, '1.00', 1),
(35, 'V0000000035', '2025-11-18 05:09:22', '2025-11-18', 1, '1.00', 1),
(36, 'V0000000036', '2025-11-18 05:40:12', '2025-11-18', 1, '1.00', 1),
(37, 'V0000000037', '2025-11-18 05:40:46', '2025-11-18', 1, '1.00', 1),
(38, 'V0000000038', '2025-11-18 05:45:45', '2025-11-18', 1, '1.00', 1),
(39, 'V0000000039', '2025-11-18 08:11:19', '2025-11-18', 1, '1.00', 1),
(40, 'V0000000040', '2025-11-18 08:23:22', '2025-11-18', 1, '1.00', 1),
(41, 'V0000000041', '2025-11-18 08:23:26', '2025-11-18', 1, '1.00', 1),
(42, 'V0000000042', '2025-11-18 09:38:28', '2025-11-18', 1, '1.00', 1),
(43, 'V0000000043', '2025-11-18 10:03:28', '2025-11-18', 1, '1.00', 1),
(44, 'V0000000044', '2025-11-18 10:03:30', '2025-11-18', 1, '1.00', 1),
(45, 'V0000000045', '2025-11-18 10:22:21', '2025-11-18', 1, '1.00', 1),
(46, 'V0000000046', '2025-11-18 10:22:25', '2025-11-18', 1, '1.00', 1),
(47, 'V0000000047', '2025-11-18 10:41:33', '2025-11-18', 1, '1.00', 1),
(48, 'V0000000048', '2025-11-18 10:41:36', '2025-11-18', 1, '1.00', 1),
(49, 'V0000000049', '2025-11-18 11:01:47', '2025-11-18', 1, '1.00', 1),
(50, 'V0000000050', '2025-11-18 14:03:55', '2025-11-18', 1, '1.00', 1),
(51, 'V0000000051', '2025-11-18 15:52:11', '2025-11-18', 1, '1.00', 1),
(52, 'V0000000052', '2025-11-18 15:52:12', '2025-11-18', 1, '1.00', 1),
(53, 'V0000000053', '2025-11-18 17:03:01', '2025-11-18', 1, '1.00', 1),
(54, 'V0000000054', '2025-11-18 17:04:47', '2025-11-18', 1, '1.00', 1),
(55, 'V0000000055', '2025-11-18 17:05:10', '2025-11-18', 1, '1.00', 1),
(56, 'V0000000056', '2025-11-18 17:05:33', '2025-11-18', 1, '1.00', 1),
(57, 'V0000000057', '2025-11-18 17:07:21', '2025-11-18', 1, '1.00', 1),
(58, 'V0000000058', '2025-11-18 17:17:55', '2025-11-18', 1, '1.00', 1),
(59, 'V0000000059', '2025-11-18 17:35:58', '2025-11-18', 1, '1.00', 1),
(60, 'V0000000060', '2025-11-18 18:07:54', '2025-11-18', 1, '1.00', 1),
(61, 'V0000000061', '2025-11-18 18:24:50', '2025-11-18', 1, '1.00', 1),
(62, 'V0000000062', '2025-11-18 18:24:51', '2025-11-18', 1, '1.00', 1),
(63, 'V0000000063', '2025-11-18 21:37:38', '2025-11-18', 1, '1.01', 1),
(64, 'V0000000064', '2025-11-18 21:04:20', '2025-11-18', 1, '1.01', 1),
(65, 'V0000000065', '2025-11-18 22:50:23', '2025-11-18', 1, '1.01', 1),
(66, 'V0000000066', '2025-11-18 21:46:34', '2025-11-18', 1, '1.01', 1),
(67, 'V0000000067', '2025-11-18 22:50:23', '2025-11-18', 1, '1.01', 1),
(68, 'V0000000068', '2025-11-18 22:50:41', '2025-11-18', 1, '1.01', 1),
(69, 'V0000000069', '2025-11-18 22:50:42', '2025-11-18', 1, '1.01', 1),
(70, 'V0000000070', '2025-11-18 23:36:21', '2025-11-18', 1, '1.01', 1),
(71, 'V0000000071', '2025-11-19 00:56:37', '2025-11-19', 1, '1.01', 1),
(72, 'V0000000072', '2025-11-19 01:36:31', '2025-11-19', 1, '1.01', 1),
(73, 'V0000000073', '2025-11-19 01:46:29', '2025-11-19', 1, '1.01', 1),
(74, 'V0000000074', '2025-11-19 02:06:21', '2025-11-19', 1, '1.01', 1),
(75, 'V0000000075', '2025-11-19 02:20:19', '2025-11-19', 1, '1.01', 1),
(76, 'V0000000076', '2025-11-19 02:20:20', '2025-11-19', 1, '1.01', 1),
(77, 'V0000000077', '2025-11-19 02:35:22', '2025-11-19', 1, '1.01', 1),
(78, 'V0000000078', '2025-11-19 03:12:14', '2025-11-19', 1, '1.01', 1),
(79, 'V0000000079', '2025-11-19 03:36:36', '2025-11-19', 1, '1.01', 1),
(80, 'V0000000080', '2025-11-19 03:50:23', '2025-11-19', 1, '1.01', 1),
(81, 'V0000000081', '2025-11-19 04:06:29', '2025-11-19', 1, '1.01', 1),
(82, 'V0000000082', '2025-11-19 04:36:21', '2025-11-19', 1, '1.01', 1),
(83, 'V0000000083', '2025-11-19 05:45:44', '2025-11-19', 1, '1.01', 1),
(84, 'V0000000084', '2025-11-19 06:41:04', '2025-11-19', 1, '1.01', 1),
(85, 'V0000000085', '2025-11-19 07:40:57', '2025-11-19', 1, '1.01', 1),
(86, 'V0000000086', '2025-11-19 07:41:31', '2025-11-19', 1, '1.01', 1),
(87, 'V0000000087', '2025-11-19 07:41:39', '2025-11-19', 1, '1.01', 1),
(88, 'V0000000088', '2025-11-19 07:42:04', '2025-11-19', 1, '1.01', 1),
(89, 'V0000000089', '2025-11-19 08:04:24', '2025-11-19', 1, '1.01', 1),
(90, 'V0000000090', '2025-11-19 08:46:10', '2025-11-19', 1, '1.01', 1),
(91, 'V0000000091', '2025-11-19 09:06:29', '2025-11-19', 1, '1.01', 1),
(92, 'V0000000092', '2025-11-19 09:07:56', '2025-11-19', 1, '1.01', 1),
(93, 'V0000000093', '2025-11-19 09:47:48', '2025-11-19', 1, '1.01', 1),
(94, 'V0000000094', '2025-11-19 09:54:59', '2025-11-19', 1, '1.01', 1),
(95, 'V0000000095', '2025-11-19 09:55:02', '2025-11-19', 1, '1.01', 1),
(96, 'V0000000096', '2025-11-19 09:55:17', '2025-11-19', 1, '1.01', 1),
(97, 'V0000000097', '2025-11-19 10:10:24', '2025-11-19', 1, '1.01', 1),
(98, 'V0000000098', '2025-11-19 10:32:29', '2025-11-19', 1, '1.01', 1),
(99, 'V0000000099', '2025-11-19 10:57:29', '2025-11-19', 1, '1.01', 1),
(100, 'V0000000100', '2025-11-19 11:00:59', '2025-11-19', 1, '1.01', 1),
(101, 'V0000000101', '2025-11-19 11:09:59', '2025-11-19', 1, '1.01', 1),
(102, 'V0000000102', '2025-11-19 11:36:29', '2025-11-19', 1, '1.01', 1),
(103, 'V0000000103', '2025-11-19 12:15:59', '2025-11-19', 1, '1.01', 1),
(104, 'V0000000104', '2025-11-19 12:24:59', '2025-11-19', 1, '1.01', 1),
(105, 'V0000000105', '2025-11-19 12:37:45', '2025-11-19', 1, '1.01', 1),
(106, 'V0000000106', '2025-11-19 12:37:49', '2025-11-19', 1, '1.01', 1),
(107, 'V0000000107', '2025-11-19 12:37:49', '2025-11-19', 1, '1.01', 1),
(108, 'V0000000108', '2025-11-19 12:39:24', '2025-11-19', 1, '1.01', 1),
(109, 'V0000000109', '2025-11-19 13:52:28', '2025-11-19', 1, '1.01', 1),
(110, 'V0000000110', '2025-11-19 14:51:02', '2025-11-19', 1, '1.01', 1),
(111, 'V0000000111', '2025-11-19 15:09:02', '2025-11-19', 1, '1.01', 1),
(112, 'V0000000112', '2025-11-19 15:49:55', '2025-11-19', 1, '1.01', 1),
(113, 'V0000000113', '2025-11-19 17:28:33', '2025-11-19', 1, '1.01', 1),
(114, 'V0000000114', '2025-11-19 18:54:00', '2025-11-19', 1, '1.01', 1),
(115, 'V0000000115', '2025-11-19 18:54:31', '2025-11-19', 1, '1.01', 1),
(116, 'V0000000116', '2025-11-19 20:35:09', '2025-11-19', 1, '1.01', 1),
(117, 'V0000000117', '2025-11-19 20:35:37', '2025-11-19', 1, '1.01', 1),
(118, 'V0000000118', '2025-11-19 20:36:54', '2025-11-19', 1, '1.01', 1),
(119, 'V0000000119', '2025-11-19 20:38:17', '2025-11-19', 1, '1.01', 1),
(120, 'V0000000120', '2025-11-19 21:09:24', '2025-11-19', 1, '1.01', 1),
(121, 'V0000000121', '2025-11-19 21:23:23', '2025-11-19', 1, '1.01', 1),
(122, 'V0000000122', '2025-11-19 21:23:25', '2025-11-19', 1, '1.01', 1),
(123, 'V0000000123', '2025-11-19 21:23:26', '2025-11-19', 1, '1.01', 1),
(124, 'V0000000124', '2025-11-19 21:29:38', '2025-11-19', 1, '1.01', 1),
(125, 'V0000000125', '2025-11-19 22:00:21', '2025-11-19', 1, '1.01', 1),
(126, 'V0000000126', '2025-11-19 22:00:22', '2025-11-19', 1, '1.01', 1),
(127, 'V0000000127', '2025-11-19 22:21:28', '2025-11-19', 1, '1.01', 1),
(128, 'V0000000128', '2025-11-19 22:21:53', '2025-11-19', 1, '1.01', 1),
(129, 'V0000000129', '2025-11-20 04:11:43', '2025-11-20', 1, '1.01', 1),
(130, 'V0000000130', '2025-11-20 04:31:22', '2025-11-20', 1, '1.01', 1),
(131, 'V0000000131', '2025-11-20 04:31:22', '2025-11-20', 1, '1.01', 1),
(132, 'V0000000132', '2025-11-20 04:32:25', '2025-11-20', 1, '1.01', 1),
(133, 'V0000000133', '2025-11-20 05:10:25', '2025-11-20', 1, '1.01', 1),
(134, 'V0000000134', '2025-11-20 05:55:16', '2025-11-20', 1, '1.01', 1),
(135, 'V0000000135', '2025-11-20 06:49:09', '2025-11-20', 1, '1.01', 1),
(136, 'V0000000136', '2025-11-20 06:54:51', '2025-11-20', 1, '1.01', 1),
(137, 'V0000000137', '2025-11-20 07:39:08', '2025-11-20', 1, '1.01', 1),
(138, 'V0000000138', '2025-11-20 08:29:09', '2025-11-20', 1, '1.01', 1),
(139, 'V0000000139', '2025-11-20 08:53:02', '2025-11-20', 1, '1.01', 1),
(140, 'V0000000140', '2025-11-20 11:49:08', '2025-11-20', 1, '1.01', 1),
(141, 'V0000000141', '2025-11-20 13:16:17', '2025-11-20', 1, '1.01', 1),
(142, 'V0000000142', '2025-11-20 13:20:07', '2025-11-20', 1, '1.01', 1),
(143, 'V0000000143', '2025-11-20 15:54:24', '2025-11-20', 1, '1.01', 1),
(144, 'V0000000144', '2025-11-20 15:54:24', '2025-11-20', 1, '1.01', 1),
(145, 'V0000000145', '2025-11-20 15:54:24', '2025-11-20', 1, '1.01', 1),
(146, 'V0000000146', '2025-11-20 17:33:24', '2025-11-20', 1, '1.01', 1),
(147, 'V0000000147', '2025-11-20 18:09:32', '2025-11-20', 1, '1.01', 1),
(148, 'V0000000148', '2025-11-20 19:32:03', '2025-11-20', 1, '1.01', 1),
(149, 'V0000000149', '2025-11-20 19:32:03', '2025-11-20', 1, '1.01', 1),
(150, 'V0000000150', '2025-11-20 20:21:16', '2025-11-20', 1, '1.01', 1),
(151, 'V0000000151', '2025-11-20 20:42:17', '2025-11-20', 1, '1.01', 1),
(152, 'V0000000152', '2025-11-20 23:01:44', '2025-11-20', 1, '1.01', 1),
(153, 'V0000000153', '2025-11-20 23:01:46', '2025-11-20', 1, '1.01', 1),
(154, 'V0000000154', '2025-11-20 23:02:51', '2025-11-20', 1, '1.01', 1),
(155, 'V0000000155', '2025-11-21 05:15:41', '2025-11-21', 1, '1.01', 1),
(156, 'V0000000156', '2025-11-21 06:18:32', '2025-11-21', 1, '1.01', 1),
(157, 'V0000000157', '2025-11-21 06:42:28', '2025-11-21', 1, '1.01', 1),
(158, 'V0000000158', '2025-11-21 06:42:29', '2025-11-21', 1, '1.01', 1),
(159, 'V0000000159', '2025-11-21 07:04:15', '2025-11-21', 1, '1.01', 1),
(160, 'V0000000160', '2025-11-21 07:38:20', '2025-11-21', 1, '1.01', 1),
(161, 'V0000000161', '2025-11-21 07:38:22', '2025-11-21', 1, '1.01', 1),
(162, 'V0000000162', '2025-11-21 07:53:05', '2025-11-21', 1, '1.01', 1),
(163, 'V0000000163', '2025-11-21 07:53:19', '2025-11-21', 1, '1.01', 1),
(164, 'V0000000164', '2025-11-21 11:45:18', '2025-11-21', 1, '1.01', 1),
(165, 'V0000000165', '2025-11-21 11:54:59', '2025-11-21', 1, '1.01', 1),
(166, 'V0000000166', '2025-11-21 12:18:59', '2025-11-21', 1, '1.01', 1),
(167, 'V0000000167', '2025-11-21 12:19:02', '2025-11-21', 1, '1.01', 1),
(168, 'V0000000168', '2025-11-21 12:19:05', '2025-11-21', 1, '1.01', 1),
(169, 'V0000000169', '2025-11-21 12:37:42', '2025-11-21', 1, '1.01', 1),
(170, 'V0000000170', '2025-11-21 12:37:44', '2025-11-21', 1, '1.01', 1),
(171, 'V0000000171', '2025-11-21 12:37:46', '2025-11-21', 1, '1.01', 1),
(172, 'V0000000172', '2025-11-21 12:38:37', '2025-11-21', 1, '1.01', 1),
(173, 'V0000000173', '2025-11-21 13:19:33', '2025-11-21', 1, '1.01', 1),
(174, 'V0000000174', '2025-11-21 13:19:34', '2025-11-21', 1, '1.01', 1),
(175, 'V0000000175', '2025-11-21 13:44:25', '2025-11-21', 1, '1.01', 1),
(176, 'V0000000176', '2025-11-21 13:44:26', '2025-11-21', 1, '1.01', 1),
(177, 'V0000000177', '2025-11-21 14:59:25', '2025-11-21', 1, '1.01', 1),
(178, 'V0000000178', '2025-11-21 16:08:24', '2025-11-21', 1, '1.01', 1),
(179, 'V0000000179', '2025-11-21 19:20:00', '2025-11-21', 1, '1.01', 1),
(180, 'V0000000180', '2025-11-21 19:20:01', '2025-11-21', 1, '1.01', 1),
(181, 'V0000000181', '2025-11-21 23:59:03', '2025-11-21', 1, '1.01', 1),
(182, 'V0000000182', '2025-11-21 23:59:03', '2025-11-21', 1, '1.01', 1),
(183, 'V0000000183', '2025-11-21 23:59:04', '2025-11-21', 1, '1.01', 1),
(184, 'V0000000184', '2025-11-22 00:03:07', '2025-11-22', 1, '1.01', 1),
(185, 'V0000000185', '2025-11-22 00:03:08', '2025-11-22', 1, '1.01', 1),
(186, 'V0000000186', '2025-11-22 00:03:19', '2025-11-22', 1, '1.01', 1),
(187, 'V0000000187', '2025-11-22 00:23:01', '2025-11-22', 1, '1.01', 1),
(188, 'V0000000188', '2025-11-22 00:53:54', '2025-11-22', 1, '1.01', 1),
(189, 'V0000000189', '2025-11-22 01:06:49', '2025-11-22', 1, '1.01', 1),
(190, 'V0000000190', '2025-11-22 01:13:23', '2025-11-22', 1, '1.01', 1),
(191, 'V0000000191', '2025-11-22 01:13:26', '2025-11-22', 1, '1.01', 1),
(192, 'V0000000192', '2025-11-22 01:51:43', '2025-11-22', 1, '1.01', 1),
(193, 'V0000000193', '2025-11-22 01:51:44', '2025-11-22', 1, '1.01', 1),
(194, 'V0000000194', '2025-11-22 02:52:33', '2025-11-22', 1, '1.01', 1),
(195, 'V0000000195', '2025-11-22 04:05:17', '2025-11-22', 1, '1.01', 1),
(196, 'V0000000196', '2025-11-22 04:46:37', '2025-11-22', 1, '1.01', 1),
(197, 'V0000000197', '2025-11-22 04:47:25', '2025-11-22', 1, '1.01', 1),
(198, 'V0000000198', '2025-11-22 04:57:26', '2025-11-22', 1, '1.01', 1),
(199, 'V0000000199', '2025-11-22 05:24:07', '2025-11-22', 1, '1.01', 1),
(200, 'V0000000200', '2025-11-22 05:37:35', '2025-11-22', 1, '1.01', 1),
(201, 'V0000000201', '2025-11-22 05:45:58', '2025-11-22', 1, '1.01', 1),
(202, 'V0000000202', '2025-11-22 06:41:49', '2025-11-22', 1, '1.01', 1),
(203, 'V0000000203', '2025-11-22 07:12:45', '2025-11-22', 1, '1.01', 1),
(204, 'V0000000204', '2025-11-22 07:12:46', '2025-11-22', 1, '1.01', 1),
(205, 'V0000000205', '2025-11-22 07:12:48', '2025-11-22', 1, '1.01', 1),
(206, 'V0000000206', '2025-11-22 07:54:56', '2025-11-22', 1, '1.01', 1),
(207, 'V0000000207', '2025-11-22 12:28:20', '2025-11-22', 1, '1.01', 1),
(208, 'V0000000208', '2025-11-22 13:55:15', '2025-11-22', 1, '1.01', 1),
(209, 'V0000000209', '2025-11-22 13:55:15', '2025-11-22', 1, '1.01', 1),
(210, 'V0000000210', '2025-11-22 13:55:16', '2025-11-22', 1, '1.01', 1),
(211, 'V0000000211', '2025-11-22 13:55:16', '2025-11-22', 1, '1.01', 1),
(212, 'V0000000212', '2025-11-22 18:29:16', '2025-11-22', 1, '1.01', 1),
(213, 'V0000000213', '2025-11-22 19:34:50', '2025-11-22', 1, '1.01', 1),
(214, 'V0000000214', '2025-11-22 20:29:26', '2025-11-22', 1, '1.01', 1),
(215, 'V0000000215', '2025-11-23 00:30:37', '2025-11-23', 1, '1.01', 1),
(216, 'V0000000216', '2025-11-23 01:02:51', '2025-11-23', 1, '1.01', 1),
(217, 'V0000000217', '2025-11-23 01:02:52', '2025-11-23', 1, '1.01', 1),
(218, 'V0000000218', '2025-11-23 01:04:11', '2025-11-23', 1, '1.01', 1),
(219, 'V0000000219', '2025-11-23 02:44:14', '2025-11-23', 1, '1.01', 1),
(220, 'V0000000220', '2025-11-23 05:13:21', '2025-11-23', 1, '1.01', 1),
(221, 'V0000000221', '2025-11-23 05:13:23', '2025-11-23', 1, '1.01', 1),
(222, 'V0000000222', '2025-11-23 05:13:23', '2025-11-23', 1, '1.01', 1),
(223, 'V0000000223', '2025-11-23 05:38:01', '2025-11-23', 1, '1.01', 1),
(224, 'V0000000224', '2025-11-23 10:06:12', '2025-11-23', 1, '1.01', 1),
(225, 'V0000000225', '2025-11-23 10:30:41', '2025-11-23', 1, '1.01', 1),
(226, 'V0000000226', '2025-11-23 11:54:54', '2025-11-23', 1, '1.01', 1),
(227, 'V0000000227', '2025-11-23 12:08:47', '2025-11-23', 1, '1.01', 1),
(228, 'V0000000228', '2025-11-23 12:08:49', '2025-11-23', 1, '1.01', 1),
(229, 'V0000000229', '2025-11-23 12:39:39', '2025-11-23', 1, '1.01', 1),
(230, 'V0000000230', '2025-11-23 12:48:07', '2025-11-23', 1, '1.01', 1),
(231, 'V0000000231', '2025-11-23 12:58:49', '2025-11-23', 1, '1.01', 1),
(232, 'V0000000232', '2025-11-23 13:07:58', '2025-11-23', 1, '1.01', 1),
(233, 'V0000000233', '2025-11-23 13:08:01', '2025-11-23', 1, '1.01', 1),
(234, 'V0000000234', '2025-11-23 13:18:34', '2025-11-23', 1, '1.01', 1),
(235, 'V0000000235', '2025-11-23 13:18:38', '2025-11-23', 1, '1.01', 1),
(236, 'V0000000236', '2025-11-23 13:25:42', '2025-11-23', 1, '1.01', 1),
(237, 'V0000000237', '2025-11-23 13:25:46', '2025-11-23', 1, '1.01', 1),
(238, 'V0000000238', '2025-11-23 13:36:53', '2025-11-23', 1, '1.01', 1),
(239, 'V0000000239', '2025-11-23 13:36:53', '2025-11-23', 1, '1.01', 1),
(240, 'V0000000240', '2025-11-23 13:38:39', '2025-11-23', 1, '1.01', 1),
(241, 'V0000000241', '2025-11-23 13:38:43', '2025-11-23', 1, '1.01', 1),
(242, 'V0000000242', '2025-11-23 13:57:28', '2025-11-23', 1, '1.01', 1),
(243, 'V0000000243', '2025-11-23 13:57:31', '2025-11-23', 1, '1.01', 1),
(244, 'V0000000244', '2025-11-23 14:01:53', '2025-11-23', 1, '1.01', 1),
(245, 'V0000000245', '2025-11-23 14:07:17', '2025-11-23', 1, '1.01', 1),
(246, 'V0000000246', '2025-11-23 14:07:20', '2025-11-23', 1, '1.01', 1),
(247, 'V0000000247', '2025-11-23 14:17:54', '2025-11-23', 1, '1.01', 1),
(248, 'V0000000248', '2025-11-23 14:17:56', '2025-11-23', 1, '1.01', 1),
(249, 'V0000000249', '2025-11-23 14:17:58', '2025-11-23', 1, '1.01', 1),
(250, 'V0000000250', '2025-11-23 14:37:54', '2025-11-23', 1, '1.01', 1),
(251, 'V0000000251', '2025-11-23 15:07:28', '2025-11-23', 1, '1.01', 1),
(252, 'V0000000252', '2025-11-23 16:48:35', '2025-11-23', 1, '1.01', 1),
(253, 'V0000000253', '2025-11-23 18:09:07', '2025-11-23', 1, '1.01', 1),
(254, 'V0000000254', '2025-11-23 18:24:34', '2025-11-23', 1, '1.01', 1),
(255, 'V0000000255', '2025-11-23 19:23:28', '2025-11-23', 1, '1.01', 1),
(256, 'V0000000256', '2025-11-23 19:27:39', '2025-11-23', 1, '1.01', 1),
(257, 'V0000000257', '2025-11-23 19:37:50', '2025-11-23', 1, '1.01', 1),
(258, 'V0000000258', '2025-11-23 19:37:51', '2025-11-23', 1, '1.01', 1),
(259, 'V0000000259', '2025-11-23 19:38:38', '2025-11-23', 1, '1.01', 1),
(260, 'V0000000260', '2025-11-23 19:51:59', '2025-11-23', 1, '1.01', 1),
(261, 'V0000000261', '2025-11-23 19:52:00', '2025-11-23', 1, '1.01', 1),
(262, 'V0000000262', '2025-11-23 21:59:10', '2025-11-23', 1, '1.01', 1),
(263, 'V0000000263', '2025-11-23 21:59:10', '2025-11-23', 1, '1.01', 1),
(264, 'V0000000264', '2025-11-23 21:59:11', '2025-11-23', 1, '1.01', 1),
(265, 'V0000000265', '2025-11-23 22:53:53', '2025-11-23', 1, '1.01', 1),
(266, 'V0000000266', '2025-11-24 00:52:34', '2025-11-24', 1, '1.01', 1),
(267, 'V0000000267', '2025-11-24 00:52:34', '2025-11-24', 1, '1.01', 1),
(268, 'V0000000268', '2025-11-24 00:52:34', '2025-11-24', 1, '1.01', 1),
(269, 'V0000000269', '2025-11-24 00:52:35', '2025-11-24', 1, '1.01', 1),
(270, 'V0000000270', '2025-11-24 00:52:44', '2025-11-24', 1, '1.01', 1),
(271, 'V0000000271', '2025-11-24 00:52:44', '2025-11-24', 1, '1.01', 1),
(272, 'V0000000272', '2025-11-24 00:53:04', '2025-11-24', 1, '1.01', 1),
(273, 'V0000000273', '2025-11-24 01:27:50', '2025-11-24', 1, '1.01', 1),
(274, 'V0000000274', '2025-11-24 01:44:57', '2025-11-24', 1, '1.01', 1),
(275, 'V0000000275', '2025-11-24 01:44:58', '2025-11-24', 1, '1.01', 1),
(276, 'V0000000276', '2025-11-24 01:52:26', '2025-11-24', 1, '1.01', 1),
(277, 'V0000000277', '2025-11-24 01:52:34', '2025-11-24', 1, '1.01', 1),
(278, 'V0000000278', '2025-11-24 01:53:20', '2025-11-24', 1, '1.01', 1),
(279, 'V0000000279', '2025-11-24 01:53:27', '2025-11-24', 1, '1.01', 1),
(280, 'V0000000280', '2025-11-24 01:59:50', '2025-11-24', 1, '1.01', 1),
(281, 'V0000000281', '2025-11-24 02:01:27', '2025-11-24', 1, '1.01', 1),
(282, 'V0000000282', '2025-11-24 02:01:34', '2025-11-24', 1, '1.01', 1),
(283, 'V0000000283', '2025-11-24 02:01:35', '2025-11-24', 1, '1.01', 1),
(284, 'V0000000284', '2025-11-24 02:03:12', '2025-11-24', 1, '1.01', 1),
(285, 'V0000000285', '2025-11-24 02:08:51', '2025-11-24', 1, '1.01', 1),
(286, 'V0000000286', '2025-11-24 02:09:38', '2025-11-24', 1, '1.01', 1),
(287, 'V0000000287', '2025-11-24 02:32:34', '2025-11-24', 1, '1.01', 1),
(288, 'V0000000288', '2025-11-24 02:42:53', '2025-11-24', 1, '1.01', 1),
(289, 'V0000000289', '2025-11-24 03:02:40', '2025-11-24', 1, '1.01', 1),
(290, 'V0000000290', '2025-11-24 04:37:00', '2025-11-24', 1, '1.01', 1),
(291, 'V0000000291', '2025-11-24 04:37:03', '2025-11-24', 1, '1.01', 1),
(292, 'V0000000292', '2025-11-24 05:05:31', '2025-11-24', 1, '1.01', 1),
(293, 'V0000000293', '2025-11-24 05:05:35', '2025-11-24', 1, '1.01', 1),
(294, 'V0000000294', '2025-11-24 05:06:03', '2025-11-24', 1, '1.01', 1),
(295, 'V0000000295', '2025-11-24 05:39:29', '2025-11-24', 1, '1.01', 1),
(296, 'V0000000296', '2025-11-24 05:39:43', '2025-11-24', 1, '1.01', 1),
(297, 'V0000000297', '2025-11-24 06:03:29', '2025-11-24', 1, '1.01', 1),
(298, 'V0000000298', '2025-11-24 06:03:30', '2025-11-24', 1, '1.01', 1),
(299, 'V0000000299', '2025-11-24 06:22:40', '2025-11-24', 1, '1.01', 1),
(300, 'V0000000300', '2025-11-24 06:22:43', '2025-11-24', 1, '1.01', 1),
(301, 'V0000000301', '2025-11-24 08:13:48', '2025-11-24', 1, '1.01', 1),
(302, 'V0000000302', '2025-11-24 09:11:26', '2025-11-24', 1, '1.01', 1),
(303, 'V0000000303', '2025-11-24 12:07:21', '2025-11-24', 1, '1.01', 1),
(304, 'V0000000304', '2025-11-24 12:39:07', '2025-11-24', 1, '1.01', 1),
(305, 'V0000000305', '2025-11-24 14:18:18', '2025-11-24', 1, '1.01', 1),
(306, 'V0000000306', '2025-11-24 15:10:00', '2025-11-24', 1, '1.01', 1),
(307, 'V0000000307', '2025-11-24 15:15:59', '2025-11-24', 1, '1.01', 1),
(308, 'V0000000308', '2025-11-24 16:49:58', '2025-11-24', 1, '1.01', 1),
(309, 'V0000000309', '2025-11-24 16:49:58', '2025-11-24', 1, '1.01', 1),
(310, 'V0000000310', '2025-11-24 17:04:43', '2025-11-24', 1, '1.01', 1),
(311, 'V0000000311', '2025-11-24 20:57:35', '2025-11-24', 1, '1.01', 1),
(312, 'V0000000312', '2025-11-24 21:49:11', '2025-11-24', 1, '1.01', 1),
(313, 'V0000000313', '2025-11-24 21:50:24', '2025-11-24', 1, '1.01', 1),
(314, 'V0000000314', '2025-11-24 22:02:04', '2025-11-24', 1, '1.01', 1),
(315, 'V0000000315', '2025-11-24 22:02:30', '2025-11-24', 1, '1.01', 1),
(316, 'V0000000316', '2025-11-24 22:02:34', '2025-11-24', 1, '1.01', 1),
(317, 'V0000000317', '2025-11-24 22:02:35', '2025-11-24', 1, '1.01', 1),
(318, 'V0000000318', '2025-11-25 02:58:51', '2025-11-25', 1, '1.01', 1),
(319, 'V0000000319', '2025-11-25 02:58:51', '2025-11-25', 1, '1.01', 1),
(320, 'V0000000320', '2025-11-25 02:58:52', '2025-11-25', 1, '1.01', 1),
(321, 'V0000000321', '2025-11-25 02:58:52', '2025-11-25', 1, '1.01', 1),
(322, 'V0000000322', '2025-11-25 02:59:23', '2025-11-25', 1, '1.01', 1),
(323, 'V0000000323', '2025-11-25 03:12:53', '2025-11-25', 1, '1.01', 1),
(324, 'V0000000324', '2025-11-25 03:52:11', '2025-11-25', 1, '1.01', 1),
(325, 'V0000000325', '2025-11-25 03:52:12', '2025-11-25', 1, '1.01', 1),
(326, 'V0000000326', '2025-11-25 03:52:12', '2025-11-25', 1, '1.01', 1),
(327, 'V0000000327', '2025-11-25 04:33:08', '2025-11-25', 1, '1.01', 1),
(328, 'V0000000328', '2025-11-25 06:06:19', '2025-11-25', 1, '1.01', 1),
(329, 'V0000000329', '2025-11-25 06:06:20', '2025-11-25', 1, '1.01', 1),
(330, 'V0000000330', '2025-11-25 06:06:29', '2025-11-25', 1, '1.01', 1),
(331, 'V0000000331', '2025-11-25 06:06:29', '2025-11-25', 1, '1.01', 1),
(332, 'V0000000332', '2025-11-25 06:30:02', '2025-11-25', 1, '1.01', 1),
(333, 'V0000000333', '2025-11-25 08:24:18', '2025-11-25', 1, '1.01', 1),
(334, 'V0000000334', '2025-11-25 08:24:20', '2025-11-25', 1, '1.01', 1),
(335, 'V0000000335', '2025-11-25 08:25:00', '2025-11-25', 1, '1.01', 1),
(336, 'V0000000336', '2025-11-25 09:51:18', '2025-11-25', 1, '1.01', 1),
(337, 'V0000000337', '2025-11-25 09:52:16', '2025-11-25', 1, '1.01', 1),
(338, 'V0000000338', '2025-11-25 11:03:34', '2025-11-25', 1, '1.01', 1),
(339, 'V0000000339', '2025-11-25 11:56:44', '2025-11-25', 1, '1.01', 1),
(340, 'V0000000340', '2025-11-25 12:34:28', '2025-11-25', 1, '1.01', 1),
(341, 'V0000000341', '2025-11-25 13:09:14', '2025-11-25', 1, '1.01', 1),
(342, 'V0000000342', '2025-11-25 15:05:59', '2025-11-25', 1, '1.01', 1),
(343, 'V0000000343', '2025-11-25 15:25:05', '2025-11-25', 1, '1.01', 1),
(344, 'V0000000344', '2025-11-25 15:25:05', '2025-11-25', 1, '1.01', 1),
(345, 'V0000000345', '2025-11-25 15:25:06', '2025-11-25', 1, '1.01', 1),
(346, 'V0000000346', '2025-11-25 16:25:04', '2025-11-25', 1, '1.01', 1),
(347, 'V0000000347', '2025-11-25 16:25:05', '2025-11-25', 1, '1.01', 1),
(348, 'V0000000348', '2025-11-25 16:25:05', '2025-11-25', 1, '1.01', 1),
(349, 'V0000000349', '2025-11-25 16:41:18', '2025-11-25', 1, '1.01', 1),
(350, 'V0000000350', '2025-11-25 16:41:18', '2025-11-25', 1, '1.01', 1),
(351, 'V0000000351', '2025-11-25 16:41:20', '2025-11-25', 1, '1.01', 1),
(352, 'V0000000352', '2025-11-25 16:41:27', '2025-11-25', 1, '1.01', 1),
(353, 'V0000000353', '2025-11-25 16:41:39', '2025-11-25', 1, '1.01', 1),
(354, 'V0000000354', '2025-11-25 18:04:40', '2025-11-25', 1, '1.01', 1),
(355, 'V0000000355', '2025-11-25 18:14:50', '2025-11-25', 1, '1.01', 1),
(356, 'V0000000356', '2025-11-25 18:31:00', '2025-11-25', 1, '1.01', 1),
(357, 'V0000000357', '2025-11-25 18:31:02', '2025-11-25', 1, '1.01', 1),
(358, 'V0000000358', '2025-11-25 18:31:04', '2025-11-25', 1, '1.01', 1),
(359, 'V0000000359', '2025-11-25 18:41:13', '2025-11-25', 1, '1.01', 1),
(360, 'V0000000360', '2025-11-25 18:41:16', '2025-11-25', 1, '1.01', 1),
(361, 'V0000000361', '2025-11-25 18:41:17', '2025-11-25', 1, '1.01', 1),
(362, 'V0000000362', '2025-11-25 19:11:24', '2025-11-25', 1, '1.01', 1),
(363, 'V0000000363', '2025-11-25 19:25:25', '2025-11-25', 1, '1.01', 1),
(364, 'V0000000364', '2025-11-25 19:25:29', '2025-11-25', 1, '1.01', 1),
(365, 'V0000000365', '2025-11-25 19:39:46', '2025-11-25', 1, '1.01', 1),
(366, 'V0000000366', '2025-11-25 19:39:47', '2025-11-25', 1, '1.01', 1),
(367, 'V0000000367', '2025-11-25 20:37:37', '2025-11-25', 1, '1.01', 1),
(368, 'V0000000368', '2025-11-25 20:37:44', '2025-11-25', 1, '1.01', 1),
(369, 'V0000000369', '2025-11-26 01:34:36', '2025-11-26', 1, '1.01', 1),
(370, 'V0000000370', '2025-11-26 02:08:45', '2025-11-26', 1, '1.01', 1),
(371, 'V0000000371', '2025-11-26 02:15:35', '2025-11-26', 1, '1.01', 1),
(372, 'V0000000372', '2025-11-26 03:46:09', '2025-11-26', 1, '1.01', 1),
(373, 'V0000000373', '2025-11-26 03:59:41', '2025-11-26', 1, '1.01', 1),
(374, 'V0000000374', '2025-11-26 03:59:44', '2025-11-26', 1, '1.01', 1),
(375, 'V0000000375', '2025-11-26 03:59:44', '2025-11-26', 1, '1.01', 1),
(376, 'V0000000376', '2025-11-26 03:59:45', '2025-11-26', 1, '1.01', 1),
(377, 'V0000000377', '2025-11-26 03:59:49', '2025-11-26', 1, '1.01', 1),
(378, 'V0000000378', '2025-11-26 03:59:56', '2025-11-26', 1, '1.01', 1),
(379, 'V0000000379', '2025-11-26 04:57:17', '2025-11-26', 1, '1.01', 1),
(380, 'V0000000380', '2025-11-26 04:57:18', '2025-11-26', 1, '1.01', 1),
(381, 'V0000000381', '2025-11-26 06:09:45', '2025-11-26', 1, '1.01', 1),
(382, 'V0000000382', '2025-11-26 07:01:13', '2025-11-26', 1, '1.01', 1),
(383, 'V0000000383', '2025-11-26 07:49:46', '2025-11-26', 1, '1.01', 1),
(384, 'V0000000384', '2025-11-26 10:46:25', '2025-11-26', 1, '1.01', 1),
(385, 'V0000000385', '2025-11-26 10:46:26', '2025-11-26', 1, '1.01', 1),
(386, 'V0000000386', '2025-11-26 11:18:51', '2025-11-26', 1, '1.01', 1),
(387, 'V0000000387', '2025-11-26 11:18:53', '2025-11-26', 1, '1.01', 1),
(388, 'V0000000388', '2025-11-26 13:09:25', '2025-11-26', 1, '1.01', 1),
(389, 'V0000000389', '2025-11-26 13:28:39', '2025-11-26', 1, '1.01', 1),
(390, 'V0000000390', '2025-11-26 14:31:51', '2025-11-26', 1, '1.01', 1),
(391, 'V0000000391', '2025-11-26 15:22:38', '2025-11-26', 1, '1.01', 1),
(392, 'V0000000392', '2025-11-26 17:53:30', '2025-11-26', 1, '1.01', 1),
(393, 'V0000000393', '2025-11-26 17:53:32', '2025-11-26', 1, '1.01', 1),
(394, 'V0000000394', '2025-11-26 18:54:59', '2025-11-26', 1, '1.01', 1),
(395, 'V0000000395', '2025-11-26 19:25:47', '2025-11-26', 1, '1.01', 1),
(396, 'V0000000396', '2025-11-26 20:27:03', '2025-11-26', 1, '1.01', 1),
(397, 'V0000000397', '2025-11-26 21:29:26', '2025-11-26', 1, '1.01', 1),
(398, 'V0000000398', '2025-11-26 21:29:26', '2025-11-26', 1, '1.01', 1),
(399, 'V0000000399', '2025-11-26 21:29:27', '2025-11-26', 1, '1.01', 1),
(400, 'V0000000400', '2025-11-26 21:29:28', '2025-11-26', 1, '1.01', 1),
(401, 'V0000000401', '2025-11-26 21:40:50', '2025-11-26', 1, '1.01', 1),
(402, 'V0000000402', '2025-11-26 23:34:55', '2025-11-26', 1, '1.01', 1),
(403, 'V0000000403', '2025-11-27 01:11:05', '2025-11-27', 1, '1.01', 1),
(404, 'V0000000404', '2025-11-27 01:43:27', '2025-11-27', 1, '1.01', 1),
(405, 'V0000000405', '2025-11-27 01:43:29', '2025-11-27', 1, '1.01', 1),
(406, 'V0000000406', '2025-11-27 02:12:47', '2025-11-27', 1, '1.01', 1),
(407, 'V0000000407', '2025-11-27 03:40:00', '2025-11-27', 1, '1.01', 1),
(408, 'V0000000408', '2025-11-27 03:40:01', '2025-11-27', 1, '1.01', 1),
(409, 'V0000000409', '2025-11-27 03:40:01', '2025-11-27', 1, '1.01', 1),
(410, 'V0000000410', '2025-11-27 03:56:44', '2025-11-27', 1, '1.01', 1),
(411, 'V0000000411', '2025-11-27 04:55:09', '2025-11-27', 1, '1.01', 1),
(412, 'V0000000412', '2025-11-27 04:55:11', '2025-11-27', 1, '1.01', 1),
(413, 'V0000000413', '2025-11-27 04:55:11', '2025-11-27', 1, '1.01', 1),
(414, 'V0000000414', '2025-11-27 04:55:14', '2025-11-27', 1, '1.01', 1),
(415, 'V0000000415', '2025-11-27 04:55:20', '2025-11-27', 1, '1.01', 1),
(416, 'V0000000416', '2025-11-27 05:01:56', '2025-11-27', 1, '1.01', 1),
(417, 'V0000000417', '2025-11-27 05:56:25', '2025-11-27', 1, '1.01', 1),
(418, 'V0000000418', '2025-11-27 06:17:58', '2025-11-27', 1, '1.01', 1),
(419, 'V0000000419', '2025-11-27 11:29:54', '2025-11-27', 1, '1.01', 1),
(420, 'V0000000420', '2025-11-27 12:03:26', '2025-11-27', 1, '1.01', 1),
(421, 'V0000000421', '2025-11-27 12:09:24', '2025-11-27', 1, '1.01', 1),
(422, 'V0000000422', '2025-11-27 13:01:58', '2025-11-27', 1, '1.01', 1),
(423, 'V0000000423', '2025-11-27 13:16:31', '2025-11-27', 1, '1.01', 1),
(424, 'V0000000424', '2025-11-27 13:44:19', '2025-11-27', 1, '1.01', 1),
(425, 'V0000000425', '2025-11-27 19:46:40', '2025-11-27', 1, '1.01', 1),
(426, 'V0000000426', '2025-11-27 20:03:51', '2025-11-27', 1, '1.01', 1),
(427, 'V0000000427', '2025-11-27 20:27:55', '2025-11-27', 1, '1.01', 1),
(428, 'V0000000428', '2025-11-27 21:09:29', '2025-11-27', 1, '1.01', 1),
(429, 'V0000000429', '2025-11-27 21:25:19', '2025-11-27', 1, '1.01', 1),
(430, 'V0000000430', '2025-11-27 21:25:22', '2025-11-27', 1, '1.01', 1),
(431, 'V0000000431', '2025-11-27 21:32:00', '2025-11-27', 1, '1.01', 1),
(432, 'V0000000432', '2025-11-27 21:44:19', '2025-11-27', 1, '1.01', 1),
(433, 'V0000000433', '2025-11-27 21:44:23', '2025-11-27', 1, '1.01', 1),
(434, 'V0000000434', '2025-11-27 21:54:28', '2025-11-27', 1, '1.01', 1),
(435, 'V0000000435', '2025-11-27 21:54:32', '2025-11-27', 1, '1.01', 1),
(436, 'V0000000436', '2025-11-27 22:13:07', '2025-11-27', 1, '1.01', 1),
(437, 'V0000000437', '2025-11-27 22:26:35', '2025-11-27', 1, '1.01', 1),
(438, 'V0000000438', '2025-11-27 22:43:06', '2025-11-27', 1, '1.01', 1),
(439, 'V0000000439', '2025-11-27 22:43:08', '2025-11-27', 1, '1.01', 1),
(440, 'V0000000440', '2025-11-27 22:49:34', '2025-11-27', 1, '1.01', 1),
(441, 'V0000000441', '2025-11-27 22:59:03', '2025-11-27', 1, '1.01', 1),
(442, 'V0000000442', '2025-11-27 22:59:06', '2025-11-27', 1, '1.01', 1),
(443, 'V0000000443', '2025-11-27 23:12:20', '2025-11-27', 1, '1.01', 1),
(444, 'V0000000444', '2025-11-27 23:12:24', '2025-11-27', 1, '1.01', 1),
(445, 'V0000000445', '2025-11-27 23:12:27', '2025-11-27', 1, '1.01', 1),
(446, 'V0000000446', '2025-11-27 23:21:21', '2025-11-27', 1, '1.01', 1),
(447, 'V0000000447', '2025-11-27 23:21:26', '2025-11-27', 1, '1.01', 1),
(448, 'V0000000448', '2025-11-28 02:07:50', '2025-11-28', 1, '1.01', 1),
(449, 'V0000000449', '2025-11-28 02:07:54', '2025-11-28', 1, '1.01', 1),
(450, 'V0000000450', '2025-11-28 02:32:51', '2025-11-28', 1, '1.01', 1),
(451, 'V0000000451', '2025-11-28 02:32:55', '2025-11-28', 1, '1.01', 1),
(452, 'V0000000452', '2025-11-28 02:32:56', '2025-11-28', 1, '1.01', 1),
(453, 'V0000000453', '2025-11-28 03:10:04', '2025-11-28', 1, '1.01', 1),
(454, 'V0000000454', '2025-11-28 03:10:04', '2025-11-28', 1, '1.01', 1),
(455, 'V0000000455', '2025-11-28 04:26:58', '2025-11-28', 1, '1.01', 1),
(456, 'V0000000456', '2025-11-28 05:40:06', '2025-11-28', 1, '1.01', 1),
(457, 'V0000000457', '2025-11-28 05:46:52', '2025-11-28', 1, '1.01', 1),
(458, 'V0000000458', '2025-11-28 05:46:53', '2025-11-28', 1, '1.01', 1),
(459, 'V0000000459', '2025-11-28 05:58:45', '2025-11-28', 1, '1.01', 1),
(460, 'V0000000460', '2025-11-28 05:58:45', '2025-11-28', 1, '1.01', 1),
(461, 'V0000000461', '2025-11-28 05:58:46', '2025-11-28', 1, '1.01', 1),
(462, 'V0000000462', '2025-11-28 05:58:46', '2025-11-28', 1, '1.01', 1),
(463, 'V0000000463', '2025-11-28 05:58:47', '2025-11-28', 1, '1.01', 1),
(464, 'V0000000464', '2025-11-28 05:59:28', '2025-11-28', 1, '1.01', 1),
(465, 'V0000000465', '2025-11-28 06:26:26', '2025-11-28', 1, '1.01', 1),
(466, 'V0000000466', '2025-11-28 06:50:18', '2025-11-28', 1, '1.01', 1),
(467, 'V0000000467', '2025-11-28 06:50:19', '2025-11-28', 1, '1.01', 1),
(468, 'V0000000468', '2025-11-28 08:09:38', '2025-11-28', 1, '1.01', 1),
(469, 'V0000000469', '2025-11-28 08:30:12', '2025-11-28', 1, '1.01', 1),
(470, 'V0000000470', '2025-11-28 08:30:15', '2025-11-28', 1, '1.01', 1),
(471, 'V0000000471', '2025-11-28 09:33:58', '2025-11-28', 1, '1.01', 1),
(472, 'V0000000472', '2025-11-28 11:55:41', '2025-11-28', 1, '1.01', 1),
(473, 'V0000000473', '2025-11-28 14:27:08', '2025-11-28', 1, '1.01', 1),
(474, 'V0000000474', '2025-11-28 15:00:24', '2025-11-28', 1, '1.01', 1),
(475, 'V0000000475', '2025-11-28 15:49:19', '2025-11-28', 1, '1.01', 1),
(476, 'V0000000476', '2025-11-28 15:49:44', '2025-11-28', 1, '1.01', 1),
(477, 'V0000000477', '2025-11-28 16:38:36', '2025-11-28', 1, '1.01', 1),
(478, 'V0000000478', '2025-11-28 19:15:00', '2025-11-28', 1, '1.01', 1),
(479, 'V0000000479', '2025-11-28 19:39:49', '2025-11-28', 1, '1.01', 1),
(480, 'V0000000480', '2025-11-28 20:14:26', '2025-11-28', 1, '1.01', 1),
(481, 'V0000000481', '2025-11-28 20:59:01', '2025-11-28', 1, '1.01', 1),
(482, 'V0000000482', '2025-11-28 22:50:44', '2025-11-28', 1, '1.01', 1),
(483, 'V0000000483', '2025-11-29 04:07:03', '2025-11-29', 1, '1.01', 1),
(484, 'V0000000484', '2025-11-29 04:07:04', '2025-11-29', 1, '1.01', 1),
(485, 'V0000000485', '2025-11-29 04:07:05', '2025-11-29', 1, '1.01', 1),
(486, 'V0000000486', '2025-11-29 04:07:11', '2025-11-29', 1, '1.01', 1),
(487, 'V0000000487', '2025-11-29 05:16:49', '2025-11-29', 1, '1.01', 1),
(488, 'V0000000488', '2025-11-29 05:30:55', '2025-11-29', 1, '1.01', 1),
(489, 'V0000000489', '2025-11-29 06:01:26', '2025-11-29', 1, '1.01', 1),
(490, 'V0000000490', '2025-11-29 06:24:48', '2025-11-29', 1, '1.01', 1),
(491, 'V0000000491', '2025-11-29 06:27:34', '2025-11-29', 1, '1.01', 1),
(492, 'V0000000492', '2025-11-29 06:53:00', '2025-11-29', 1, '1.01', 1),
(493, 'V0000000493', '2025-11-29 06:58:59', '2025-11-29', 1, '1.01', 1),
(494, 'V0000000494', '2025-11-29 06:59:00', '2025-11-29', 1, '1.01', 1),
(495, 'V0000000495', '2025-11-29 06:59:01', '2025-11-29', 1, '1.01', 1),
(496, 'V0000000496', '2025-11-29 06:59:05', '2025-11-29', 1, '1.01', 1),
(497, 'V0000000497', '2025-11-29 06:59:10', '2025-11-29', 1, '1.01', 1),
(498, 'V0000000498', '2025-11-29 06:59:39', '2025-11-29', 1, '1.01', 1),
(499, 'V0000000499', '2025-11-29 07:12:19', '2025-11-29', 1, '1.01', 1),
(500, 'V0000000500', '2025-11-29 09:03:29', '2025-11-29', 1, '1.01', 1),
(501, 'V0000000501', '2025-11-29 09:03:50', '2025-11-29', 1, '1.01', 1),
(502, 'V0000000502', '2025-11-29 09:03:52', '2025-11-29', 1, '1.01', 1),
(503, 'V0000000503', '2025-11-29 09:49:22', '2025-11-29', 1, '1.01', 1),
(504, 'V0000000504', '2025-11-29 10:22:30', '2025-11-29', 1, '1.01', 1),
(505, 'V0000000505', '2025-11-29 11:13:36', '2025-11-29', 1, '1.01', 1),
(506, 'V0000000506', '2025-11-29 12:33:33', '2025-11-29', 1, '1.01', 1),
(507, 'V0000000507', '2025-11-29 13:25:42', '2025-11-29', 1, '1.01', 1),
(508, 'V0000000508', '2025-11-29 13:55:09', '2025-11-29', 1, '1.01', 1),
(509, 'V0000000509', '2025-11-29 14:58:35', '2025-11-29', 1, '1.01', 1),
(510, 'V0000000510', '2025-11-29 15:59:36', '2025-11-29', 1, '1.01', 1),
(511, 'V0000000511', '2025-11-29 18:54:30', '2025-11-29', 1, '1.01', 1),
(512, 'V0000000512', '2025-11-29 18:58:42', '2025-11-29', 1, '1.01', 1),
(513, 'V0000000513', '2025-11-29 19:35:53', '2025-11-29', 1, '1.01', 1),
(514, 'V0000000514', '2025-11-29 19:50:21', '2025-11-29', 1, '1.01', 1),
(515, 'V0000000515', '2025-11-29 19:50:22', '2025-11-29', 1, '1.01', 1),
(516, 'V0000000516', '2025-11-29 19:56:17', '2025-11-29', 1, '1.01', 1),
(517, 'V0000000517', '2025-11-29 21:29:10', '2025-11-29', 1, '1.01', 1),
(518, 'V0000000518', '2025-11-29 21:29:11', '2025-11-29', 1, '1.01', 1),
(519, 'V0000000519', '2025-11-29 21:36:28', '2025-11-29', 1, '1.01', 1),
(520, 'V0000000520', '2025-11-30 00:21:57', '2025-11-30', 1, '1.01', 1),
(521, 'V0000000521', '2025-11-30 01:45:21', '2025-11-30', 1, '1.01', 1),
(522, 'V0000000522', '2025-11-30 02:43:28', '2025-11-30', 1, '1.01', 1),
(523, 'V0000000523', '2025-11-30 02:51:32', '2025-11-30', 1, '1.01', 1),
(524, 'V0000000524', '2025-11-30 03:05:05', '2025-11-30', 1, '1.01', 1),
(525, 'V0000000525', '2025-11-30 03:05:07', '2025-11-30', 1, '1.01', 1),
(526, 'V0000000526', '2025-11-30 05:58:31', '2025-11-30', 1, '1.01', 1),
(527, 'V0000000527', '2025-11-30 06:11:45', '2025-11-30', 1, '1.01', 1),
(528, 'V0000000528', '2025-11-30 06:36:12', '2025-11-30', 1, '1.01', 1),
(529, 'V0000000529', '2025-11-30 07:51:28', '2025-11-30', 1, '1.01', 1),
(530, 'V0000000530', '2025-11-30 07:59:18', '2025-11-30', 1, '1.01', 1),
(531, 'V0000000531', '2025-11-30 07:59:19', '2025-11-30', 1, '1.01', 1),
(532, 'V0000000532', '2025-11-30 07:59:22', '2025-11-30', 1, '1.01', 1),
(533, 'V0000000533', '2025-11-30 07:59:24', '2025-11-30', 1, '1.01', 1),
(534, 'V0000000534', '2025-11-30 07:59:25', '2025-11-30', 1, '1.01', 1),
(535, 'V0000000535', '2025-11-30 08:00:47', '2025-11-30', 1, '1.01', 1),
(536, 'V0000000536', '2025-11-30 08:31:29', '2025-11-30', 1, '1.01', 1),
(537, 'V0000000537', '2025-11-30 08:32:52', '2025-11-30', 1, '1.01', 1),
(538, 'V0000000538', '2025-11-30 09:26:20', '2025-11-30', 1, '1.01', 1),
(539, 'V0000000539', '2025-11-30 13:12:10', '2025-11-30', 1, '1.01', 1),
(540, 'V0000000540', '2025-11-30 13:13:25', '2025-11-30', 1, '1.01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aux_iconos_agrups`
--
ALTER TABLE `aux_iconos_agrups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aux_lugares`
--
ALTER TABLE `aux_lugares`
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
-- Indexes for table `cartas_personajes`
--
ALTER TABLE `cartas_personajes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encabezadoexperiencia` (`encab_id`);

--
-- Indexes for table `cont_3carrusel`
--
ALTER TABLE `cont_3carrusel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arrouselContenido` (`contenido_id`);

--
-- Indexes for table `cont_ediciones`
--
ALTER TABLE `cont_ediciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encabezadoCarta` (`contenido_id`) USING BTREE;

--
-- Indexes for table `encab_1original`
--
ALTER TABLE `encab_1original`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  ADD KEY `cartasEncabezado_statusRegistro` (`statusRegistro_id`) USING BTREE,
  ADD KEY `cartasEncabezado_usuario` (`creadoPor_id`) USING BTREE;

--
-- Indexes for table `encab_2edicion`
--
ALTER TABLE `encab_2edicion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartasEncabezado_desdePersonaje` (`nombreDesde_id`) USING BTREE,
  ADD KEY `cartasEncabezado_haciaPersonaje` (`nombreHacia_id`) USING BTREE,
  ADD KEY `cartasEncabezado_idioma` (`idioma_id`) USING BTREE,
  ADD KEY `cartasEncabezado_lugar` (`lugar_id`) USING BTREE,
  ADD KEY `cartasEncabezado_usuario` (`editadoPor_id`) USING BTREE,
  ADD KEY `edic_exper` (`encab_id`),
  ADD KEY `edic_sinindice` (`sinIndice_id`);

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
  ADD KEY `nivel2_1` (`seccion_id`),
  ADD KEY `temas_capturadoPor` (`capturadoPor_id`);

--
-- Indexes for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `nivel3_2` (`tema_id`),
  ADD KEY `pestanas_capturadoPor` (`capturadoPor_id`);

--
-- Indexes for table `nivel_indices`
--
ALTER TABLE `nivel_indices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indice_tema` (`tema_id`);

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
  ADD KEY `rol_usuario_id` (`rol_id`) USING BTREE,
  ADD KEY `status_registro_id` (`statusRegistro_id`) USING BTREE,
  ADD KEY `us_usuarios_pais` (`pais_id`);

--
-- Indexes for table `us_visitas`
--
ALTER TABLE `us_visitas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cliente_id` (`cliente_id`),
  ADD KEY `rolUsuario_id` (`rol_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aux_iconos_agrups`
--
ALTER TABLE `aux_iconos_agrups`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `aux_lugares`
--
ALTER TABLE `aux_lugares`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `aux_novs_del_sitio`
--
ALTER TABLE `aux_novs_del_sitio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `cartas_personajes`
--
ALTER TABLE `cartas_personajes`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `cont_3carrusel`
--
ALTER TABLE `cont_3carrusel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cont_ediciones`
--
ALTER TABLE `cont_ediciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encab_1original`
--
ALTER TABLE `encab_1original`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `encab_2edicion`
--
ALTER TABLE `encab_2edicion`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `nivel_indices`
--
ALTER TABLE `nivel_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `us_roles`
--
ALTER TABLE `us_roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `us_status_registros`
--
ALTER TABLE `us_status_registros`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `us_usuarios`
--
ALTER TABLE `us_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `us_visitas`
--
ALTER TABLE `us_visitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cont_2contenidos`
--
ALTER TABLE `cont_2contenidos`
  ADD CONSTRAINT `encabezadoexperiencia` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`);

--
-- Constraints for table `cont_3carrusel`
--
ALTER TABLE `cont_3carrusel`
  ADD CONSTRAINT `arrouselContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`);

--
-- Constraints for table `cont_ediciones`
--
ALTER TABLE `cont_ediciones`
  ADD CONSTRAINT `edicionesContenido` FOREIGN KEY (`contenido_id`) REFERENCES `cont_2contenidos` (`id`);

--
-- Constraints for table `encab_1original`
--
ALTER TABLE `encab_1original`
  ADD CONSTRAINT `cartasEncabezado_lugar_copy` FOREIGN KEY (`lugar_id`) REFERENCES `aux_lugares` (`id`),
  ADD CONSTRAINT `cartasEncabezado_statusRegistro_copy` FOREIGN KEY (`statusRegistro_id`) REFERENCES `aux_status_registros` (`id`),
  ADD CONSTRAINT `cartasEncabezado_usuario_copy` FOREIGN KEY (`creadoPor_id`) REFERENCES `us_usuarios` (`id`);

--
-- Constraints for table `encab_2edicion`
--
ALTER TABLE `encab_2edicion`
  ADD CONSTRAINT `edic_editadopor` FOREIGN KEY (`editadoPor_id`) REFERENCES `us_usuarios` (`id`),
  ADD CONSTRAINT `edic_exper` FOREIGN KEY (`encab_id`) REFERENCES `encab_1original` (`id`);

--
-- Constraints for table `nivel2_temas`
--
ALTER TABLE `nivel2_temas`
  ADD CONSTRAINT `nivel2_1` FOREIGN KEY (`seccion_id`) REFERENCES `nivel1_secciones` (`id`),
  ADD CONSTRAINT `temas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`);

--
-- Constraints for table `nivel3_pestanas`
--
ALTER TABLE `nivel3_pestanas`
  ADD CONSTRAINT `nivel3_2` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`),
  ADD CONSTRAINT `pestanas_capturadoPor` FOREIGN KEY (`capturadoPor_id`) REFERENCES `us_usuarios` (`id`);

--
-- Constraints for table `nivel_indices`
--
ALTER TABLE `nivel_indices`
  ADD CONSTRAINT `indice_tema` FOREIGN KEY (`tema_id`) REFERENCES `nivel2_temas` (`id`);

--
-- Constraints for table `us_usuarios`
--
ALTER TABLE `us_usuarios`
  ADD CONSTRAINT `us_usuarios_pais` FOREIGN KEY (`pais_id`) REFERENCES `aux_paises` (`id`),
  ADD CONSTRAINT `us_usuarios_roles` FOREIGN KEY (`rol_id`) REFERENCES `us_roles` (`id`),
  ADD CONSTRAINT `us_usuarios_statusRegistro` FOREIGN KEY (`statusRegistro_id`) REFERENCES `us_status_registros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
