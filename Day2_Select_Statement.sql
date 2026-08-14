Create database Day2_Select_Statement;

use Day2_Select_Statement;


/* Scenario 1 - Employee Directory Report
Question : The result should display all five employee records along with EmpID, EmpName, Department, 
Salary, and City. */

Create table Employee (
EMPID int,
Empname Varchar(5),
Department varchar(8),
Salary DECIMAL(10,2),
City varchar(10));

Insert into Employee (EmpID, EmpName, Department, Salary, City) 
values (101,"John","IT",50000,"Chennai"),
 (102,"Mary","HR",35000,"Salem"),
(103,"David","Finance", 60000,"Trichy"),
(104,"Sam","IT",45000,"Chennai"),
(105,"Priya","HR",40000,"Banagalore");

-- Answer : 
Select * from Employee;

/* Scenario 2 - Finance Salary Report
Question : The result should display five rows containing only the EmpName and Salary columns for all employees. */

-- Answer : 
select EmpName, Salary from Employee;

/* Scenario 3 - Deprtment List
Question : The result should display only three department names: IT, HR, and Finance, with no duplicate values. */

-- Answer
Select distinct Department from Employee;

/* Scenario 4 - Employee Cities
Question : The result should display four unique city names: Chennai, Bangalore, Hyderabad, and Madurai. */

-- Answer
select distinct city from employee;

/* Scenario 5
Questions : The result should display only the first three employee records from the Employee table as a preview.*/

-- Answer
Select * from Employee Limit 3;