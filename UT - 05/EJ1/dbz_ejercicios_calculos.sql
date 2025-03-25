DROP DATABASE IF EXISTS DBZ_Ejercicio_Calculos;
CREATE DATABASE DBZ_Ejercicio_Calculos;
USE DBZ_Ejercicio_Calculos;

CREATE TABLE Guerreros(
    id_guerrero INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    raza VARCHAR(20),
    nivel_poder INT,
    cantidad_transformaciones INT,
    PRIMARY KEY (id_guerrero)
);

-- Insertar datos en la tabla
INSERT INTO Guerreros(nombre, raza, nivel_poder, cantidad_transformaciones)VALUES
    ('Goku', 'Saiyan', 9500, 6),
    ('Vegeta', 'Saiyan', 9200, 4),
    ('Gohan', 'Saiyan', 8700, 4),
    ('Piccolo', 'Namekiano', 7500, 1),
    ('Trunks', 'Saiyan', 8600, 2),
    ('Freezer', 'Emperador del Mal', 9400, 5),
    ('Cell', 'Bio-Androide', 9100, 3),
    ('Majin Buu', 'Majin', 9300, 3),
    ('Goten', 'Saiyan', 8200, 1),
    ('Krilin', 'Humano', 4000, 0);

SELECT * FROM Guerreros;


-- Mostrar el nombre y el nivel de poder de aquellos con nivel de poder > 9000
SELECT nombre, nivel_poder
FROM Guerreros
WHERE nivel_poder > 9000;


-- Mostrar el nombre y la cantidad de transformaciones de aquellos con 3 o más transformaciones
SELECT nombre, cantidad_transformaciones
FROM Guerreros
WHERE cantidad_transformaciones <= 3;

-- Calculamos según las transformaciones el poder total
SELECT nombre, nivel_poder * cantidad_transformaciones as poder_total
FROM Guerreros;


-- Añadimos una columna estado_transformacion que el contenido depende de la cantidad de transformaciones
SELECT nombre, nivel_poder, cantidad_transformaciones, 
        IF(cantidad_transformaciones > 0 AND raza = 'Saiyan', '¡Super Saiyan!', 'Sin Transformaciones') AS estado_transformacion
FROM Guerreros;


-- Ahora utilizamos case when, añadimos a piccolo como orange y a freezer como black
SELECT nombre, nivel_poder, cantidad_transformaciones,
       CASE 
           WHEN nombre = 'Piccolo' THEN 'Orange_Piccolo'
           WHEN nombre = 'Freezer' THEN 'Black_Freezer'
           WHEN cantidad_transformaciones > 0 AND raza = 'Saiyan' THEN '¡Super Saiyan!'
           ELSE 'Sin Transformaciones'
       END AS estado_transformacion
FROM Guerreros;
