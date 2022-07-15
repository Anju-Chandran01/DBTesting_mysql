-- 1) SHOW DATABASES
show databases;

-- 2) CREATE DATABASE
create database abc;
show databases;

-- 3) SELECT DATABASE
use abc;

-- 4) DROP DATABASE
drop database abc;
show databases;

create database ABC_School;
show databases;
use ABC_School;


-- Tables & Views


-- 5) CREATE TABLE
create table students (
id int not null auto_increment primary key,
name varchar(50) not null, 
class int
);

create table stud (
id int not null auto_increment,
name varchar(50) not null, 
class int,
primary key (id)
);

-- 6) DROP TABLE
drop table stud;

create table stud (
id int not null auto_increment,
name varchar(50) not null, 
class int,
primary key (id)
);

-- removes particular data
insert into stud values(1,'anju','3'), (2,'vismaya',2);
delete from stud where (id=1);
select * from stud;

-- DELETE WITHOUT CONDITION
-- deletes all rows from the table
delete from stud;

-- TRUNCATE TABLE  -  delete all rows and free up space
truncate table stud;
select * from stud;

--- RENAME TABLE
rename table stud to studen;
desc studen;

-- ALTER TABLE by adding column
alter table studen add course varchar(50) not null;

-- ALTER TABLE by adding columns
alter table studen add (
address varchar(50) not null, 
marksObtained int not null);

-- ALTER TABLE by modify column definitions
alter table studen modify address varchar(500) not null;
desc studen;

-- ALTER TABLE DROP column
alter table studen drop Column course;
desc studen;

-- ALTER TABLE RENAME column
alter table studen rename column address to stud_address;
desc studen;
drop table students;

-- SHOW TABLES
show tables;
show full tables;

-- SHOW TABLES OF PARTICULAR DATABASES
show tables in abc_school;
show tables in demodb;
show tables from abc_school;

-- SHOW TABLES USING PATTERN MATCHING
show tables from abc_school like "stud%";

-- SHOW TABLES USING WHERE CONDITION
show full tables;
-- show tables from abc_school where Table_type="BASE TABLE"; ===================================== 

-- RENAME TABLE
use abc_school;
alter table studen rename to students_table;

-- NOT NULL CONSTRAINTS
create table teaching_staffs (Id integer, LastName text not null, FirstName text not null, Subject varchar(35), City varchar(35));
desc teaching_staffs;

insert into teaching_staffs values(1, 'Aswini', 'Deokate','Java', 'Pune'), (2, 'Manu', 'Prakash', 'Java', 'Mumbai'), (3, 'Vijaya', 'Kadiyala', 'CQA', 'Mumbai');
select * from teaching_staffs;
-- cannot insert null value in the place of not null constarint
insert into teaching_staffs values(3, 'Shanmukh', NULL, 'CQA', 'Pune');

-- UNIQUE constraints
use abc_school;
create table subjects (Id integer, SubjectName varchar(40) UNIQUE, StaffName varchar(30));
insert into subjects (Id,SubjectName,StaffName) values(1,'Java','Aswini'), (2, 'CQA', 'Vijaya');
-- cannot insert duplicate value for subject name
insert into subjects (Id,SubjectName,StaffName) values(1,'Java','Manu'), (2, 'CQA', 'Shanmukh');

-- CHECK Constraints
create table non_teaching_staffs(
	id int not null,
    name varchar(30) not null,
    age int check (age >= 18)
);
insert into non_teaching_staffs(id, name, age)   
values (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40); 
-- violation for check constraint
insert into non_teaching_staffs(id, name, age) values (1, 'Alfred', 13);

-- DEFAULT constraints
drop table non_teaching_staffs;
create table non_teaching_staffs(
	id int not null,
    name varchar(30) not null,
    age int not null,
    city varchar(30) default 'Delhi'
);
insert into non_teaching_staffs(id, name, age, city)
values (1, 'Robert', 40, 'Pune'), (2, 'Alferd', 39, 'Mumbai'), (1, 'Christina', 28, 'Pune');
insert into non_teaching_staffs(id, name, age) values (1, 'Ann Mariya', 21);
select * from non_teaching_staffs;

