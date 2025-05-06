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
SELECT g.nombre as nombre_grado, a.nombre as nombre_asignatura, MAX(a.creditos) as creditos FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY nombre_grado, nombre_asignatura 
ORDER BY creditos DESC, nombre_asignatura;
