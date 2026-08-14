Create database Day11_Window_Function;

Use Day11_Window_function;

-- Scenario 1 -- Company salary Sequence

/* The HR department wants to assign a unique sequence number to every employee based on the 
highest salary.
Display the Employee ID, Employee Name, Department, Salary, and Sequence Number.
Arrange the employees from the highest salary to the lowest salary.*/

Select
Emp_Id,
Emp_name,
Department,
Salary,
row_number()
 Over(order by salary Desc) as Sequence_Number
from employee
Order by salary Desc;

-- Scenario 2 -- Department-Wise salary Ranking

/*The HR team wants to rank employees based on salary within each department.
Display the Employee Name, Department, Salary, and Rank. Highest salary should receive Rank 1 in every department.*/

Select 
Emp_Name,
Department,
Salary,
dense_rank () 
Over (
partition by Department
order by salary) as Dept_Salary_Rank
from employee
order by Department asc, Dept_Salary_Rank asc;

-- Scenario 3 -- Branch-Wise Employee Numbering

/* A company has multiple branches. 
Assign a unique row number to employees within each branch based on Employee ID. 
Display the Employee Name, Branch, Employee ID, and Row Number. */
-- table Name Employeee

Select 
Emp_name,
Branch,
Emp_ID,
Row_Number() Over(
Partition by Branch
order by Emp_Id) as Row_Numbers
from Employeee;


-- Scenario 4 -- Salary Ranking with Duplicate Salaries

/*The Finance department wants employees having the same salary to receive the same rank, and 
the next rank should not skip any number. 
Display the Employee Name, Salary, and Salary Rank.*/

Select 
Emp_name,
Salary,
dense_rank () Over (order by salary Desc) as Salary_Rank
from Employee;

-- Scenario 5 - Branch and Departmnet-Wise Ranking

/*The company wants to rank employees separately for every Branch and Department 
combination based on salary. 
Display the Employee Name, Branch, Department, Salary, and Rank. */

-- Table name Employe

SELECT 
Emp_Name, 
Branch, 
Department, 
Salary,
RANK() OVER (
PARTITION BY Branch, Department
 ORDER BY Salary DESC) AS Ranks
FROM 
    Employe;

-- Scenario 6 - Salary Tie Breaker 

/* The HR department wants employees sorted by highest salary. 
If two employees receive the same salary, arrange them alphabetically by Employee Name. 
Display the Employee Name, Salary, and Row Number. */
-- Table name - Employe

SELECT 
    Emp_Name,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC, Emp_Name ASC) AS Row_Numbers
FROM 
    employe;
    

-- Scenario 7 - Department-Wise Experience Ranking

/*The HR department wants to rank employees within each department. 
Employees should first be sorted by Experience (Highest to Lowest). 
If two employees have the same experience, sort them by Salary (Highest to Lowest). 
Display the Employee Name, Department, Experience, Salary, and Rank. */

Select 
Emp_Name, 
Department,
Experience,
salary,
dense_rank() over(
partition by department
order by Experience Desc,
Salary Desc) as Ranks
from Employees
order by 
Department asc,
Ranks Asc;

-- Scenario 8 - Multi-Level Employee Ranking

/*The management wants to assign row numbers separately for each Country and Branch. 
Within each group, employees should be sorted by: 
1. Salary (Highest) 
2. Experience (Highest) 
3. Employee Name (Alphabetically) 
Display the Employee Name, Country, Branch, Salary, Experience, and Row Number. */

Select 
Emp_Name,
Country,
Branch,
Salary,
Experience,
dense_rank() over(
partition by Country, branch
order by Salary asc, Experience Asc, Emp_Name asc) as Ranks
from Employes
order by 
country asc,
Branch asc,
Ranks asc;

-- Scenario 9 - Product Price Ranking by Category

/*The inventory team wants to rank products based on price within each product category. 
Products with the same price should receive the same rank. 
Display the Product Name, Category, Price, and Rank. */

Select 
Product_Name,
Category,
price,
dense_rank() over(
partition by category
order by price Desc) as Ranks
from product
order by 
Category asc,
Ranks asc;

-- Scenario 10 - Customer order Sequence

/* An e-commerce company wants to assign order numbers separately for each Customer and 
Order Status. 
Within each group, orders should be arranged by: 
1. Order Date (Latest First) 
2. Order Amount (Highest First) 
Display the Customer ID, Order ID, Order Status, Order Date, Order Amount, and 
Sequence Number. */

Select 
Customer_Id,
Order_Id,
Order_status,
Order_Date,
Order_Amount,
Row_Number() over (
partition by Customer_Id, order_status
order by Order_date Desc, Order_amount Desc) as Sequence_Number
from orders
order by 
Customer_Id asc,
order_status asc,
Sequence_number asc; 
