-- Homework #5
-- Part #1
-- sql statement (classicmodels db) using union: show products with buyPrice > 100 and <200
SELECT * FROM classicmodels.products
WHERE buyPrice > 100
UNION ALL
SELECT * FROM classicmodels.products
WHERE buyPrice < 200;

SELECT productName, buyPrice
FROM classicmodels.products
WHERE buyPrice BETWEEN 100 AND 200;

-- sql statement (classicmodels db) using subquery: show all customer names with employees in San Francisco office
SELECT customerName, salesRepEmployeeNumber, city
FROM classicmodels.customers
WHERE salesRepEmployeeNumber IN (
	SELECT DISTINCT employeeNumber FROM classicmodels.employees e
	JOIN classicmodels.offices o
	ON e.officeCode = o.officeCode
	WHERE o.city = 'San Francisco');

SELECT customerName, salesRepEmployeeNumber, city
FROM classicmodels.customers
WHERE salesRepEmployeeNumber IN 
	(SELECT DISTINCT employeeNumber from classicmodels.employees e
	WHERE officeCode IN 
		(SELECT officeCode FROM classicmodels.offices
		WHERE city = 'San Francisco'));

-- Part #2
-- Keep working on these queries
-- write sql for #1,2,3,4,5,7
-- 1.how many vendors, product lines, and products exist in the database?
SELECT COUNT(DISTINCT productVendor), 
	COUNT(DISTINCT productName)
FROM classicmodels.products;

SELECT COUNT(DISTINCT productLine)
FROM classicmodels.productlines;

-- 2.what is the average price (buy price, MSRP) per vendor?
SELECT productVendor, 
	AVG(buyPrice) as AvgPrice, 
    AVG(MSRP) as AvgMSRP
FROM classicmodels.products
GROUP BY productVendor
ORDER BY productVendor;

-- 3.what is the average price (buy price, MSRP) per customer?
SELECT c.customerNumber, c.customerName, 
	p.productName, 
    AVG(od.priceEach) AS AvgPrice,
    AVG(p.buyPrice) AS AvgBuyPrice,
    AVG(p.MSRP) AS AvgMSRP
FROM classicmodels.customers c
JOIN classicmodels.orders o ON c.customerNumber = o.customerNumber
JOIN classicmodels.orderdetails od ON o.orderNumber = od.orderNumber
JOIN classicmodels.products p ON od.productCode = p.productCode
GROUP BY c.customerNumber
ORDER BY c.customerNumber;

-- 4.what product was sold the most?
SELECT od.productCode, SUM(od.quantityOrdered) AS quantitySold, p.productName
FROM classicmodels.orderdetails od
JOIN classicmodels.products p
ON od.productCode = p.productCode
GROUP BY od.productCode
ORDER BY quantitySold DESC;

-- 5.how much money was made between buyPrice and MSRP?
-- for each product
SELECT od.productCode, p.productName,
SUM(od.quantityOrdered * p.buyPrice) AS buyPrice,
SUM(od.quantityOrdered * p.MSRP) as MSRP,
SUM(od.quantityOrdered * p.MSRP) - SUM(od.quantityOrdered * p.buyPrice) AS difference
FROM classicmodels.orderdetails od
JOIN classicmodels.products p
ON od.productCode = p.productCode
GROUP BY od.productCode;

-- overall
SELECT SUM(od.quantityOrdered * p.buyPrice) AS buyPrice,
SUM(od.quantityOrdered * p.MSRP) as MSRP,
SUM(od.quantityOrdered * p.MSRP) - SUM(od.quantityOrdered * p.buyPrice) AS difference
FROM classicmodels.orderdetails od
JOIN classicmodels.products p
ON od.productCode = p.productCode;

-- 7.which vendor sells more products?
SELECT p.productVendor, p.productName,
od.productCode, SUM(od.quantityOrdered) AS quantity
FROM classicmodels.orderdetails od
JOIN classicmodels.products p
ON od.productCode = p.productCode
GROUP BY od.productCode
ORDER BY quantity DESC
LIMIT 1;

-- Part #3 library_simple database
-- Find all release dates for book 'Dog With Money'
SELECT b.name, i.copy_id, i.release_date
FROM library_simple.book b 
LEFT JOIN library_simple.copy c
ON b.id = c.book_id
LEFT JOIN library_simple.issuance i
ON c.id = i.copy_id
WHERE b.name = 'Dog With Money';