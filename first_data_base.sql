show databases;
use first_db;

-- Tabla no auto incremental
CREATE TABLE animals (
	id int,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY (id)
);

-- INSERT INTO animals (tipo, estado) VALUES ('sheep', 'scamed');

ALTER TABLE animals MODIFY COLUMN id int auto_increment;

SHOW CREATE TABLE animals;

-- Tabla sí auto incremental
CREATE TABLE `animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO animals (tipo, estado) VALUES ('sheep', 'scamed');
INSERT INTO animals (tipo, estado) VALUES ('dog', 'guardian');
INSERT INTO animals (tipo, estado) VALUES ('pig', 'lust');

SELECT * FROM animals;
SELECT * FROM animals WHERE id = 5;
SELECT * FROM animals WHERE estado = 'scamed';

UPDATE animals SET estado = 'lux' WHERE id = 5;

DELETE FROM animals WHERE estado = 'scamed';

-- Error Code: 1175. You are using safe update mode and you tried to update
-- a table without a WHERE that uses a KEY column.  To disable safe mode, 
-- toggle the option in Preferences -> SQL Editor and reconnect.

DELETE FROM animals WHERE id = 2;

SELECT * FROM animals;
UPDATE animals SET estado = 'scammed' WHERE id = 3;