-- PRIMARY KEY constraints
drop table non_teaching_staffs;
create table non_teaching_staffs(
	id int not null primary key,
    name varchar(30) not null,
    age int,
    city varchar(30)
);
insert into non_teaching_staffs(id, name, age, city)
values (1, 'Robert', 40, 'Pune'), (2, 'Alferd', 39, 'Mumbai'), (3, 'Christina', 28, 'Pune');
-- duplicate entry for primary key is not possible
insert into non_teaching_staffs(id, name, age, city)values (1, 'Ann', 20, 'Pune');

-- AUTO INCREMENT constraints
drop table non_teaching_staffs;
create table non_teaching_staffs(
	id int not null auto_increment,
    name varchar(30) not null,
    primary key (id)
);
insert into non_teaching_staffs (name) values ('Robert'), ('Alferd');
select * from non_teaching_staffs;

-- ENUM constraints
 create table stud_uniforms (    
    id int primary key auto_increment,     
    stud_name varchar(35),     
    uniform_size enum('small', 'medium', 'large', 'x-large')    
);  
insert into stud_uniforms (id, stud_name, uniform_size)     
values (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'); 
select * from stud_uniforms;

-- INDEX constraints
CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    name VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
);
INSERT INTO Shirts(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large');
CREATE INDEX idx_name ON Shirts(name);  
SELECT * FROM Shirts USE INDEX(idx_name);

-- FOREIGN KEY constraints
drop table students;
drop table classes;
create table students (
	id int not null auto_increment,
	name varchar(50) not null, 
	class int,
	primary key (id)
);
create table classes (
	class_id int not null primary key auto_increment,
	class_name varchar(50) not null,
	class_div varchar(5) not null,
    stud_id int not null,
	foreign key(stud_id) references students(id)
);

-- INSERT Record
use abc_school;
insert into students values(1,'anju','3'), (2,'vismaya',2);
select * from students;

-- UPDATE Record
update students set name = 'athira' where (id = 1);
select * from students;

-- UPDATE Record using replace
update students set class = replace(class,3,2) where id = 1; 
select * from students;

-- DELETE Record
delete from students where id = 2;
select * from students;

-- DELETE Record with LIMIT
insert into students values (6,'Arya',2), (2,'Amaya',3), (3,'Aswathy',2), (4,'Arsthi',2), (5,'Anu',3);
select * from students;
delete from students order by name limit 3;
select * from students;

-- SELECT ALL ROWS FROM ALL FIELDS OF TABLE
use abc_school;
create table students (
id int not null auto_increment primary key,
name varchar(50) not null, 
class int,
subject varchar(50) not null,
marks_obtained int not null
);
insert into students values
(1,'Anju',2,'cryptography',66), 
(2,'Asim',2,'cryptography',77),
(3,'Aswin',2,'cryptography',88),
(4,'Athira',2,'cryptography',99),
(5,'Vismaya',2,'cryptography',100);
select * from students;

-- SELECT PARTICULAR COLUMNS ONLY
select name, marks_obtained from students;

-- SELECT USING WHERE CLAUSE
select * from students where (marks_obtained > 80);

-- USING GROUPBY AND COUNT
select count(name), subject from students group by (subject); 

-- SQL SELECT Statement with HAVING clause


-- REPLACE 
use abc_school;
CREATE TABLE HODs (  
  ID int AUTO_INCREMENT PRIMARY KEY,  
  Name varchar(45) DEFAULT NULL,  
  Email varchar(45) DEFAULT NULL UNIQUE,  
  City varchar(25) DEFAULT NULL  
);  
INSERT INTO HODs(ID, Name, Email, City)   
VALUES (1,'Mike', 'mike@javatpoint.com', 'California'),   
(2, 'Alexandar', 'alexandar@javatpoint.com', 'New York'),   
(3, 'Adam', 'adam@javatpoint.com', 'Los Angeles'),  
(4, 'Peter', 'Peter@javatpoint.com', 'Alaska');  
REPLACE INTO HODs (id, city)  
VALUES(4,'Amsterdam'); 
select * from HODs;

-- REPLACE statement to update a row
REPLACE INTO HODs  
SET ID = 1,  
    Name = 'Mike',  
    City = 'Birmingham';
select * from HODs;

-- REPLACE to insert data from select
REPLACE INTO HODs(Name, City)  
SELECT Name, City   
FROM HODs WHERE id = 2; 
select *from HODs;

-- On insert if duplicacy occurs update the key
CREATE TABLE Student (  
  Stud_ID int AUTO_INCREMENT PRIMARY KEY,  
  Name varchar(45) DEFAULT NULL,  
  Email varchar(45) DEFAULT NULL,  
  City varchar(25) DEFAULT NULL  
);  
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (1,'Stephen', 'stephen@javatpoint.com', 'Texax'),   
(2, 'Joseph', 'Joseph@javatpoint.com', 'Alaska'),   
(3, 'Peter', 'Peter@javatpoint.com', 'california');  
SELECT * FROM Student;  
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (4,'John', 'john@javatpoint.com', 'New York');  
SELECT * FROM Student;
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (4, 'John', 'john@javatpoint.com', 'New York')  
ON DUPLICATE KEY UPDATE City = 'California';   
SELECT * FROM Student;

-- INSERT IGNORE
drop table student;
CREATE TABLE Student (  
  Stud_ID int AUTO_INCREMENT PRIMARY KEY,  
  Name varchar(45) DEFAULT NULL,  
  Email varchar(45) NOT NULL UNIQUE,  
  City varchar(25) DEFAULT NULL  
); 
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (1,'Stephen', 'stephen@javatpoint.com', 'Texax'),   
	(2, 'Joseph', 'Joseph@javatpoint.com', 'Alaska'),   
	(3, 'Peter', 'Peter@javatpoint.com', 'california');  
SELECT * FROM Student;  
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (4,'Donald', 'donald@javatpoint.com', 'New York'),   
(5, 'Joseph', 'Joseph@javatpoint.com', 'Chicago');  -- creates error because vilates unique constraint
-- if we use ignore
INSERT IGNORE INTO Student(Stud_ID, Name, Email, City)   
VALUES (4,'Donald', 'donald@javatpoint.com', 'New York'),   
(5, 'Joseph', 'Joseph@javatpoint.com', 'Chicago'); -- creates warning and one row affected

-- INSERT IGNORE AND STRICT
CREATE TABLE Test (  
    ID int AUTO_INCREMENT PRIMARY KEY,  
    Name varchar(5) NOT NULL  
);  
INSERT INTO Test(Name)  
VALUES ('Peter'), ('John');  
select * from Test;
INSERT INTO Test(Name) VALUES ('Stephen');  
INSERT IGNORE INTO Test(Name) VALUES ('Stephen');  
select * from Test;

-- INSERT INTO SELECT
CREATE TABLE person (    
  id int AUTO_INCREMENT PRIMARY KEY,    
  name varchar(45) NOT NULL,    
  email varchar(45) NOT NULL,    
  city varchar(25) NOT NULL    
);  
INSERT INTO person (id, name, email, city)     
VALUES (1,'Stephen', 'stephen@javatpoint.com', 'Texas'),     
(2, 'Joseph', 'Joseph@javatpoint.com', 'Alaska'),     
(3, 'Peter', 'Peter@javatpoint.com', 'Texas'),  
(4,'Donald', 'donald@javatpoint.com', 'New York'),     
(5, 'Kevin', 'kevin@javatpoint.com', 'Texas'); 
SELECT * FROM person; 
SELECT name, email, city  
FROM person  
WHERE city = 'Texas'; 
CREATE TABLE person_info (    
  person_id int AUTO_INCREMENT PRIMARY KEY,    
  person_name varchar(45) NOT NULL,    
  email varchar(45) NOT NULL,    
  city varchar(25) NOT NULL    
);
INSERT INTO person_info (person_name, email, city)  
SELECT name, email, city  
FROM person  
WHERE city = 'Texas';  
INSERT INTO person_info Table person;  
select * from person_info;

-- WHERE CLAUSE
SELECT * FROM students WHERE name = 'Arya';  
SELECT * FROM students WHERE name = 'Arya' AND class = 2;  
SELECT * FROM students WHERE name = 'Arya' OR id = 5;
SELECT * FROM students WHERE (name = 'Arya' AND class = 2) OR (id = 1);  

-- DISTINCT CLAUSE
SELECT DISTINCT class FROM students;  
SELECT DISTINCT class, name FROM students;

-- FROM CLAUSE
insert into students values (2, 'Amaya', 3), (4, 'Anujith', 4), (5, 'Adarsh', 3), (7, 'Aarathi', 3), (8, 'Ashish', 5);
select * from students;

-- ORDER BY CLAUSE
SELECT * FROM students WHERE id > 2 ORDER BY id ASC; 
SELECT * FROM students WHERE id > 2 ORDER BY id DESC; 
SELECT * FROM students WHERE id > 2 ORDER BY id ASC, class DESC; 

-- GROUP BY CLAUSE
SELECT name, COUNT(*) FROM students GROUP BY class;  
CREATE TABLE Employees (id int not null primary key auto_increment, emp_name varchar(30) not null, working_hours int not null);
insert into Employees values(1, 'Madhav', 4), (2, 'Harsh', 8), (3, 'Karan', 4), (4, 'Kishore', 4), (5, 'Kunthavi', 4); 
SELECT emp_name, SUM(working_hours) AS "Total working hours" FROM employees GROUP BY working_hours; 
SELECT emp_name, MIN(working_hours) AS "Minimum working hour" FROM employees GROUP BY working_hours;  
SELECT emp_name, MAX (working_hours) AS "Maximum working hour" FROM employees GROUP BY working_hours;

-- HAVING Clause
SELECT emp_name, SUM(working_hours) AS "Total working hours" FROM employees GROUP BY emp_name HAVING SUM(working_hours) > 4;

-- IF condition
SELECT IF(200>350,'YES','NO');  
SELECT IF(251 = 251,' Correct','Wrong');  
SELECT IF(STRCMP('Ricky Ponting','Yuvraj Singh')=0, 'Correct', 'Wrong'); 
SELECT name, IF(class > 2 ,"Mature","Immature")As Result FROM students;  

-- IFNULL Condition
SELECT IFNULL(0,5);  
SELECT IFNULL("Hello", "javaTpoint");  
SELECT IFNULL(NULL,5);  
CREATE TABLE student_contacts (  
  studentid int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  contactname varchar(45) NOT NULL,  
  cellphone varchar(20) DEFAULT NULL,  
  homephone varchar(20) DEFAULT NULL
  ); 
SELECT contactname, cellphone, homephone FROM student_contacts;  

-- NULLIF Condition
SELECT NULLIF("Anju", "Anju");   
SELECT NULLIF("Hello", "111");  
SELECT NULLIF(9,5);  
SELECT 1/NULLIF(0,0);  
CREATE TABLE customers (  
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,  
  cust_name VARCHAR(45) NOT NULL,  
  occupation VARCHAR(45) NOT NULL,  
  income VARCHAR(15) NOT NULL,  
  qualification VARCHAR(45) NOT NULL  
);  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('John Miller', 'Developer', '20000', 'Btech');  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('Mark Robert', 'Enginneer', '40000', 'Btech');  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('Reyan Watson', 'Scientists', '60000', 'MSc');  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('Shane Trump', 'Businessman', '10000', 'MBA');  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('Adam Obama', 'Manager', '80000', 'MBA');  
INSERT INTO abc_school.customers (cust_name, occupation, income, qualification) VALUES ('Rincky Ponting', 'Cricketer', '200000', 'Btech');
SELECT * FROM customers;  
SELECT cust_name, occupation, qualification, NULLIF (qualification,"Btech") result FROM abc_school.customers;  


-- CASE statement
SELECT CASE 3 WHEN 1 THEN 'one' WHEN 2 THEN 'two' ELSE 'more' END;  
SELECT CASE BINARY 'b' WHEN 'a' THEN 1 WHEN 'b' THEN 2 END; -- searched case
select * from students;
SELECT id, name,  
 CASE class   
    WHEN 2 THEN 'Computer Science'   
    WHEN 3 THEN 'Electronics and Communication'   
    ELSE 'No idea'   
END AS department from students;

-- LIKE condition
SELECT emp_name FROM employees WHERE emp_name LIKE 'K%';  
SELECT emp_name FROM employees WHERE emp_name LIKE 'K___n';   -- using _ wildcard
SELECT emp_name FROM employees WHERE emp_name NOT LIKE 'K%';   -- NOT operator

-- IN condition
select * from students;
SELECT * FROM students WHERE name IN ('Aswathy', 'Ashish', 'Arya');  
SELECT * FROM students WHERE name = 'Aswathy' OR name = 'Ashish' OR name = 'Arya'; -- same output but IN has min. number of code

-- ANY
CREATE TABLE table1 (  
    num_value INT  
);   
INSERT INTO table1 (num_value)   
VALUES(10), (20), (25);  
CREATE TABLE table2 (  
    num_val int  
);   
INSERT INTO table2 (num_val)  
VALUES(20), (7), (10);  
SELECT num_value FROM table1 WHERE num_value > ANY (SELECT num_val FROM table2);  

-- JOIN
use abc_school;
create table classes (
class_id int not null primary key auto_increment,
stud_id int not null,
class_name varchar(50) not null,
class_div varchar(5) not null
);
insert into classes values (1,'Tenth','B',2),(2,'Tenth','B',1),(3,'Tenth','A',1),(4,'Eighth','A',3),(5,'Seventh','A',2);
select * from classes;
select * from students;

-- Inner join or simple join
select students.name, classes.stud_id, students.class, classes.class_id, classes.class_name
from students left join classes
on students.id = classes.class_id;

-- Right outer join
select classes.class_name, classes.class_div, students.name, students.marks_obtained
FROM students 
RIGHT JOIN classes 
ON students.id = classes.class_id;  

select classes.class_name, classes.class_div, students.name, students.marks_obtained
FROM classes 
RIGHT JOIN students
ON students.id = classes.class_id;  

-- Left outer joins
select classes.class_name, classes.class_div, students.name, students.marks_obtained
FROM students 
LEFT JOIN classes 
ON students.id = classes.class_id;  

select classes.class_name, classes.class_div, students.name, students.marks_obtained
FROM classes 
LEFT JOIN students
ON students.id = classes.class_id;

-- Transaction
CREATE TABLE Transactions(
transactionId INT PRIMARY KEY,
transactionType VARCHAR(20) NOT NULL,
transactionAmount INT(45) NOT NULL);
desc Transactions;
INSERT INTO transactions VALUES (1,"IMPS",200),(2,"NEFT",250),(3,"NEFT",350);
SELECT * FROM Transactions;
START transaction;
insert into transactions values (4,"UPI",300);
select * from transactions;
rollback;
select * from transactions;
insert into transactions values (5,"UPI",300);
select * from transactions;
savepoint save1;
insert into transactions values (5,"RTGS",300);
rollback to savepoint save1;
select * from transactions;