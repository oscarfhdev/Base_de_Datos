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

INSERT INTO productos VALUES
(1, 'Smartphone', 'Electrónica', 25, 399.99),
(2, 'Camiseta', 'Ropa', 50, 19.99),
(3, 'Leche', 'Alimentos', 100, 1.50),
(4, 'Destornillador', 'Herramientas', 15, 9.99),
(5, 'Portátil', 'Electrónica', 10, 899.99),
(6, 'Pantalones', 'Ropa', 30, 29.99),
(7, 'Manzanas', 'Alimentos', 75, 0.50),
(8, 'Martillo', 'Herramientas', 20, 12.99),
(9, 'Tablet', 'Electrónica', 8, 299.99),
(10, 'Chaqueta', 'Ropa', 20, 49.99),
(11, 'Queso', 'Alimentos', 50, 2.99),
(12, 'Taladro', 'Herramientas', 12, 39.99),
(13, 'Altavoces', 'Electrónica', 18, 149.99),
(14, 'Bufanda', 'Ropa', 40, 14.99),
(15, 'Arroz', 'Alimentos', 90, 1.20),
(16, 'Destapacañerías', 'Herramientas', 5, 7.99),
(17, 'Televisor', 'Electrónica', 6, 699.99),
(18, 'Zapatos', 'Ropa', 35, 39.99),
(19, 'Pan', 'Alimentos', 120, 0.80),
(20, 'Cinta métrica', 'Herramientas', 10, 5.99),
(21, 'Auriculares', 'Electrónica', 22, 79.99),
(22, 'Vestido', 'Ropa', 15, 59.99),
(23, 'Cerveza', 'Alimentos', 65, 1.99),
(24, 'Llave inglesa', 'Herramientas', 8, 8.99),
(25, 'Monitor', 'Electrónica', 9, 199.99),
(26, 'Jersey', 'Ropa', 25, 34.99),
(27, 'Pasta', 'Alimentos', 80, 1.30),
(28, 'Destornillador eléctrico', 'Herramientas', 18, 24.99),
(29, 'Cámara', 'Electrónica', 7, 449.99),
(30, 'Gorra', 'Ropa', 50, 9.99);

SELECT * FROM productos;


-- 1. Encuentra todos los productos cuyo stock es menor a 10 unidades.
SELECT * FROM productos WHERE stock < 10;


-- 2. Encuentra todos los productos cuya categoría es Electrónica o Ropa.
SELECT * FROM productos WHERE categoria IN ('Electrónica', 'Ropa');


-- 3. Encuentra todos los productos cuyo precio unitario es mayor a 100 euros.
SELECT * FROM productos WHERE precio_unitario > 100;

-- 4. Encuentra el producto con el precio unitario más alto.
SELECT * FROM productos WHERE precio_unitario = (
    SELECT MAX(precio_unitario) FROM productos
    );

-- 5. Encuentra la categoría con el mayor valor total de stock.
SELECT categoria, 
    SUM(stock * precio_unitario) as valorstock
FROM productos
GROUP BY categoria
ORDER BY valorstock DESC
LIMIT 1;


-- 6. Encuentra el promedio del precio unitario de todos los productos.
SELECT AVG(precio_unitario) as promedio_de_precio_unitario FROM productos;


-- 7. Encuentra todos los productos cuyo nombre comienza con “A” y su stock es mayor a 0.
SELECT * 
FROM productos
WHERE nombre_producto LIKE 'A%' AND stock > 0;


-- 8. Encuentra todos los productos que no pertenecen a la categoría Alimentos y su precio unitario es inferior a 50 euros.
SELECT * 
FROM productos
-- WHERE categoria NOT IN ('Alimentos') AND precio_unitario < 50; opción válida
WHERE categoria <> 'Alimentos' AND precio_unitario < 50;

-- 9. Encuentra todos los productos cuya cantidad en stock es un número par.
SELECT * 
FROM productos
WHERE stock % 2 = 0; -- Todos los números pares divididos entre dos, tienen resto 0.


-- 10. Encuentra todos los productos cuya categoría no contiene la palabra “Herramientas”.
SELECT * 
FROM productos
WHERE categoria NOT IN ('Herramientas');


-- 11. Encuentra todos los productos cuyo precio unitario está dentro del rango de 50 a 100 euros.
SELECT * 
FROM productos
WHERE precio_unitario BETWEEN 50 AND 100; 


-- 12. Encuentra el producto con la cantidad de stock más baja.
SELECT * 
FROM productos
WHERE stock = (
    SELECT MIN(stock) FROM productos);


-- 13. Encuentra la categoría con el menor valor total de stock.
SELECT categoria, SUM(stock * precio_unitario) as valortotal
FROM productos
GROUP BY categoria
ORDER BY categoria DESC;

-- 14. Encuentra el número total de productos en cada categoría.
SELECT categoria, COUNT(*) AS totalproductos
FROM productos
GROUP BY categoria;


-- 15. Encuentra todos los productos que tienen el mismo precio unitario que otro producto.
SELECT * FROM productos
WHERE precio_unitario = (
    SELECT precio_unitario FROM productos WHERE id_producto = 30
);


-- 16. Encuentra todos los productos cuyo nombre contiene una ‘a’ y una ‘e’ (en cualquier orden).
SELECT * FROM productos
WHERE nombre_producto LIKE '%a%' and nombre_producto LIKE '%e%';


-- 17. Encuentra todos los productos que tienen el mismo nombre de categoría que otro producto.
SELECT * FROM productos
WHERE categoria = (
    SELECT categoria FROM productos WHERE id_producto = 20
);


-- 18. Encuentra todos los productos cuyo nombre es más largo que su categoría.
SELECT * FROM productos
WHERE CHAR_LENGTH(nombre_producto) > CHAR_LENGTH(categoria);


-- 19. Encuentra todos los productos cuyo precio unitario es un número entero.
SELECT * FROM productos
WHERE (precio_unitario%1) = 0;


-- 20. Encuentra el producto con el mayor valor total (stock * precio_unitario).
SELECT * FROM productos
WHERE precio_unitario*stock = (SELECT MAX(precio_unitario * stock) FROM productos);
