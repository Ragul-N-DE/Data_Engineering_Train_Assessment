Create Database Day7_Conditional_Functions;

use Day7_Conditional_Functions;

-- Scenario 1 - Student Result Report

/*A training institute wants to generate a student result report. 
Students who score 50 or above should be displayed as "Pass", and students scoring below 50 
should be displayed as "Fail". 
Write a SQL query to generate the report. */

CREATE TABLE Student (
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(100),
Course VARCHAR(50),
Marks INT);

INSERT INTO Student (Student_ID, Student_Name, Course, Marks) 
VALUES (1, 'Liam Smith', 'Computer Science', 45),
(2, 'Noah Johnson', 'Data Science', 92),
(3, 'Oliver Williams', 'Mathematics', 38),
(4, 'Elijah Brown', 'Physics', 88),
(5, 'James Jones', 'Computer Science', 95),
(6, 'William Miller', 'Chemistry', 42),
(7, 'Benjamin Davis', 'Data Science', 73),
(8, 'Lucas Garcia', 'Mathematics', 91),
(9, 'Henry Rodriguez', 'Physics', 35),
(10, 'Alexander Wilson', 'Computer Science', 79),
(11, 'Mason Martinez', 'Chemistry', 87),
(12, 'Michael Anderson', 'Mathematics', 48),
(13, 'Ethan Taylor', 'Data Science', 84),
(14, 'Daniel Thomas', 'Physics', 29),
(15, 'Jacob Moore', 'Computer Science', 76),
(16, 'Logan Jackson', 'Chemistry', 93),
(17, 'Jackson Martin', 'Mathematics', 81),
(18, 'Levi Lee', 'Data Science', 44),
(19, 'Sebastian Perez', 'Physics', 72),
(20, 'Mateo Thompson', 'Computer Science', 86),
(21, 'Jack White', 'Chemistry', 33),
(22, 'Owen Harris', 'Mathematics', 94),
(23, 'Theodore Sanchez', 'Data Science', 75),
(24, 'Aiden Clark', 'Physics', 41),
(25, 'Samuel Ramirez', 'Computer Science', 90);

-- Answer

Select Student_ID, Student_Name, Course, Marks,
case
when marks >= 50 then 'Pass' else 'Fail'
 end as Result_Report 
 from Day7_Conditional_Functions.Student;
 
 -- Scenario 2 - Employee Bonus Eligibility 
 
 /*The HR department wants to identify employees eligible for a yearly bonus. 
Employees with a salary of ₹60,000 or more should be displayed as "Bonus Eligible"; all 
others should be displayed as "Not Eligible". 
Write the SQL query.*/

Create table Day7_Conditional_Functions.Employee(
Emp_ID int,
Emp_Name Varchar(100),
Department VarchaR (50),
Salary Decimal (10,2));

INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary) VALUES
(1, 'John Doe', 'IT', 65000.00),
(2, 'Jane Smith', 'HR', 45000.00),
(3, 'Michael Brown', 'Finance', 72000.00),
(4, 'Emily Davis', 'Marketing', 58000.00),
(5, 'David Wilson', 'IT', 61000.00),
(6, 'Sarah Martinez', 'Sales', 42000.00),
(7, 'James Anderson', 'Finance', 85000.00),
(8, 'Amanda Thomas', 'HR', 49000.00),
(9, 'Robert Jackson', 'IT', 55000.00),
(10, 'Lisa White', 'Marketing', 63000.00),
(11, 'William Harris', 'Sales', 38000.00),
(12, 'Megan Martin', 'Finance', 90000.00),
(13, 'Kevin Garcia', 'IT', 60500.00),
(14, 'Rachel Robinson', 'HR', 52000.00),
(15, 'Brian Clark', 'Sales', 47000.00),
(16, 'Christine Rodriguez', 'Marketing', 67000.00),
(17, 'Edward Lewis', 'Finance', 59000.00),
(18, 'Ashley Lee', 'IT', 71000.00),
(19, 'Joseph Walker', 'Sales', 51000.00),
(20, 'Stephanie Hall', 'HR', 64000.00),
(21, 'Andrew Allen', 'Marketing', 53000.00),
(22, 'Anna Young', 'Finance', 62500.00),
(23, 'Joshua King', 'IT', 48000.00),
(24, 'Rebecca Wright', 'Sales', 66000.00),
(25, 'Christopher Scott', 'HR', 56000.00);

