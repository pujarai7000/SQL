--counts no of rows from product tableProducts
SELECT COUNT(*)
FROM products

--selects the unique  product sub category
SELECT DISTINCT c2
FROM products ;

-- Displays ProductStyle as style_of_product and shows only the first 10 records 
SELECT c9 as style_of_product
FROM products 
LIMIT 10;

--Count how many white products exist.
SELECT COUNT(c7)
FROM products
WHERE c7='White';

--Show products whose price (c11) is greater than 1000 and  are in  black color 
SELECT c11 as price_of_product,
       c7 as color_of_product
FROM Products
WHERE CAST(c11 as Real )>1000 and c7='Black';

--Show the 5 cheapest products 
SELECT c4 as product_name,c11 as product_price
FROM Products
ORDER BY c11 ASC
LIMIT 5;

--How many products are black in color?
SELECT COUNT(c9) as product_style ,c7 as product_color
FROM Products
GROUP by c7
HAVING c7='Black';

--Shows all product names that start with the letter R.
SELECT c4 as product_name
FROM Products
WHERE c4 LIKE 'R%';

--Average product price Products
SELECT ROUND(AVG(CAST(c11 AS REAL)),2) AS average_price
FROM Products;

--Product styles that appear more than 5 timesProducts
SELECT c9 AS product_style,
       COUNT(*) AS total_products
FROM Products
GROUP BY c9
HAVING COUNT(*) > 5;
