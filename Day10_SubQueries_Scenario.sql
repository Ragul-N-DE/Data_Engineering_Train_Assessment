Create database Day10_SubQueries_Scenario;

use Day10_SubQueries_Scenario;

-- scenario -- Above Department Average

/*The HR department wants to identify employees who earn more than the average salary of 
their own department. 
Display the Employee ID, Employee Name, Department, and Salary. 
Sort the result by Salary in descending order. */

select Emp_ID,Emp_Name,department,salary
from employee e
where 
salary > ( select Avg(Salary)
from employee
where Department = e.Department)
order by Salary Desc;

-- Scenario 2 -  Highest paid Employee In Each Department 

/*The management wants to identify the employee(s) who receive the highest salary in each 
department. 
Display the Employee Name, Department, Salary, and Experience. 
Arrange the result in descending order of Salary. */

Select Emp_Name, Department, Salary, Experience
from employee E
where Salary =
( select Max(salary) 
from Employee
where department = E.Department
group by E.Department
order by salary Desc);

-- Scenario 3 - Customers with Highest Order Amount

/*An e-commerce company wants to identify customers who placed the highest-value order. 
Display the Customer Name, City, Order ID, and Order Amount. 
Arrange the report alphabetically by Customer Name. */
-- Table 

Select 
c.Customer_name,
c.City,
o.Order_Id,
o.Order_Amount
from Customer c
Join 
orders o on C.Customer_ID = O.Customer_ID
where
o.Order_Amount = (Select max(Order_Amount) from orders)
order by C.Customer_Name Asc;


-- Scenario 4 - Employee Working in Departments with more than three Employees

/* The HR department wants to generate a report of employees who work in departments having 
more than three employees. 
Display the Employee Name, Department, Salary, and Age. 
Sort the result by Department and then by Salary in descending order. */

SELECT
Emp_Name,
Department,
Salary,
Age
FROM Employees
WHERE Department IN (
    SELECT Department 
    FROM Employees 
    GROUP BY Department 
    HAVING COUNT(Emp_ID) > 3
)
ORDER BY Department, Salary DESC;

-- Scenario 5 - Prodcuts Never Ordered Scenario

/* An online shopping company wants to identify products that have never been ordered. 
Display the Product ID, Product Name, Category, and Price. 
Sort the report by Product Name. */

SELECT 
    p.Product_ID,
    p.Product_Name,
    p.Category,
    p.Price
FROM Product p
WHERE p.Product_ID NOT IN (
    SELECT DISTINCT oi.Product_ID
    FROM Order_Items oi
)
ORDER BY p.Product_Name;

-- Scenario 6 - Employees matching Department and experience

/* The HR team wants to identify employees whose Department and Experience match the 
Department and Experience of employees working in the Finance department. 
Display the Employee Name, Department, Experience, and Salary. 
Arrange the report by Experience in descending order. */
-- Table Name Employe

SELECT 
    Emp_Name, 
    Department, 
    Experience, 
    Salary
FROM Employe
WHERE Experience IN (
    SELECT DISTINCT Experience 
    FROM Employe 
    WHERE Department = 'Finance'
)
ORDER BY Experience DESC;

-- Scenario 7 -- Employees reporting to the Manager with the Highest salary 

/* The company wants to identify employees who report directly to the manager who receives the 
highest salary in the organization.
Display the Employee Name, Manager ID, Department, and Salary.
Sort the report by Employee Name.*/
-- Table name Employeee

SELECT 
    Emp_Name, 
    Manager_ID, 
    Department, 
    Salary
FROM Employeee
WHERE Manager_ID = (
    SELECT Emp_ID 
    FROM Employeee 
    WHERE Emp_ID IN (SELECT DISTINCT Manager_ID FROM Employeee WHERE Manager_ID IS NOT NULL)
    ORDER BY Salary DESC
    LIMIT 1
)
ORDER BY Emp_Name ASC;
