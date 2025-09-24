use [Employee Accidents]
select * from Employee

-- Total Employees, Avg Satisfaction, Avg Evaluation

SELECT
    COUNT(Emp_ID) AS TotalEmployees,
    AVG(satisfaction_level) AS AvgSatisfaction,
    AVG(last_evaluation) AS AvgEvaluation
FROM Employee;

-- Satisfaction Histogram (Binned)

SELECT 
    CAST(satisfaction_level*10 AS INT) AS SatisfactionBin,
    COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY CAST(satisfaction_level*10 AS INT)
ORDER BY SatisfactionBin;

--Last Evaluation Histogram (Binned)

SELECT 
    CAST(last_evaluation*10 AS INT) AS EvaluationBin,
    COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY CAST(last_evaluation*10 AS INT)
ORDER BY EvaluationBin;

-- Employees by Department

SELECT dept, COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY dept
ORDER BY EmployeeCount DESC;

-- Salary Distribution

SELECT salary, COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY salary;

-- Attrition by Department

SELECT dept, SUM(Work_accident) AS AttritionCount
FROM Employee
GROUP BY dept;

-- Attrition by Salary

SELECT salary, SUM(Work_accident) AS AttritionCount
FROM Employee
GROUP BY salary;

-- Attrition by Tenure

SELECT time_spend_company, SUM(Work_accident) AS AttritionCount
FROM Employee
GROUP BY time_spend_company
ORDER BY time_spend_company;

-- Satisfaction vs Attrition (Box Plot)

SELECT Work_accident, satisfaction_level
FROM Employee;

-- Satisfaction vs Evaluation (Scatter Plot)

SELECT satisfaction_level, last_evaluation, dept, salary, average_montly_hours, Work_accident
FROM Employee;

-- Correlation Table (for Heatmap)

SELECT 
    AVG(satisfaction_level) AS AvgSatisfaction,
    AVG(last_evaluation) AS AvgEvaluation,
    AVG(average_montly_hours) AS AvgHours,
    AVG(number_project) AS AvgProjects
FROM Employee;

-- Treemap: Dept → Salary → Employee Count

SELECT dept, salary, COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY dept, salary;

-- Sunburst: Dept → Salary → Promotion

SELECT dept, salary, promotion_last_5years, COUNT(Emp_ID) AS EmployeeCount
FROM Employee
GROUP BY dept, salary, promotion_last_5years;
