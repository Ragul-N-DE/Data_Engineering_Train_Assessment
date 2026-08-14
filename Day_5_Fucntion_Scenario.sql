Create database Day5_FunctionScenario;

Create Table Day5_FunctionScenario.Employee(
Emp_ID INTEGER,
Emp_Name Varchar(100),
Department Varchar(50),
Salary Decimal(10,2));

Select * from Day5_FunctionScenario.Employee;

Insert into Day5_FunctionScenario.Employee(Emp_ID,Emp_Name,Department,Salary)
Values(1,'Ragul','HR',55000),
(2,'Priya','Finance',42000),
(3,'Arjun','IT',55000),
(4,'Sneha','Marketing',40000),
(5,'Vishal','Sales',38000),
(6,'Meena','Operations',45000),
(7,'Karthik','IT',47000),
(8,'Divya','HR',36000);

Select * from Day5_FunctionScenario.Employee;

Select 	Sum(Salary) as Total_Monthly_Salary_Expense
from Employee;

-- Scenario 2 - Student average marks report

Create table Day5_FunctionScenario.student(
Student_ID integer,
Student_Name Varchar(100),
Course Varchar(50),
Marks Integer);

Select * from Day5_FunctionScenario.student;

Insert into Day5_FunctionScenario.student(Student_ID,Student_Name,Course,Marks)
Values (1,'Arjun','SQL',85),
(2,'Priya','SQL',78),
(3,'Karthik','SQL',92),
(4,'Meena','SQL',74),
(5,'Ramesh','SQL',88),
(6,'Sneha','SQL',81),
(7,'Varun','SQL',69),
(8,'Divya','SQL',95),
(9,'Sanjay','SQL',77),
(10,'Kaviya','SQL',83);

Select * from Day5_FunctionScenario.student;

Select avg(Marks) as Average_Marks from Day5_FunctionScenario.student
where course = 'SQL';

-- Scenario 3 - Product Price Analysis

Create table Day5_FunctionScenario.product(
Product_ID integer,
Product_Name Varchar(100),
Category Varchar(50),
Price Decimal(10,3));

Select * from Day5_FunctionScenario.Product;

Insert into Day5_FunctionScenario.Product(	Product_ID,Product_Name,Price,Category)
Values(1,'Laptop',54999.75,'Electronics'),
(2,'Headphones',1499.40,'Electronics'),
(3,'Coffemaker',3499.80,'Home'),
(4,'Shoes',1999.10,'Fashion'),
(5,'Smartwatch',9999.50,'Electronics'),
(6,'Backpack',799.60,'Accessories'),
(7,'Microwave',7499.25,'Home'),
(8,'Sunglasees',1299.90,'Fashion');

Select * from Day5_FunctionScenario.Product;

Select  max(Price) as Most_Expensive_Price,
min(Price) as Least_Expensive_Price from Day5_FunctionScenario.Product;

-- Scenario Customer Registration Report 

Create table Day5_FunctionScenario.Customer(
Customer_ID Integer,
Customer_Name Varchar(100),
Mobile_No Varchar(15),
City Varchar(50));

Select * from Day5_FunctionScenario.customer;

Insert into Day5_FunctionScenario.customer(Customer_ID,Customer_Name,Mobile_No,City)
Values (1,'Arjun',9876543210,'Chennai'),
(2,	'Priya',9123456780,'Bangalore'),
(3,'Karthik',9988776655,'Hyderabad'),
(4,'Meena',9876501234,'Mumbai'),
(5,	'Ramesh',9123409876,'	Delhi'),
(6,	'Sneha',9988123456,'	Pune'),
(7,	'Varun',	9876123450	,'Kolkata'),
(8,	'Divya',	9123987654	,'Coimbatore'),
(9,	'Sanjay',	9988001122,'	Jaipur'),
(10,	'Kavya',	9876009988	,'Kochi');

Select * from Day5_FunctionScenario.customer;

Select count(*) as Total_Customer from Day5_FunctionScenario.customer;

-- Scenario 5 Company Salary Dashboard

Create table Day5_FunctionScenario.Company(
Emp_ID integer,
Emp_Name Varchar(100),
Department Varchar(50),
Salary Decimal(10,2));

Select * from Day5_FunctionScenario.Company;

Insert into Day5_FunctionScenario.Company(Emp_ID,Emp_Name,Department,Salary)
Values (1,'Arjun','IT',	55000.00),
(2	,'Priya','HR',42000.00),
(3,'Karthik','Finance',60000.00),
(4,	'Meena','IT',48000.00),
(5,	'Ramesh','Sales',45000.00),
(6,	'Sneha','Marketing',52000.00),
(7,	'Varun','Finance',70000.00),
(8,	'Divya','HR',39000.00),
(9,	'Sanjay','Sales',46000.00),
(10,'Kavya','IT',58000.00);

Select * from Day5_FunctionScenario.Company;

Select Count(*) as Total_Employees,
sum(Salary) as Total_Salary_Paid,
avg(Salary) as Average_Salary,
max(Salary) as Highest_Salary,
min(Salary) as Lowest_Salary from Day5_FunctionScenario.Company;

