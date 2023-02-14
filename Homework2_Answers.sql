-- Homework #2
-- show all customers in Australia
SELECT * FROM classicmodels.customers
WHERE country = 'Australia';
-- show First and Last name of customers in Melbourne
SELECT contactFirstName as 'First name', contactLastName as 'Last name'
FROM classicmodels.customers
WHERE city = 'Melbourne';
-- show all customers with Credit Limit over $200,000
SELECT * FROM classicmodels.customers
WHERE creditLimit >= 200000;
-- who is the president of the company?
SELECT firstName as 'First name', lastName as 'Last name', jobTitle as 'Job title'
FROM classicmodels.employees
WHERE jobTitle = 'President';
-- how many Sales Reps are in the company?
SELECT COUNT(*) FROM classicmodels.employees
WHERE jobTitle = 'Sales Rep';
-- show payments in descending order
SELECT * FROM classicmodels.payments
ORDER BY amount DESC;
-- what was the check# for the payment done on December 17th 2004
SELECT checkNumber, paymentDate FROM classicmodels.payments
WHERE paymentDate = '2004-12-17';
-- show product line with the word 'realistic' in the description
SELECT productLine, textDescription 
FROM classicmodels.productlines
WHERE textDescription LIKE '%realistic%';
-- show product name for vendor 'Unimax Art Galleries'
SELECT productName, productVendor
FROM classicmodels.products
WHERE productVendor = 'Unimax Art Galleries';
-- what is the customer number for the highest amount of payment
SELECT customerNumber, amount
FROM classicmodels.payments
WHERE amount = (SELECT MAX(amount) FROM classicmodels.payments);
-- Save your work in Homework2_Answers.sql