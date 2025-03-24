DROP DATABASE IF EXISTS guerreros_z;
CREATE DATABASE IF NOT EXISTS guerreros_z;
USE guerreros_z;


CREATE TABLE IF NOT EXISTS guerreros_z(
    id_guerrero INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    nivel_poder INT NOT NULL,
    PRIMARY KEY (id_guerrero)
);

INSERT INTO guerreros_z (nombre, raza, nivel_poder) VALUES
    ('Goku', 'Saiyan', 9500),
    ('Vegeta', 'Saiyan', 9200),
    ('Gohan', 'Saiyan-mestizo', 8700),
    ('Piccolo', 'Namek', 7500),
    ('Krilin', 'Humano', 4000);

SELECT * FROM guerreros_z;

SELECT nombre, nivel_poder
FROM guerreros_z
WHERE nivel_poder > 9000;


SELECT nombre, raza
FROM guerreros_z
WHERE raza IN ('Saiyan', 'Humano');

