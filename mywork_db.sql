CREATE DATABASE mywork;

CREATE TABLE mywork.EMPLOYEE_TEST (
EMPLOYEE_ID int not null,
FIRST_NAME varchar (75),
LAST_NAME varchar (75),
ADDRESS varchar (100),
CITY varchar (30),
STATE  varchar (20),
ZIP_CODE varchar (20),
PHONE varchar (25),
COUNTRY varchar (50),
HIREDATE date,
SALARY decimal (6,2),
PRIMARY KEY (EMPLOYEE_ID));

CREATE TABLE mywork.emp (
empno INT (10) NOT NULL,
ename VARCHAR(10) DEFAULT NULL,
job VARCHAR(9) DEFAULT NULL,
mgr INT(10) DEFAULT NULL,
hiredate DATE,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT (10),
 PRIMARY KEY (empno));
 
 insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4);
    
insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (2,'HARDING','MANAGER',9,'1990-12-17',52000,300,3),
	(3,'TAFT','SALES I',2,'1995-12-17',25000,500,3),
    (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
    (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
    (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
    (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
    (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
    (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
    (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
    (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);
    
CREATE TABLE IF NOT EXISTS mywork.dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13),
 PRIMARY KEY (deptno));