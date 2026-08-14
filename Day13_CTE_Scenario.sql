Create database Day13_CTE_Scenario;

use Day13_CTE_Scenario;

ALTER DATABASE Day13_CTE_Scenario
 Day12_CTE_Scenario;

-- Scenario 1 --  Department Salary Benchmark Analysis (Advanced)

/* The HR department wants to identify employees who are earning more than the average salary 
of their respective department. 
Additionally, management wants to include only those departments where the department's 
average salary is greater than the overall company average salary. 
Display the following details: 
• Employee ID 
• Employee Name 
• Department 
• Employee Salary 
• Department Average Salary 
• Company Average Salary 
Sort the result by: 
1. Department (Ascending) 
2. Employee Salary (Descending) */

with DeptAvg as (
  Select department,
  avg(Salary) as Dept_Avg_Salary
  from Employee
  group by Department),
CompanyAvg as (
 Select 
 Avg(salary) as Company_Avg_Salary
 from Employee)
Select 
  E.Emp_Id,
  E.Emp_Name,
  E.Department,
  E.salary As Employee_Salary,
  D.Dept_Avg_Salary,
  c.Company_Avg_Salary
from employee e
Join DeptAvg d
   on E.Department = D.Department
Cross join CompanyAvg C
  where E.salary > D.Dept_Avg_salary
  and D.dept_Avg_Salary > C.Company_Avg_Salary
  order by E.Department asc, E.salary Desc;
  
  -- Scenario 2 - Top Performing Customers analysis
  
  /* The Sales team wants to identify high-value customers based on their total purchase amount. 
Generate a report that displays only customers who satisfy all of the following conditions: 
• Their total purchase amount is greater than the average total purchase amount of all 
customers. 
• They have placed more than 3 orders. 
• Their latest order was placed in the current year. 
Display: 
• Customer ID 
• Customer Name 
• Total Orders 
• Total Purchase Amount 
• Latest Order Date 
Sort the report by: 
1. Total Purchase Amount (Descending) 
2. Total Orders (Descending)*/

WITH Customer_Aggregates AS (
    SELECT 
        Customer_ID,
        COUNT(Order_ID) AS Total_Orders,
        SUM(Order_Amount) AS Total_Purchase_Amount,
        MAX(Order_Date) AS Latest_Order_Date
    FROM Orders
    GROUP BY Customer_ID
),
Overall_Average AS (
    SELECT 
        AVG(Total_Purchase_Amount) AS Avg_Customer_Spend
    FROM Customer_Aggregates
)
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    ca.Total_Orders,
    ca.Total_Purchase_Amount,
    ca.Latest_Order_Date
FROM Customer_Aggregates ca
JOIN Customer c ON ca.Customer_ID = c.Customer_ID
CROSS JOIN Overall_Average oa
WHERE ca.Total_Purchase_Amount > oa.Avg_Customer_Spend             -- Rule 1
  AND ca.Total_Orders > 3                                         -- Rule 2
  AND EXTRACT(YEAR FROM ca.Latest_Order_Date) = EXTRACT(YEAR FROM CURRENT_DATE) -- Rule 3
ORDER BY 
    ca.Total_Purchase_Amount DESC, 
    ca.Total_Orders DESC;



