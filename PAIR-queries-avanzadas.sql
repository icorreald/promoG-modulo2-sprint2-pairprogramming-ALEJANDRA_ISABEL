-- Productos más baratos y caros de nuestra BBDD
SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
FROM products;

-- Conociendo el numero de productos y su precio medio
SELECT COUNT(product_id) AS NumeroProductos, AVG(unit_price) AS MediaPrecio
FROM products;

-- Sacad la máxima y mínima carga de los pedidos de UK
SELECT MAX(freight) AS MaximaCarga, MIN(freight) AS MinimaCarga
FROM orders
WHERE ship_country = 'UK';

-- Qué productos se venden por encima del precio medio
SELECT product_name, unit_price
FROM products
WHERE unit_price > 28.86
ORDER BY unit_price DESC;

-- Qué productos se han descontinuado
SELECT product_name
FROM products
WHERE discontinued = 1;

-- Detalles de los productos de la query anterior
-- Detalles descontinuados:
SELECT product_id, product_name
FROM products
WHERE discontinued = 1;

-- Detalles no descontinuados:
SELECT product_id, product_name
FROM products
WHERE NOT discontinued = 1 
ORDER BY product_id ASC
LIMIT 10;

-- Relación entre número de pedidos y máxima carga
SELECT employee_id AS Empleado, COUNT(order_id) AS NumeroPedidos, MAX(freight)
FROM orders
GROUP BY employee_id;

-- Descartar pedidos sin fecha y ordénalos
SELECT employee_id AS Empleado, COUNT(order_id) AS NumeroPedidos, MAX(freight)
FROM orders
GROUP BY employee_id
HAVING shipped_date <> '0000-00-00 00:00:00';
		-- no entiendo por qué da mal

-- Números de pedidos por día
		-- depende del anterior
        
-- Seleccionad las ciudades con 4 o más empleadas
SELECT country
FROM employees
GROUP BY country
HAVING COUNT(country) >= 4; 

-- Cread una nueva columna basándonos en la cantidad monetaria: ALTO (+ 2000), BAJO (- 2000)
SELECT product_id AS producto,
CASE
	WHEN unit_price * quantity > 2000 THEN 'ALTO'
    WHEN unit_price * quantity < 2000 THEN 'BAJO'
    END AS cantidad_monetaria
FROM order_details;

