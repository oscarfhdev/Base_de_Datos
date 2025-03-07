DROP DATABASE IF EXISTS TorneosDragonBall;
CREATE DATABASE IF NOT EXISTS TorneosDragonBall;
USE TorneosDragonBall;

CREATE TABLE IF NOT EXISTS Torneos(
    id_torneo INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE NULL,
    PRIMARY KEY (id_torneo)
);

CREATE TABLE IF NOT EXISTS Participantes(
    id_participante INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    edad INT CHECK (edad>18 AND edad<150),
    raza VARCHAR(30),
    id_torneo INT,
    PRIMARY KEY (id_participante),
    FOREIGN KEY (id_torneo) REFERENCES Torneos(id_torneo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
SHOW TABLES;
SHOW CREATE TABLE Participantes;