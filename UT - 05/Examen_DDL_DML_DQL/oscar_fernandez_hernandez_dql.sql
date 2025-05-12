USE universidad;

-- Ejercicio 1
SELECT COUNT(*) as total_alumnas FROM persona WHERE tipo= 'alumno' AND sexo= 'M';

-- Ejercicio 2
SELECT COUNT(*) as total_alumnos FROM persona WHERE tipo= 'alumno' AND fecha_nacimiento LIKE '2000-%';


-- Ejercicio 3
SELECT g.nombre as nombre_asignatura, a.tipo as tipo_asignatura, SUM(a.creditos) as total_creditos FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY total_creditos DESC;


-- EJERCICIO 4
-- SELECT g.nombre as nombre_grado, a.nombre as nombre_asignatura, MAX(a.creditos) as creditos FROM grado g
-- LEFT JOIN asignatura a ON g.id = a.id_grado
-- GROUP BY nombre_grado, nombre_asignatura 
-- ORDER BY creditos DESC, nombre_asignatura;



-- CORRECIÓN CLASE
SELECT g.nombre AS nombre_grado,
    a.nombre as nombre_asignatura,
    a.creditos AS creditos

FROM grado g
LEFT JOIN (
    SELECT a1.*
    FROM asignatura a1
    WHERE a1.id = (
        SELECT a2.id
        FROM asignatura a2
        WHERE a2.id_grado = a1.id_grado
    ORDER BY a2.creditos DESC, a2.nombre ASC
    LIMIT 1
    )
) a ON g.id = a.id_grado
;
