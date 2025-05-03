DROP DATABASE IF EXISTS Taller;
CREATE DATABASE Taller;
USE Taller;

CREATE TABLE Coches(
    matricula VARCHAR(8),
    marca VARCHAR(15) NOT NULL,
    an_fab INT NOT NULL CHECK(an_fab BETWEEN 1000 AND 9999),
    modelo VARCHAR(15) NOT NULL,
    PRIMARY KEY (matricula)
);

CREATE TABLE Mecanicos(
    dni VARCHAR(9),
    nombre VARCHAR(15) NOT NULL,
    puesto VARCHAR(15) NOT NULL,
    parcial CHAR(1) NOT NULL CHECK (parcial IN ('S', 'N')),
    PRIMARY KEY (dni)
);

CREATE TABLE Trabajos(
    id INT AUTO_INCREMENT,
    mat VARCHAR(8) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    horas DECIMAL(3,1) NOT NULL,
    fecha_rep DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mat) REFERENCES Coches(matricula),
    FOREIGN KEY (dni) REFERENCES Mecanicos(dni)

);

CREATE TABLE Clientes(
    id_cliente VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Piezas(
    id_pieza VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL (5,1) NOT NULL,
    PRIMARY KEY (id_pieza)
);

CREATE TABLE Facturas(
    id_factura VARCHAR(10),
    id_cliente VARCHAR(10) NOT NULL,
    fecha_emision DATE NOT NULL,
    total DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);