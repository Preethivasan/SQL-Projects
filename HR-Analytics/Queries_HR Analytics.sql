-- Department wise Head count
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Average Performance Rating by Department
SELECT d.dept_name, ROUND(AVG(e.performance_rating), 2) AS avg_performance
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_performance DESC;

-- Total Attendance Summary
SELECT status, COUNT(*) AS count
FROM attendance
GROUP BY status
ORDER BY count DESC;

-- Employee-wise Attendance Summary
SELECT 
  e.first_name, e.last_name,
  SUM(CASE WHEN a.status = 'present' THEN 1 ELSE 0 END) AS days_present,
  SUM(CASE WHEN a.status = 'absent' THEN 1 ELSE 0 END) AS days_absent,
  SUM(CASE WHEN a.status = 'wfh' THEN 1 ELSE 0 END) AS days_wfh,
  SUM(CASE WHEN a.status = 'sick leave' THEN 1 ELSE 0 END) AS days_sick,
  SUM(CASE WHEN a.status = 'paid leave' THEN 1 ELSE 0 END) AS days_paid_leave
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id
GROUP BY e.emp_id;

-- Average Satisfaction & Work-Life Balance by Department
SELECT d.dept_name,
       ROUND(AVG(s.satisfaction_score), 2) AS avg_satisfaction,
       ROUND(AVG(s.work_life_balance), 2) AS avg_balance
FROM surveys s
JOIN employees e ON s.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_satisfaction DESC;

-- Monthly Hiring Trend
SELECT 
  DATE_FORMAT(hire_date, '%Y-%m') AS hire_month,
  COUNT(*) AS hired_count
FROM employees
GROUP BY hire_month
ORDER BY hire_month;

-- List of Currently Active Employees Working Remotely
SELECT e.first_name, e.last_name, a.attendance_date
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id
WHERE a.attendance_date = CURDATE() AND a.status = 'wfh' AND e.is_active = 1;

-- Top 3 Departments by Highest Average Salary
SELECT d.dept_name, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC
LIMIT 3;

-- Top 5 Highest Paid Employees
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;








