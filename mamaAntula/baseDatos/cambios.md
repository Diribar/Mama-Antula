ALTER TABLE ma_bd.encab_1original DROP FOREIGN KEY encabezado_lugar;
ALTER TABLE ma_bd.encab_2edicion DROP FOREIGN KEY edicion_lugar;

<!-- Lugares Carta -->
CREATE TABLE ma_bd.cartas_lugares (
	id tinyint(1) unsigned auto_increment NOT NULL,
	nombre varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='';
INSERT INTO cartas_lugares (id, nombre) VALUES(1, 'Córdoba');
INSERT INTO cartas_lugares (id, nombre) VALUES(9, 'Roma, Italia');
INSERT INTO cartas_lugares (id, nombre) VALUES(10, 'Buenos Aires');
INSERT INTO cartas_lugares (id, nombre) VALUES(11, 'Poloch, Rusia');
INSERT INTO cartas_lugares (id, nombre) VALUES(13, 'Tucumán');
INSERT INTO cartas_lugares (id, nombre) VALUES(14, 'Ravenna, Italia');
INSERT INTO cartas_lugares (id, nombre) VALUES(15, 'Colonia, Uruguay');
INSERT INTO cartas_lugares (id, nombre) VALUES(16, 'Faenza, Italia');
INSERT INTO cartas_lugares (id, nombre) VALUES(17, 'Madrid, España');
INSERT INTO cartas_lugares (id, nombre) VALUES(18, 'San Isidro');

<!-- Lugares Experiencias -->
RENAME TABLE ma_bd.aux_lugares TO ma_bd.cont_lugares;
DELETE FROM ma_bd.cont_lugares WHERE expers = 0;
ALTER TABLE ma_bd.cont_lugares DROP COLUMN cartas;
ALTER TABLE ma_bd.cont_lugares DROP COLUMN expers;

<!-- Encabezados -->
ALTER TABLE ma_bd.encab_1original CHANGE lugar_id lugarCarta_id tinyint(1) unsigned DEFAULT NULL NULL;
ALTER TABLE ma_bd.encab_1original ADD lugarExper_id tinyint(1) unsigned DEFAULT NULL NULL;
ALTER TABLE ma_bd.encab_1original CHANGE lugarExper_id lugarExper_id tinyint(1) unsigned DEFAULT NULL NULL AFTER lugarCarta_id;
UPDATE ma_bd.encab_1original SET lugarExper_id = lugarCarta_id, lugarCarta_id = NULL WHERE tema_id <> 10;
ALTER TABLE ma_bd.encab_1original ADD CONSTRAINT encabezado_lugarCarta FOREIGN KEY (lugarCarta_id) REFERENCES ma_bd.cartas_lugares(id);
ALTER TABLE ma_bd.encab_1original ADD CONSTRAINT encabezado_lugarExper FOREIGN KEY (lugarExper_id) REFERENCES ma_bd.cont_lugares(id);

<!-- Edición -->
ALTER TABLE ma_bd.encab_2edicion CHANGE lugar_id lugarCarta_id tinyint(1) unsigned DEFAULT NULL NULL;
ALTER TABLE ma_bd.encab_2edicion ADD lugarExper_id tinyint(1) unsigned DEFAULT NULL NULL;
ALTER TABLE ma_bd.encab_2edicion CHANGE lugarExper_id lugarExper_id tinyint(1) unsigned DEFAULT NULL NULL AFTER lugarCarta_id;
ALTER TABLE ma_bd.encab_2edicion ADD CONSTRAINT edicion_lugarCarta FOREIGN KEY (lugarCarta_id) REFERENCES ma_bd.cartas_lugares(id);
ALTER TABLE ma_bd.encab_2edicion ADD CONSTRAINT edicion_lugarExper FOREIGN KEY (lugarExper_id) REFERENCES ma_bd.cont_lugares(id);

<!-- Indices lugar -->
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Introducción', orden = '1' WHERE id = 1;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'CABA', orden = '2' WHERE id = 2;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'GBA', orden = '3' WHERE id = 3;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Buenos Aires', orden = NULL WHERE id = 4;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Córdoba', orden = NULL WHERE id = 5;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Santa Fe', orden = NULL WHERE id = 6;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Santiago del Estero', orden = NULL WHERE id = 7;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Salta', orden = NULL WHERE id = 8;
UPDATE ma_bd.nivel9_indices_lugar SET tema_id = 17, nombre = 'Jujuy', orden = NULL WHERE id = 9;
ALTER TABLE ma_bd.nivel9_indices_lugar MODIFY COLUMN orden tinyint(1) unsigned DEFAULT NULL NULL;
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Catamarca');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Chaco');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Chubut');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Corrientes');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Entre Ríos');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Formosa');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'La Pampa');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'La Rioja');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Mendoza');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Misiones');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Neuquén');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Río Negro');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'San Juan');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'San Luis');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Santa Cruz');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Tierra del Fuego');
INSERT INTO ma_bd.nivel9_indices_lugar (tema_id, nombre) VALUES (17, 'Tucumán');
RENAME TABLE ma_bd.nivel9_indices_lugar TO ma_bd.nivel9_indices_advoc;
