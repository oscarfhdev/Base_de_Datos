DROP DATABASE IF EXISTS CaballerosDelZodiaco;
CREATE DATABASE CaballerosDelZodiaco;
USE CaballerosDelZodiaco;

CREATE TABLE Constelaciones(
    ID INT NOT NULL,
    Nombre VARCHAR(20),
    Descripcion VARCHAR(250),
    PRIMARY KEY (ID)
);



CREATE TABLE CaballerosdelZodiaco(
    ID INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    SignoZodiacal VARCHAR(50),
    ConstelacionID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ConstelacionID) REFERENCES Constelaciones(ID)
);



INSERT INTO Constelaciones(ID, Nombre, Descripcion) VALUES
    (1, 'Osa Menor', 'la constelacion más famosa'),
    (2, 'Osa Mayor', 'una de las constelacion más famosa'),
    (3, 'Andrómeda', 'una muy lejana'),
    (4, 'Canis Major', 'la mas brillante'),
    (5, 'Lyra', 'un cuadrado asimétrico');

SELECT * FROM Constelaciones;



INSERT INTO  CaballerosdelZodiaco(ID, Nombre, SignoZodiacal, ConstelacionID) VALUES
    (1, 'Javi', 'Aries', 5),
    (2, 'Óscar', 'Tauro', 4),
    (3, 'Adrián', 'Géminis', 2),
    (4, 'Anás', 'Cáncer', 3),
    (5, 'Carmen', 'Capricornio', 1);

SELECT * FROM CaballerosdelZodiaco;

ALTER TABLE CaballerosdelZodiaco
RENAME COLUMN SignoZodiacal TO Zodiaco,
ADD Estrella_Principal VARCHAR(50);
RENAME TABLE CaballerosdelZodiaco TO Caballeros;

ALTER TABLE Constelaciones
MODIFY COLUMN Nombre VARCHAR(20) NOT NULL;

UPDATE Constelaciones
SET Descripcion = 'Andrómeda es una constelación del hemisferio norte, cerca del Polo Norte Celeste, conocida por su vínculo con la mitología griega y la galaxia de Andrómeda (M31), una de las más grandes y brillantes observables desde la Tierra.'
WHERE Nombre = 'Andrómeda';

SELECT * FROM Constelaciones;

SELECT * FROM Caballeros;
