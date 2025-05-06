DROP DATABASE IF EXISTS talleres;
CREATE DATABASE IF NOT EXISTS talleres;
USE talleres;

CREATE TABLE Coches (
    matricula VARCHAR(20),
    marca VARCHAR(50),
    año_fabricacion INT,
    modelo VARCHAR(50),
    PRIMARY KEY (matricula)
);

CREATE TABLE Clientes (
    id_cliente INT,
    nombre VARCHAR(100),
    apellidos VARCHAR(200),
    telefono VARCHAR(20),
    mail VARCHAR(100),
    PRIMARY KEY (id_cliente)
);


CREATE TABLE Mecanicos (
    dni VARCHAR(20),
    nombre VARCHAR(150),
    puesto VARCHAR(50),
    salario DECIMAL(11,2),
    PRIMARY KEY (dni)
);


CREATE TABLE Cliente_Coche(
    id_relacion INT, 
    id_cliente INT,
    matricula VARCHAR(20),
    PRIMARY KEY (id_relacion),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (matricula) REFERENCES Coches(matricula)
)
