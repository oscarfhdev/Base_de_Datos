DROP DATABASE IF EXISTS pubs;
CREATE DATABASE pubs;
USE pubs;

CREATE TABLE Localidad(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Pub(
    cod_pub INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    licencia_fiscal VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(4) CHECK (horario IN ('HOR1', 'HOR2', 'HOR3')),
    cod_localidad INT NOT NULL,
    PRIMARY KEY (cod_pub),
    FOREIGN KEY (cod_localidad) REFERENCES Localidad(id)
);


CREATE TABLE Titular(
    dni_titular INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50),
    cod_pub INT NOT NULL,
    PRIMARY KEY (dni_titular),
    FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub)
);

CREATE TABLE Empleado(
    dni_empleado INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50),
    PRIMARY KEY (dni_empleado)
);

CREATE TABLE Pub_Empleado(
    cod_pub INT,
    dni_empleado INT,
    funcion VARCHAR(50) CHECK(funcion IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA')),
    PRIMARY KEY (cod_pub, dni_empleado),
    FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
    FOREIGN KEY (dni_empleado) REFERENCES Empleado(dni_empleado)
);


CREATE TABLE Existencias(
    cod_articulo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio INT NOT NULL CHECK(precio > 0),
    cod_pub INT NOT NULL,
    PRIMARY KEY (cod_articulo),
    FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub)
);

