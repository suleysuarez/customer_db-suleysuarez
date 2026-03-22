SELECT 
    COUNT(*)
FROM ctg.categories 
UNION
SELECT 
    'ctg.departments' AS tabla,
    COUNT(*)
FROM ctg.departments
UNION
SELECT 
    'ctg.municipalites' AS tabla,
    COUNT(*)
FROM ctg.municipalites 
UNION
SELECT 
    'ctg.categories' AS tabla,
    COUNT(*)
FROM ctg.categories
UNION
SELECT 
    'ctg.products' AS tabla,
    COUNT(*)
FROM ctg.products
UNION
SELECT 
    'ctg.payment_methods' AS tabla,
    COUNT(*)
FROM cth.payment_methods
UNION
SELECT 
    'cs.customers' AS tabla,
    COUNT(*)
FROM cs.customers
UNION
SELECT 
    'cs.adresses' AS tabla,
    COUNT(*)
FROM cs.adresses
UNION
SELECT 
    'pay.orders' AS tabla,
    COUNT(*)
FROM pay.orders
UNION
SELECT 
    'pay.order_items' AS tabla,
    COUNT(*)
FROM pay.order_items
UNION
SELECT 
    'ship.ship_company' AS tabla,
    COUNT(*)
FROM ship.ship_company
UNION
SELECT 
    'ship.shipments_orders' AS tabla,
    COUNT(*)
FROM ship.shipments_orders

--top 5 clientes con mas ordenes 

SELECT 
    COUNT(*) AS total
FROM cs.customers c
INNER JOIN pay.orders o ON c.id= o.customer_id

--cliente mas viejo 

SELECT
    c.name AS nombre,
    c.id_number AS identificacion,
    c.
FROM cs.customers c 

--totla orders collected by category 

SELECT 
    c.name AS category,
    SUM(o.total) AS total_sales
FROM pay.order_items oi
INNER JOIN ctg.products p ON oi.id = p.id
INNER JOIN ctg.categories c ON p.category_id = c.id
GROUP BY c.name
ORDER BY total_sales ASC;