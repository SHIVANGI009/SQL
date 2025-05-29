use employees;

select * from employees;
select * from dept_emp;
select * from salaries;

-- get the employee number and the first name and the department number for the employees from the employees table and department employee table.
select e.emp_no,e.first_name,de.dept_no 
from employees e
join dept_emp de where e.emp_no = de.emp_no;

select * from salaries as sal
where salary > (select avg(salary) from salaries as s where sal.emp_no=s.emp_no);

-- a correlated query a type of query that depends on the outer query to execute the logic.
-- it is re executed again and again for each row. It takes Time to execute a query.

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);

select * from employees;

select * from employees as e
where salary > (select avg(salary) from employees d 
                where e.deptID = d.deptID);

-- list departments where at least one employee earns more than 60,0000
select deptid,deptname from departments d
where exists (select deptid from employees e where d.deptid = e.deptid and salary>60000);

-- find the employee who have the highest salary in thier department
select * from employees as e
where salary >= (select max(salary) from departments d 
                where e.deptID = d.deptID);


use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;                
-- get the student name and the course name and student id for the each student.
select studentname,studentid from students s
join courses c where s.department=c.department;

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from enrollments;

-- find studnets who scored above the average in any course they enrolled in.
select * from enrollments as e
where grade > (select avg(grade) from enrollments as e1
                where e.studentID = e1.studentID);
                
-- list all students who have the highest grade in at least one course.
select deptid,deptname from departments d
where exists (select deptid from employees e where d.deptid = e.deptid and salary>60000);

select * from students;
select * from enrollments;