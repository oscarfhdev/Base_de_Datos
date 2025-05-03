DROP DATABASE IF EXISTS EmpresaLogistica;
CREATE DATABASE IF NOT EXISTS EmpresaLogistica;
USE EmpresaLogistica;

CREATE TABLE productos(
    id_producto INT,
    nombre_producto VARCHAR(30) NOT NULL,
    categoria ENUM('Electrónica', 'Ropa', 'Alimentos', 'Herramientas'),
    stock INT NOT NULL,
    precio_unitario DECIMAL (5,2) NOT NULL,
    PRIMARY KEY (id_producto)
);