-- Answer 
 
 Select Emp_ID,Emp_Name,Department,Salary,
 case
 when Salary >= 60000 then 'Bonus Eligible' else 'Not Eligible'
 End as Eligible_For_Yearly_Bonus 
 from Day7_Conditional_Functions.Employee;
 
 -- Scenario 3 - Customer Premium Status
 
 /*An online shopping company wants to classify customers based on their total purchase amount. 
Customers meeting the company's purchase criteria should be displayed as "Premium 
Customer", otherwise display "Regular Customer". 
Write the SQL query. */

Create table Day7_Conditional_Functions.Customer(
Customer_ID Integer,
Customer_Name varchar (100),
City Varchar (50),
Purchase_Amount Decimal(10,2));

INSERT INTO Customer (Customer_ID, Customer_Name, City, Purchase_Amount) VALUES
(1, 'Oliver Bennett', 'New York', 12500.50),
(2, 'Sophia Mendoza', 'Los Angeles', 450.00),
(3, 'Liam Gallagher', 'Chicago', 23000.75),
(4, 'Ava DuVernay', 'Houston', 85.20),
(5, 'Noah Sebastian', 'Phoenix', 16000.00),
(6, 'Mia Hamm', 'Philadelphia', 925.40),
(7, 'Lucas Croft', 'San Antonio', 10500.15),
(8, 'Amelia Earhart', 'San Diego', 45.00),
(9, 'Ethan Hunt', 'Dallas', 35000.00),
(10, 'Harper Lee', 'San Jose', 120.65),
(11, 'Mason Mount', 'Austin', 875.00),
(12, 'Evelyn Waugh', 'Jacksonville', 14200.30),
(13, 'Logan Paul', 'Fort Worth', 60.00),
(14, 'Abigail Adams', 'Columbus', 18500.25),
(15, 'Elijah Wood', 'Charlotte', 310.00),
(16, 'Emily Blunt', 'San Francisco', 42000.50),
(17, 'James Bond', 'Indianapolis', 95.99),
(18, 'Charlotte Bronte', 'Seattle', 11300.00),
(19, 'Benjamin Franklin', 'Denver', 75.50),
(20, 'Aria Stark', 'Washington', 29000.00);

-- Answer

Select Customer_ID,Customer_name,City,Purchase_Amount,
case
when Purchase_Amount >= 10000 then 'Premium Customer'
else 'Regular Cutomer' End as Premium_Status from Day7_Conditional_Functions.Customer;

-- Scenario 4 - Product Availability report 

/*An inventory management system wants to display the stock status of every product. 
Products satisfying the company's stock condition should display "In Stock", otherwise display 
"Out of Stock". 
Write the SQL query. */

Create table Day7_Conditional_Functions.Product(
Product_ID int,
 Product_Name varchar (100),
 Category varchar(50),
 Stock_Quantity int);
 
INSERT INTO Product (Product_ID, Product_Name, Category, Stock_Quantity)
 VALUES (1, 'Wireless Mouse', 'Electronics', 45),
