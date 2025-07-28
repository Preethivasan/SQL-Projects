-- create database
CREATE DATABASE hr_analytics;
USE hr_analytics;

-- create table departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- create table employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    dept_id INT,
    job_role VARCHAR(50),
    hire_date DATE,
    exit_date DATE,
    salary DECIMAL(10,2),
    education_level VARCHAR(20),
    performance_rating INT,
    is_active BOOLEAN,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- insert data into table departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR'),
(4, 'Finance'),
(5, 'Marketing');

-- insert data into table employees
INSERT INTO employees (emp_id, first_name, last_name, gender, age, dept_id, job_role, hire_date, exit_date, salary, education_level, performance_rating, is_active) VALUES
(1, 'Arjun', 'Kumar', 'Male', 29, 2, 'Developer', '2019-06-01', NULL, 65000.00, 'Bachelors', 4, 1),
(2, 'Divya', 'Sharma', 'Female', 35, 1, 'Manager', '2015-01-10', NULL, 95000.00, 'Masters', 5, 1),
(3, 'Rahul', 'Nair', 'Male', 31, 5, 'Executive', '2018-04-15', '2022-11-30', 55000.00, 'Bachelors', 3, 0),
(4, 'Sneha', 'Reddy', 'Female', 27, 3, 'Analyst', '2020-09-20', NULL, 48000.00, 'Masters', 4, 1),
(5, 'Vikram', 'Seth', 'Male', 45, 4, 'Manager', '2012-03-18', NULL, 105000.00, 'Masters', 5, 1),
(6, 'Anjali', 'Verma', 'Female', 30, 2, 'Developer', '2021-01-12', NULL, 72000.00, 'Bachelors', 3, 1),
(7, 'Kiran', 'Mehta', 'Male', 38, 1, 'Executive', '2016-07-22', NULL, 60000.00, 'Bachelors', 2, 1),
(8, 'Pooja', 'Das', 'Female', 33, 5, 'Manager', '2017-05-05', '2021-10-10', 87000.00, 'Masters', 4, 0),
(9, 'Nikhil', 'Jain', 'Male', 28, 2, 'Intern', '2023-01-01', NULL, 30000.00, 'Bachelors', 3, 1),
(10, 'Meena', 'Iyer', 'Female', 41, 4, 'Analyst', '2014-11-25', NULL, 78000.00, 'PhD', 5, 1);

-- create table attendance
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE,
    status ENUM('present', 'absent', 'wfh', 'sick leave', 'paid leave'),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- create table surveys
CREATE TABLE surveys (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    survey_date DATE,
    satisfaction_score INT CHECK (satisfaction_score BETWEEN 1 AND 5),
    work_life_balance INT CHECK (work_life_balance BETWEEN 1 AND 5),
    recommend_score INT CHECK (recommend_score BETWEEN 1 AND 5),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- insert data into table attendence
INSERT INTO attendance (emp_id, attendance_date, status) VALUES
(1, '2025-07-24', 'present'),
(2, '2025-07-24', 'present'),
(3, '2025-07-24', 'wfh'),
(4, '2025-07-24', 'present'),
(5, '2025-07-24', 'absent'),
(6, '2025-07-24', 'present'),
(7, '2025-07-24', 'sick leave'),
(8, '2025-07-24', 'present'),
(9, '2025-07-24', 'present'),
(10, '2025-07-24', 'paid leave');

INSERT INTO attendance (emp_id, attendance_date, status) VALUES
(1, '2025-07-25', 'wfh'),
(2, '2025-07-25', 'present'),
(3, '2025-07-25', 'present'),
(4, '2025-07-25', 'present'),
(5, '2025-07-25', 'present'),
(6, '2025-07-25', 'present'),
(7, '2025-07-25', 'paid leave'),
(8, '2025-07-25', 'sick leave'),
(9, '2025-07-25', 'present'),
(10, '2025-07-25', 'absent');

-- insert data into table surveys
INSERT INTO surveys (emp_id, survey_date, satisfaction_score, work_life_balance, recommend_score) VALUES
(1, '2025-07-15', 4, 3, 4),
(4, '2025-07-15', 5, 5, 5),
(5, '2025-07-15', 2, 2, 3),
(8, '2025-07-15', 3, 3, 3),
(10, '2025-07-15', 4, 4, 5);






