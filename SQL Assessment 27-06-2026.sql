Create database Scenario;

-- Scenario 1 Employee Management system

use Scenario;

create table scenario.Employee(
Emp_ID integer,
Emp_Name Varchar(50),
Department Varchar(30),
Salary integer);

select * from Scenario.Employee;

insert into Scenario.Employee(Emp_ID,Emp_Name,Department,Salary)
values (101.,'John','IT',45000),
(102,'Mary','HR',35000),
(103,'David','Finance',55000),
(104,'Sam','IT',40000)
(105,'priya','HR',38000);

select * from Scenario.Employee;

-- Scenario 2 - College Student Database

Create table scenario.student(
StudentID integer,
Student_Name Varchar(50),
Course Varchar(30));

select * from scenario.student;

insert into scenario.student(StudentID,Student_Name,Course)
values (1,'Rahul','SQL'),
(2,'Priya','Python'),
(3,'Arun','Power BI'),
(4,'Sneha','Java'),
(5,'Karthik','SQL');

select * from scenario.student;

alter table Scenario.student
add email varchar(50);

select *from Scenario.student;

-- Scenario 3 Online Shopping system

create table scenario.product(
ProductID integer,
ProductName varchar(50),
price integer);

select * from scenario.product;

insert into scenario.product(ProductID,ProductName,Price)
Values(101,'laptop',60000),
(102,'mouse',800),
(103,'keyboard',1200),
(104,'Monitor',15000),
(105,'Printer',9000);

select * from scenario.product;

Update scenario.product
set Price=1500 where ProductID = 103;

select * from scenario.product;

-- Scenario 4 Hospital Database

create table Scenario.Patient(
PatientID integer,
PatientName varchar(50),
Disease Varchar(50));

Select * from scenario.patient;

insert into scenario.patient(PatientID,PatientName,Disease)
Values(1,'Ramesh','Fever'),
(2,'Suresh','Cold'),
(3,'Anitha','Diabetes'),
(4,'Meena','Asthma'),
(5,'Kumar','Typhoid');

Select * from scenario.patient;

Delete from Scenario.Patient
where PatientID=2;

Select * from scenario.patient;

-- Scenario 5 School Management System

create table Scenario.EventRegistration(
StudentID integer,
StudentName Varchar(50),
EventNAme varchar(50));

Select * from Scenario.Eventregistration;

Insert into Scenario.Eventregistration(StudentID,StudentName,EventName)
Values(1,'Rahul','Dance'),
(2,'Priya','Singing'),
(3,'Arun','Drawing'),
(4,'Sneha','Quiz'),
(5,'Karthik','Drama');

Select * from Scenario.EventRegistration;

Truncate table Scenario.EventRegistration;

Select * from Scenario.EventRegistration;

-- Scenario 6 Company Database

Create table Scenario.Employee01(
EmpID integer,
EmpName Varchar(30),
Salary integer);

Select * from Scenario.Employee01;

insert into Scenario.Employee01(EmpID,EmpName,Salary)
Values(101,'John',45000),
(102,'Mary',35000),
(103,'David',50000),
(104,'Sam',42000),
(105,'Priya',39000);

Select * from Scenario.Employee01;

rename table scenario.Employee01 to scenario.Staff;

Select * from Scenario.staff;

-- Scenario 7 Banking System

Create table Scenario.Account(
AccountNO Integer,
CustomerName Varchar(50),
Balance Integer);

Select * from scenario.account;

Insert into Scenario.Account(AccountNo,CustomerName,Balance)
Values(1001,'John',50000),
(1002,'Mary',30000),
(1003,'David',70000),
(1004,'Sam',45000),
(1005,'Priya',60000);

Select * from Scenario.Account;

Update Scenario.Account
set Balance=35000
where AccountNo=1002;

Commit;

Select * From Scenario.Account;

-- Scenario 8 Library Management System

Create table Scenario.Book(
BookID INT,
BookName Varchar(50),
Author Varchar(50));

Select * from Scenario.Book;

Insert into Scenario.Book(BookID,BookName,Author)
Values(1,'SQL Basics','James'),
(2,'Python Guide','Robert'),
(3,'Java Programming','John'),
(4,'Power BI','David'),
(5,'Data Science','Peter');

Select * From Scenario.book;

Delete from Scenario.book where BookID=3;
rollback;

Select * From Scenario.book;

-- Scenario 9 Company Security

Select * from Scenario.Employee;

Create user Student1 @Localhost;

grant select
on Scenario.Employee
To Student1;

Select * from Scenario.Employee;

-- Scenario E-Commerce Database

Create Table Scenario.CustomerDetails2026(
CustomerID integer,
CustomerName Varchar(30),
City Varchar(30));

Select * From Scenario.CustomerDetails2026;

Insert into Scenario.CustomerDetails2026(CustomerID,CustomerName,City)
Values(1,'John','Chennai'),
(2,'Mary','Bangalore'),
(3,'David','Hydrebad'),
(4,'Sam','Coimbatore'),
(5,'Priya','Madurai');

Select * From Scenario.CustomerDetails2026;

Drop table Scenario.CustomerDetails2026;