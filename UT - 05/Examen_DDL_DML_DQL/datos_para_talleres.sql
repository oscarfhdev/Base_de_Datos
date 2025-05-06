-- Inserción de valores en la tabla "Clientes"
INSERT INTO Clientes (id_cliente, nombre, apellidos, telefono, mail) VALUES
(1, 'Juan', 'Pérez Gómez', '123456789', 'juanelpilotazo@gmail.com'),
(2, 'María', 'López Martínez', '987654321', 'lamecánicacrack@gmail.com'),
(3, 'Carlos', 'García Sánchez', '555555555', 'carmaster@gmail.com'),
(4, 'Ana', 'Martínez Rodríguez', '666666666', 'laquearreglatodo@gmail.com'),
(5, 'Pedro', 'Sánchez Pérez', '777777777', 'soyelcrackdesql@gmail.com'),
(6, 'Laura', 'Rodríguez López', '888888888', 'laurajefa@gmail.com'),
(7, 'Sofía', 'Fernández Martín', '999999999', 'sofíagti@gmail.com'),
(8, 'David', 'Ruiz García', '333333333', 'eldavidcadillac@gmail.com'),
(9, 'Elena', 'Gómez Sánchez', '444444444', 'elenalavoltilla@gmail.com'),
(10, 'Miguel', 'Torres Pérez', '222222222', 'miguelpedalalmetal@gmail.com'),
(11, 'Carmen', 'Ramírez Gómez', '111111111', 'carmenmaravilla@gmail.com');

-- Inserción de valores en la tabla "Coches"
INSERT INTO Coches (matricula, marca, año_fabricacion, modelo) VALUES
('ABC123', 'Toyota', 2018, 'Corolla'),
('XYZ789', 'Ford', 2019, 'Focus'),
('DEF456', 'Honda', 2020, 'Civic'),
('GHI789', 'Volkswagen', 2017, 'Golf'),
('JKL012', 'Chevrolet', 2016, 'Camaro'),
('MNO345', 'BMW', 2015, 'X5'),
('PQR678', 'Mercedes-Benz', 2014, 'CLA'),
('STU901', 'Audi', 2013, 'A4'),
('VWX234', 'Hyundai', 2012, 'Elantra'),
('YZA567', 'Kia', 2021, 'Sportage'),
('BCD890', 'Nissan', 2011, 'Altima'),
('LMN012', 'Ford', 2020, 'Fiesta'),
('OPQ345', 'Chevrolet', 2018, 'Spark'),
('RST678', 'Toyota', 2019, 'Yaris'),
('UVW901', 'Volkswagen', 2017, 'Polo'),
('XYZ234', 'Honda', 2016, 'Fit'),
('BCD567', 'Hyundai', 2015, 'Accent'),
('EFG890', 'Mercedes-Benz', 2014, 'GLA'),
('HIJ123', 'Audi', 2013, 'A3'),
('KLM456', 'Nissan', 2012, 'Micra'),
('NOP789', 'BMW', 2011, '1 Series'),
('QRS012', 'Kia', 2021, 'Rio');

-- Inserción de valores en la tabla "Mecánico"
INSERT INTO Mecanicos (dni, nombre, puesto, salario) VALUES
('12345678A', 'Juan Martínez', 'Jefe de taller', 3000.00),
('23456789B', 'Pedro García', 'Mecánico', 2000.00),
('34567890C', 'Ana López', 'Mecánico', 2000.00),
('45678901D', 'María Rodríguez', 'Mecánico', 2000.00),
('56789012E', 'Carlos Sánchez', 'Ayudante', 1500.00),
('67890123F', 'Laura Martínez', 'Ayudante', 1500.00),
('78901234G', 'José Pérez', 'Mecánico', 2000.00),
('89012345H', 'Sofía Gómez', 'Mecánico', 2000.00),
('90123456I', 'David Fernández', 'Mecánico', 2000.00),
('01234567J', 'Elena Ruiz', 'Ayudante', 1500.00),
('98765432K', 'Miguel Sánchez', 'Ayudante', 1500.00);

-- Inserción de valores en la tabla de relación "Cliente_Coche"
INSERT INTO Cliente_Coche (id_relacion, id_cliente, matricula) VALUES
(1, 1, 'ABC123'),
(2, 2, 'XYZ789'),
(3, 3, 'DEF456'),
(4, 4, 'GHI789'),
(5, 5, 'JKL012'),
(6, 6, 'MNO345'),
(7, 7, 'PQR678'),
(8, 8, 'STU901'),
(9, 9, 'VWX234'),
(10, 10, 'YZA567'),
(11, 11, 'BCD890'),
(12, 1, 'LMN012'),  -- Juan
(13, 2, 'OPQ345'),  -- María
(14, 3, 'RST678'),  -- Carlos
(15, 4, 'UVW901'),  -- Ana
(16, 5, 'XYZ234'),  -- Pedro
(17, 6, 'BCD567'),  -- Laura
(18, 7, 'EFG890'),  -- Sofía
(19, 8, 'HIJ123'),  -- David
(20, 9, 'KLM456'),  -- Elena
(21, 10, 'NOP789'),  -- Miguel
(22, 11, 'QRS012');  -- Carmen