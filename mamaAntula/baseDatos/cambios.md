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

RENAME TABLE ma_bd.aux_lugares TO ma_bd.cont_lugares;
DELETE FROM cont_lugares WHERE id=1;
DELETE FROM cont_lugares WHERE id=9;
DELETE FROM cont_lugares WHERE id=10;
DELETE FROM cont_lugares WHERE id=11;
DELETE FROM cont_lugares WHERE id=13;
DELETE FROM cont_lugares WHERE id=14;
DELETE FROM cont_lugares WHERE id=15;
DELETE FROM cont_lugares WHERE id=16;
DELETE FROM cont_lugares WHERE id=17;
DELETE FROM cont_lugares WHERE id=18;