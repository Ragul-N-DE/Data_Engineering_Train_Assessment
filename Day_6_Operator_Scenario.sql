Create Database Day_6_Operator_Scenario;

Create table Day_6_Operator_Scenario.Employee(
Emp_Id Int,
Emp_name varchar (100),
Department varchar(50),
Salary decimal(10,2),
Age integer );

INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Age) 
VALUES (1, 'Aaron Smith', 'IT', 85000.00, 28),
(2, 'Abigail Jones', 'HR', 62000.00, 32),
(3, 'Adam Taylor', 'Finance', 75000.00, 45),
(4, 'Alexander Brown', 'Marketing', 58000.00, 24),
(5, 'Alexis Wilson', 'Sales', 69000.00, 31),
(6, 'Amelia Miller', 'Operations', 71000.00, 29),
(7, 'Andrew Davis', 'IT', 92000.00, 35),
(8, 'Anna Garcia', 'HR', 63500.00, 27),
(9, 'Anthony Rodriguez', 'Finance', 88000.00, 41),
(10, 'Austin Martinez', 'Marketing', 61000.00, 33),
(11, 'Ava Hernandez', 'Sales', 67000.00, 26),
(12, 'Benjamin Lopez', 'Operations', 73000.00, 38),
(13, 'Blake Gonzalez', 'IT', 81000.00, 25),
(14, 'Brooke Wilson', 'HR', 64000.00, 30),
(15, 'Caleb Anderson', 'Finance', 79000.00, 44),
(16, 'Chloe Thomas', 'Marketing', 59500.00, 23),
(17, 'Christopher Moore', 'Sales', 68500.00, 36),
(18, 'Daniel Jackson', 'Operations', 74000.00, 40),
(19, 'David Martin', 'IT', 95000.00, 42),
(20, 'Dylan Lee', 'HR', 61500.00, 29),
(21, 'Elijah Perez', 'Finance', 82000.00, 37),
(22, 'Elizabeth Thompson', 'Marketing', 63000.00, 34),
(23, 'Emily White', 'Sales', 70000.00, 28),
(24, 'Emma Harris', 'Operations', 72500.00, 31),
(25, 'Ethan Sanchez', 'IT', 87000.00, 30),
(26, 'Gabriel Clark', 'HR', 65000.00, 46),
(27, 'Grace Ramirez', 'Finance', 84000.00, 39),
(28, 'Hannah Lewis', 'Marketing', 62500.00, 27),
(29, 'Henry Robinson', 'Sales', 71500.00, 33),
(30, 'Isaac Walker', 'Operations', 76000.00, 48),
(31, 'Jack Young', 'IT', 89000.00, 32),
(32, 'Jacob Allen', 'HR', 66000.00, 35),
(33, 'James King', 'Finance', 91000.00, 50),
(34, 'John Wright', 'Marketing', 64500.00, 26),
(35, 'Jonathan Scott', 'Sales', 72000.00, 29),
(36, 'Joseph Torres', 'Operations', 78000.00, 43),
(37, 'Joshua Nguyen', 'IT', 83000.00, 24),
(38, 'Liam Hill', 'HR', 67000.00, 31),
(39, 'Lucas Flores', 'Finance', 86000.00, 36),
(40, 'Luke Green', 'Marketing', 65000.00, 28),
(41, 'Madison Adams', 'Sales', 73500.00, 30),
(42, 'Matthew Nelson', 'Operations', 79500.00, 47),
(43, 'Michael Baker', 'IT', 94000.00, 41),
(44, 'Mia Hall', 'HR', 68000.00, 33),
(45, 'Nathan Rivera', 'Finance', 89500.00, 38),
(46, 'Noah Campbell', 'Marketing', 66000.00, 25),
(47, 'Oliver Mitchell', 'Sales', 74000.00, 34),
(48, 'Owen Carter', 'Operations', 81000.00, 42),
(49, 'Ryan Roberts', 'IT', 90500.00, 36),
(50, 'Sophia Gomez', 'Finance', 93000.00, 45)
(51, 'Alice Smith', NULL, 55000.00, 28),
(52, 'Bob Johnson', NULL, 72000.50, 34),
(53, 'Charlie Brown', NULL, 48000.00, 25),
(54, 'Diana Prince', NULL, 95000.00, 31),
(55, 'Evan Wright', NULL, 61000.00, 29),
(56, 'Fiona Gallagher', NULL, 52000.00, 27),
(57, 'George Clark', NULL, 68000.00, 40);

use Day_6_Operator_Scenario;

select * from  Day_6_Operator_Scenario.Employee;

-- Scenario 1 - Employee salary Revision report
/*A company is planning to provide a fixed salary increment of ₹5,000 to every employee. The HR 
department wants to generate a report showing both the current salary and the revised salary after 
the increment. 
Write a SQL query to generate the report. */

select Emp_Name,
 Salary,
 Salary + 5000 as Revised_Salary
 from Day_6_Operator_Scenario.Employee;

-- Scenario 2 - 	Employee Eligibility Report
/*The HR department wants to identify employees who belong to the Sales department and 
whose salary is greater than ₹45,000. 
Generate a report containing only employees who satisfy both conditions.*/


select *
from  Day_6_Operator_Scenario.employee
where department = 'Sales' and salary > (45000);

-- Scenario 3 - Department-wise Employee Search 

/*The management wants to retrieve employees who are working in either the HR department or 
the IT department. 
Generate a report displaying all matching employees.*/

select * from  Day_6_Operator_Scenario.Employee
where department in ('HR','IT');

-- Scenario 4 - Employee Name Pattern Search

/*The recruitment team wants to identify employees whose names start with the letter 'A' and 
employees whose names end with the letter 'n'. 
Write the required SQL queries to generate both reports. */

Select * 
from Day_6_Operator_Scenario.Employee
where Emp_Name like 'A%';

Select * 
from Day_6_Operator_Scenario.Employee
where Emp_Name like '%N';

-- Scenario 5 - Employee Data Validation Report

/*A company has migrated employee records from another system. During migration, some 
employees were assigned a department, while others were left without one. 
Generate the following reports: 
• Employees whose department information is missing. 
• Employees whose department information is available. */

Select * from Day_6_Operator_Scenario.Employee
where department is null;

Select * from Day_6_Operator_Scenario.Employee
where department is not null;