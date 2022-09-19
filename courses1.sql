show databases;
CREATE DATABASE Courses;
use Courses;

CREATE TABLE Account (
	account_id INTEGER NOT NULL AUTO_INCREMENT,
    email VARCHAR(255),
    name VARCHAR(255),
    
    PRIMARY KEY (account_id)
) ENGINE = InnoDB;

CREATE TABLE Course(
	course_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    
    PRIMARY KEY (course_id)
) ENGINE = InnoDB;

CREATE TABLE Member(
	account_id INTEGER,
    course_id INTEGER,
    role INTEGER,
    
    CONSTRAINT FOREIGN KEY (account_id) REFERENCES Account (account_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    
    PRIMARY KEY (account_id, course_id)
) ENGINE = InnoDB;

INSERT INTO Account (name, email) VALUES ('Jane','jane@tsugi.org');
INSERT INTO Account (name, email) VALUES ('Ed','ed@tsugi.org');
INSERT INTO Account (name, email) VALUES ('Sue','sue@tsugi.org');

INSERT INTO Course (title) VALUES ('Python');
INSERT INTO Course (title) VALUES ('SQL');
INSERT INTO Course (title) VALUES ('PHP');

SELECT * FROM Member;

INSERT INTO Member (account_id, course_id, role) VALUES 
	(1,1,1), (2,1,0), (3,1,0), 
    (1,2,0), (2,2,1),
    (2,3,1), (3,3,0);

-- Show explicit information of Members
SELECT A.name, M.role, C.title FROM Account A JOIN Member M JOIN Course C ON
	A.account_id = M.account_id AND C.course_id = M.course_id 
    ORDER BY C.title ASC;