show databases;
CREATE DATABASE People DEFAULT CHARACTER SET utf8;

-- 1 row(s) affected, 1 warning(s): 3719 'utf8' is currently an alias for 
-- the character set UTF8MB3, but will be an alias for UTF8MB4 in a future 
-- release. Please consider using UTF8MB4 in order to be unambiguous.

use People;

CREATE TABLE Users(
	name VARCHAR(128),
    email VARCHAR(128)
);

describe Users;

INSERT INTO Users (name, email) VALUES ('Chuck', 'csev@umich.edu');
SELECT * FROM Users;
INSERT INTO Users (name, email) VALUES ('Sally', 'saly@umich.edu');
INSERT INTO Users (name, email) VALUES ('Somesh', 'somesh@umich.edu');
INSERT INTO Users (name, email) VALUES ('Caitlin', 'cait@umich.edu');
INSERT INTO Users (name, email) VALUES ('Ted', 'ted@umich.edu');

DELETE FROM Users WHERE name='Ted';

-- Error Code: 1175. You are using safe update mode and you tried to update 
-- a table without a WHERE that uses a KEY column.  To disable safe mode, 
-- toggle the option in Preferences -> SQL Editor and reconnect.

UPDATE Users SET name='Charles' WHERE email='csev@umich.edu';

-- Error Code: 1175. You are using safe update mode and you tried to update 
-- a table without a WHERE that uses a KEY column.  To disable safe mode, 
-- toggle the option in Preferences -> SQL Editor and reconnect.

SELECT * FROM Users ORDER BY email;
SELECT * FROM Users WHERE name LIKE '%e%';
SELECT count(*) FROM Users;
SELECT count(*) FROM Users WHERE name LIKE '%e%';

ALTER TABLE Users ADD user_id INT UNSIGNED NOT NULL AUTO_INCREMENT;

DROP TABLE Users;

CREATE TABLE Users(
	user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(128),
    email VARCHAR(128),
    PRIMARY KEY(user_id)
);
SELECT * FROM Users;
INSERT INTO Users (name, email) VALUES ('Chuck', 'csev@umich.edu');
INSERT INTO Users (name, email) VALUES ('Sally', 'saly@umich.edu');
INSERT INTO Users (name, email) VALUES ('Somesh', 'somesh@umich.edu');
INSERT INTO Users (name, email) VALUES ('Caitlin', 'cait@umich.edu');
INSERT INTO Users (name, email) VALUES ('Ted', 'ted@umich.edu');

-- To alter a table
-- ALTER TABLE Users ADD INDEX(email);

CREATE TABLE Ages(
	name VARCHAR(128),
    age INT
);

DELETE FROM Ages;
INSERT INTO Ages (name, age) VALUES ('Zahra', 34);
INSERT INTO Ages (name, age) VALUES ('Olufunke', 23);
INSERT INTO Ages (name, age) VALUES ('Choire', 38);
INSERT INTO Ages (name, age) VALUES ('Makenna', 32);
INSERT INTO Ages (name, age) VALUES ('Ula', 16);
INSERT INTO Ages (name, age) VALUES ('Garren', 40);
SELECT * FROM Ages;
SELECT sha1(CONCAT(name,age)) AS X FROM Ages ORDER BY X;

DROP TABLE Ages;

CREATE TABLE Ages(
	name VARCHAR(128),
    age INTEGER
);

INSERT INTO Ages (name, age) VALUES ('Linton', 30);
INSERT INTO Ages (name, age) VALUES ('Muhamadjavad', 19);
INSERT INTO Ages (name, age) VALUES ('Kayda', 19);
INSERT INTO Ages (name, age) VALUES ('Cal', 15);

SELECT sha1(CONCAT(name,age)) AS X FROM Ages ORDER BY X;