(2, 'Gaming Keyboard', 'Electronics', 3),
(3, 'Running Shoes', 'Apparel', 12),
(4, 'Cotton T-Shirt', 'Apparel', 2),
(5, 'Desk Lamp', 'Home Decor', 25),
(6, 'Ceramic Vase', 'Home Decor', 1),
(7, 'Stainless Steel Bottle', 'Kitchen', 60),
(8, 'Non-Stick Frying Pan', 'Kitchen', 4),
(9, 'Bluetooth Speaker', 'Electronics', 18),
(10, 'Noise Cancelling Headphones', 'Electronics', 35),
(11, 'Leather Wallet', 'Apparel', 0),
(12, 'Denim Jacket', 'Apparel', 15),
(13, 'Office Chair', 'Furniture', 8),
(14, 'Bookshelf', 'Furniture', 2),
(15, 'Blender', 'Kitchen', 14),
(16, 'Coffee Maker', 'Kitchen', 5),
(17, 'Yoga Mat', 'Fitness', 30),
(18, 'Dumbbell Set', 'Fitness', 1),
(19, 'Wall Clock', 'Home Decor', 11),
(20, 'Smart Watch', 'Electronics', 22);

-- Answer 

Select Product_ID, Product_Name, Category, Stock_Quantity,
case 
when Stock_Quantity > 5 then 'In_Stock'
else 'Out_Of_Stock' end as Stock_Status from Day7_Conditional_Functions.Product;

-- Scenario 5 - Employee Performance rating

/*The HR department wants to classify employee performance into multiple levels based on their 
performance score. 
Generate the report according to the company's performance policy. 
Write the SQL query. */

create table Day7_Conditional_Functions.Employee_Performance(
Emp_ID int,
Emp_Name varchar(100),
 Performance_Score Int,
 Department varchar(50));
 
 INSERT INTO Employee_Performance (Emp_ID, Emp_Name, Performance_Score, Department)
 VALUES (1, 'John Doe', 95, 'IT'),
(2, 'Jane Smith', 42, 'HR'),
(3, 'Michael Brown', 78, 'Finance'),
(4, 'Emily Davis', 92, 'Marketing'),
(5, 'David Wilson', 55, 'IT'),
(6, 'Sarah Martinez', 88, 'Sales'),
(7, 'James Anderson', 35, 'Finance'),
(8, 'Amanda Thomas', 74, 'HR'),
(9, 'Robert Jackson', 91, 'IT'),
(10, 'Lisa White', 48, 'Marketing'),
(11, 'William Harris', 82, 'Sales'),
(12, 'Megan Martin', 60, 'Finance'),
(13, 'Kevin Garcia', 97, 'IT'),
(14, 'Rachel Robinson', 39, 'HR'),
(15, 'Brian Clark', 71, 'Sales'),
(16, 'Christine Rodriguez', 86, 'Marketing'),
(17, 'Edward Lewis', 52, 'Finance'),
(18, 'Ashley Lee', 94, 'IT'),
(19, 'Joseph Walker', 41, 'Sales'),
(20, 'Stephanie Hall', 83, 'HR'),
(21, 'Andrew Allen', 67, 'Marketing'),
(22, 'Anna Young', 31, 'Finance'),
(23, 'Joshua King', 76, 'IT'),
(24, 'Rebecca Wright', 89, 'Sales'),
(25, 'Christopher Scott', 58, 'HR');

-- Answer 

Select Emp_ID,Emp_Name,Performance_Score,Department,
case 
when Performance_Score >= 95 then 'Star_Performer'
when Performance_Score >= 85 then 'Out_standing'
when Performance_Score >= 75 then 'Exceed_Expectations'
when Performance_Score >= 65 then 'Meets_Expectation'
when Performance_Score >= 50 then 'Needs_improvement'
else 'Unsatisfactory'
end as Employee_Perfomance 
from Day7_Conditional_Functions.Employee_Performance;

-- Scenario 6 - Student Scholarship Report

/* A university wants to classify students into different scholarship categories based on their 
semester marks. 
Generate the scholarship report according to the university's scholarship rules. 
Write the SQL query. */

SELECT Student_ID,Student_Name,Course,Marks,
    CASE
        WHEN Marks >= 90 THEN 'Full Scholarship'
        WHEN Marks >= 75 THEN 'Half Scholarship'
        WHEN Marks >= 60 THEN 'Quarter Scholarship'
        ELSE 'No Scholarship'
    END AS Scholarship_Report
FROM Student;


-- Scenario 7 - Loan Approval status

