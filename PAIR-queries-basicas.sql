-- Conociendo a las empleadas: Esta consulta incluirá los campos employee_id, last_name y first_name

SELECT employee_id, last_name, first_name
FROM employees;

-- Conociendo los productos más baratos: identificar aquellos productos cuyos precios por unidad oscilen entre 0 y 5 dólares

SELECT product_name
FROM products
WHERE 5 < unit_price < 0;

-- Conociendo los productos que no tienen precio:

SELECT product_name
FROM products
WHERE unit_price IS NULL;

-- Comparando productos:
SELECT *
FROM products
WHERE product_id < 10 AND unit_price < 15;

-- Cambiando operadores
SELECT *
FROM products
WHERE NOT product_id < 10 AND unit_price < 15;

-- Conociendo el tipo de producto que vendemos

SELECT product_name, unit_price
FROM products
LIMIT 10;

-- Ordenando los resultados
SELECT product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

-- Pedidos en nuestra BBDD
SELECT DISTINCT order_id
FROM order_details;

-- Pedido que ha gastado más

SELECT order_id, unit_price * quantity AS ImporteTotal
FROM order_details;

-- Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking
SELECT product_id
FROM order_details
ORDER BY unit_price * quantity ASC
LIMIT 5
OFFSET 5;

-- Qué categorías tenemos en nuestra BBDD
SHOW COLUMNS FROM pair_mod2_sprint2.orders;
			-- revisar esto--

-- Envíos con retraso
			-- usar date_add : DATE_ADD("2017-06-15", INTERVAL 10 DAY)

-- Productos más rentables
SELECT product_name
FROM products
WHERE unit_price BETWEEN 15 AND 50;

-- Precios dados
SELECT product_name
FROM products
WHERE unit_price IN (18, 19, 20);