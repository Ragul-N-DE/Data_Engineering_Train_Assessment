create database day12_Indexing_Triggers_Scenario;

use day12_Indexing_Triggers_Scenario;

-- Scenario 1 - Employee Search Performance

/* The HR department frequently searches employees using their Email Address. As the Employee 
table has grown to over 10 lakh records, searching has become slow. 
Create an appropriate Index to improve the search performance. 
Task:
• Create an index on the Email column. 
• Verify that the index is created. 
• Search for an employee using the Email column. */

CREATE INDEX idx_employee_email 
ON Employee (Email);

SHOW INDEX FROM Employee;

SELECT * 
FROM Employee 
WHERE Email = 'aamir.k@company.com';


-- Scenario 2 - Product Search optimization

/*An e-commerce company frequently searches products based on both Category and Price. 
The Product table contains more than 5 million records, and the search queries are taking too 
much time. 
Create a suitable index to improve the performance. 

Task
• Create a Composite Index on Category and Price. 
• Display all products in the Electronics category whose price is greater than 50000. 
• Explain why a Composite Index is suitable for this query. */

CREATE INDEX idx_category_price ON Product (Category, Price);

SELECT *
FROM Product
WHERE Category = 'Electronics'
  AND Price > 50000;
  
-- Category-only index: Would still require scanning all rows in that category to check prices.
-- Price-only index: Would scan all products above 50,000 regardless of category.
-- Composite index (Category + Price): Within each category, prices are ordered.
/* MySQL can directly jump to the subset of rows where Category = 'Electronics' and then efficiently filter by Price > 50000.
This reduces the number of rows scanned dramatically, which is crucial with 5 million+ records. */

-- Scenario 3 - Employee Audit Log

/* Whenever a new employee joins the company, the HR team wants to automatically maintain an 
Employee Audit Log. 
Every new employee inserted into the Employee table should automatically create a record in the 
Employee_Log table. 

Task :
• Create an AFTER INSERT Trigger. 
• Whenever a new employee is inserted, automatically insert: 
o Employee_ID 
o Action = 'Inserted' 
o Current Date & Time into Employee_Log. 
• Insert one employee and display both tables. */

DELIMITER //

CREATE TRIGGER trg_After_Employee_Insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
INSERT INTO Employee_Log (Employee_ID, Action_Performed, Action_Time)
 VALUES (NEW.Employee_ID, 'Inserted', NOW());
END //

DELIMITER ;

INSERT INTO Employees (Employee_Name, Department, Salary)
VALUES ('John Doe', 'HR', 55000.00);

SELECT * FROM Employees;
SELECT * FROM Employee_Log;

-- Scenario 4 - Salary Validation

/*The Finance department has introduced a new rule. 
An employee's salary should never become negative. 
If any user tries to update a salary with a negative value, the database should reject the update 
and display an error message.

Task 
• Create a BEFORE UPDATE Trigger. 
• Prevent updating a salary if it is less than 0. 
• Display the message: 
Salary cannot be negative 
• Test the trigger using an UPDATE statement. */


DELIMITER //

CREATE TRIGGER trg_Before_Employee_Salary_Update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
IF NEW.Salary < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Salary cannot be negative';
END IF;
END //

DELIMITER ;

-- Employee ID 1 with negative salary
UPDATE Employee 
SET Salary = -5000.00 
WHERE Employee_ID = 1;

-- Updating employee ID 1 with a valid salary value
UPDATE Employee 
SET Salary = 89500.00 
WHERE Employee_ID = 1;

-- Verify
SELECT Employee_ID, Employee_Name, Salary 
FROM Employee 
WHERE Employee_ID = 1;


-- Scenario 5 -  Customer E-Mail Validation

/*A banking application stores customer details. 
Business requirements: 
1. No two customers should have the same Email Address. 
2. The customer's Age must be at least 18 years before registration. 
Implement the required database objects. 

Task
• Create a Unique Index on the Email column. 
• Create a BEFORE INSERT Trigger. 
• Reject the insert if Age is less than 18. 
• Display the message: 
Customer must be at least 18 years old 
• Test the trigger by inserting both valid and invalid records. */


CREATE UNIQUE INDEX idx_unique_email ON Customer(Email);

DELIMITER //

CREATE TRIGGER trg_check_age_before_insert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF NEW.Age < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer must be at least 18 years old';
    END IF;
END; //

DELIMITER ;

-- Valid Records

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (14, 'Laura Palmer', 'laura.p@email.com', 24);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (15, 'Michael Scott', 'michael.s@email.com', 21);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (16, 'Nora Jones', 'nora.j@email.com', 47);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (17, 'Oscar Wilde', 'oscar.w@email.com', 30);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (18, 'Peter Parker', 'peter.p@email.com', 27);

-- Invalid Records
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (23, 'Test User 1', 'test1@reject.com', 17);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (24, 'Test User 2', 'test2@reject.com', 16);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (25, 'Test User 3', 'test3@reject.com', 15);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (26, 'Test User 4', 'test4@reject.com', 14);
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Age) VALUES (27, 'Test User 5', 'test5@reject.com', 13);
