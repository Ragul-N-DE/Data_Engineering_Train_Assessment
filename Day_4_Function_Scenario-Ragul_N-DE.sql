Create database DAY4_Functions_Scenario;

Create table DAY4_Functions_Scenario.Employee(
EmpID Integer,
EmpName Varchar (30),
Department Varchar (30),
Salary Decimal(10,2));

Select * from DAY4_Functions_Scenario.Employee;

Insert into DAY4_Functions_Scenario.Employee(EmpID, EmpName, Department, Salary)
Values(1,'ragul','HR', 3500000),
(2,'PRIYA','Finance',4200000),
(3,'Arjun','IT',5500000),
(4,'Sneha','Marketing',4000000),
(5,'vishal','Sales',3800000),
(6,'MEENA','Operations',450000);

select EmpID, UPPER(EmpName) as EmpName, Department, Salary from DAY4_Functions_Scenario.Employee;

-- Scenario 2 - PRODUCT PRICE CALCULATION

use DAY4_Functions_Scenario;

Create table DAY4_Functions_Scenario.ProductTable(
Product_ID integer primary key,
Product_Name Varchar(30),
Price decimal (10,2),
Category Varchar(30));

Select * from DAY4_Functions_Scenario.ProductTable;

Insert into DAY4_Functions_Scenario.ProductTable(Product_ID,Product_Name,Price,Category)
Values(1,'Laptop',54999.75,'Electronics'),
(2,'Headphones',1499.40,'Electronics'),
(3,'Coffemaker',3499.80,'Home'),
(4,'Shoes',1999.10,'Fashion'),
(5,'Smartwatch',9999.50,'Electronics'),
(6,'Backpack',799.60,'Accessories'),
(7,'Microwave',7499.25,'Home'),
(8,'Sunglasees',1299.90,'Fashion');

Select * from DAY4_Functions_Scenario.ProductTable;

Select 
Product_ID,
Product_Name,
Category, 
Price as original_Price,
Round(price) as Rounded_Price,
CEIl(price) as Ceiling_price,
Floor(price) as Floor_price from DAY4_Functions_Scenario.ProductTable;


-- Scenario 3 - Employee Joining Report

Create table DAY4_Functions_Scenario.EmployeeTable(
Emp_Id Integer,
Emp_Name Varchar(30),
Join_Date date,
Department Varchar(30));

select * from DAY4_Functions_Scenario.EmployeeTable;

Insert into DAY4_Functions_Scenario.EmployeeTable(Emp_ID,Emp_Name,Join_Date,Department)
Values (1,'Ragul','2020-01-15','HR'),
(2,'Priya','2019-03-22','Finance'),
(3,'Arjun','2021-11-05','IT'),
(4,'Sneha','2021-07-10','Marketing'),
(5,'vishal','2018-06-30','Sales'),
(6,'Meena','2023-02-18','Meena'),
(7,'karthik','2024-09-25','IT');

Select * from DAY4_Functions_Scenario.EmployeeTable;

Select 
Emp_Name,
Join_date,
Year(Join_date) as joining_Year,
Month(Join_date) as Joining_Month,
Day(Join_date) as Joining_Day from DAY4_Functions_Scenario.EmployeeTable;

-- Scenario 4 -  Customer Information Cleanup

Create table DAY4_Functions_Scenario.CustomerTable(
Customer_ID Integer,
Customer_name Varchar(30),
Mobile_No Varchar(15),
Email_ varchar(100));

Select * from DAY4_Functions_Scenario.CustomerTable;

Insert into DAY4_Functions_Scenario.CustomerTable(Customer_ID,customer_name,Mobile_no,Email_)
Values (1,'Ragul','6385439060','ragul@gog.com'),
(2,'priya','9176794562','priya@gog.com'),
(3,'Arjun','8994992331',Null),
(4,'Vishal',null,'Vishal@gog.com'),
(5,'Sneha','9843715039',null),
(6,'Meena','8442448434',null),
(7,'Karthik',Null,'Karthik@gog.com'),
(8,'Divya','9942200751',Null);

select * from DAY4_Functions_Scenario.CustomerTable;

Select 
customer_ID,
Customer_Name,
coalesce(mobile_no, 'no Mobile number') as Mobile_no,
Coalesce(Email_, 'No Email addreess') as Email_ from DAY4_Functions_Scenario.CustomerTable;

-- Scenario 5 - Student Performance Report

Create table DAY4_Functions_Scenario.Student_Table(
Student_ID Integer,
Student_Name Varchar(50),
Marks Integer,
Course Varchar(30));

select * from DAY4_Functions_Scenario.Student_Table;

Insert into DAY4_Functions_Scenario.Student_Table(Student_ID,Student_Name,Marks,Course)
Values(1,'Ragul',95,'Java'),
(2,'Priya',82,'Python'),
(3,'Arjun',67,'SQL'),
(4,'Sneha',45,'HTML'),
(5,'Vishal',76,'CSS'),
(6,'Meena',89,'Javascript'),
(7,'Karthik',53,'C++'),
(8,'Divya',38,'PHP'),
(9,'Sanjay',91,'DataScience'),
(10,'Anitha',60,'Networking');

Select * from DAY4_Functions_Scenario.Student_Table;

Select 
student_name,
marks,
Case
When Marks >= 90 Then 'Excellent'
When Marks >= 75 Then 'Good'
When Marks >= 50 Then 'Average'
Else 'Needs Improvement'
End as Performance_Status from DAY4_Functions_Scenario.Student_Table;

