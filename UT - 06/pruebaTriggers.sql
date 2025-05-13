DROP DATABASE IF EXISTS pruebaTriggers;
CREATE DATABASE IF NOT EXISTS pruebaTriggers;
USE pruebaTriggers;

CREATE TABLE people (age INT, name VARCHAR(150));

DELIMITER //
CREATE TRIGGER agecheck 
BEFORE INSERT ON people 
FOR EACH ROW 
IF NEW.age < 0 THEN 
    SET NEW.age = 0; 
END IF;
//

DELIMITER ;

INSERT INTO people VALUES (-20, 'Sid'), (30, 'Josh');

SELECT * FROM people;
