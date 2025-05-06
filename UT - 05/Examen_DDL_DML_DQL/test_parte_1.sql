USE talleres;

-- TEST 1.0: Comprobar que existen las tablas
SELECT CASE
         WHEN COUNT(*) = 4 THEN 'TEST 1.0 PASADO: Todas las tablas creadas'
         ELSE 'TEST 1.0 FALLADO: Faltan tablas'
       END AS resultado
FROM information_schema.tables
WHERE table_schema = 'talleres'
  AND table_name IN ('coches', 'clientes', 'mecanicos', 'cliente_coche');

-- TEST 1.1: Comprobar que la tabla Coches tiene las columnas correctas
SELECT CASE
         WHEN COUNT(*) = 4 THEN 'TEST 1.1 PASADO: Tabla Coches correcta'
         ELSE 'TEST 1.1 FALLADO: Problema en la tabla Coches'
       END AS resultado
FROM information_schema.columns
WHERE table_schema = 'talleres'
  AND table_name = 'coches'
  AND column_name IN ('matricula', 'marca', 'año_fabricacion', 'modelo');

-- TEST 1.2: Comprobar claves primarias
SELECT CASE
         WHEN COUNT(*) = 4 THEN 'TEST 1.2 PASADO: Claves primarias correctas'
         ELSE 'TEST 1.2 FALLADO: Faltan o sobran claves primarias'
       END AS resultado
FROM information_schema.table_constraints
WHERE table_schema = 'talleres'
  AND constraint_type = 'PRIMARY KEY'
  AND table_name IN ('coches', 'clientes', 'mecanicos', 'cliente_coche');

-- TEST 1.3: Comprobar claves foráneas en Cliente_Coche
SELECT CASE
         WHEN COUNT(*) = 2 THEN 'TEST 1.3 PASADO: Claves foráneas en Cliente_Coche correctas'
         ELSE 'TEST 1.3 FALLADO: Problema con las claves foráneas'
       END AS resultado
FROM information_schema.table_constraints
WHERE table_schema = 'talleres'
  AND constraint_type = 'FOREIGN KEY'
  AND table_name = 'cliente_coche';

-- TEST 2: Comprobar que los mails de CLIENTES tienen el nombre en minúscula y guión bajo
SELECT CASE
         WHEN COUNT(*) = 0 THEN 'TEST 2 FALLADO: Mails de clientes no actualizados correctamente'
         ELSE 'TEST 2 PASADO: Mails de clientes actualizados correctamente'
       END AS resultado
FROM clientes
WHERE mail LIKE '%\_%@%';

-- TEST 3.1: Comprobar que el campo salario ahora se llama salario_anual
SELECT CASE
         WHEN COUNT(*) = 1 THEN 'TEST 3.1 PASADO: Cambio de nombre a salario_anual correcto'
         ELSE 'TEST 3.1 FALLADO: No se ha cambiado a salario_anual'
       END AS resultado
FROM information_schema.columns
WHERE table_schema = 'talleres'
  AND table_name = 'mecanicos'
  AND column_name = 'salario_anual';

-- TEST 3.2: Comprobar que los salarios se han multiplicado por 12
SELECT CASE
         WHEN MIN(salario_anual) >= 12 THEN 'TEST 3.2 PASADO: Salarios anuales multiplicados'
         ELSE 'TEST 3.2 FALLADO: Salarios no actualizados'
       END AS resultado
FROM mecanicos;



-- TEST 4: Comprobar que el coche Kia Río ya no pertenece a Carmen
SELECT CASE
         WHEN COUNT(*) = 0 THEN 'TEST 4 PASADO: Coche Kia Río de Carmen eliminado correctamente'
         ELSE 'TEST 4 FALLADO: El coche Kia Río sigue registrado a nombre de Carmen'
       END AS resultado
FROM cliente_coche
WHERE id_cliente = (
    SELECT id_cliente
    FROM clientes
    WHERE nombre = 'Carmen' AND apellidos = 'Ramirez Gomez'
)
AND matricula = (
    SELECT matricula
    FROM coches
    WHERE marca = 'Kia' AND modelo = 'Rio'
);
