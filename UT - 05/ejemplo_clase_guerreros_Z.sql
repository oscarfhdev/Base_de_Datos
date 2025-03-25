DROP DATABASE IF EXISTS guerreros_z;
CREATE DATABASE IF NOT EXISTS guerreros_z;
USE guerreros_z;


CREATE TABLE IF NOT EXISTS guerreros_z(
    id_guerrero INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    nivel_poder INT,
    PRIMARY KEY (id_guerrero)
);

INSERT INTO guerreros_z (nombre, raza, nivel_poder) VALUES
    ('Goku', 'Saiyan', 9500),
    ('Vegeta', 'Saiyan', 9200),
    ('Gohan', 'Saiyan-mestizo', 8700),
    ('Piccolo', 'Namek', 7500),
    ('Krilin', 'Humano', 4000),
    ('Yamcha', 'Humano', NULL);

SELECT * FROM guerreros_z;

SELECT nombre, nivel_poder
FROM guerreros_z
WHERE nivel_poder > 9000;


SELECT nombre, raza
FROM guerreros_z
WHERE raza IN ('Saiyan', 'Humano');

SELECT COUNT(*)
FROM guerreros_z;

SELECT nombre, nivel_poder
FROM guerreros_z
WHERE nivel_poder = (
SELECT MAX(nivel_poder)
FROM guerreros_z
);

SELECT RAZA, AVG(NIVEL_PODER) AS poder_maximo
FROM GUERRERO
GROUP BY RAZA;

SELECT raza, AVG(nivel_poder) AS poder_medio
FROM guerreros_z
GROUP BY raza
HAVING AVG(nivel_poder) > 8000;

SELECT raza, COUNT(*) AS cantidad
FROM guerreros_z
GROUP BY raza;

SELECT raza, COUNT(*) AS total
FROM guerreros_z
GROUP BY raza
HAVING COUNT(*) >= 2;

SELECT nombre, nivel_poder
FROM guerreros_z
ORDER BY nivel_poder DESC;
