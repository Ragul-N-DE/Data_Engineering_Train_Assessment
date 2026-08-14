Create database Day8_Clause_Scenario;

use Day8_Clause_Scenario;

-- Scenario 1 - Department Salary Analysis

/*The HR department wants to identify departments where the average employee salary is 
greater than the company's salary benchmark is ₹60,000. 
Display the Department and its Average Salary. 
Sort the result by Average Salary in descending order and display only the top 3 departments.*/

select 
department,
avg(Salary) As AVG_Salary
from employee
group by department
having avg(Salary) > 60000
order by AVG_Salary desc
limit 3;

-- Scenario 2 - Top Performing Products

/*An e-commerce company wants to identify the top-selling products. 
Display each Product Category along with the total quantity sold. 
Only display categories that have sold more than the company's minimum sales requirement 100 
units. 
Sort the result from highest to lowest quantity sold and display only the top 5 categories. */

select 
category,
sum(Quantity) as Total_Quatity_Sold
from sales
group by category
having  sum(quantity) > 100
order by Total_Quatity_Sold desc
limit 5;  

-- Scenario 3  Customer Purchase Report

/*A retail company wants to prepare a customer purchase report. 
Display only customers whose purchase amount satisfies the company's Purchase_Amount ≥ 
₹25,000. 
Remove duplicate city names in the report and display the customers in ascending alphabetical 
order. */

select distinct city
from customer
where Purchase_Amount >= 25000
Order by City asc;

-- Scenario 4  Hospital Department Patient Analysis

/*A hospital wants to analyze the number of patients treated in each department. 
Display the Department Name and Total Patients. 
Show only those departments that have treated more than the hospital's required More than 3 
patients. 
Sort the result based on the total number of patients in descending order. */

select Department as 'Department_name',
count(Patient_Id) as 'Total patients'
from patient
group by department
having count(Patient_ID) >3
order by 'Total Patients' desc; 

-- Scenario 5 - Employee Age and Salary Report

/*A company wants to prepare a report of employees who satisfy both the company's age criteria 
and salary criteria Age ≥ 30 and Salary ≥ ₹60,000. 
Display the employee details, arrange the report by Salary in descending order, and return only 
the top 5 employees. */
-- Table Name Employe

select * from employe
where age >= 30 and salary >= 60000
order by salary desc
limit 5;