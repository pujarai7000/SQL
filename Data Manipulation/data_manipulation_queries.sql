-- Which customers are repeat customers?

SELECT Customers.c2 AS CustomerName,
       COUNT(Orders.c1) AS total_orders,
       CASE
           WHEN COUNT(Orders.c1) >= 1 THEN 'Repeat Customer'
           ELSE 'No Orders'
       END AS customer_type
FROM Customers
LEFT JOIN Orders
ON Customers.c1 = Orders.c2
GROUP BY Customers.c2;

-- Which customers placed no orders?
SELECT Customers.c2 AS CustomerName,
       COUNT(Orders.c1) AS total_orders,
       CASE 
           WHEN COUNT(Orders.c1) = 0 THEN 'NO orders placed'
           else 'Ordered'
       END AS customer_type
FROM Customers
LEFT JOIN Orders
ON Customers.c1 = Orders.c2
GROUP BY Customers.c2;


-- Which cities have the most active customers?
SELECT Customers.c3 AS cities,
      Count(Orders.c1) as total_orders
FROM Customers 
LEFT JOIN orders 
ON Customers.c1 = Orders.c2
GROUP BY Customers.c3
ORDER BY total_orders DESC
LIMIT 1;

-- Which customers are one-time vs repeat customers?
SELECT Customers.c2 AS CustomerName,
       COUNT(Orders.c1) AS total_orders,
       CASE
           WHEN COUNT(Orders.c1) > 1 THEN 'Repeat Customer'
           WHEN COUNT(Orders.c1) = 1 THEN 'One-Time Customer'
           ELSE 'No Orders'
       END AS customer_type
FROM Customers
LEFT JOIN Orders
ON Customers.c1 = Orders.c2
GROUP BY Customers.c2;

-- Which customers placed more orders than the average customer?
SELECT Customers.c2 AS CustomerName,
       COUNT(Orders.c1) AS total_orders
FROM Customers
LEFT JOIN Orders
ON Customers.c1 = Orders.c2
GROUP BY Customers.c2
HAVING COUNT(Orders.c1) >
(
    SELECT AVG(order_count)
    FROM
    (
        SELECT COUNT(Orders.c1) AS order_count
        FROM Customers
        LEFT JOIN Orders
        ON Customers.c1 = Orders.c2
        GROUP BY Customers.c2
    )
)
