-- TOP 5: CUSTOMERS WITH MORE ORDERS

SELECT
    T2.name,
    T2.id_number,
    T2.phone_number,
    COUNT(T1.id) AS total_orders
FROM pay.orders T1
INNER JOIN cs.customers T2
    ON T1.customer_id_number = T2.id_number
GROUP BY T2.name, T2.id_number, T2.phone_number
ORDER BY total_orders DESC
LIMIT 5;

-- THE MOST YOUNGER CUSTOMER
SELECT
    name,
    id_number,
    phone_number,
    birth_date,
    EXTRACT (YEAR FROM AGE(CURRENT_DATE, birth_date)) AS AGE
FROM cs.customers T1
WHERE birth_date = 
(
    SELECT MAX(birth_date) FROM cs.customers
)
LIMIT 1;

-- THE MOST OLDER CUSTOMER

SELECT
    name,
    id_number,
    phone_number,
    birth_date,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date)) AS age
FROM cs.customers
WHERE birth_date = (
    SELECT MIN(birth_date) FROM cs.customers
)
LIMIT 1;


-- THE COMPANY WITH MORE SHIPS

SELECT
    T2.name AS company,
    COUNT(*) AS total_shipments
FROM ship.shipment_orders T1
INNER JOIN ship.ship_company T2
    ON T1.ship_company_id = T2.id
GROUP BY T2.name
ORDER BY total_shipments DESC
LIMIT 1;

-- TOTAL ORDERS COLLECTED BY CATEGORY
SELECT
        T3.name AS category,
        MONEY(SUM(T1.quantity * T2.cop_price)) AS total_by_category_cop,
        MONEY(SUM(T1.quantity * T2.usd_price)) AS total_by_category_usd
    FROM pay.order_items T1
    INNER JOIN ctg.products T2
        ON T1.product_id = T2.id
    INNER JOIN ctg.categories T3
        ON T2.category_id = T3.id
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 5;