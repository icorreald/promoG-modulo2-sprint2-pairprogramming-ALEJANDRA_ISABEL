-- Pedidos por empresa en UK

SELECT company_name, COUNT(O.order_id)
	FROM customers AS C
INNER JOIN orders AS O
	ON C.customer_id = O.customer_id
WHERE country = 'UK'
GROUP BY company_name;

-- Productos pedidos por empresa en UK por año:
SELECT YEAR(O.shipped_date) AS Año, O.ship_name AS NombreEmpresa, SUM(OD.quantity) AS Cantidad
	FROM orders AS O
INNER JOIN order_details AS OD
	ON O.order_id = OD.order_id
GROUP BY YEAR(O.shipped_date), O.ship_name
ORDER BY NombreEmpresa;

-- Mejorad la query anterior
SELECT YEAR(O.shipped_date) AS Año, 
			O.ship_name AS NombreEmpresa, 
            SUM(OD.quantity) AS Cantidad, 
			SUM(CASE WHEN OD.discount > 0 
					THEN (OD.unit_price * OD.discount) * OD.quantity 
				ELSE OD.unit_price * OD.quantity 
                END) 
			AS DineroTotal
	FROM orders AS O
INNER JOIN order_details AS OD
	ON O.order_id = OD.order_id
WHERE OD.discount > 0
GROUP BY YEAR(O.shipped_date), O.ship_name
ORDER BY NombreEmpresa;
		-- no me sale el segundo sumatorio

-- Pedidos que han realizado cada compañía y su fecha
SELECT O.order_id AS OrderID, O.ship_name AS CompanyName, O.shipped_date AS OrderDate
FROM orders AS O
LEFT JOIN order_details AS OD
ON O.order_id = OD.order_id
ORDER BY O.ship_name;
        
-- Tipos de producto vendidos:
SELECT C.category_id AS OrderID, 
	C.category_name AS CategoryName, 
    P.product_name AS ProductName, 
    SUM(CASE WHEN OD.discount > 0 
					THEN (OD.unit_price * OD.discount) * OD.quantity 
				ELSE OD.unit_price * OD.quantity 
                END) 
			AS ProductSales 
FROM categories AS C
INNER JOIN products as P
ON C.category_id = P.category_id
INNER JOIN order_details AS OD
ON P.product_id = OD.product_id
GROUP BY OD.product_id
ORDER BY C.category_name
;
		-- no sale como el ejemplo; revisar
        
-- Qué empresas tenemos en la BBDD Northwind:
SELECT order_id, ship_name, shipped_date
FROM orders
ORDER BY ship_name;

-- Pedidos por cliente de UK:
SELECT DISTINCT ship_name AS NombreCliente, COUNT(ship_name) AS NumeroPedidos
FROM orders
WHERE ship_country = 'UK'
GROUP BY ship_name
ORDER BY ship_name;

-- Empresas UK y sus pedidos:
SELECT OD.order_id AS OrderID, C.company_name AS NombreCliente, O.shipped_date
FROM order_details AS OD

INNER JOIN orders AS O
ON OD.order_id = O.order_id

INNER JOIN customers AS C
ON O.ship_name = C.company_name

WHERE country = 'UK'
ORDER BY NombreCliente;

-- para ver si cambia algo alternando el orden
SELECT OD.order_id AS OrderID, C.company_name AS NombreCliente, O.shipped_date
FROM customers AS C

INNER JOIN orders AS O
ON C.company_name = O.ship_name

INNER JOIN order_details AS OD
ON O.order_id = OD.order_id

WHERE country = 'UK'
ORDER BY NombreCliente;

-- Empleadas que sean de la misma ciudad:
SELECT E.city AS cityE, E.first_name AS nombreE, E.last_name AS apellidoE, J.city AS cityJ, J.first_name AS nombreJ, J.last_name AS apellidoJ
FROM employees AS E, employees AS J
WHERE E.reports_to = J.employee_id
ORDER BY E.city
;

-- BONUS: FULL OUTER JOIN


