USE talleres;


-- EJERCICIO 2
UPDATE Clientes
SET mail = LOWER(CONCAT(nombre, '_', mail));
SELECT * FROM Clientes;

-- EJERCICIO 3
-- Modificar salario --> salario_anual
ALTER TABLE Mecanicos
CHANGE COLUMN salario salario_anual DECIMAL(10,2);
SELECT * FROM Mecanicos;

-- Multiplicar salario_anual*12
UPDATE Mecanicos SET salario_anual = salario_anual*12;
SELECT * FROM Mecanicos;


-- EJERCICIO 4 
DELETE FROM Cliente_Coche 

WHERE id_cliente =
(
    SELECT id_cliente
    FROM Clientes
    WHERE nombre = 'Carmen' AND apellidos = 'Ramirez Gomez'
)
AND matricula = (
    SELECT matricula
    FROM Coches
    WHERE marca = 'Kia' AND modelo = 'Rio'
);
