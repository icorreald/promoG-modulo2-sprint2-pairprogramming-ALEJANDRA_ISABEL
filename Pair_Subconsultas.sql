-- 1 
-- VERSION A
SELECT order_id, customer_id, employee_id, MAX(order_date), required_date
	FROM orders
    GROUP BY order_id
    ORDER BY order_id
;

-- VERSION B
SELECT order_id, customer_id, employee_id, order_date, required_date
	FROM orders
    WHERE order_date IN (SELECT MAX(order_date)
							FROM orders
							GROUP BY order_id
                            )
		;

 -- 2
 SELECT product_id,
		(SELECT MAX(unit_price) 
        FROM order_details 
        WHERE product_id = product_id) AS max_unit_price_sold
	FROM (SELECT DISTINCT product_id FROM order_details)
    ;


SELECT 
    od.product_id,
    (
        SELECT MAX(unit_price) 
        FROM order_details 
        WHERE product_id = od.product_id
    ) AS max_unit_price_sold
FROM 
    (SELECT DISTINCT product_id FROM order_details) od;

-- 3 
SELECT product_id, product_name, category_id
	FROM products
    WHERE category_id IN (SELECT category_id
							FROM categories
    						WHERE category_name LIKE "Beverages") 

;

-- 4 
SELECT DISTINCT country
	FROM customers
    WHERE country NOT IN (SELECT DISTINCT country
								FROM suppliers)
    ;

-- 5 
SELECT 

SELECT order_id
	FROM order_details
    WHERE product_id = 6 AND quantity >= 20

    ;

