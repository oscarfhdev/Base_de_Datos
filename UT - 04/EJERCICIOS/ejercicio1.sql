DROP DATABASE IF EXISTS TorneosDragonBall; -- Eliminamos la base de datos si existe
CREATE DATABASE IF NOT EXISTS TorneosDragonBall; -- Crea la BBDD si no existe
USE TorneosDragonBall; -- Usamos la base de datos


CREATE TABLE IF NOT EXISTS Torneos(
    id_torneo INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    PRIMARY KEY (id_torneo)
);

CREATE TABLE IF NOT EXISTS Participantes(
    id_participante INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad>18 AND edad<150) NOT NULL,
    raza VARCHAR(30) NOT NULL,
    id_torneo INT,
    PRIMARY KEY (id_participante),
    FOREIGN KEY (id_torneo) REFERENCES Torneos(id_torneo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SHOW TABLES;

INSERT INTO Torneos (nombre, ubicacion, fecha_inicio, fecha_fin) VALUES 
('Torneo de las Artes Marciales', 'Isla Papaya', '2025-06-10', '2025-06-15'),
('Torneo del Poder', 'Mundo del Vacío', '2025-07-20', NULL),
('Torneo Intergaláctico', 'Planeta Namek', '2025-08-01', NULL);

INSERT INTO Participantes (nombre, edad, raza, id_torneo) VALUES 
('Goku', 42, 'Saiyan', 1),       -- Goku en el Torneo de las Artes Marciales
('Vegeta', 44, 'Saiyan Elite', 2),-- Vegeta en el Torneo del Poder
('Piccolo', 28, 'Namekiano', 3);  -- Piccolo en el Torneo Intergaláctico

SELECT * FROM Torneos;
SELECT * FROM Participantes;

DELETE FROM Torneos
WHERE nombre = 'Torneo del Poder';
-- Verificar que el torneo y el participante se eliminaron
SELECT * FROM Torneos;
SELECT * FROM Participantes;
