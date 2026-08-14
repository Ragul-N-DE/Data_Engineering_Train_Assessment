create database Day9_Joins_Scenario;

use Day9_Joins_Scenario;

-- Scenario 1 - Employee Department Report
/*The HR department wants to generate a report showing employee details along with their 
department names. 
Display the Employee ID, Employee Name, Department Name, and Salary for employees 
who are assigned to a valid department. 
Sort the report by Salary in descending order. */
-- Table Name 1 Employee and Table name 2 Department

Select e.Emp_Id, e.Emp_Name, D.Department_Name, E.Salary
from Employee E
Inner join Department D on E.Department_Id = D.Department_Id
order by E.Salary desc;

-- Scenario 2 - Customer Without orders

/*An online shopping company wants to identify customers who have registered on the website but 
have not placed any orders. 
Display the Customer ID, Customer Name, City, and Order ID. 
Arrange the result in ascending order of Customer Name. */
-- Table name 1 Customer and Table name 2 Orders

select 
C.Customer_Id,
 C.Customer_Name,
 c.City,
 O.Order_Id
 from Customer c
 Left Join Orders o on C.Customer_ID = o.Customer_ID
 where o.Order_Id is null
 order by c.customer_Name asc;
 
 -- scenario 3 Department without employees
 
 /*The management wants to identify departments that currently have no employees assigned. 
Display the Department ID, Department Name, Employee ID, and Employee Name. 
Sort the result by Department Name. */
-- Table name 1 = Departments and Table name 2 = Employees


Select 
D.Department_ID, 
D.Department_name, 
E.Emp_Id,
E.Emp_Name 
from Department d
left Join Employee E on D.Department_ID = E.Department_Id
where E.Emp_ID is null
order by D.Department_name;

-- Scenario 4 - Prodcut Inventory Verification 

/*An inventory management team wants to compare the Product Master table with the 
Warehouse Stock table. 
Generate a report containing: 
• Products available in both tables 
• Products available only in the Product Master 
• Products available only in the Warehouse Stock 
Display the Product ID, Product Name, Warehouse Quantity. 
Sort the report by Product ID. */


SELECT 
COALESCE(pm.Product_ID, ws.Product_ID) AS Product_ID,
pm.Product_Name,
ws.Quantity AS Warehouse_Quantity,
CASE
WHEN pm.Product_ID IS NOT NULL AND ws.Product_ID IS NOT NULL THEN 'Available in Both'
WHEN pm.Product_ID IS NOT NULL AND ws.Product_ID IS NULL THEN 'Only in Product Master'
WHEN pm.Product_ID IS NULL AND ws.Product_ID IS NOT NULL THEN 'Only in Warehouse Stock'
END AS Availability_Status
FROM Product_Master pm
LEFT JOIN Warehouse_Stock ws ON pm.Product_ID = ws.Product_ID
UNION
SELECT 
COALESCE(pm.Product_ID, ws.Product_ID) AS Product_ID,
pm.Product_Name,
ws.Quantity AS Warehouse_Quantity,
CASE
WHEN pm.Product_ID IS NOT NULL AND ws.Product_ID IS NOT NULL THEN 'Available in Both'
WHEN pm.Product_ID IS NOT NULL AND ws.Product_ID IS NULL THEN 'Only in Product Master'
WHEN pm.Product_ID IS NULL AND ws.Product_ID IS NOT NULL THEN 'Only in Warehouse Stock'
END AS Availability_Status
FROM Product_Master pm
RIGHT JOIN Warehouse_Stock ws ON pm.Product_ID = ws.Product_ID
ORDER BY Product_ID;


-- Scenario 5 - Employee Reporting Heirarchy
/*A company wants to generate an organization hierarchy report. 
Display each Employee Name along with their Reporting Manager Name. 
Include employees even if they do not have a manager. 
Sort the report alphabetically by Employee Name. */

SELECT 
e.Emp_Name AS `Employee Name`,
COALESCE(m.Emp_Name, 'No Manager') AS `Reporting Manager Name`
FROM Employe e
LEFT JOIN Employe m ON e.Manager_ID = m.Emp_ID
ORDER BY e.Emp_Name ASC;