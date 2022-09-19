show databases;
CREATE DATABASE Musik DEFAULT CHARACTER SET utf8;

use Musik;

CREATE TABLE Artist(
	artist_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (artist_id)
) ENGINE = InnoDB;

CREATE TABLE Album(
	album_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    artist_id INTEGER,
    
    PRIMARY KEY (album_id),
    INDEX USING BTREE (title),
    
    CONSTRAINT FOREIGN KEY (artist_id)
		REFERENCES Artist (artist_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Genre(
	genre_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (genre_id)
) ENGINE = InnoDB;

CREATE TABLE Track(
	track_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    
    album_id INTEGER,
    genre_id INTEGER,
    
    PRIMARY KEY (track_id),
    INDEX USING BTREE (title),
    
    CONSTRAINT FOREIGN KEY (album_id)
		REFERENCES Album (album_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (genre_id)
		REFERENCES Genre (genre_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO Artist (name) VALUES ('Caifanes');
INSERT INTO Artist (name) VALUES ('Rainbow');
INSERT INTO Artist (name) VALUES ('Kendrick Lamar');

INSERT INTO Genre (name) VALUES ('Rock');
INSERT INTO Genre (name) VALUES ('Rap');


-- Show all information inside Track table
SELECT * FROM Track;

INSERT INTO Album (title, artist_id) VALUES ('DAMN', 3);
INSERT INTO Album (title, artist_id) VALUES ('Rising', 2);
INSERT INTO Album (title, artist_id) VALUES ('Matenme Porque Me Muero', 1);
INSERT INTO Album (title, artist_id) VALUES ('Long Live Rock n Roll', 2);
INSERT INTO Album (title, artist_id) VALUES ('El Silencio', 1);

INSERT INTO Track (title, album_id, genre_id) VALUES
	('Perdi Mi Ojo de Venado', 3, 1), ('Amanece', 3, 1), 
    ('Nada', 3, 1), ('Viento', 3, 1),
    ('Blood', 1, 2), ('Fear', 1, 2), ('Pride', 1, 2), ('XXX', 1, 2),
    ('Tarot Woman', 2, 1), ('Starstruck', 2, 1), ('Stargazer',2, 1), 
    ('A Light in the Black', 2, 1),
    ('Nubes', 5, 1), ('Piedra', 5, 1), ('Miercoles De Ceniza', 5, 1), 
    ('Mariquita', 5, 1),
    ('Gates of Babylon', 4, 1), ('Kill The King', 4, 1), 
    ('Lady of The Lake', 4, 1), ('Rainbow Eyes', 4, 1);

-- Show all information of each song ordered ascending ordering respect to album
SELECT T.title, Al.title, Ar.name, G.name 
	FROM Artist Ar JOIN Track T JOIN Album Al JOIN Genre G ON
	G.genre_id = T.genre_id AND Ar.artist_id = Al.artist_id 
    AND Al.album_id = T.album_id ORDER BY Al.title ASC;

-- Show all genres related to a particular artist
SELECT DISTINCT Ar.name, G.name  
	FROM Artist Ar JOIN Genre G JOIN Album Al JOIN Track T
    ON G.genre_id = T.genre_id AND Ar.artist_id = Al.artist_id 
    AND Al.album_id = T.album_id WHERE Ar.artist_id = 3;