-- 1

WITH company_data 
	AS ( SELECT customer_id, company_name
			FROM customers)


-- 2

SELECT customer_id, company_name
	FROM customers
    WHERE country = "Germany"
    GROUP BY customer_id
    ;

-- 3

WITH company_data 
	AS ( SELECT customer_id, company_name
			FROM customers)
SELECT company_data.customer_id, company_data.company_name, order_id, shipped_date
    FROM orders
    INNER JOIN company_data
    ON company_data.company_name = orders.ship_name
    ;

-- 4

SELECT customer_id, ship_name, COUNT(customer_id)
	FROM orders
    GROUP BY customer_id, ship_name
    ;
    
    
-- 5  
  
SELECT COUNT(product_id)
	FROM order_details
    GROUP BY product_id;
    
     
    

