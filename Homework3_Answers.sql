-- Homework #3  
-- Part 1 - mywork database
-- 1. Add column 'country' to dept table in mywork database
ALTER TABLE mywork.dept
ADD COLUMN country VARCHAR(20);
-- 2. Rename column 'loc' to 'city'
ALTER TABLE mywork.dept 
RENAME COLUMN loc TO city; 
-- 3. Add three more departments: HR, Engineering, Marketing
SELECT * FROM mywork.dept;
INSERT INTO mywork.dept (deptno, dname)
VALUES (5, 'HR'),
(6, 'Engineering'),
(7, 'Marketing');
-- 4. Write sql statement to show which department is in Atlanta
SELECT * FROM mywork.dept
WHERE city LIKE '%Atlanta%';
-- Save your work in Homework3_Answers.sql

-- Part 2  - library_simple database
-- Run library_simple.sql script  (takes a few minutes)
-- (source: https://github.com/amyasnov/stepic-db-intro/tree/2650f9a7f9c72e1219ea93cb4c4e410cca046e54 )

-- Look at table relationships in EER Diagram

-- 1. What is the first name of the author with the last name Swanson?
SELECT first_name, last_name 
FROM library_simple.author
WHERE last_name = 'Swanson';
-- 2. How many pages are in Men Without Fear book?
SELECT name, page_num
FROM library_simple.book
WHERE name = 'Men Without Fear';
-- 3. Show all book categories that start with with letter 'W'
SELECT name FROM library_simple.category
WHERE name LIKE 'W%';