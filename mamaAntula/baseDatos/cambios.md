ALTER TABLE ma_bd.encab_1original DROP FOREIGN KEY encabezado_lugar;

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