/*A bank wants to classify loan applications into different approval categories based on the 
applicant's monthly income. 
Generate the loan approval report according to the bank's business policy. 
Write the SQL query. */

CREATE TABLE Loan_Application (
    Application_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Monthly_Income DECIMAL(10,2),
    Loan_Amount DECIMAL(10,2)
);

INSERT INTO Loan_Application (Application_ID, Customer_Name, Monthly_Income, Loan_Amount)
 VALUES (1, 'John Doe', 5500.00, 15000.00),
(2, 'Jane Smith', 8200.50, 45000.00),
(3, 'Michael Brown', 3400.00, 5000.00),
(4, 'Emily Davis', 12000.00, 85000.00),
(5, 'David Wilson', 4100.25, 12000.00),
(6, 'Sarah Martinez', 6800.00, 30000.00),
(7, 'James Anderson', 9500.75, 60000.00),
(8, 'Elizabeth Taylor', 5000.00, 18000.00),
(9, 'William Thomas', 7100.00, 25000.00),
(10, 'Barbara White', 3100.50, 8000.00),
(11, 'Richard Harris', 10500.00, 75000.00),
(12, 'Susan Martin', 4800.00, 14000.00),
(13, 'Joseph Thompson', 6200.80, 22000.00),
(14, 'Jessica Garcia', 8900.00, 50000.00),
(15, 'Thomas Robinson', 4300.00, 11000.00),
(16, 'Nancy Clark', 7600.20, 35000.00),
(17, 'Charles Rodriguez', 5800.00, 19000.00),
(18, 'Lisa Lewis', 11000.50, 90000.00),
(19, 'Matthew Lee', 3900.00, 9500.00),
(20, 'Karen Walker', 6500.00, 28000.00),
(21, 'Donald Hall', 8100.15, 40000.00),
(22, 'Betty Allen', 5200.00, 16500.00),
(23, 'Paul Young', 7300.00, 32000.00),
(24, 'Margaret King', 13500.00, 100000.00),
(25, 'Steven Wright', 4600.50, 13000.00);

-- Answer 

SELECT 
Application_ID,
Customer_Name,
Monthly_Income,
Loan_Amount,
CASE 
WHEN Monthly_Income >= 10000 THEN 'Instant Approval'
WHEN Monthly_Income >= 5000 AND Monthly_Income < 10000 THEN 'Standard Review'
WHEN Monthly_Income >= 3000 AND Monthly_Income < 5000 THEN 'Additional Verification Required'
ELSE 'Decline - Income Below Threshold'
END AS Approval_Status
FROM Loan_Application;

-- Scenario 8 - Product Discount Category

/*An e-commerce company wants to classify products into different discount categories based on 
their selling price. 
Generate the discount category report according to the company's pricing policy. 
Write the SQL query.*/

select *,
case 
when price > 40000 then 'Premium Discount'
when price between 30000 and 39999 then 'Standard Discount'
when price between 15000 and 29999 then 'Basic Discount'
else 'No Discount'
end as Discount_Category
from product_Disc
order by price Desc; 

-- Scenario 9  Hospital Patient Priority report

/*A hospital wants to categorize patients based on their health score into different treatment 
priority levels. 
Generate the patient priority report according to the hospital's treatment policy. 
Write the SQL query. */

select *, 
case 
when Health_score < 25 then 'Critical Priority'
when Health_score between 25 and 50 then 'High Priority'
when Health_Score between 50 and 75 then 'Medium Priority'
else 'Low Priority'
end as Treatment_priority
from patient
order by health_Score Asc;

-- Scenario 10 - Employee Salary band Classification

/*The Finance department wants to classify employees into different salary bands based on their 
monthly salary. 
Generate the salary band report according to the company's salary classification policy. 
Write the SQL query. */

Select *,
case 
when salary > 75000 then 'Executive Band'
when salary between 50000 and 75000 then 'Senior Band'
when salary between 30000 and 49999 then ' Mid Band'
Else 'Junior band'
end as Salary_band
from employee
order by salary desc;