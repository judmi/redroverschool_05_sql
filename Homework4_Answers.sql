-- Homework for Lesson #4 
-- Part #1 classicmodels database 
-- (write sql for #6, 8, 9, 10, 11, 14, 16, 17, 21) -- easy questions

-- 1.how many vendors, product lines, and products exist in the database?
-- 2.what is the average price, buy price, MSRP per vendor?
-- 3.what is the average price, buy price, MSRP per customer?
-- 4.what product was sold the most?
-- 5.how much money was made between buyPrice and MSRP?
-- 6.which vendor sells 1966 Shelby Cobra?
SELECT productVendor, productName
FROM classicmodels.products
WHERE productName LIKE '%1966 Shelby Cobra%';
-- 7.which vendor sells more products?
-- 8.which product is the most and least expensive?
SELECT MSRP, productName 
FROM classicmodels.products
ORDER BY MSRP DESC
LIMIT 1;
SELECT MSRP, productName 
FROM classicmodels.products
ORDER BY MSRP ASC
LIMIT 1;
-- 9.which product has the most quantityInStock?
SELECT quantityInStock, productName 
FROM classicmodels.products
ORDER BY quantityInStock DESC
LIMIT 1;
-- 10.list all products that have quantity in stock less than 20
SELECT productName, quantityInStock
FROM classicmodels.products
WHERE quantityInStock < 20;
-- 11.which customer has the highest and lowest credit limit?
SELECT creditLimit, customerName
FROM classicmodels.customers
ORDER BY creditLimit DESC
LIMIT 1;
SELECT creditLimit, customerName
FROM classicmodels.customers
ORDER BY creditLimit ASC, customerName
LIMIT 1;
-- 12.rank customers by credit limit
-- 13.list the most sold product by city
-- 14.customers in what city are the most profitable to the company?
SELECT c.customerName, c.city, p.amount 
FROM classicmodels.customers c 
JOIN classicmodels.payments p
ON c.customerNumber = p.customerNumber
ORDER BY p.amount DESC
LIMIT 1;
-- 15.what is the average number of orders per customer?
-- 16.who is the best customer?
SELECT c.customerName, c.city, p.amount 
FROM classicmodels.payments p  
JOIN classicmodels.customers c
ON p.customerNumber = c.customerNumber
ORDER BY p.amount DESC
LIMIT 1;
-- 17.customers without payment
SELECT c.customerName, c.city, p.amount 
FROM classicmodels.customers c 
LEFT JOIN classicmodels.payments p
ON c.customerNumber = p.customerNumber
WHERE p.amount IS NULL;
-- 18.what is the average number of days between the order date and ship date?
-- 19.sales by year
-- 20.how many orders are not shipped?
-- 21.list all employees by their (full name: first + last) in alpabetical order
SELECT CONCAT(contactFirstName, ' ', contactLastName) as Name
FROM classicmodels.customers
ORDER BY Name;
-- 22.list of employees  by how much they sold in 2003?
-- 23.which city has the most number of employees?
-- 24.which office has the biggest sales?

-- Part #2  -- library_simple database
-- 1.find all information (query each table seporately for book_id = 252)
SELECT * FROM library_simple.author a
JOIN library_simple.author_has_book ab
ON a.id = ab.author_id
WHERE ab.book_id = 252;

SELECT * FROM library_simple.author_has_book
WHERE book_id = 252;

SELECT * FROM library_simple.book
WHERE id = 252;

SELECT * FROM library_simple.category c
JOIN library_simple.category_has_book cb
ON c.id = cb.category_id
WHERE cb.book_id = 252;

SELECT * FROM library_simple.category_has_book
WHERE book_id = 252;

SELECT * FROM library_simple.copy
WHERE book_id = 252;

SELECT * FROM library_simple.issuance i
JOIN library_simple.copy c
ON i.copy_id = c.id
WHERE c.book_id = 252;

SELECT i.id, i.copy_id, i.issue_date, i.release_date, i.deadline_date, 
c.book_id, c.number, c.admission_date, 
CONCAT(r.first_name, ' ', r.last_name) AS 'Reader name', r.reader_num
FROM library_simple.issuance i
JOIN library_simple.copy c
ON i.copy_id = c.id
JOIN library_simple.reader r
ON i.reader_id = r.id
WHERE c.book_id = 252;

-- 2.which books did Van Parks write?
SELECT b.name, CONCAT(a.first_name, ' ', a.last_name) as Author
FROM library_simple.author_has_book ab
JOIN library_simple.book b
ON ab.book_id = b.id
JOIN library_simple.author a
ON ab.author_id = a.id
WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Van Parks';

-- 3.which books where published in 2003?
SELECT b.name, b.pub_year, GROUP_CONCAT(CONCAT (a.first_name, ' ', a.last_name)) as author
FROM library_simple.author a
JOIN library_simple.author_has_book ab
ON a.id = ab.author_id
JOIN library_simple.book b
ON ab.book_id = b.id
WHERE b.pub_year = 2003
GROUP BY b.name;